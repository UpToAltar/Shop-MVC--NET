using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NetMVC.Areas.Admin.Models;
using NetMVC.Areas.Payment.Models;
using NetMVC.Models;

namespace NetMVC.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = $"{BaseRole.Admin},{BaseRole.Manager}")]
    public class HomeController : Controller
    {
        private readonly AppDbContext _context;
        public HomeController(AppDbContext context)
        {
            _context = context;
        }
        
        public async Task<IActionResult> Index()
        {
            var orders = await _context.Orders.ToListAsync();
            if (orders == null)
            {
                orders = new List<NetMVC.Models.Order>();
            }
            var totalRevenue = orders.Where(o => o.Status == (int)StatusOrder.Completed).Sum(o => o.TotalAmount);
            var totalOrder = orders.Count();
            var orderPending = orders.Count(o => o.Status == (int)StatusOrder.Pending);
            var orderCompleted = orders.Count(o => o.Status == (int)StatusOrder.Completed);
            var orderCancelled = orders.Count(o => o.Status == (int)StatusOrder.Cancelled);
            var orderShipping = orders.Count(o => o.Status == (int)StatusOrder.Shipping);
            var orderConfirmedByUser = orders.Count(o => o.Status == (int)StatusOrder.ConfirmedByUser);
            var orderConfirmedByAdmin = orders.Count(o => o.Status == (int)StatusOrder.ConfirmedByAdmin);
            var model = new IndexAdminModel()
            {
                Orders = orders,
                TotalRevenue = totalRevenue,
                TotalOrder = totalOrder,
                OrderPending = orderPending,
                OrderCompleted = orderCompleted,
                OrderCancelled = orderCancelled,
                OrderShipping = orderShipping,
                OrderConfirmedByUser = orderConfirmedByUser,
                OrderConfirmedByAdmin = orderConfirmedByAdmin,
                BankingMethod = orders.Count(o => o.MethodPay == (int)MethodPayment.Banking),
                CashMethod = orders.Count(o => o.MethodPay == (int)MethodPayment.Cash),
            };
            return View(model);
        }
    }
}