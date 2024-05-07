using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace NetMVC.Models;

[Table("Comment")]
public class Comment : Common
{ 
    [Key]
    public Guid Id { get; set; }
    
    [Column(TypeName = "nvarchar(250)")]
    [Display(Name = "Content")]
    public string? Content { get; set; }
    
    [Display(Name = "Content")]
    public int Rating { get; set; }
    
    [Required]
    public Guid? ProductId { get; set; }
    public virtual Product? Product {get;set;}
    
    [Required]
    public string? AppUserIdFK { get; set; }
    public virtual AppUser? AppUser {get;set;}
}