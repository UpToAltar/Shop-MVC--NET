namespace NetMVC.Areas.Posts.Models;

public class IndexPostsModel
{
    public int ITEM_PER_PAGE { get; set; }
    public int totalPosts { get; set; }
    public X.PagedList.IPagedList<NetMVC.Models.Post> posts { get; set; }
}