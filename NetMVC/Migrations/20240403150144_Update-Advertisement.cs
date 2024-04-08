using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace NetMVC.Migrations
{
    public partial class UpdateAdvertisement : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "Image",
                table: "Advertisement",
                type: "nvarchar(200)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(200)",
                oldNullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsActive",
                table: "Advertisement",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<int>(
                name: "Position",
                table: "Advertisement",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsActive",
                table: "Advertisement");

            migrationBuilder.DropColumn(
                name: "Position",
                table: "Advertisement");

            migrationBuilder.AlterColumn<string>(
                name: "Image",
                table: "Advertisement",
                type: "nvarchar(200)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(200)");
        }
    }
}
