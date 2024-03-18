using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace NetMVC.Models;

[Table("SystemSetting")]
public class SystemSetting
{
    [Key]
    public Guid SettingKey { get; set; }
    
    [Column(TypeName = "nvarchar(200)")]
    public string? SettingValue { get; set; }
    
    [Column(TypeName = "nvarchar(250)")]
    public string? SettingDescription { get; set; }
}