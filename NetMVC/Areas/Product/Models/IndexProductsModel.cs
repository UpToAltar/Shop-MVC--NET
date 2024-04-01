namespace NetMVC.Areas.Category.Models;

public class IndexProductsModel
{
    public int ITEM_PER_PAGE { get; set; }
    public int totalProducts { get; set; }
    public X.PagedList.IPagedList<NetMVC.Models.Product> products { get; set; }
}