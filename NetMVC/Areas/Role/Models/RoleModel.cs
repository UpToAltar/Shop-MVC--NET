using Microsoft.AspNetCore.Identity;

namespace NetMVC.Areas.Role.Models;

public class RoleModel : IdentityRole
{
    public List<string> Claims { get; set; }
}
