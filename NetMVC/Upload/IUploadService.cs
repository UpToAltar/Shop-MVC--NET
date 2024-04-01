namespace NetMVC.UpLoad;

public interface IUploadService
{
    public Task<string> UploadFile(IFormFile file);
    public Task<string> DeleteFile(string url);
    
    public Task<List<string>> UploadManyFiles(IFormFile[] files);
    
    public Task<List<string>> DeleteManyFiles(List<string> urls);
}