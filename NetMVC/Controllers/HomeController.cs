using System.Diagnostics;
using Microsoft.AspNetCore.Antiforgery;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NetMVC.Areas.News.Models;
using NetMVC.Models;
using NetMVC.Models.Main;
using X.PagedList;

namespace NetMVC.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;
    private readonly AppDbContext _context;
    public const int ITEM_PER_PAGE = 6;
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
        var bestSellerModel = productModel.Where(p => p.IsHot && p.IsActive).ToList();
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
    
    public async Task<IActionResult> Blog(string? searchString, int? page = 1)
    {
        if(_context.News == null)
        {
            return Problem("Entity set 'AppDbContext.News'  is null.");
        }
        var news = _context.News.Where(n => n.IsActive).OrderByDescending( n => n.CreatedAt).ToPagedList(page ?? 1, ITEM_PER_PAGE);
        if (!string.IsNullOrEmpty(searchString))
        {
            news = _context.News.Where(n => n.Title.Contains(searchString) && n.IsActive).OrderByDescending(n => n.CreatedAt).ToPagedList(page ?? 1, ITEM_PER_PAGE);
        }
        var model = new IndexNewsModel
        {
            ITEM_PER_PAGE = ITEM_PER_PAGE,
            totalNews = await _context.News.CountAsync(),
            news = news
        };
        return View(model);
    }
    
    public async Task<IActionResult> BlogDetail(string ?id)
    {
        if (id == null || _context.News == null)
        {
            return RedirectToAction("Error404");
        }   
        var news = await _context.News.FirstOrDefaultAsync(m => m.Id == Guid.Parse(id));
        if (news == null)
        {
            return RedirectToAction("Error404");
        }
        return View(news);
    }

    public async Task<IActionResult> DetailProduct(Guid id)
    {
        var product = await _context.Products.FindAsync(id);
        await _context.Entry(product).Collection(p => p.ProductImages).LoadAsync();
        await _context.Entry(product).Collection(p => p.Comments).Query().Include(c => c.AppUser).LoadAsync();
        await _context.Entry(product).Reference(p => p.ProductCategory).LoadAsync();
        if (product == null)
        {
            return RedirectToAction("Error404", "Home");
        }
        product.ViewCount += 1;
        await _context.SaveChangesAsync();
        var policyModel = await _context.Policies.Where(p => p.IsActive && p.Icon != null).ToListAsync();
        
        var model = new IndexDetail()
        {
            product = product,
            policyModel = policyModel,
            userId = await _context.Users.Where(u => u.UserName == User.Identity.Name).Select(u => u.Id).FirstOrDefaultAsync()
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