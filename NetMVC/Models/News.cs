using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace NetMVC.Models;

[Table("News")]
public class News : Common
{
    [Key]
    public Guid Id { get; set; }
    
    [Column(TypeName = "nvarchar(200)")]
    [Required]
    [Display(Name = "Title")]
    public string Title { get; set; }
    
    [Column(TypeName = "nvarchar(250)")]
    [Display(Name = "Description")]
    public string? Description { get; set; }
    
    [Column(TypeName = "nvarchar(250)")]
    [Display(Name = "Detail")]
    public string? Detail { get; set; }
    
    [Display(Name = "Image")]
    public string? Image {get;set;}
    
    [Column(TypeName = "nvarchar(200)")]
    [Display(Name = "Seo Title")]
    public string? SeoTitle {get;set;}
    
    [Column(TypeName = "nvarchar(250)")]
    [Display(Name = "Seo Description")]
    public string? SeoDescription {get;set;}
    
    [Column(TypeName = "nvarchar(250)")]
    [Display(Name = "Seo Keywords")]
    public string? SeoKeywords {get;set;}
    
    public virtual Category? Category {get;set;}
}