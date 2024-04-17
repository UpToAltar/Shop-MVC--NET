using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using NetMVC.Models;

namespace NetMVC.Data;

public class SeedData
{
    private AppDbContext _context;

    public SeedData(AppDbContext context)
    {
        _context = context;
    }

    public async Task SeedRole()
    {
        var roleStore = new RoleStore<IdentityRole>(_context);
        if (!_context.Roles.Any(r => r.Name == BaseRole.Admin))
        {
            await roleStore.CreateAsync(new IdentityRole { Name = BaseRole.Admin, NormalizedName = BaseRole.Admin.ToUpper() });
        }
        if (!_context.Roles.Any(r => r.Name == BaseRole.User))
        {
            await roleStore.CreateAsync(new IdentityRole { Name = BaseRole.User, NormalizedName = BaseRole.User.ToUpper() });
        }
        if (!_context.Roles.Any(r => r.Name == BaseRole.Manager))
        {
            await roleStore.CreateAsync(new IdentityRole { Name = BaseRole.Manager, NormalizedName = BaseRole.Manager.ToUpper() });
        }
        
    }
    public async Task SeedUser()
    {
        var admin = new AppUser()
        {
            UserName = "Admin",
            NormalizedUserName = "ADMIN",
            Email = "admin@gmail.com",
            NormalizedEmail = "ADMIN@GMAIL.COM",
            EmailConfirmed = true,
            TwoFactorEnabled = false,
            LockoutEnabled = false,
            CreatedAt = DateTime.Now,
            UpdatedBy = "Admin",
            CreatedBy = "Admin",
            Address = "HN",
            IsDeleted = false,
            PhoneNumber = "+111111111111",
            UpdatedAt = DateTime.Now,
            Image = "https://i.pinimg.com/originals/2a/44/dd/2a44ddddb03ab7f755db5c5c4379404e.png",
            SecurityStamp = Guid.NewGuid().ToString()
        };
        
        var user = new AppUser()
        {
            UserName = "User",
            NormalizedUserName = "USER",
            Email = "user@gmail.com",
            NormalizedEmail = "USER@GMAIL.COM",
            EmailConfirmed = true,
            TwoFactorEnabled = true,
            LockoutEnabled = false,
            SecurityStamp = Guid.NewGuid().ToString(),
            CreatedAt = DateTime.Now,
            UpdatedBy = "Admin",
            CreatedBy = "Admin",
            Address = "HN",
            IsDeleted = false,
            PhoneNumber = "+111111111111",
            UpdatedAt = DateTime.Now,
            Image = "https://www.pngkey.com/png/full/72-729716_user-avatar-png-graphic-free-download-icon.png",
        };
        
        var manager = new AppUser()
        {
            UserName = "Manager",
            NormalizedUserName = "MANAGER",
            Email = "manager@gmail.com",
            NormalizedEmail = "MANAGER@GMAIL.COM",
            EmailConfirmed = true,
            LockoutEnabled = false,
            TwoFactorEnabled = true,
            CreatedAt = DateTime.Now,
            SecurityStamp = Guid.NewGuid().ToString(),
            UpdatedBy = "Admin",
            CreatedBy = "Admin",
            Address = "HN",
            IsDeleted = false,
            PhoneNumber = "+111111111111",
            UpdatedAt = DateTime.Now,
            Image = "https://www.pngkey.com/png/full/72-729716_user-avatar-png-graphic-free-download-icon.png",
        };

        var roleStore = new RoleStore<IdentityRole>(_context);
        var roleAdmin = await roleStore.FindByNameAsync(BaseRole.Admin);
        var roleUser = await roleStore.FindByNameAsync(BaseRole.User);
        var roleManager = await roleStore.FindByNameAsync(BaseRole.Manager);

        if (!_context.Users.Any(u => u.UserName == admin.UserName))
        {
            var passwordAdmin = new PasswordHasher<AppUser>();
            var hashed = passwordAdmin.HashPassword(admin, "Admin123@");
            admin.PasswordHash = hashed;
            var userStore = new UserStore<AppUser>(_context);
            await userStore.CreateAsync(admin);
            await userStore.AddToRoleAsync(admin, roleAdmin.Name);
        }
        
        if (!_context.Users.Any(u => u.UserName == user.UserName))
        {
            var passwordUser = new PasswordHasher<AppUser>();
            var hashed = passwordUser.HashPassword(user, "User123@");
            user.PasswordHash = hashed;
            var userStore = new UserStore<AppUser>(_context);
            await userStore.CreateAsync(user);
            await userStore.AddToRoleAsync(user, roleUser.Name);
        }
        
        if (!_context.Users.Any(u => u.UserName == manager.UserName))
        {
            var passwordManager = new PasswordHasher<AppUser>();
            var hashed = passwordManager.HashPassword(manager, "Manager123@");
            manager.PasswordHash = hashed;
            var userStore = new UserStore<AppUser>(_context);
            await userStore.CreateAsync(manager);
            await userStore.AddToRoleAsync(manager, roleManager.Name);
        }

        await _context.SaveChangesAsync();
    }
}