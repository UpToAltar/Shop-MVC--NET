using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using NetMVC.Areas.Category.Models;
using NetMVC.Models;
using NetMVC.UpLoad;
using X.PagedList;

namespace NetMVC.Areas.Advertisements.Controllers
{
    [Area("Advertisement")]
    [Authorize(Roles = "Admin,Manager")]
    public class HomeController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IUploadService _uploadService;
        public HomeController(AppDbContext context, IUploadService uploadService)
        {
            _context = context;
            _uploadService = uploadService;
        }

        [TempData]
        public string StatusMessage { get; set; }
        public const int ITEM_PER_PAGE = 5;

        // GET: News/Home
        public async Task<IActionResult> Index(string? searchString, int? page = 1)
        {
            if(_context.Advertisements == null)
            {
                return Problem("Entity set 'AppDbContext.Advertisements'  is null.");
            }
            var advertisements = _context.Advertisements.OrderBy( n => n.Position).ToPagedList(page ?? 1, ITEM_PER_PAGE);
            if (!string.IsNullOrEmpty(searchString))
            {
                advertisements = _context.Advertisements.Where(n => n.Title.Contains(searchString)).OrderBy(n => n.Position).ToPagedList(page ?? 1, ITEM_PER_PAGE);
            }
            var model = new IndexAdvertisementsModel
            {
                ITEM_PER_PAGE = ITEM_PER_PAGE,
                totalAdvertisements = await _context.Advertisements.CountAsync(),
                advertisements = advertisements
            };
            return View(model);
        }
        

        // GET: Advertisements/Home/Details/5
        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null || _context.Advertisements == null)
            {
                return NotFound();
            }

            var advertisements = await _context.Advertisements
                .FirstOrDefaultAsync(m => m.Id == id);
            if (advertisements == null)
            {
                return NotFound();
            }

            return View(advertisements);
        }

        // GET: Advertisements/Home/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Advertisements/Home/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(
            [Bind("Id,Title,Position,Description,Image,Link,IsActive")] Models.Advertisement advertisements,
            IFormFile? file)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    string imageLink = await _uploadService.UploadFile(file);
                    if(!string.IsNullOrEmpty(imageLink))
                    {
                        advertisements.Image = imageLink;
                    }
                }
                advertisements.Id = Guid.NewGuid();
                advertisements.CreatedAt = DateTime.Now;
                advertisements.UpdatedAt = DateTime.Now;
                advertisements.CreatedBy = User.Identity.Name;
                advertisements.UpdatedBy = User.Identity.Name;
                _context.Add(advertisements);
                StatusMessage = "Advertisements has been created.";
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(advertisements);
        }

        // GET: Advertisements/Home/Edit/5
        public async Task<IActionResult> Edit(Guid? id)
        {
            if (id == null || _context.Advertisements == null)
            {
                return NotFound();
            }

            var advertisements = await _context.Advertisements.FindAsync(id);
            if (advertisements == null)
            {
                return NotFound();
            }
            return View(advertisements);
        }

        // POST: Advertisements/Home/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Guid id,IFormFile? file,
            [Bind("Id,Title,Position,Description,Image,Link,IsActive,CreatedAt,CreatedBy")] Models.Advertisement advertisements)
        {
            if (id != advertisements.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    if (file != null)
                    {
                        string imageLink = await _uploadService.UploadFile(file);
                        if(!string.IsNullOrEmpty(imageLink))
                        {
                            if(advertisements.Image != null)
                            {
                               await _uploadService.DeleteFile(advertisements.Image);
                            }
                            advertisements.Image = imageLink;
                        }
                    }
                    advertisements.UpdatedAt = DateTime.Now;
                    advertisements.UpdatedBy = User.Identity.Name;
                    _context.Update(advertisements);
                    StatusMessage = "Advertisements has been updated.";
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!AdvertisementsExists(advertisements.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(advertisements);
        }

        // GET: Advertisements/Home/Delete/5
        public async Task<IActionResult> Delete(Guid? id)
        {
            if (id == null || _context.Advertisements == null)
            {
                return NotFound();
            }

            var advertisements = await _context.Advertisements
                .FirstOrDefaultAsync(m => m.Id == id);
            if (advertisements == null)
            {
                return NotFound();
            }

            return View(advertisements);
        }

        // POST: Advertisements/Home/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(Guid id)
        {
            if (_context.Advertisements == null)
            {
                return Problem("Entity set 'AppDbContext.Advertisements'  is null.");
            }
            var advertisements = await _context.Advertisements.FindAsync(id);
            if (advertisements != null)
            {
                if(advertisements.Image != null)
                {
                    await _uploadService.DeleteFile(advertisements.Image);
                }
                _context.Advertisements.Remove(advertisements);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }
        
        [HttpGet]
        public IActionResult DeleteMany()
        {
            return Json(new { success = true, message = "test" });
        }
        
        [HttpPost]
        public async Task<IActionResult> DeleteMany([FromBody]string? data)
        {
            if (_context.Advertisements == null)
            {
                return Json(new { success = false, message = "Entity set 'AppDbContext.Advertisements'  is null." });
            }
            if(data == null)
            {
                return Json(new { success = false, message = "Data is null." });
            }
            var ids = data.Split(",");
            foreach (var id in ids)
            {
                if (Guid.TryParse(id, out Guid guid))
                {
                    var advertisements = await _context.Advertisements.FindAsync(guid);
                    if (advertisements != null)
                    {
                        if(advertisements.Image != null)
                        {
                            await _uploadService.DeleteFile(advertisements.Image);
                        }
                        _context.Advertisements.Remove(advertisements);
                    }
                }
            }
            await _context.SaveChangesAsync();
            return Json(new { success = true, message = "Delete success." });
        }
        private bool AdvertisementsExists(Guid id)
        {
          return (_context.Advertisements?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
