using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using NetMVC.Areas.Category.Models;
using NetMVC.Areas.Policy.Models;
using NetMVC.Models;
using NetMVC.UpLoad;
using X.PagedList;

namespace NetMVC.Areas.Policy.Controllers
{
    [Area("Policy")]
    [Authorize(Roles = $"{BaseRole.Admin},{BaseRole.Manager}")]
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
            if(_context.Policies == null)
            {
                return Problem("Entity set 'AppDbContext.Policies'  is null.");
            }
            var policies = _context.Policies.OrderBy( n => n.Title).ToPagedList(page ?? 1, ITEM_PER_PAGE);
            if (!string.IsNullOrEmpty(searchString))
            {
                policies = _context.Policies.Where(n => n.Title.Contains(searchString)).OrderBy(n => n.Title).ToPagedList(page ?? 1, ITEM_PER_PAGE);
            }
            var model = new IndexPolicyModel()
            {
                ITEM_PER_PAGE = ITEM_PER_PAGE,
                totalPolicies = await _context.Policies.CountAsync(),
                policies = policies
            };
            return View(model);
        }
        

        // GET: Policies/Home/Details/5
        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null || _context.Policies == null)
            {
                return NotFound();
            }

            var policies = await _context.Policies
                .FirstOrDefaultAsync(m => m.Id == id);
            if (policies == null)
            {
                return NotFound();
            }

            return View(policies);
        }

        // GET: Policies/Home/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Policies/Home/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(
            [Bind("Id,Title,Description,SeoTitle,SeoDescription,SeoKeywords,IsActive")] NetMVC.Models.Policy policies,
            IFormFile? file)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    string imageLink = await _uploadService.UploadFile(file);
                    if(!string.IsNullOrEmpty(imageLink))
                    {
                        policies.Icon = imageLink;
                    }
                }
                policies.Id = Guid.NewGuid();
                policies.CreatedAt = DateTime.Now;
                policies.UpdatedAt = DateTime.Now;
                policies.CreatedBy = User.Identity.Name;
                policies.UpdatedBy = User.Identity.Name;
                _context.Add(policies);
                StatusMessage = "Policies has been created.";
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(policies);
        }

        // GET: Policies/Home/Edit/5
        public async Task<IActionResult> Edit(Guid? id)
        {
            if (id == null || _context.Policies == null)
            {
                return NotFound();
            }

            var policies = await _context.Policies.FindAsync(id);
            if (policies == null)
            {
                return NotFound();
            }
            return View(policies);
        }

        // POST: Policies/Home/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Guid id,IFormFile? file,
            [Bind("Id,Title,Description,Icon,SeoTitle,SeoDescription,SeoKeywords,IsActive,CreatedAt,CreatedBy")] NetMVC.Models.Policy policies)
        {
            if (id != policies.Id)
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
                            if(policies.Icon != null)
                            {
                               await _uploadService.DeleteFile(policies.Icon);
                            }
                            policies.Icon = imageLink;
                        }
                    }
                    policies.UpdatedAt = DateTime.Now;
                    policies.UpdatedBy = User.Identity.Name;
                    _context.Update(policies);
                    StatusMessage = "Policies has been updated.";
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!AdvertisementsExists(policies.Id))
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
            return View(policies);
        }

        // GET: Policies/Home/Delete/5
        public async Task<IActionResult> Delete(Guid? id)
        {
            if (id == null || _context.Policies == null)
            {
                return NotFound();
            }

            var policies = await _context.Policies
                .FirstOrDefaultAsync(m => m.Id == id);
            if (policies == null)
            {
                return NotFound();
            }

            return View(policies);
        }

        // POST: Policies/Home/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(Guid id)
        {
            if (_context.Policies == null)
            {
                return Problem("Entity set 'AppDbContext.Policies'  is null.");
            }
            var policies = await _context.Policies.FindAsync(id);
            if (policies != null)
            {
                if(policies.Icon != null)
                {
                    await _uploadService.DeleteFile(policies.Icon);
                }
                _context.Policies.Remove(policies);
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
            if (_context.Policies == null)
            {
                return Json(new { success = false, message = "Entity set 'AppDbContext.Policies'  is null." });
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
                    var policies = await _context.Policies.FindAsync(guid);
                    if (policies != null)
                    {
                        if(policies.Icon != null)
                        {
                            await _uploadService.DeleteFile(policies.Icon);
                        }
                        _context.Policies.Remove(policies);
                    }
                }
            }
            await _context.SaveChangesAsync();
            return Json(new { success = true, message = "Delete success." });
        }
        private bool AdvertisementsExists(Guid id)
        {
          return (_context.Policies?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
