using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NetMVC.Areas.Role.Models;
using NetMVC.Models;

namespace NetMVC.Areas.Role.Controllers
{
    [Area("Role")]
    [Authorize(Roles = "Admin")]
    public class RoleController : Controller
    {
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly AppDbContext _context;
        
        public RoleController(RoleManager<IdentityRole> roleManager, AppDbContext context)
        {
            _roleManager = roleManager;
            _context = context;
        }
        
        [TempData]
        public string StatusMessage { get; set; }
        
        public const int ITEM_PER_PAGE = 5;
        
        [BindProperty(SupportsGet = true, Name = "pageNumber")]
        public int currentPage { get; set; }
        public int countPage { get; set; }
        
        public CreateRoleModel CreateRoleModel { get; set; } = default!;
        
        public List<RoleModel> Roles { get; set; }
        // GET: Role
        public async Task<IActionResult> Index(string? searchString)
        {
            var roles = await _roleManager.Roles.OrderBy(r => r.Name).ToListAsync();
            countPage = (int)Math.Ceiling((double)roles.Count / ITEM_PER_PAGE);
            Roles = new List<RoleModel>();
            foreach (var role in roles)
            {
                var roleModel = new RoleModel
                {
                    Id = role.Id,
                    Name = role.Name,
                    Claims = (await _roleManager.GetClaimsAsync(role)).Select(c => $"{c.Type} = {c.Value}").ToList()
                };
                Roles.Add(roleModel);
            }

            var allRoles = Roles;
            if (currentPage < 1 || currentPage > countPage)
            {
                currentPage = 1;
            }
            if (!string.IsNullOrEmpty(searchString))
            {
                Roles = Roles.Where(r => r.Name.Contains(searchString)).ToList();
            }
            Roles = Roles.Skip((currentPage - 1) * ITEM_PER_PAGE).Take(ITEM_PER_PAGE).ToList();

            var model = new RoleIndexModel()
            {
                Roles = Roles,
                ITEM_PER_PAGE = ITEM_PER_PAGE,
                currentPage = currentPage,
                countPage = countPage,
                allRoles = allRoles
            };
                
            return View(model);
        }
        
        // GET: Role/Create
        public ActionResult Create()
        {
            return View(CreateRoleModel);
        }
        
        // Post: Role/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind("RoleName")] CreateRoleModel model)
        {
            if (ModelState.IsValid)
            {
                var oldRoles = await _roleManager.Roles.OrderBy(r => r.Name).ToListAsync();
                if(oldRoles.Any(r => r.Name == model.RoleName))
                {
                    StatusMessage = "Error: Role already exists.";
                    return View(CreateRoleModel);
                }
                var newRole = new IdentityRole(model.RoleName);
                var result = await _roleManager.CreateAsync(newRole);
                if (result.Succeeded)
                {
                    StatusMessage = $"Success: Role <b>{model.RoleName}</b> created.";
                    return RedirectToAction(nameof(Index));
                }
                else
                {
                    StatusMessage = "Error: Role not created.";
                    return View(CreateRoleModel);
                }
            } else
            {
                StatusMessage = "Error: Invalid input.";
                return View(CreateRoleModel);
            }
        }

        // GET: Role/Edit/5
        public async Task<ActionResult> Edit(Guid id)
        {
            var role = await _roleManager.FindByIdAsync(id.ToString());
            if (role == null)
            {
                StatusMessage = "Error: Role not found.";
                return RedirectToAction(nameof(Index));
            }

            var model = new EditRoleModel()
            {
                Role = role,
                RoleClaims = await _context.RoleClaims.Where(c => c.RoleId == role.Id).ToListAsync()
            };
            return View(model);
        }

        // POST: Role/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: Role/Delete/5
        public async Task<IActionResult> Delete(Guid id)
        {
            var role = await _roleManager.FindByIdAsync(id.ToString());
            if (role == null)
            {
                StatusMessage = "Error: Role not found.";
                return RedirectToAction(nameof(Index));
            }

            var model = new EditRoleModel()
            {
                Role = role,
                RoleClaims = await _context.RoleClaims.Where(c => c.RoleId == role.Id).ToListAsync()
            };
            return View(model);
        }

        // POST: Role/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(Guid id)
        {
            try
            {
                var role = await _roleManager.FindByIdAsync(id.ToString());
                await _roleManager.DeleteAsync(role);
                StatusMessage = $"Success: Role <b>{role.Name}</b> deleted.";
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
        
    }
}