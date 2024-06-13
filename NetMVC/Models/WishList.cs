using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace NetMVC.Models;

[Table("WithList")]
public class WishList
{
    [Key]
    public int Id { get; set; }
    
    [Column(TypeName = "nvarchar(200)")]
    [Required]
    [Display(Name = "UserId")]
    public string UserId { get; set; }
    
    [Column(TypeName = "nvarchar(250)")]
    [Display(Name = "ProductId")]
    [Required]
    public string? ProductId { get; set; }
    
}