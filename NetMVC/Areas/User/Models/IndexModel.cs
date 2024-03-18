using NetMVC.Models;

namespace NetMVC.Areas.User.Models;

public class IndexModel
{
    public int ITEM_PER_PAGE { get; set; }
    public int currentPage { get; set; }
    public int countPage { get; set; }
    public List<AppUser> users { get; set; }
    
    public List<AppUser> usersAll { get; set; }
}