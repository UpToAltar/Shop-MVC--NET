using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace NetMVC.Models;

[Table("Advertisement")]
public class Advertisement : Common
{
    [Key]
    public Guid Id { get; set; }
    
    [Column(TypeName = "nvarchar(200)")]
    [Required]
    [Display(Name = "Title")]
    public string Title { get; set; }
    
    [Column(TypeName = "nvarchar(250)")]
    [Display(Name = "Description")]
    [Required]
    public string Description { get; set; }
    
    [Display(Name = "Type")]
    public int? Type {get;set;}
    
    [Column(TypeName = "nvarchar(200)")]
    [Display(Name = "Image")]
    public string? Image {get;set;}
    
    [Column(TypeName = "nvarchar(250)")]
    [Display(Name = "Link")]
    public string? Link {get;set;}
    
}