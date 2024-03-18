using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Identity;

namespace NetMVC.Models;

public class AppUser : IdentityUser
{
    [Column(TypeName = "nvarchar(200)")]
    public string? Address { get; set; }
    
    [Column(TypeName = "ntext")]
    [DefaultValue("https://www.pngkey.com/png/full/72-729716_user-avatar-png-graphic-free-download-icon.png")]
    public string? Image { get; set; }
    
    [DataType(DataType.Date)]
    public DateTime? BirthDay { get; set; }
    
    [DataType(DataType.Date)]
    public DateTime? CreatedAt { get; set; }
    
    [DataType(DataType.Date)]
    public DateTime? UpdatedAt { get; set; }
    
    public string? CreatedBy { get; set; }
    
    public string? UpdatedBy { get; set; }
    
    [DefaultValue(false)]
    public bool? IsDeleted { get; set; }
    
    public string? Job { get; set; }
    
    [DefaultValue("https://www.facebook.com/")]
    public string? FbLink { get; set; }
    
    [DefaultValue("https://www.instagram.com/")]
    public string? IgLink { get; set; }
    
    [DefaultValue("Is not updated")]
    public string? OtherLink { get; set; }
}