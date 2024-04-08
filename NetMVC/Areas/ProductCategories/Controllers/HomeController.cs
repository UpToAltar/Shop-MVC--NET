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

namespace NetMVC.Areas.ProductCategories.Controllers
{
    [Area("ProductCategories")]
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
            if(_context.ProductCategories == null)
            {
                return Problem("Entity set 'AppDbContext.ProductCategories'  is null.");
            }
            var productCategories = _context.ProductCategories.OrderBy( n => n.CreatedAt).ToPagedList(page ?? 1, ITEM_PER_PAGE);
            if (!string.IsNullOrEmpty(searchString))
            {
                productCategories = _context.ProductCategories.Where(n => n.Title.Contains(searchString)).OrderBy(n => n.CreatedAt).ToPagedList(page ?? 1, ITEM_PER_PAGE);
            }
            var model = new IndexProductCategoriesModel
            {
                ITEM_PER_PAGE = ITEM_PER_PAGE,
                totalProductCategories = await _context.ProductCategories.CountAsync(),
                productCategories = productCategories
            };
            return View(model);
        }
        

        // GET: ProductCategories/Home/Details/5
        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null || _context.ProductCategories == null)
            {
                return NotFound();
            }

            var productCategories = await _context.ProductCategories
                .FirstOrDefaultAsync(m => m.Id == id);
            if (productCategories == null)
            {
                return NotFound();
            }

            return View(productCategories);
        }

        // GET: ProductCategories/Home/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: ProductCategories/Home/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(
            [Bind("Id,Title,Description,SeoTitle,SeoDescription,SeoKeywords")] Models.ProductCategory productCategories,
            IFormFile? file)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    string imageLink = await _uploadService.UploadFile(file);
                    if(!string.IsNullOrEmpty(imageLink))
                    {
                        productCategories.Icon = imageLink;
                    }
                }
                productCategories.Id = Guid.NewGuid();
                productCategories.CreatedAt = DateTime.Now;
                productCategories.UpdatedAt = DateTime.Now;
                productCategories.CreatedBy = User.Identity.Name;
                productCategories.UpdatedBy = User.Identity.Name;
                _context.Add(productCategories);
                StatusMessage = "ProductCategories has been created.";
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(productCategories);
        }

        // GET: ProductCategories/Home/Edit/5
        public async Task<IActionResult> Edit(Guid? id)
        {
            if (id == null || _context.ProductCategories == null)
            {
                return NotFound();
            }

            var productCategories = await _context.ProductCategories.FindAsync(id);
            if (productCategories == null)
            {
                return NotFound();
            }
            return View(productCategories);
        }

        // POST: ProductCategories/Home/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Guid id,IFormFile? file,
            [Bind("Id,Title,Description,Icon,SeoTitle,SeoDescription,SeoKeywords,CreatedAt,CreatedBy")] Models.ProductCategory productCategories)
        {
            if (id != productCategories.Id)
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
                            if(productCategories.Icon != null)
                            {
                               await _uploadService.DeleteFile(productCategories.Icon);
                            }
                            productCategories.Icon = imageLink;
                        }
                    }
                    productCategories.UpdatedAt = DateTime.Now;
                    productCategories.UpdatedBy = User.Identity.Name;
                    _context.Update(productCategories);
                    StatusMessage = "ProductCategories has been updated.";
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductCategoriesExists(productCategories.Id))
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
            return View(productCategories);
        }

        // GET: ProductCategories/Home/Delete/5
        public async Task<IActionResult> Delete(Guid? id)
        {
            if (id == null || _context.ProductCategories == null)
            {
                return NotFound();
            }

            var productCategories = await _context.ProductCategories
                .FirstOrDefaultAsync(m => m.Id == id);
            if (productCategories == null)
            {
                return NotFound();
            }

            return View(productCategories);
        }

        // POST: ProductCategories/Home/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(Guid id)
        {
            if (_context.ProductCategories == null)
            {
                return Problem("Entity set 'AppDbContext.ProductCategories'  is null.");
            }
            var productCategories = await _context.ProductCategories.FindAsync(id);
            if (productCategories != null)
            {
                if(productCategories.Icon != null)
                {
                    await _uploadService.DeleteFile(productCategories.Icon);
                }
                _context.ProductCategories.Remove(productCategories);
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
            if (_context.ProductCategories == null)
            {
                return Json(new { success = false, message = "Entity set 'AppDbContext.ProductCategories'  is null." });
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
                    var productCategories = await _context.ProductCategories.FindAsync(guid);
                    if (productCategories != null)
                    {
                        if(productCategories.Icon != null)
                        {
                            await _uploadService.DeleteFile(productCategories.Icon);
                        }
                        _context.ProductCategories.Remove(productCategories);
                    }
                }
            }
            await _context.SaveChangesAsync();
            return Json(new { success = true, message = "Delete success." });
        }
        private bool ProductCategoriesExists(Guid id)
        {
          return (_context.ProductCategories?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
