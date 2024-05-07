﻿namespace NetMVC.Areas.Payment.Models;

public class PaymentHtml
{
    public string  ReturnHtml()
    {
        return $"<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\"\n\tstyle=\"background-color:#ffffff;border:1px solid #dedede;border-radius:3px\">\n\t<tbody>\n\t\t<tr>\n\t\t\t<td align=\"center\" valign=\"top\">\n\n\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\n\t\t\t\t\tstyle=\"background-color:#96588a;color:#ffffff;border-bottom:0;font-weight:bold;line-height:100%;vertical-align:middle;font-family:'Helvetica Neue',Helvetica,Roboto,Arial,sans-serif;border-radius:3px 3px 0 0\">\n\t\t\t\t\t<tbody>\n\t\t\t\t\t\t<tr>\n\t\t\t\t\t\t\t<td style=\"padding:36px 48px;display:block\">\n\t\t\t\t\t\t\t\t<h1\n\t\t\t\t\t\t\t\t\tstyle=\"font-family:'Helvetica Neue',Helvetica,Roboto,Arial,sans-serif;font-size:30px;font-weight:300;line-height:150%;margin:0;text-align:left;color:#ffffff;background-color:inherit\">\n\t\t\t\t\t\t\t\t\tCảm ơn bạn đã đặt hàng</h1>\n\t\t\t\t\t\t\t</td>\n\t\t\t\t\t\t</tr>\n\t\t\t\t\t</tbody>\n\t\t\t\t</table>\n\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td align=\"center\" valign=\"top\">\n\n\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\">\n\t\t\t\t\t<tbody>\n\t\t\t\t\t\t<tr>\n\t\t\t\t\t\t\t<td valign=\"top\" style=\"background-color:#ffffff\">\n\n\t\t\t\t\t\t\t\t<table border=\"0\" cellpadding=\"20\" cellspacing=\"0\" width=\"100%\">\n\t\t\t\t\t\t\t\t\t<tbody>\n\t\t\t\t\t\t\t\t\t\t<tr>\n\t\t\t\t\t\t\t\t\t\t\t<td valign=\"top\" style=\"padding:48px 48px 32px\">\n\t\t\t\t\t\t\t\t\t\t\t\t<div\n\t\t\t\t\t\t\t\t\t\t\t\t\tstyle=\"color:#636363;font-family:'Helvetica Neue',Helvetica,Roboto,Arial,sans-serif;font-size:14px;line-height:150%;text-align:left\">\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t<p style=\"margin:0 0 16px\">Xin chào Hưng Đoàn,</p>\n\t\t\t\t\t\t\t\t\t\t\t\t\t<p style=\"margin:0 0 16px\">Cảm ơn đã đặt hàng. Đơn hàng sẽ bị tạm\n\t\t\t\t\t\t\t\t\t\t\t\t\t\tgiữ cho đến khi chúng tôi xác nhận thanh toán hoàn thành. Trong\n\t\t\t\t\t\t\t\t\t\t\t\t\t\tthời gian chờ đợi, đây là lời nhắc về những gì bạn đã đặt hàng:\n\t\t\t\t\t\t\t\t\t\t\t\t\t</p>\n\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t<h2\n\t\t\t\t\t\t\t\t\t\t\t\t\t\tstyle=\"color:#96588a;display:block;font-family:'Helvetica Neue',Helvetica,Roboto,Arial,sans-serif;font-size:18px;font-weight:bold;line-height:130%;margin:0 0 18px;text-align:left\">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t[Đơn hàng #4752] (18/01/2022)</h2>\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t<div style=\"margin-bottom:40px\">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t<table cellspacing=\"0\" cellpadding=\"6\" border=\"1\"\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tstyle=\"color:#636363;border:1px solid #e5e5e5;vertical-align:middle;width:100%;font-family:'Helvetica Neue',Helvetica,Roboto,Arial,sans-serif\">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<thead>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<th scope=\"col\"\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tstyle=\"color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left\">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tSản phẩm</th>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<th scope=\"col\"\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tstyle=\"color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left\">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tSố lượng</th>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<th scope=\"col\"\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tstyle=\"color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left\">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tGiá</th>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</thead>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tbody>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tstyle=\"color:#636363;border:1px solid #e5e5e5;padding:12px;text-align:left;vertical-align:middle;font-family:'Helvetica Neue',Helvetica,Roboto,Arial,sans-serif;word-wrap:break-word\">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tNước uống Đông Trùng Hạ Thảo </td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tstyle=\"color:#636363;border:1px solid #e5e5e5;padding:12px;text-align:left;vertical-align:middle;font-family:'Helvetica Neue',Helvetica,Roboto,Arial,sans-serif\">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t1 </td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tstyle=\"color:#636363;border:1px solid #e5e5e5;padding:12px;text-align:left;vertical-align:middle;font-family:'Helvetica Neue',Helvetica,Roboto,Arial,sans-serif\">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<span>1.499.000&nbsp;<span>\u20ab</span></span>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tbody>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tfoot>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<th scope=\"row\" colspan=\"2\"\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tstyle=\"color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left;border-top-width:4px\">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tNguyên giá:</th>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tstyle=\"color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left;border-top-width:4px\">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<span>1.499.000&nbsp;<span>\u20ab</span></span>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<th scope=\"row\" colspan=\"2\"\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tstyle=\"color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left\">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tPhương thức thanh toán:</th>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tstyle=\"color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left\">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tChuyển khoản ngân hàng</td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<th scope=\"row\" colspan=\"2\"\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tstyle=\"color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left\">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tTổng cộng:</th>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tstyle=\"color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left\">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<span>1.499.000&nbsp;<span>\u20ab</span></span>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tfoot>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t</table>\n\t\t\t\t\t\t\t\t\t\t\t\t\t</div>\n\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\"\n\t\t\t\t\t\t\t\t\t\t\t\t\t\tstyle=\"width:100%;vertical-align:top;margin-bottom:40px;padding:0\">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tbody>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td valign=\"top\" width=\"50%\"\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tstyle=\"text-align:left;font-family:'Helvetica Neue',Helvetica,Roboto,Arial,sans-serif;border:0;padding:0\">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<h2\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tstyle=\"color:#96588a;display:block;font-family:'Helvetica Neue',Helvetica,Roboto,Arial,sans-serif;font-size:18px;font-weight:bold;line-height:130%;margin:0 0 18px;text-align:left\">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tThông tin người nhận</h2>\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<address\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tstyle=\"padding:12px;color:#636363;border:1px solid #e5e5e5\">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tHưng Đoàn<br>Ngõ 100 Trần Đại Nghĩa, Hai Bà\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tTrưng<br>Ha Noi <br><a href=\"tel:0886478333\"\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tstyle=\"color:#96588a;font-weight:normal;text-decoration:underline\"\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\ttarget=\"_blank\">0886478333</a> <br><a\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\thref=\"mailto:hungdd06@gmail.com\"\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\ttarget=\"_blank\">hungdd06@gmail.com</a>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</address>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tbody>\n\t\t\t\t\t\t\t\t\t\t\t\t\t</table>\n\t\t\t\t\t\t\t\t\t\t\t\t\t<p style=\"margin:0 0 16px\">Chúng tôi đang tiến hành hoàn thiện đơn\n\t\t\t\t\t\t\t\t\t\t\t\t\t\tđặt hàng của bạn</p>\n\t\t\t\t\t\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t\t\t\t\t\t</td>\n\t\t\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t\t</tbody>\n\t\t\t\t\t\t\t\t</table>\n\n\t\t\t\t\t\t\t</td>\n\t\t\t\t\t\t</tr>\n\t\t\t\t\t</tbody>\n\t\t\t\t</table>\n\n\t\t\t</td>\n\t\t</tr>\n\t</tbody>\n</table>";
    }
}