namespace NetMVC.Models.Main;

public class IndexDetail
{
    public Product product { get; set; }
    public List<Policy> policyModel { get; set; }
    
    public string? userId { get; set; }
}