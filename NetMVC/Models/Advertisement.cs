using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace NetMVC.Models;

[Table("Advertisement")]
public class Advertisement : Common
{
    [Key]
    public Guid Id { get; set; }
    
    [Column(TypeName = "nvarchar(200)")]
    [Display(Name = "Title")]
    public string? Title { get; set; }
    
    [Column(TypeName = "nvarchar(250)")]
    [Display(Name = "Description")]
    public string? Description { get; set; }
    
    [Column(TypeName = "nvarchar(200)")]
    [Display(Name = "Image")]
    public string? Image {get;set;}
    
    [Column(TypeName = "nvarchar(250)")]
    [Display(Name = "Link")]
    public string? Link {get;set;}
    
    [Display(Name = "Position")]
    [Required]
    public int? Position {get;set;}
    
    public bool IsActive {get;set;}
    
}