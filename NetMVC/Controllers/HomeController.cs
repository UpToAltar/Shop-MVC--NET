using System.Diagnostics;
using Microsoft.AspNetCore.Antiforgery;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NetMVC.Models;
using NetMVC.Models.Main;

namespace NetMVC.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;
    private readonly AppDbContext _context;

    public HomeController(ILogger<HomeController> logger, AppDbContext context)
    {
        _logger = logger;
        _context = context;
    }
    
     public async Task<IActionResult> Index()
    {
        var categoriesModel = await _context.ProductCategories.Where(c => c.Icon != null).ToListAsync();
        var productModel = await _context.Products.Where(p => p.IsHome && p.IsActive).ToListAsync();
        var sliderModel = await _context.Advertisements.Where(a => a.IsActive).OrderBy(a => a.Position).ToListAsync();
        var bestSellerModel = productModel.Where(p => p.IsHot).ToList();
        var policyModel = await _context.Policies.Where(p => p.IsActive && p.Icon != null).ToListAsync();
        var blogModel = await _context.News.Where(b => b.IsActive).Take(3).ToListAsync();

        var model = new IndexMain()
        {
            categoriesModel = categoriesModel,
            productModel = productModel,
            sliderModel = sliderModel,
            bestSellerModel = bestSellerModel,
            policyModel = policyModel,
            blogModel = blogModel
        };
        return View(model);
    }
    public IActionResult About()
    {
        return View();
    }
    public async Task<IActionResult> Shop()
    {
        var policyModel = await _context.Policies.Where(p => p.IsActive && p.Icon != null).ToListAsync();
        var pCate = await _context.ProductCategories.ToListAsync();
        var product = await _context.Products.Where(p => p.IsActive).ToListAsync();
        var model = new IndexCate()
        {
            policyModel = policyModel,
            pCate = pCate,
            product = product
        };
        return View(model);
    }

    public async Task<IActionResult> DetailProduct(Guid id)
    {
        var product = await _context.Products.FindAsync(id);
        if (product == null)
        {
            return RedirectToAction("Error404", "Home");
        }
        var policyModel = await _context.Policies.Where(p => p.IsActive && p.Icon != null).ToListAsync();
        var model = new IndexDetail()
        {
            product = product,
            policyModel = policyModel
        };
        return View(model);
    }
    
    public IActionResult Error404()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}