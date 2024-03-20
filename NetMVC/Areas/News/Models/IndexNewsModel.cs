namespace NetMVC.Areas.Category.Models;

public class IndexNewsModel
{
    public int ITEM_PER_PAGE { get; set; }
    public int currentPage { get; set; }
    public int countPage { get; set; }
    public List<NetMVC.Models.News> news { get; set; }
    
    public List<NetMVC.Models.News> newsAll { get; set; }
}