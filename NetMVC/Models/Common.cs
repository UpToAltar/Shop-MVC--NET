using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace NetMVC.Models;

public class Common 
{
    [DataType(DataType.Date)]
    public DateTime? CreatedAt { get; set; }
    
    [DataType(DataType.Date)]
    public DateTime? UpdatedAt { get; set; }
    
    public string? CreatedBy { get; set; }
    
    public string? UpdatedBy { get; set; }
    
    [DefaultValue(false)]
    public bool? IsDeleted { get; set; }
}