using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace NetMVC.Models;

public class Statistical
{
    [Key]
    public int Id { get; set; }
    
    [Required]
    public decimal TotalAmount { get; set; } 
    
    [Required]
    public int TotalOrderComplicated { get; set; } 
    
    [Required]
    public int TotalQuantity { get; set; } 
    
    [DataType(DataType.Date)]
    public DateTime? Time { get; set; }
}