using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using NetMVC.Areas.Category.Models;
using NetMVC.Models;

namespace NetMVC.Areas.News.Controllers
{
    [Area("News")]
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

        // GET: News/Home
        public async Task<IActionResult> Index(string? searchString)
        {
            if(_context.News == null)
            {
                return Problem("Entity set 'AppDbContext.News'  is null.");
            }

            var News = await _context.News.ToListAsync();
            var AllNews = News;
            
            if (currentPage < 1 || currentPage > countPage)
            {
                currentPage = 1;
            }
            
            News = News.Skip((currentPage - 1) * ITEM_PER_PAGE).Take(ITEM_PER_PAGE).OrderByDescending(u=> u.CreatedAt).ToList();
            if (!string.IsNullOrEmpty(searchString))
            {
                News = AllNews.Where(u => u.Title.Contains(searchString)).Skip((currentPage - 1) * ITEM_PER_PAGE).Take(ITEM_PER_PAGE).OrderByDescending(u=> u.CreatedAt).ToList();
            }
            countPage = (int)Math.Ceiling((double)News.Count / ITEM_PER_PAGE);
            var model = new IndexNewsModel()
            {
                news = News,
                ITEM_PER_PAGE = ITEM_PER_PAGE,
                currentPage = currentPage,
                countPage = countPage,
                newsAll = AllNews
            };
            return View(model);
        }
        

        // GET: News/Home/Details/5
        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null || _context.News == null)
            {
                return NotFound();
            }

            var news = await _context.News
                .FirstOrDefaultAsync(m => m.Id == id);
            if (news == null)
            {
                return NotFound();
            }

            return View(news);
        }

        // GET: News/Home/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: News/Home/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Title,Description,Detail,Image,SeoTitle,SeoDescription,SeoKeywords,IsActive")] Models.News news)
        {
            if (ModelState.IsValid)
            {
                news.Id = Guid.NewGuid();
                news.CreatedAt = DateTime.Now;
                news.UpdatedAt = DateTime.Now;
                news.CreatedBy = User.Identity.Name;
                news.UpdatedBy = User.Identity.Name;
                _context.Add(news);
                StatusMessage = "News has been created.";
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(news);
        }

        // GET: News/Home/Edit/5
        public async Task<IActionResult> Edit(Guid? id)
        {
            if (id == null || _context.News == null)
            {
                return NotFound();
            }

            var news = await _context.News.FindAsync(id);
            if (news == null)
            {
                return NotFound();
            }
            return View(news);
        }

        // POST: News/Home/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Guid id, [Bind("Id,Title,Description,Detail,Image,SeoTitle,SeoDescription,SeoKeywords,IsActive")] Models.News news)
        {
            if (id != news.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    news.UpdatedAt = DateTime.Now;
                    news.UpdatedBy = User.Identity.Name;
                    _context.Update(news);
                    StatusMessage = "News has been updated.";
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!NewsExists(news.Id))
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
            return View(news);
        }

        // GET: News/Home/Delete/5
        public async Task<IActionResult> Delete(Guid? id)
        {
            if (id == null || _context.News == null)
            {
                return NotFound();
            }

            var news = await _context.News
                .FirstOrDefaultAsync(m => m.Id == id);
            if (news == null)
            {
                return NotFound();
            }

            return View(news);
        }

        // POST: News/Home/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(Guid id)
        {
            if (_context.News == null)
            {
                return Problem("Entity set 'AppDbContext.News'  is null.");
            }
            var news = await _context.News.FindAsync(id);
            if (news != null)
            {
                _context.News.Remove(news);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool NewsExists(Guid id)
        {
          return (_context.News?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
