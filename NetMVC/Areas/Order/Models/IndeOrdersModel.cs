using NetMVC.Areas.Payment.Models;

namespace NetMVC.Areas.Order.Models;

public class IndeOrdersModel
{
    public int ITEM_PER_PAGE { get; set; }
    public int totalOrders { get; set; }
    
    public StatusOrder StatusOrder { get; set; }
    public X.PagedList.IPagedList<NetMVC.Models.Order> orders { get; set; }
}