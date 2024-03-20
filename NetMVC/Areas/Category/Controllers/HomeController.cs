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

namespace NetMVC.Areas.Category.Controllers
{
    [Area("Category")]
    [Authorize(Roles = "Admin,Manager")]
    public class HomeController : Controller
    {
        private readonly AppDbContext _context;

        public HomeController(AppDbContext context)
        {
            _context = context;
        }
        [TempData]
        public string StatusMessage { get; set; }
        public const int ITEM_PER_PAGE = 10;
        
        [BindProperty(SupportsGet = true, Name = "pageNumber")]
        public int currentPage { get; set; }
        public int countPage { get; set; }

        // GET: Category/Home
        public async Task<IActionResult> Index(string? searchString)
        {
            if(_context.Categories == null)
            {
                return Problem("Entity set 'AppDbContext.Categories'  is null.");
            }

            var categories = await _context.Categories.ToListAsync();
            var AllCategories = categories;
            
            if (currentPage < 1 || currentPage > countPage)
            {
                currentPage = 1;
            }
            
            categories = categories.Skip((currentPage - 1) * ITEM_PER_PAGE).Take(ITEM_PER_PAGE).OrderBy(u=> u.Position).ToList();
            if (!string.IsNullOrEmpty(searchString))
            {
                categories = AllCategories.Where(u => u.Title.Contains(searchString)).Skip((currentPage - 1) * ITEM_PER_PAGE).Take(ITEM_PER_PAGE).OrderBy(u=> u.Title).ToList();
            }
            countPage = (int)Math.Ceiling((double)categories.Count / ITEM_PER_PAGE);
            var model = new IndexCategoryModel()
            {
                categories = categories,
                ITEM_PER_PAGE = ITEM_PER_PAGE,
                currentPage = currentPage,
                countPage = countPage,
                categoriesAll = AllCategories
            };
            return View(model);
        }

        // GET: Category/Home/Details/5
        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null || _context.Categories == null)
            {
                return NotFound();
            }

            var category = await _context.Categories
                .FirstOrDefaultAsync(m => m.Id == id);
            if (category == null)
            {
                return NotFound();
            }

            return View(category);
        }

        // GET: Category/Home/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Category/Home/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Title,Description,Position,SeoTitle,SeoDescription,SeoKeywords,IsActive")] NetMVC.Models.Category category)
        {
            if (ModelState.IsValid)
            {
                category.Id = Guid.NewGuid();
                category.CreatedAt = DateTime.Now;
                category.UpdatedAt = DateTime.Now;
                category.CreatedBy = User.Identity.Name;
                category.UpdatedBy = User.Identity.Name;
                _context.Add(category);
                StatusMessage = "Category has been created.";
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(category);
        }

        // GET: Category/Home/Edit/5
        public async Task<IActionResult> Edit(Guid? id)
        {
            if (id == null || _context.Categories == null)
            {
                return NotFound();
            }

            var category = await _context.Categories.FindAsync(id);
            if (category == null)
            {
                return NotFound();
            }
            return View(category);
        }

        // POST: Category/Home/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Guid id, [Bind("Id,Title,Description,Position,SeoTitle,SeoDescription,SeoKeywords,IsActive")] NetMVC.Models.Category category)
        {
            if (id != category.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    category.UpdatedAt = DateTime.Now;
                    category.UpdatedBy = User.Identity.Name;
                    _context.Update(category);
                    StatusMessage = "Category has been updated.";
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CategoryExists(category.Id))
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
            return View(category);
        }

        // GET: Category/Home/Delete/5
        public async Task<IActionResult> Delete(Guid? id)
        {
            if (id == null || _context.Categories == null)
            {
                return NotFound();
            }

            var category = await _context.Categories
                .FirstOrDefaultAsync(m => m.Id == id);
            if (category == null)
            {
                return NotFound();
            }

            return View(category);
        }

        // POST: Category/Home/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(Guid id)
        {
            if (_context.Categories == null)
            {
                return Problem("Entity set 'AppDbContext.Categories'  is null.");
            }
            var category = await _context.Categories.FindAsync(id);
            if (category != null)
            {
                _context.Categories.Remove(category);
                StatusMessage = "Category has been deleted.";
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CategoryExists(Guid id)
        {
          return (_context.Categories?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
