using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace NetMVC.Models;

[Table("Notification")]
public class Notification : Common
{
    [Key]
    public Guid Id { get; set; }
    
    [Column(TypeName = "nvarchar(250)")]
    [Display(Name = "Description")]
    public string? Description { get; set; }
    
    [Column(TypeName = "nvarchar(250)")]
    [Display(Name = "Type")]
    public string? Type { get; set; }
}

public static class TypeNotification
{
    public const string Success = "success";
    public const string Info = "info";
    public const string Warning = "warning";
}

