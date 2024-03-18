using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace NetMVC.Models;

[Table("Subcribe")]
public class Subcribe
{
    [Key]
    public Guid Id { get; set; }
    
    [Column(TypeName = "nvarchar(200)")]
    [EmailAddress]
    [Microsoft.Build.Framework.Required]
    [Display(Name = "Email")]
    public string Email { get; set; }
    
    public DateTime? CreatedAt { get; set; }
}