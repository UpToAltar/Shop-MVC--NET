using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NetMVC.Models;
using NetMVC.UpLoad;

namespace NetMVC.Areas.Products.Controllers;

[Area("Product")]
public class MoreImageController : Controller
{
    private readonly AppDbContext _context;
    private readonly IUploadService _uploadService;
    public MoreImageController(AppDbContext context, IUploadService uploadService)
    {
        _context = context;
        _uploadService = uploadService;
    }
    // POST:
    [HttpPost]
    public async Task<IActionResult> Delete([FromBody] string? id)
    {
        var img = await _context.ProductImages.FirstOrDefaultAsync(i => i.Id.ToString() == id);
        if (img == null)
        {
            return Json(new { success = false});
        }
        _context.ProductImages.Remove(img);
        await _uploadService.DeleteFile(img.Image);
            
        await _context.SaveChangesAsync();
        return Json(new{success = true});
    }
}