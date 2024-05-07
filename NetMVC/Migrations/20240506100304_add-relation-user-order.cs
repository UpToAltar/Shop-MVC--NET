using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace NetMVC.Migrations
{
    public partial class addrelationuserorder : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
           

            migrationBuilder.AddColumn<string>(
                name: "AppUserIdFK",
                table: "Order",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
            
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            
            migrationBuilder.DropColumn(
                name: "AppUserIdFK",
                table: "Order");
        }
    }
}
