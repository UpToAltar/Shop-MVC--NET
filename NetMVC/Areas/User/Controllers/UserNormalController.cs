using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NetMVC.Areas.Order.Models;
using NetMVC.Areas.Payment.Models;
using NetMVC.Models;
using NetMVC.Models.Cart;
using NetMVC.UpLoad;
using X.PagedList;

namespace NetMVC.Areas.User.Controllers;

[Area("User")]
[Authorize]
public class UserNormalController : Controller
{
    private readonly AppDbContext _context;
    private readonly UserManager<AppUser> _userManager;
    private readonly IUploadService _uploadService;
        
    public string ImageDefault = "https://www.pngkey.com/png/full/72-729716_user-avatar-png-graphic-free-download-icon.png";

    public UserNormalController(AppDbContext context, UserManager<AppUser> userManager, IUploadService uploadService)
    {
        _context = context;
        _userManager = userManager;
        _uploadService = uploadService;
    }
    [TempData]
    public string StatusMessage { get; set; }
    public const int ITEM_PER_PAGE = 5;
    
    // GET: User/User/Edit/5
        public async Task<IActionResult> EditRender(Guid? id)
        {
            if (id == null || _context.Users == null)
            {
                return NotFound();
            }

            var user = await _context.Users.FindAsync(id.ToString());
            if (user == null)
            {
                return NotFound();
            }
            return View(user);
        }

        // POST: User/User/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditRender(Guid id, IFormFile? file,
            [Bind("Id,UserName,Email,PhoneNumber,Image,Address,Job,FbLink,IgLink,OtherLink,BirthDay,EmailConfirmed,PhoneNumberConfirmed")] 
            AppUser user)
        {
            if (id.ToString() != user.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    var userToUpdate = await _userManager.FindByIdAsync(user.Id);
                    if (userToUpdate != null)
                    {
                        if(file != null)
                        {
                            string imageLink = await _uploadService.UploadFile(file);
                            if(!string.IsNullOrEmpty(imageLink))
                            {
                                if (userToUpdate.Image != null && userToUpdate.Image != ImageDefault)
                                {
                                    await _uploadService.DeleteFile(userToUpdate.Image);
                                }
                                userToUpdate.Image = imageLink;
                            }
                        }
                        
                        userToUpdate.UserName = user.UserName;
                        userToUpdate.Email = user.Email;
                        userToUpdate.PhoneNumber = user.PhoneNumber;
                        userToUpdate.Address = user.Address;
                        userToUpdate.Job = user.Job;
                        userToUpdate.FbLink = user.FbLink;
                        userToUpdate.IgLink = user.IgLink;
                        userToUpdate.OtherLink = user.OtherLink;
                        userToUpdate.BirthDay = user.BirthDay;
                        userToUpdate.UpdatedAt = DateTime.Now;
                        userToUpdate.UpdatedBy = User.Identity?.Name;
                        userToUpdate.EmailConfirmed = user.EmailConfirmed;
                        userToUpdate.PhoneNumberConfirmed = user.PhoneNumberConfirmed;
                        await _context.SaveChangesAsync();
                        StatusMessage = "Updated info successfully.";
                    }
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!UserExists(user.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(EditRender), new {id = user.Id});
            }
            return View(user);
        }
        
        [HttpGet]
        public async Task<IActionResult> HistoryOrder(string? id,int? status, int? page = 1 )
        {
            var order = _context.Orders
                .Where(x => x.AppUserIdFK == id).OrderByDescending( n => n.CreatedAt).ToPagedList(page ?? 1, ITEM_PER_PAGE);
            if (status != -1 && status != null)
            {
                order = _context.Orders.Where(o => o.Status == status && o.AppUserIdFK == id).OrderByDescending(n => n.CreatedAt).ToPagedList(page ?? 1, ITEM_PER_PAGE);
            }
            var model = new IndeOrdersModel()
            {
                ITEM_PER_PAGE = ITEM_PER_PAGE,
                totalOrders = order.Count(),
                orders = order,
                StatusOrder = (StatusOrder)status.GetValueOrDefault()
            };
            return View(model);
        }

        [HttpGet]
        public async Task<IActionResult> HistoryDetail(string? id)
        {
            var order = await _context.Orders.Include(o => o.OrderDetails)
                .ThenInclude(od => od.Product)
                .FirstOrDefaultAsync(x => x.Id.ToString() == id);
            return View(order);
        }

        [HttpPost]
        public async Task<IActionResult> UserDeleteOrder(string? id)
        {
            var user = await _userManager.GetUserAsync(User);
            var order = await _context.Orders
                .FirstOrDefaultAsync(o => o.Id.ToString() == id && o.AppUserIdFK == user.Id);
            if (order == null)
            {
                StatusMessage = "Error: Order not found.";
                return RedirectToAction(nameof(HistoryOrder), new {id = user.Id});
            }
            order.Status = (int)StatusOrder.Cancelled;
            order.UpdatedAt = DateTime.Now;
            order.UpdatedBy = user.UserName;
            StatusMessage = "Order has been cancelled.";
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(HistoryOrder), new {id = user.Id});
        }
        
        
        
        private bool UserExists(string id)
        {
            return (_context.Users?.Any(e => e.Id == id)).GetValueOrDefault();
        }
}