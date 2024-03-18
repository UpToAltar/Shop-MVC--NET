using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace NetMVC.Models;

[Table("Category")]
public class Category : Common
{
    public Category()
    {
        this.News = new HashSet<News>();
    }
    
    [Key]
    public Guid Id { get; set; }
    
    [Column(TypeName = "nvarchar(200)")]
    [Required]
    [Display(Name = "Title")]
    public string Title { get; set; }
    
    [Column(TypeName = "nvarchar(250)")]
    [Display(Name = "Description")]
    public string? Description { get; set; }
    
    [Display(Name = "Position")]
    public int? Position {get;set;}
    
    [Column(TypeName = "nvarchar(200)")]
    [Display(Name = "Seo Title")]
    public string? SeoTitle {get;set;}
    
    [Column(TypeName = "nvarchar(250)")]
    [Display(Name = "Seo Description")]
    public string? SeoDescription {get;set;}
    
    [Column(TypeName = "nvarchar(250)")]
    [Display(Name = "Seo Keywords")]
    public string? SeoKeywords {get;set;}
    
    public ICollection<News>? News {get;set;}
    public ICollection<Post>? Posts {get;set;}
}