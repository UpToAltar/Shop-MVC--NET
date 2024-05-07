namespace NetMVC.Areas.Policy.Models;

public class IndexPolicyModel
{
    public int ITEM_PER_PAGE { get; set; }
    public int totalPolicies { get; set; }
    public X.PagedList.IPagedList<NetMVC.Models.Policy> policies { get; set; }
}