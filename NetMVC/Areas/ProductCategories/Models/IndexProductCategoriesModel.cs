namespace NetMVC.Areas.Category.Models;

public class IndexProductCategoriesModel
{
    public int ITEM_PER_PAGE { get; set; }
    public int totalProductCategories { get; set; }
    public X.PagedList.IPagedList<NetMVC.Models.ProductCategory> productCategories { get; set; }
}