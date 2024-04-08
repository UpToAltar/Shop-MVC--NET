using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace NetMVC.Migrations
{
    public partial class ProductIsFeaturetoIsNew : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "IsFeature",
                table: "Product",
                newName: "IsNew");

            migrationBuilder.AlterColumn<string>(
                name: "ProductCode",
                table: "Product",
                type: "nvarchar(200)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(200)",
                oldNullable: true);

        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            
            migrationBuilder.RenameColumn(
                name: "IsNew",
                table: "Product",
                newName: "IsFeature");

            migrationBuilder.AlterColumn<string>(
                name: "ProductCode",
                table: "Product",
                type: "nvarchar(200)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(200)");
        }
    }
}
