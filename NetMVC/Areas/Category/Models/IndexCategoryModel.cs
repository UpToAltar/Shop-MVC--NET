namespace NetMVC.Areas.Category.Models;

public class IndexCategoryModel
{
    public int ITEM_PER_PAGE { get; set; }
    public int currentPage { get; set; }
    public int countPage { get; set; }
    public List<NetMVC.Models.Category> categories { get; set; }
    
    public List<NetMVC.Models.Category> categoriesAll { get; set; }
}