using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace NetMVC.Models;

[Table("OrderDetail")]
public class OrderDetail {
    
    [Key]
    public Guid Id { get; set; }
    public Guid OrderId { get; set; }
    public Guid ProductId { get; set; }
    
    [Display(Name = "Quantity")]
    public int? Quantity { get; set; }
    
    [Display(Name = "Price")]
    public decimal? Price { get; set; }
    
    public virtual Product? Product { get; set; }
    
    public virtual Order? Order { get; set; }
}