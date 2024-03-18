using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace NetMVC.Migrations
{
    public partial class addalldb : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Name",
                table: "Product",
                newName: "Title");

            migrationBuilder.AlterColumn<DateTime>(
                name: "UpdatedAt",
                table: "Users",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(3385),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedAt",
                table: "Users",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(3258),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "CreatedAt",
                table: "Product",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(5385));

            migrationBuilder.AddColumn<string>(
                name: "CreatedBy",
                table: "Product",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Detail",
                table: "Product",
                type: "nvarchar(200)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Image",
                table: "Product",
                type: "nvarchar(250)",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "Product",
                type: "bit",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsFeature",
                table: "Product",
                type: "bit",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsHome",
                table: "Product",
                type: "bit",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsHot",
                table: "Product",
                type: "bit",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsSale",
                table: "Product",
                type: "bit",
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "Price",
                table: "Product",
                type: "decimal(18,2)",
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "PriceSale",
                table: "Product",
                type: "decimal(18,2)",
                nullable: true);

            migrationBuilder.AddColumn<Guid>(
                name: "ProductCategoryId",
                table: "Product",
                type: "uniqueidentifier",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "ProductCode",
                table: "Product",
                type: "nvarchar(200)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "Quantity",
                table: "Product",
                type: "int",
                nullable: true,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "SeoDescription",
                table: "Product",
                type: "nvarchar(250)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "SeoKeywords",
                table: "Product",
                type: "nvarchar(250)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "SeoTitle",
                table: "Product",
                type: "nvarchar(200)",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "UpdatedAt",
                table: "Product",
                type: "datetime2",
                nullable: true,
                defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(5543));

            migrationBuilder.AddColumn<string>(
                name: "UpdatedBy",
                table: "Product",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsRead",
                table: "Contacts",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.CreateTable(
                name: "Advertisement",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Title = table.Column<string>(type: "nvarchar(200)", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(250)", nullable: false),
                    Type = table.Column<int>(type: "int", nullable: true),
                    Image = table.Column<string>(type: "nvarchar(200)", nullable: true),
                    Link = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(3548)),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(3667)),
                    CreatedBy = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UpdatedBy = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Advertisement", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Category",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Title = table.Column<string>(type: "nvarchar(200)", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    Position = table.Column<int>(type: "int", nullable: true),
                    SeoTitle = table.Column<string>(type: "nvarchar(200)", nullable: true),
                    SeoDescription = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    SeoKeywords = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(4048)),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(4187)),
                    CreatedBy = table.Column<string>(type: "nvarchar(max)", nullable: true, defaultValue: "Admin"),
                    UpdatedBy = table.Column<string>(type: "nvarchar(max)", nullable: true, defaultValue: "Admin"),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Category", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Order",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Code = table.Column<string>(type: "nvarchar(200)", nullable: false),
                    CustomerName = table.Column<string>(type: "nvarchar(200)", nullable: false),
                    PhoneNumber = table.Column<string>(type: "nvarchar(200)", nullable: true),
                    Address = table.Column<string>(type: "nvarchar(200)", nullable: false),
                    TotalAmount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    Quantity = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(4630)),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(4746)),
                    CreatedBy = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UpdatedBy = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Order", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "ProductCategory",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Title = table.Column<string>(type: "nvarchar(200)", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    Icon = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SeoTitle = table.Column<string>(type: "nvarchar(200)", nullable: true),
                    SeoDescription = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    SeoKeywords = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(5955)),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(6074)),
                    CreatedBy = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UpdatedBy = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductCategory", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "ProductImage",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    ProductId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Image = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    IsDefault = table.Column<bool>(type: "bit", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductImage", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Subcribe",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Email = table.Column<string>(type: "nvarchar(200)", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(6195))
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Subcribe", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SystemSetting",
                columns: table => new
                {
                    SettingKey = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    SettingValue = table.Column<string>(type: "nvarchar(200)", nullable: true),
                    SettingDescription = table.Column<string>(type: "nvarchar(250)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SystemSetting", x => x.SettingKey);
                });

            migrationBuilder.CreateTable(
                name: "News",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Title = table.Column<string>(type: "nvarchar(200)", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    Detail = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    Image = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SeoTitle = table.Column<string>(type: "nvarchar(200)", nullable: true),
                    SeoDescription = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    SeoKeywords = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    CategoryId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(4313)),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(4443)),
                    CreatedBy = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UpdatedBy = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_News", x => x.Id);
                    table.ForeignKey(
                        name: "FK_News_Category_CategoryId",
                        column: x => x.CategoryId,
                        principalTable: "Category",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Post",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Title = table.Column<string>(type: "nvarchar(200)", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    Detail = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    Image = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SeoTitle = table.Column<string>(type: "nvarchar(200)", nullable: true),
                    SeoDescription = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    SeoKeywords = table.Column<string>(type: "nvarchar(250)", nullable: true),
                    CategoryId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(5105)),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(5238)),
                    CreatedBy = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UpdatedBy = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Post", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Post_Category_CategoryId",
                        column: x => x.CategoryId,
                        principalTable: "Category",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "OrderDetail",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    OrderId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    ProductId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Quantity = table.Column<int>(type: "int", nullable: true, defaultValue: 0),
                    Price = table.Column<decimal>(type: "decimal(18,2)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_OrderDetail", x => x.Id);
                    table.ForeignKey(
                        name: "FK_OrderDetail_Order_OrderId",
                        column: x => x.OrderId,
                        principalTable: "Order",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_OrderDetail_Product_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Product",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Product_ProductCategoryId",
                table: "Product",
                column: "ProductCategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_News_CategoryId",
                table: "News",
                column: "CategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_OrderDetail_OrderId",
                table: "OrderDetail",
                column: "OrderId");

            migrationBuilder.CreateIndex(
                name: "IX_OrderDetail_ProductId",
                table: "OrderDetail",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_Post_CategoryId",
                table: "Post",
                column: "CategoryId");

            migrationBuilder.AddForeignKey(
                name: "FK_Product_ProductCategory_ProductCategoryId",
                table: "Product",
                column: "ProductCategoryId",
                principalTable: "ProductCategory",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Product_ProductCategory_ProductCategoryId",
                table: "Product");

            migrationBuilder.DropTable(
                name: "Advertisement");

            migrationBuilder.DropTable(
                name: "News");

            migrationBuilder.DropTable(
                name: "OrderDetail");

            migrationBuilder.DropTable(
                name: "Post");

            migrationBuilder.DropTable(
                name: "ProductCategory");

            migrationBuilder.DropTable(
                name: "ProductImage");

            migrationBuilder.DropTable(
                name: "Subcribe");

            migrationBuilder.DropTable(
                name: "SystemSetting");

            migrationBuilder.DropTable(
                name: "Order");

            migrationBuilder.DropTable(
                name: "Category");

            migrationBuilder.DropIndex(
                name: "IX_Product_ProductCategoryId",
                table: "Product");

            migrationBuilder.DropColumn(
                name: "CreatedAt",
                table: "Product");

            migrationBuilder.DropColumn(
                name: "CreatedBy",
                table: "Product");

            migrationBuilder.DropColumn(
                name: "Detail",
                table: "Product");

            migrationBuilder.DropColumn(
                name: "Image",
                table: "Product");

            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "Product");

            migrationBuilder.DropColumn(
                name: "IsFeature",
                table: "Product");

            migrationBuilder.DropColumn(
                name: "IsHome",
                table: "Product");

            migrationBuilder.DropColumn(
                name: "IsHot",
                table: "Product");

            migrationBuilder.DropColumn(
                name: "IsSale",
                table: "Product");

            migrationBuilder.DropColumn(
                name: "Price",
                table: "Product");

            migrationBuilder.DropColumn(
                name: "PriceSale",
                table: "Product");

            migrationBuilder.DropColumn(
                name: "ProductCategoryId",
                table: "Product");

            migrationBuilder.DropColumn(
                name: "ProductCode",
                table: "Product");

            migrationBuilder.DropColumn(
                name: "Quantity",
                table: "Product");

            migrationBuilder.DropColumn(
                name: "SeoDescription",
                table: "Product");

            migrationBuilder.DropColumn(
                name: "SeoKeywords",
                table: "Product");

            migrationBuilder.DropColumn(
                name: "SeoTitle",
                table: "Product");

            migrationBuilder.DropColumn(
                name: "UpdatedAt",
                table: "Product");

            migrationBuilder.DropColumn(
                name: "UpdatedBy",
                table: "Product");

            migrationBuilder.DropColumn(
                name: "IsRead",
                table: "Contacts");

            migrationBuilder.RenameColumn(
                name: "Title",
                table: "Product",
                newName: "Name");

            migrationBuilder.AlterColumn<DateTime>(
                name: "UpdatedAt",
                table: "Users",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true,
                oldDefaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(3385));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedAt",
                table: "Users",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true,
                oldDefaultValue: new DateTime(2024, 3, 18, 9, 53, 19, 118, DateTimeKind.Local).AddTicks(3258));
        }
    }
}
