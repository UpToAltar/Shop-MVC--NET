﻿namespace NetMVC.Areas.Admin.Models;

public class IndexAdminModel
{
    public List<NetMVC.Models.Order> Orders { get; set; }
    public decimal TotalRevenue { get; set; }
    public int TotalOrder { get; set; }
    public int OrderPending { get; set; }
    public int OrderCompleted { get; set; }
    public int OrderCancelled { get; set; }
    public int OrderShipping { get; set; }
    public int OrderConfirmedByUser { get; set; }
    public int OrderConfirmedByAdmin { get; set; }
    
    public decimal CompletedPercentage => TotalOrder == 0 ? 0 : (decimal)OrderCompleted / TotalOrder * 100;
    public decimal PendingPercentage => TotalOrder == 0 ? 0 : (decimal)OrderPending / TotalOrder * 100;
    public decimal ShippingPercentage => TotalOrder == 0 ? 0 : (decimal)OrderShipping / TotalOrder * 100;
    public decimal CancelledPercentage => TotalOrder == 0 ? 0 : (decimal)OrderCancelled / TotalOrder * 100;
    public decimal ConfirmedByUserPercentage => TotalOrder == 0 ? 0 : (decimal)OrderConfirmedByUser / TotalOrder * 100;
    public decimal ConfirmedByAdminPercentage => TotalOrder == 0 ? 0 : (decimal)OrderConfirmedByAdmin / TotalOrder * 100;
    
    public int BankingMethod { get; set; }
    public int CashMethod { get; set; }
}