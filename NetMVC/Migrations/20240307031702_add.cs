using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace NetMVC.Migrations
{
    public partial class add : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "UpdatedBy",
                table: "Users",
                type: "nvarchar(max)",
                nullable: true,
                defaultValue: "Admin",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Image",
                table: "Users",
                type: "ntext",
                nullable: true,
                defaultValue: "https://www.pngkey.com/png/full/72-729716_user-avatar-png-graphic-free-download-icon.png",
                oldClrType: typeof(string),
                oldType: "ntext",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "CreatedBy",
                table: "Users",
                type: "nvarchar(max)",
                nullable: true,
                defaultValue: "Admin",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AddColumn<string>(
                name: "FbLink",
                table: "Users",
                type: "nvarchar(max)",
                nullable: true,
                defaultValue: "https://www.facebook.com/");

            migrationBuilder.AddColumn<string>(
                name: "IgLink",
                table: "Users",
                type: "nvarchar(max)",
                nullable: true,
                defaultValue: "https://www.instagram.com/");

            migrationBuilder.AddColumn<string>(
                name: "Job",
                table: "Users",
                type: "nvarchar(max)",
                nullable: true,
                defaultValue: "FreeLancer");

            migrationBuilder.AddColumn<string>(
                name: "OtherLink",
                table: "Users",
                type: "nvarchar(max)",
                nullable: true,
                defaultValue: "Is not updated");

            migrationBuilder.CreateTable(
                name: "Product",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(200)", nullable: false),
                    Description = table.Column<string>(type: "ntext", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Product", x => x.Id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Product");

            migrationBuilder.DropColumn(
                name: "FbLink",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "IgLink",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "Job",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "OtherLink",
                table: "Users");

            migrationBuilder.AlterColumn<string>(
                name: "UpdatedBy",
                table: "Users",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true,
                oldDefaultValue: "Admin");

            migrationBuilder.AlterColumn<string>(
                name: "Image",
                table: "Users",
                type: "ntext",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "ntext",
                oldNullable: true,
                oldDefaultValue: "https://www.pngkey.com/png/full/72-729716_user-avatar-png-graphic-free-download-icon.png");

            migrationBuilder.AlterColumn<string>(
                name: "CreatedBy",
                table: "Users",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true,
                oldDefaultValue: "Admin");
        }
    }
}
