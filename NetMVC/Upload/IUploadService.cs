namespace NetMVC.UpLoad;

public interface IUploadService
{
    public Task<string> UploadFile(IFormFile file);
    public Task<string> DeleteFile(string url);
}