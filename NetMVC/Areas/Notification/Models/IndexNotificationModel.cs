namespace NetMVC.Areas.Notification.Models;

public class IndexNotificationModel
{
    public int ITEM_PER_PAGE { get; set; }
    public int totalNotifications { get; set; }
    public X.PagedList.IPagedList<NetMVC.Models.Notification> notifications { get; set; }
}