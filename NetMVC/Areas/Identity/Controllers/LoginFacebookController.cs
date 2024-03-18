using Bogus.DataSets;
using Facebook;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using NetMVC.Models;

namespace NetMVC.Areas.Identity.Controller;

[Area("Identity")]
public class LoginFacebookController : Microsoft.AspNetCore.Mvc.Controller
{
    public IConfiguration _configuration { get; }
    public UserManager<AppUser> _userManager { get; }
    public SignInManager<AppUser> _signInManager { get; }

    public LoginFacebookController(IConfiguration configuration, UserManager<AppUser> userManager,
        SignInManager<AppUser> signInManager)
    {
        _signInManager = signInManager;
        _userManager = userManager;
        _configuration = configuration;
    }
    
    public IActionResult Index()
    {
        var config = _configuration.GetSection("Authentication:Facebook");
        var fb = new FacebookClient();
        var loginUrl = fb.GetLoginUrl(new
        {
            client_id = config["AppId"],
            client_secret = config["AppSecret"],
            redirect_uri = config["CallbackUri"],
            response_type = "code",
            scope = "email",
        });
        return Redirect(loginUrl.AbsoluteUri);
    }

    [HttpGet("/facebook-callback")]
    public IActionResult FacebookCallback(string? code)
    {
        return View();
    }
}