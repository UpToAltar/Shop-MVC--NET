using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace NetMVC.Models;

public class AppDbContext : IdentityDbContext<AppUser>
{
    public DbSet<Contact> Contacts { get; set; }
    public DbSet<Policy> Policies { get; set; }
    public DbSet<Product> Products { get; set; }
    public DbSet<Order> Orders { get; set; }
    public DbSet<OrderDetail> OrderDetails { get; set; }
    public DbSet<News> News { get; set; }
    public DbSet<Advertisement> Advertisements { get; set; }
    public DbSet<Category> Categories { get; set; }
    public DbSet<Post> Posts { get; set; }
    public DbSet<ProductCategory> ProductCategories { get; set; }
    public DbSet<ProductImage> ProductImages { get; set; }
    public DbSet<Subscriber> Subscribers { get; set; }
    public DbSet<SystemSetting> SystemSettings { get; set; }
    public DbSet<Comment> Comments { get; set; }
    public DbSet<Notification> Notifications { get; set; }
    
    public DbSet<WishList> WishLists { get; set; }
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
    {
        
    }
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        base.OnConfiguring(optionsBuilder);
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
        // Bỏ tiền tố AspNet của các bảng: mặc định các bảng trong IdentityDbContext có
        // tên với tiền tố AspNet như: AspNetUserRoles, AspNetUser ...
        // Đoạn mã sau chạy khi khởi tạo DbContext, tạo database sẽ loại bỏ tiền tố đó
        foreach (var entityType in modelBuilder.Model.GetEntityTypes ()) {
            var tableName = entityType.GetTableName ();
            if (tableName.StartsWith ("AspNet")) {
                entityType.SetTableName (tableName.Substring (6));
            }
        }
        //Set default value for AppUser
        modelBuilder.Entity<AppUser>()
            .Property(u => u.Job)
            .HasDefaultValue("FreeLancer");
        
        modelBuilder.Entity<AppUser>()
            .Property(u => u.FbLink)
            .HasDefaultValue("https://www.facebook.com/");
        
        modelBuilder.Entity<AppUser>()
            .Property(u => u.IgLink)
            .HasDefaultValue("https://www.instagram.com/");
        
        modelBuilder.Entity<AppUser>()
            .Property(u => u.OtherLink)
            .HasDefaultValue("Is not updated");
        
        modelBuilder.Entity<AppUser>()
            .Property(u => u.Image)
            .HasDefaultValue("https://www.pngkey.com/png/full/72-729716_user-avatar-png-graphic-free-download-icon.png");
        
        modelBuilder.Entity<AppUser>()
            .Property(u => u.Image)
            .HasDefaultValue("https://www.pngkey.com/png/full/72-729716_user-avatar-png-graphic-free-download-icon.png");
        
        modelBuilder.Entity<Comment>()
            .HasOne(c => c.AppUser)
            .WithMany()
            .HasForeignKey(c => c.AppUserIdFK);
        
    }
}