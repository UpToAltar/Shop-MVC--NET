using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace NetMVC.Migrations
{
    public partial class updatecmtfk : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Comment_Users_AppUserId1",
                table: "Comment");

            migrationBuilder.DropIndex(
                name: "IX_Comment_AppUserId1",
                table: "Comment");

            migrationBuilder.DropColumn(
                name: "AppUserId",
                table: "Comment");

            migrationBuilder.DropColumn(
                name: "AppUserId1",
                table: "Comment");

            migrationBuilder.AddColumn<string>(
                name: "AppUserIdFK",
                table: "Comment",
                type: "nvarchar(450)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.CreateIndex(
                name: "IX_Comment_AppUserIdFK",
                table: "Comment",
                column: "AppUserIdFK");

            migrationBuilder.AddForeignKey(
                name: "FK_Comment_Users_AppUserIdFK",
                table: "Comment",
                column: "AppUserIdFK",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Comment_Users_AppUserIdFK",
                table: "Comment");

            migrationBuilder.DropIndex(
                name: "IX_Comment_AppUserIdFK",
                table: "Comment");

            migrationBuilder.DropColumn(
                name: "AppUserIdFK",
                table: "Comment");

            migrationBuilder.AddColumn<Guid>(
                name: "AppUserId",
                table: "Comment",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.AddColumn<string>(
                name: "AppUserId1",
                table: "Comment",
                type: "nvarchar(450)",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Comment_AppUserId1",
                table: "Comment",
                column: "AppUserId1");

            migrationBuilder.AddForeignKey(
                name: "FK_Comment_Users_AppUserId1",
                table: "Comment",
                column: "AppUserId1",
                principalTable: "Users",
                principalColumn: "Id");
        }
    }
}
