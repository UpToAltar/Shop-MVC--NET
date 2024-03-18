using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace NetMVC.Models;

[Table("Order")]
public class Order : Common
{
    public Order()
    {
        this.OrderDetails = new HashSet<OrderDetail>();
    }
    
    [Key]
    public Guid Id { get; set; }
    
    [Column(TypeName = "nvarchar(200)")]
    [Display(Name = "Title")]
    [Required]
    public string Code { get; set; }
    
    [Column(TypeName = "nvarchar(200)")]
    [Display(Name = "CustomerName")]
    [Required]
    public string CustomerName { get; set; }
    
    [Column(TypeName = "nvarchar(200)")]
    [Display(Name = "PhoneNumber")]
    public string? PhoneNumber { get; set; }
    
    [Column(TypeName = "nvarchar(200)")]
    [Display(Name = "Address")]
    [Required]
    public string Address { get; set; }
    
    [Display(Name = "TotalAmount")]
    [Required]
    public decimal TotalAmount { get; set; }
    
    [Required]
    public int Quantity { get; set; }
    
    public ICollection<OrderDetail>? OrderDetails {get;set;}
}