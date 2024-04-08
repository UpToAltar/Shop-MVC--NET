namespace NetMVC.Areas.Category.Models;

public class IndexAdvertisementsModel
{
    public int ITEM_PER_PAGE { get; set; }
    public int totalAdvertisements { get; set; }
    public X.PagedList.IPagedList<NetMVC.Models.Advertisement> advertisements { get; set; }
}