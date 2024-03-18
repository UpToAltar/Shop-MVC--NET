using System.ComponentModel.DataAnnotations;

namespace NetMVC.Areas.Role.Models;

public class CreateRoleModel
{
    [Required]
    public string RoleName { get; set; }
}