using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using NetMVC.Areas.Product.Models;
using NetMVC.Models;
using NetMVC.UpLoad;
using NuGet.Packaging;
using X.PagedList;

namespace NetMVC.Areas.Product.Controllers
{
    [Area("Product")]
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
            var product = _context.Products.OrderBy( n => n.Title).ToPagedList(page ?? 1, ITEM_PER_PAGE);
            if (!string.IsNullOrEmpty(searchString))
            {
                product = _context.Products.Where(n => n.Title.Contains(searchString)).OrderBy(n => n.Title).ToPagedList(page ?? 1, ITEM_PER_PAGE);
            }

            foreach (var p in product)
            {
                var category = await _context.ProductCategories.FirstOrDefaultAsync( c=> c.Id == p.ProductCategoryId);
                if(category != null)
                {
                    p.ProductCategory = category;
                }
            }
            var model = new IndexProductsModel
            {
                ITEM_PER_PAGE = ITEM_PER_PAGE,
                totalProducts = await _context.Products.CountAsync(),
                products = product
            };
            return View(model);
        }
        

        // GET: Products/Home/Details/5
        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null || _context.Products == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .FirstOrDefaultAsync(m => m.Id == id);
            if (product == null)
            {
                return NotFound();
            }
            var category = await _context.ProductCategories.FirstOrDefaultAsync( c=> c.Id == product.ProductCategoryId);
            var productImages = await _context.ProductImages.Where( p => p.ProductId == product.Id).ToListAsync();
            if(category != null)
            {
                product.ProductCategory = category;
            }
            if(productImages.Count > 0)
            {
                product.ProductImages = productImages;
            }

            return View(product);
        }

        // GET: Products/Home/Create
        public IActionResult Create()
        {
            ViewData["ProductCategoryId"] = new SelectList(_context.ProductCategories.ToList(), "Id", "Title");
            return View();
        }

        // POST: Products/Home/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(IFormFile? file, IFormFile[]? files,
            [Bind("Id,Title,Description,ProductCode,Detail,Price,"+
                  "SeoTitle,SeoDescription,SeoKeywords,PriceSale,Quantity," +
                  "IsFeature,IsHot,IsHome,IsActive,IsSale,ProductCategoryId,")] NetMVC.Models.Product product)
        {
            ViewData["ProductCategoryId"] = new SelectList(_context.ProductCategories.ToList(), "Id", "Title");
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    string imageLink = await _uploadService.UploadFile(file);
                    if(!string.IsNullOrEmpty(imageLink))
                    {
                        product.Image = imageLink;
                    }
                }
                
                if(files != null)
                {
                    var imageLinks = await _uploadService.UploadManyFiles(files);
                    if(imageLinks.Count > 0)
                    {
                        var productImages = new List<ProductImage>();
                        foreach (var img in imageLinks)
                        {
                            productImages.Add(new ProductImage
                            {
                                Id = Guid.NewGuid(),
                                Image = img,
                                ProductId = product.Id,
                                IsDefault = false
                            });
                        }
                        product.ProductImages = productImages;
                    }
                }
                
                product.Id = Guid.NewGuid();
                product.CreatedAt = DateTime.Now;
                product.UpdatedAt = DateTime.Now;
                product.CreatedBy = User.Identity.Name;
                product.UpdatedBy = User.Identity.Name;
                product.ProductCategory = await _context.ProductCategories.FirstOrDefaultAsync( c=> c.Id == product.ProductCategoryId);
                _context.Add(product);
                StatusMessage = "Products has been created.";
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(product);
        }

        // GET: Products/Home/Edit/5
        public async Task<IActionResult> Edit(Guid? id)
        {
            if (id == null || _context.Products == null)
            {
                return NotFound();
            }
            
            var product = await _context.Products.FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }
            var category = await _context.ProductCategories.FirstOrDefaultAsync( c=> c.Id == product.ProductCategoryId);
            var productImages = await _context.ProductImages.Where( p => p.ProductId == product.Id).ToListAsync();
            if(category != null)
            {
                product.ProductCategory = category;
            }
            if(productImages.Count > 0)
            {
                product.ProductImages = productImages;
            }
            ViewData["ProductCategoryId"] = new SelectList(_context.ProductCategories.ToList(), "Id", "Title",category.Id.ToString());
            return View(product);
        }

        // POST: Products/Home/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Guid id,IFormFile? file, IFormFile[]? files,
            [Bind("Id,Title,Description,ProductCode,Detail,Price,Image,"+
            "SeoTitle,SeoDescription,SeoKeywords,PriceSale,Quantity,CreatedAt,CreatedBy," +
            "IsFeature,IsHot,IsHome,IsActive,ProductImages,IsSale,ProductCategoryId,")] NetMVC.Models.Product product)
        {
            ViewData["ProductCategoryId"] = new SelectList(_context.ProductCategories.ToList(), "Id", "Title");
            if (id != product.Id)
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
                            if(product.Image != null)
                            {
                               await _uploadService.DeleteFile(product.Image);
                            }
                            product.Image = imageLink;
                        }
                    }
                    
                    if(files != null)
                    {
                        var imageLinks = await _uploadService.UploadManyFiles(files);
                        if(imageLinks.Count > 0)
                        {
                            var productImages = new List<ProductImage>();
                            foreach (var img in imageLinks)
                            {
                                productImages.Add(new ProductImage
                                {
                                    Id = Guid.NewGuid(),
                                    Image = img,
                                    ProductId = product.Id,
                                    IsDefault = false
                                });
                            }

                             await _context.ProductImages.AddRangeAsync(productImages);
                        }
                    }
                    
                    
                    product.UpdatedAt = DateTime.Now;
                    product.UpdatedBy = User.Identity.Name;
                    _context.Products.Update(product);
                    StatusMessage = "Products has been updated.";
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductsExists(product.Id))
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
            return View(product);
        }

        // GET: Products/Home/Delete/5
        public async Task<IActionResult> Delete(Guid? id)
        {
            if (id == null || _context.Products == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .FirstOrDefaultAsync(m => m.Id == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // POST: Products/Home/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(Guid id)
        {
            if (_context.Products == null)
            {
                return Problem("Entity set 'AppDbContext.Products'  is null.");
            }
            var product = await _context.Products.FindAsync(id);
            if (product != null)
            {
                if(product.Image != null)
                {
                    await _uploadService.DeleteFile(product.Image);
                }
                var productImages = await _context.ProductImages.Where( p => p.ProductId == product.Id).ToListAsync();
                if(productImages.Count > 0)
                {
                    var listImage = productImages.Select( i => i.Image).ToList();
                    if(listImage.Count > 0)
                    {
                        await _uploadService.DeleteManyFiles(listImage);
                    }
                    _context.ProductImages.RemoveRange(productImages);
                }
                _context.Products.Remove(product);
            }
            StatusMessage = "Products has been deleted.";
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }
        
        
        [HttpPost]
        public async Task<IActionResult> DeleteMany([FromBody]string? data)
        {
            if (_context.Products == null)
            {
                return Json(new { success = false, message = "Entity set 'AppDbContext.Products'  is null." });
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
                    var product = await _context.Products.FindAsync(guid);
                    if (product != null)
                    {
                        if(product.Image != null)
                        {
                            await _uploadService.DeleteFile(product.Image);
                        }
                        _context.Products.Remove(product);
                        
                        var productImages = await _context.ProductImages.Where( p => p.ProductId == product.Id).ToListAsync();
                        if(productImages.Count > 0)
                        {
                            var listImage = productImages.Select( i => i.Image).ToList();
                            if(listImage.Count > 0)
                            {
                                await _uploadService.DeleteManyFiles(listImage);
                            }
                            _context.ProductImages.RemoveRange(productImages);
                        }
                    }
                }
            }
            await _context.SaveChangesAsync();
            return Json(new { success = true, message = "Delete success." });
        }
        private bool ProductsExists(Guid id)
        {
          return (_context.Products?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
