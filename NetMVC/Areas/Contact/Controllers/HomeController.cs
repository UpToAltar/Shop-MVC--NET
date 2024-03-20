using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using NetMVC.Models;

namespace NetMVC.Areas.Contact
{
    [Area("Contact")]
    [Authorize(Roles = "Admin")]
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

        

        // GET: Contact/Contact
        public async Task<IActionResult> Index(string? searchString)
        {
            if(_context.Contacts == null)
            {
                return Problem("Entity set 'AppDbContext.Contacts'  is null.");
            }

            var Contacts = await _context.Contacts.ToListAsync();
            var AllContacts = Contacts;
            
            if (currentPage < 1 || currentPage > countPage)
            {
                currentPage = 1;
            }
            
            Contacts = Contacts.Skip((currentPage - 1) * ITEM_PER_PAGE).Take(ITEM_PER_PAGE).OrderBy(u=> u.UserName).ToList();
            if (!string.IsNullOrEmpty(searchString))
            {
                Contacts = AllContacts.Where(u => u.UserName.Contains(searchString)).Skip((currentPage - 1) * ITEM_PER_PAGE).Take(ITEM_PER_PAGE).OrderBy(u=> u.UserName).ToList();
            }
            countPage = (int)Math.Ceiling((double)Contacts.Count / ITEM_PER_PAGE);
            var model = new IndexContactModel()
            {
                contacts = Contacts,
                ITEM_PER_PAGE = ITEM_PER_PAGE,
                currentPage = currentPage,
                countPage = countPage,
                contactsAll = AllContacts
            };
            return View(model);
        }

        // GET: Contact/Contact/Details/5
        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null || _context.Contacts == null)
            {
                return NotFound();
            }

            var contact = await _context.Contacts
                .FirstOrDefaultAsync(m => m.Id == id);
            if (contact == null)
            {
                return NotFound();
            }

            return View(contact);
        }

        // GET: Contact/Contact/Create
        [AllowAnonymous]
        public IActionResult Create()
        {
            return View();
        }

        // POST: Contact/Contact/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [AllowAnonymous]
        public async Task<IActionResult> Create([Bind("UserName,Email,PhoneNumber,Message,CreatedAt,CreatedBy")] Models.Contact contact)
        {
            if (ModelState.IsValid)
            {
                contact.Id = Guid.NewGuid();
                contact.CreatedAt = DateTime.Now;
                contact.CreatedBy = contact.UserName ?? "Anonymous";
                _context.Add(contact);
                await _context.SaveChangesAsync();
                StatusMessage = "Contact created successfully.";
                return RedirectToAction("Index", "Home", new { area = ""});
            }
            return View(contact);
        }

        // GET: Contact/Contact/Edit/5
        public async Task<IActionResult> Edit(Guid? id)
        {
            if (id == null || _context.Contacts == null)
            {
                return NotFound();
            }

            var contact = await _context.Contacts.FindAsync(id);
            if (contact == null)
            {
                return NotFound();
            }
            
            return View(contact);
        }

        // POST: Contact/Contact/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Guid id, [Bind("Id, UserName,Email,PhoneNumber,Message,CreatedAt,CreatedBy")] Models.Contact contact)
        {
            if (id != contact.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(contact);
                    await _context.SaveChangesAsync();
                    StatusMessage = "Contact updated successfully.";
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ContactExists(contact.Id))
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
            return View(contact);
        }

        // GET: Contact/Contact/Delete/5
        public async Task<IActionResult> Delete(Guid? id)
        {
            if (id == null || _context.Contacts == null)
            {
                return NotFound();
            }

            var contact = await _context.Contacts
                .FirstOrDefaultAsync(m => m.Id == id);
            if (contact == null)
            {
                return NotFound();
            }

            return View(contact);
        }

        // POST: Contact/Contact/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(Guid id)
        {
            if (_context.Contacts == null)
            {
                return Problem("Entity set 'AppDbContext.Contacts'  is null.");
            }
            var contact = await _context.Contacts.FindAsync(id);
            if (contact != null)
            {
                _context.Contacts.Remove(contact);
            }
            
            await _context.SaveChangesAsync();
            StatusMessage = "Contact deleted successfully.";
            return RedirectToAction(nameof(Index));
        }

        private bool ContactExists(Guid id)
        {
          return (_context.Contacts?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
