namespace NetMVC.Models;

public class IndexContactModel
{
    public int ITEM_PER_PAGE { get; set; }
    public int currentPage { get; set; }
    public int countPage { get; set; }
    public List<Contact> contacts { get; set; }
    
    public List<Contact> contactsAll { get; set; }
}