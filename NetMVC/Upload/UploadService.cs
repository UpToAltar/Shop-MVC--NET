using CloudinaryDotNet;
using CloudinaryDotNet.Actions;
using Microsoft.Extensions.Options;

namespace NetMVC.UpLoad;

public class UploadService : IUploadService
{
    private readonly CloudinarySettings _cloudinarySettings;
    public UploadService(IOptions<CloudinarySettings> cloudinarySettings)
    {
        _cloudinarySettings = cloudinarySettings.Value;
    }
    
    public async Task<string> UploadFile(IFormFile file)
    {
        var cloudinary = new CloudinaryDotNet.Cloudinary(new Account(
            _cloudinarySettings.CloudName,
            _cloudinarySettings.ApiKey,
            _cloudinarySettings.ApiSecret
        ));

        var uploadResult = new ImageUploadResult();

        if (file.Length > 0)
        {
            using var stream = file.OpenReadStream();
            var uploadParams = new ImageUploadParams
            {
                File = new FileDescription(file.FileName,stream),
                Folder = ".Net-MVC",
                UseFilename = true,
                UniqueFilename = false,
                Overwrite = true
            };
            uploadResult = await cloudinary.UploadAsync(uploadParams);
            if (uploadResult.Error != null)
            {
                throw new Exception(uploadResult.Error.Message);
            }
        }

        return uploadResult.SecureUrl.AbsoluteUri;
    }

    public async Task<string> DeleteFile(string url)
    {
        var cloudinary = new CloudinaryDotNet.Cloudinary(new Account(
            _cloudinarySettings.CloudName,
            _cloudinarySettings.ApiKey,
            _cloudinarySettings.ApiSecret
        ));
        var format = url.IndexOf(".jpg") > 0 ? url.IndexOf(".jpg") : url.IndexOf(".png");
        string id = url.Substring(url.IndexOf(".Net-MVC"), format - url.IndexOf(".Net-MVC"));
        var deleteParams = new DeletionParams(id);
        var result = await cloudinary.DestroyAsync(deleteParams);
        if (result.Error != null)
        {
            throw new Exception(result.Error.Message);
        }
        return result.Result;
    }
}