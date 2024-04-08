using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace NetMVC.Migrations
{
    public partial class deletetyoeadvertisement : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Type",
                table: "Advertisement");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "Type",
                table: "Advertisement",
                type: "int",
                nullable: true);
        }
    }
}
