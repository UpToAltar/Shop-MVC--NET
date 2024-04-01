using Microsoft.EntityFrameworkCore;
using NetMVC.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using NetMVC.Areas.Identity.Controller;
using NetMVC.Data;
using NetMVC.Mail;
using NetMVC.UpLoad;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

// Add services to the container.
var services = builder.Services;


// Add DBContext
services.AddDbContext<AppDbContext>(options =>
{
    string connectionString = builder.Configuration.GetConnectionString("AppMVC");
    options.UseSqlServer(connectionString);
});

// Add Identity
services.AddDefaultIdentity<AppUser> ()
    .AddRoles<IdentityRole> ()
    .AddEntityFrameworkStores<AppDbContext> ()
    .AddDefaultTokenProviders ();

// Truy cập IdentityOptions
services.Configure<IdentityOptions> (options => {
    // Thiết lập về Password
    options.Password.RequireDigit = false; // Không bắt phải có số
    options.Password.RequireLowercase = false; // Không bắt phải có chữ thường
    options.Password.RequireNonAlphanumeric = false; // Không bắt ký tự đặc biệt
    options.Password.RequireUppercase = false; // Không bắt buộc chữ in
    options.Password.RequiredLength = 3; // Số ký tự tối thiểu của password
    options.Password.RequiredUniqueChars = 1; // Số ký tự riêng biệt

    // Cấu hình Lockout - khóa user
    options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes (1); // Khóa 5 phút
    options.Lockout.MaxFailedAccessAttempts = 5; // Thất bại 5 lầ thì khóa
    options.Lockout.AllowedForNewUsers = true;

    // Cấu hình về User.
    options.User.AllowedUserNameCharacters = // các ký tự đặt tên user
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._@+";
    options.User.RequireUniqueEmail = true;  // Email là duy nhất

    // Cấu hình đăng nhập.
    options.SignIn.RequireConfirmedEmail = true;            // Cấu hình xác thực địa chỉ email (email phải tồn tại)
    options.SignIn.RequireConfirmedPhoneNumber = false;     // Xác thực số điện thoại
    options.SignIn.RequireConfirmedAccount = true;         // Xác thực tài khoản
});

// Use Razor Pages
services.AddRazorPages();

//Add Facebook authentication
services.AddAuthentication()
    .AddFacebook(options =>
    {
        IConfigurationSection facebookAuthNSection =
            builder.Configuration.GetSection("Authentication:Facebook");

        options.AppId = facebookAuthNSection["AppId"];
        options.AppSecret = facebookAuthNSection["AppSecret"];
        options.CallbackPath = facebookAuthNSection["CallbackPath"];
    });

// Cấu hình Cookie
services.ConfigureApplicationCookie (options => {
    // options.Cookie.HttpOnly = true;
    // options.ExpireTimeSpan = TimeSpan.FromMinutes (5);
    options.LoginPath = "/Identity/Account/Login";
    options.AccessDeniedPath = "/Identity/Account/AccessDenied";
    options.SlidingExpiration = true;
});

// Add MailSettings
services.Configure<MailSettings>(builder.Configuration.GetSection("MailSettings"));
services.AddTransient<IEmailSender, SendMailService>();

//Seed Data
SeedData seed = new(builder.Services.BuildServiceProvider().CreateScope().ServiceProvider.GetRequiredService<AppDbContext>());
await seed.SeedRole();
await seed.SeedUser();

// Upload Cloudinary
builder.Services.Configure<CloudinarySettings>(builder.Configuration.GetSection("Cloudinary"));
builder.Services.AddScoped<IUploadService, UploadService>();



var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}
app.Use(async (context, next) =>
{
    await next();
    if (context.Response.StatusCode == 404)
    {
        context.Request.Path = "/Home/Error404";
        await next();
    }
});
app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();


app.MapControllerRoute(
    name : "areas",
    pattern : "{area:exists}/{controller=Home}/{action=Index}/{id?}"
);
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.MapRazorPages();
app.Run();