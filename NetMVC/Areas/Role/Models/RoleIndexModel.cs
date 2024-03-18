namespace NetMVC.Areas.Role.Models;

public class RoleIndexModel
{
    public List<RoleModel> Roles { get; set; }
    
    public int ITEM_PER_PAGE { get; set; }
    
    public int currentPage { get; set; }
    
    public int countPage { get; set; }
    
    public List<RoleModel> allRoles { get; set; }
}