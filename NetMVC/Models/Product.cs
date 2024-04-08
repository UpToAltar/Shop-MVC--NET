using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace NetMVC.Models;

[Table("Product")]
public class Product : Common
{
    
    public Product()
    {
        this.ProductImages = new HashSet<ProductImage>();
        this.OrderDetails = new HashSet<OrderDetail>();
    }
    [Key]
    public Guid Id { get; set; }
    
    [Column(TypeName = "nvarchar(200)")]
    [Required]
    [Display(Name = "Title")]
    public string Title { get; set; }
    
    [Column(TypeName = "ntext")]
    [Display(Name = "Description")]
    [Required]
    public string? Description { get; set; }
    
    [Column(TypeName = "nvarchar(200)")]
    [Required]
    public string? ProductCode { get; set; }
    
    [Column(TypeName = "nvarchar(200)")]
    [Display(Name = "Detail")]
    [Required]
    public string? Detail { get; set; }
    
    [Column(TypeName = "nvarchar(250)")]
    [Display(Name = "Image")]
    
    public string? Image { get; set; }
    
    [Required]
    public decimal Price { get; set; } 
    
    [Required]
    public decimal PriceSale { get; set; } 
    
    [Required]
    public int Quantity { get; set; }
    
    [Column(TypeName = "nvarchar(200)")]
    [Display(Name = "Seo Title")]
    public string? SeoTitle {get;set;}
    
    [Column(TypeName = "nvarchar(250)")]
    [Display(Name = "Seo Description")]
    public string? SeoDescription {get;set;}
    
    [Column(TypeName = "nvarchar(250)")]
    [Display(Name = "Seo Keywords")]
    public string? SeoKeywords {get;set;}

    public bool IsNew { get; set; } = false;
    
    public bool IsHot { get; set; } = false;
    
    public bool IsHome { get; set; } = false;
    
    public bool IsSale { get; set; } = false;
    
    public bool IsActive {get;set;}
    
    [Required]
    public Guid? ProductCategoryId { get; set; }
    
    public virtual ProductCategory? ProductCategory { get; set; }
    public virtual ICollection<ProductImage>? ProductImages { get; set; }
    
    public virtual ICollection<OrderDetail>? OrderDetails { get; set; }
}