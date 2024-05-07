namespace NetMVC.Areas.Subcriber.Models;

public class IndexSubscriberModel
{
    public int ITEM_PER_PAGE { get; set; }
    public int totalSubscribers { get; set; }
    public X.PagedList.IPagedList<NetMVC.Models.Subscriber> subscribers { get; set; }
}