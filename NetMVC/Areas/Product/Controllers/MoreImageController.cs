using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NetMVC.Models;
using NetMVC.UpLoad;

namespace NetMVC.Areas.Products.Controllers;

[Area("Product")]
[Authorize(Roles = $"{BaseRole.Admin},{BaseRole.Manager}")]
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
    
    [HttpPost]
    public async Task<IActionResult> SetDefault([FromBody] string? id)
    {
        var oldDefault = await _context.ProductImages.FirstOrDefaultAsync(i => i.IsDefault == true);
        if (oldDefault != null)
        {
            oldDefault.IsDefault = false;
        }
        var newDefault = await _context.ProductImages.FirstOrDefaultAsync(i => i.Id.ToString() == id);
        if (newDefault == null)
        {
            return Json(new { success = false});
        }
        newDefault.IsDefault = true;
        await _context.SaveChangesAsync();
        return Json(new{success = true});
    }
}