using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace NetMVC.Migrations
{
    public partial class UpdateNewandPost : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<DateTime>(
                name: "UpdatedAt",
                table: "Users",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 19, 22, 50, 4, 355, DateTimeKind.Local).AddTicks(7077),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true,
                oldDefaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(3385));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedAt",
                table: "Users",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 19, 22, 50, 4, 355, DateTimeKind.Local).AddTicks(6584),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true,
                oldDefaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(3258));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedAt",
                table: "Subcribe",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true,
                oldDefaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(6195));

            migrationBuilder.AlterColumn<DateTime>(
                name: "UpdatedAt",
                table: "ProductCategory",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true,
                oldDefaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(6074));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedAt",
                table: "ProductCategory",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true,
                oldDefaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(5955));

            migrationBuilder.AlterColumn<DateTime>(
                name: "UpdatedAt",
                table: "Product",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true,
                oldDefaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(5543));

            migrationBuilder.AlterColumn<int>(
                name: "Quantity",
                table: "Product",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true,
                oldDefaultValue: 0);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedAt",
                table: "Product",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true,
                oldDefaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(5385));

            migrationBuilder.AlterColumn<DateTime>(
                name: "UpdatedAt",
                table: "Post",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true,
                oldDefaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(5238));

            migrationBuilder.AlterColumn<string>(
                name: "Detail",
                table: "Post",
                type: "ntext",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(250)",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedAt",
                table: "Post",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true,
                oldDefaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(5105));

            migrationBuilder.AlterColumn<int>(
                name: "Quantity",
                table: "OrderDetail",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true,
                oldDefaultValue: 0);

            migrationBuilder.AlterColumn<DateTime>(
                name: "UpdatedAt",
                table: "Order",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true,
                oldDefaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(4746));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedAt",
                table: "Order",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true,
                oldDefaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(4630));

            migrationBuilder.AlterColumn<DateTime>(
                name: "UpdatedAt",
                table: "News",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true,
                oldDefaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(4443));

            migrationBuilder.AlterColumn<string>(
                name: "Detail",
                table: "News",
                type: "ntext",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(250)",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedAt",
                table: "News",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true,
                oldDefaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(4313));

            migrationBuilder.AlterColumn<DateTime>(
                name: "UpdatedAt",
                table: "Category",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true,
                oldDefaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(4187));

            migrationBuilder.AlterColumn<int>(
                name: "Position",
                table: "Category",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedAt",
                table: "Category",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true,
                oldDefaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(4048));

            migrationBuilder.AlterColumn<DateTime>(
                name: "UpdatedAt",
                table: "Advertisement",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 19, 22, 50, 4, 355, DateTimeKind.Local).AddTicks(7956),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true,
                oldDefaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(3667));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedAt",
                table: "Advertisement",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 19, 22, 50, 4, 355, DateTimeKind.Local).AddTicks(7748),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true,
                oldDefaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(3548));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<DateTime>(
                name: "UpdatedAt",
                table: "Users",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(3385),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true,
                oldDefaultValue: new DateTime(2024, 3, 19, 22, 50, 4, 355, DateTimeKind.Local).AddTicks(7077));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedAt",
                table: "Users",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(3258),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true,
                oldDefaultValue: new DateTime(2024, 3, 19, 22, 50, 4, 355, DateTimeKind.Local).AddTicks(6584));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedAt",
                table: "Subcribe",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(6195),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "UpdatedAt",
                table: "ProductCategory",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(6074),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedAt",
                table: "ProductCategory",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(5955),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "UpdatedAt",
                table: "Product",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(5543),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "Quantity",
                table: "Product",
                type: "int",
                nullable: true,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedAt",
                table: "Product",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(5385),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "UpdatedAt",
                table: "Post",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(5238),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Detail",
                table: "Post",
                type: "nvarchar(250)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "ntext",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedAt",
                table: "Post",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(5105),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "Quantity",
                table: "OrderDetail",
                type: "int",
                nullable: true,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "UpdatedAt",
                table: "Order",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(4746),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedAt",
                table: "Order",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(4630),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "UpdatedAt",
                table: "News",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(4443),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Detail",
                table: "News",
                type: "nvarchar(250)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "ntext",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedAt",
                table: "News",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(4313),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "UpdatedAt",
                table: "Category",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(4187),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "Position",
                table: "Category",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedAt",
                table: "Category",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(4048),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "UpdatedAt",
                table: "Advertisement",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(3667),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true,
                oldDefaultValue: new DateTime(2024, 3, 19, 22, 50, 4, 355, DateTimeKind.Local).AddTicks(7956));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedAt",
                table: "Advertisement",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(3548),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true,
                oldDefaultValue: new DateTime(2024, 3, 19, 22, 50, 4, 355, DateTimeKind.Local).AddTicks(7748));
        }
    }
}
