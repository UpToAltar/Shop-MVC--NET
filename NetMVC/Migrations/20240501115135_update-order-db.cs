using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace NetMVC.Migrations
{
    public partial class updateorderdb : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Type",
                table: "Order",
                newName: "MethodPay");

            migrationBuilder.RenameColumn(
                name: "IsConfirm",
                table: "Order",
                newName: "IsConfirmByUser");

            migrationBuilder.AddColumn<bool>(
                name: "IsConfirmByShop",
                table: "Order",
                type: "bit",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsConfirmByShop",
                table: "Order");

            migrationBuilder.RenameColumn(
                name: "MethodPay",
                table: "Order",
                newName: "Type");

            migrationBuilder.RenameColumn(
                name: "IsConfirmByUser",
                table: "Order",
                newName: "IsConfirm");
        }
    }
}
