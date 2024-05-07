using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using NetMVC.Areas.Subcriber.Models;
using NetMVC.Models;
using NetMVC.UpLoad;
using X.PagedList;

namespace NetMVC.Areas.Subscriber.Controllers
{
    [Area("Subscriber")]
    [Authorize(Roles = $"{BaseRole.Admin},{BaseRole.Manager}")]
    public class HomeController : Controller
    {
        private readonly AppDbContext _context;
        public HomeController(AppDbContext context)
        {
            _context = context;
        }

        [TempData]
        public string StatusMessage { get; set; }
        public const int ITEM_PER_PAGE = 5;

        // GET: News/Home
        public async Task<IActionResult> Index(string? searchString, int? page = 1)
        {
            if(_context.Subscribers == null)
            {
                return Problem("Entity set 'AppDbContext.Subscribers'  is null.");
            }
            var subscribers = _context.Subscribers.OrderByDescending( n => n.CreatedAt).ToPagedList(page ?? 1, ITEM_PER_PAGE);
            if (!string.IsNullOrEmpty(searchString))
            {
                subscribers = _context.Subscribers.Where(n => n.Email.Contains(searchString)).OrderByDescending(n => n.CreatedAt).ToPagedList(page ?? 1, ITEM_PER_PAGE);
            }
            var model = new IndexSubscriberModel()
            {
                ITEM_PER_PAGE = ITEM_PER_PAGE,
                totalSubscribers = await _context.Subscribers.CountAsync(),
                subscribers = subscribers
            };
            return View(model);
        }
        
        // GET: Subscribers/Home/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Subscribers/Home/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(
            [Bind("Id,Email")] NetMVC.Models.Subscriber subscribers)
        {
            if (ModelState.IsValid)
            {
                var oldSubcriber = await _context.Subscribers.FirstOrDefaultAsync(n => n.Email == subscribers.Email);
                if (oldSubcriber != null)
                {
                    StatusMessage = "Subscribers has been existed.";
                    return View(subscribers);
                }
                subscribers.Id = Guid.NewGuid();
                subscribers.CreatedAt = DateTime.Now;
                _context.Add(subscribers);
                StatusMessage = "Subscribers has been created.";
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(subscribers);
        }
        
        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> SubByUser([FromBody]BodySubModel data)
        {
            if (data != null)
            {
                var oldSubscriber = await _context.Subscribers.FirstOrDefaultAsync(n => n.Email == data.Email);
                if (oldSubscriber != null)
                {
                    return Json(new { success = false, message = "User had subscribed" });
                }
                var subscribers = new Models.Subscriber();
                subscribers.Id = Guid.NewGuid();
                subscribers.CreatedAt = DateTime.Now;
                subscribers.Email = data.Email;
                await _context.Subscribers.AddAsync(subscribers);
                await _context.SaveChangesAsync();
                return Json(new { success = true, message = "Subscribed success!" });
            }
            return Json(new { success = false, message = "Invalid data request!" });
        }
        

        public async Task<IActionResult> Delete(Guid? id)
        {
            if (id == null || _context.Subscribers == null)
            {
                return NotFound();
            }

            var subscribers = await _context.Subscribers
                .FirstOrDefaultAsync(m => m.Id == id);
            if (subscribers == null)
            {
                return NotFound();
            }

            return View(subscribers);
        }

        // POST: Subscribers/Home/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(Guid id)
        {
            if (_context.Subscribers == null)
            {
                return Problem("Entity set 'AppDbContext.Subscribers'  is null.");
            }
            var subscribers = await _context.Subscribers.FindAsync(id);
            if (subscribers != null)
            {
                _context.Subscribers.Remove(subscribers);
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
            if (_context.Subscribers == null)
            {
                return Json(new { success = false, message = "Entity set 'AppDbContext.Subscribers'  is null." });
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
                    var subscribers = await _context.Subscribers.FindAsync(guid);
                    if (subscribers != null)
                    {
                        _context.Subscribers.Remove(subscribers);
                    }
            }
            }
            await _context.SaveChangesAsync();
            return Json(new { success = true, message = "Delete success." });
        }
    }
}
