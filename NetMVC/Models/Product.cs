using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace NetMVC.Models;

[Table("Product")]
public class Product : Common
{
    [Key]
    public Guid Id { get; set; }
    
    [Column(TypeName = "nvarchar(200)")]
    [Required]
    [Display(Name = "Title")]
    public string Title { get; set; }
    
    [Column(TypeName = "ntext")]
    [Display(Name = "Description")]
    public string? Description { get; set; }
    
    [Column(TypeName = "nvarchar(200)")]
    public string? ProductCode { get; set; }
    
    [Column(TypeName = "nvarchar(200)")]
    [Display(Name = "Detail")]
    public string? Detail { get; set; }
    
    [Column(TypeName = "nvarchar(250)")]
    [Display(Name = "Image")]
    public string? Image { get; set; }
    
    public decimal? Price { get; set; }
    
    public decimal? PriceSale { get; set; }
    
    public int? Quantity { get; set; }
    
    [Column(TypeName = "nvarchar(200)")]
    [Display(Name = "Seo Title")]
    public string? SeoTitle {get;set;}
    
    [Column(TypeName = "nvarchar(250)")]
    [Display(Name = "Seo Description")]
    public string? SeoDescription {get;set;}
    
    [Column(TypeName = "nvarchar(250)")]
    [Display(Name = "Seo Keywords")]
    public string? SeoKeywords {get;set;}
    
    public bool? IsFeature { get; set; }
    
    public bool? IsHot { get; set; }
    
    public bool? IsHome { get; set; }
    
    public bool? IsSale { get; set; }
    
    public Guid? ProductCategoryId { get; set; }
    
    public virtual ProductCategory? ProductCategory { get; set; }
}