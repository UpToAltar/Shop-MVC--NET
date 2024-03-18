using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace NetMVC.Models;

[Table("ProductCategory")]
public class ProductCategory : Common
{
    public ProductCategory()
    {
        this.Products = new HashSet<Product>();
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
    
    [Display(Name = "Icon")]
    public string? Icon {get;set;}
    
    [Column(TypeName = "nvarchar(200)")]
    [Display(Name = "Seo Title")]
    public string? SeoTitle {get;set;}
    
    [Column(TypeName = "nvarchar(250)")]
    [Display(Name = "Seo Description")]
    public string? SeoDescription {get;set;}
    
    [Column(TypeName = "nvarchar(250)")]
    [Display(Name = "Seo Keywords")]
    public string? SeoKeywords {get;set;}
    
    public ICollection<Product>? Products {get;set;}
}