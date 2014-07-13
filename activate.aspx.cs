using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class activate : User
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if (string.IsNullOrEmpty(Request.QueryString["ID"]))
        {
            VerificationMessageLabel.Text = "Truy cập không hợp lệ, chuyển về trang chủ...";
            Response.AddHeader("REFRESH", "3;URL=main.aspx");

        }
        else
        {
            Guid userId;
            Account usr = new Account();
            try
            {

                userId = new Guid(Request.QueryString["ID"]);
                usr = db.Accounts.Single(n => n.User_ID == userId);
            }
            catch
            {
                VerificationMessageLabel.Text = "Tài khoản không hợp lệ";
                return;
            }

            if (usr == null)
            {
                VerificationMessageLabel.Text = "Tài khoản không tồn tại, xin hãy chuyển về trang chủ";
                Response.AddHeader("REFRESH", "3;URL=main.aspx");


            }
            else if (usr.Active == 1)
            {
                VerificationMessageLabel.Text = "Tài khoản đã được kích hoạt từ trước, chuyển về trang chủ";
                Response.AddHeader("REFRESH", "3;URL=main.aspx");


            }
            else
            {
                usr.Active = 1;
                //db.accounts.InsertOnSubmit(usr);
                db.SubmitChanges();
                VerificationMessageLabel.Text = "Chào mừng bạn đến với The Travel. Enjoy!!";
                Response.AddHeader("REFRESH", "3;URL=main.aspx");
            }
        }
    }
}