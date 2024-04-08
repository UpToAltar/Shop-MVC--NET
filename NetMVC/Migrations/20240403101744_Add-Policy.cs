using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace NetMVC.Migrations
{
    public partial class AddPolicy : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Policy",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Title = table.Column<string>(type: "nvarchar(200)", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(250)", nullable: false),
                    Icon = table.Column<string>(type: "nvarchar(200)", nullable: false),
                    SeoTitle = table.Column<string>(type: "nvarchar(200)", nullable: true),
                    SeoDescription = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    SeoKeywords = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    IsActive = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    CreatedBy = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UpdatedBy = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Policy", x => x.Id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Policy");
        }
    }
}
