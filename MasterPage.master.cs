using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class MasterPage : User_MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["User"] == null)
                SetDefaultView();
            else
            {
                SetUserView();
            }
        }
    }
    private void SetDefaultView()
    {
        MultiView1.ActiveViewIndex = 0;
    }
    private void SetUserView()
    {
        MultiView1.ActiveViewIndex = 1;
        lblInfoName.Text = Session["User"].ToString();
    }

    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        string UN = txtUN.Text;
        string PW = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPW.Text, "MD5");
        Account user = db.Accounts.SingleOrDefault(n => n.UserName == UN);

        if (user == null || txtPW == null || txtUN == null)
        {
            if (user == null)
            {
                LbMessages.Visible = true;
                LbMessages.Text = "tài khoản không tồn tại";
            }
            else
                if (txtUN == null || txtPW == null)
                {
                    LbMessages.Visible = true;
                    LbMessages.Text = "Tên đăng nhập hoặc mật khẩu không được trống";
                }
        }
        else
            try
            {
                if (PW == user.Pass)
                {
                    if (user.Active == false)
                    {
                        LbMessages.Visible = true;
                        LbMessages.Text = "Tài khoản chưa được kích hoạt";
                        //FormsAuthentication.HashPasswordForStoringInConfigFile(n.password, "MD5") == PW
                    }
                    else
                    {
                        if (user.Active == true)
                        {
                            
                            Session["User"] = user.UserName;
                            Response.Redirect("~/main.aspx");
                        }
                        
                    }
                }
                else if (PW != user.Pass)
                {
                    LbMessages.Visible = true;
                    LbMessages.Text = "Tên đăng nhập và mật khẩu không đúng";
                }
                db.SubmitChanges();

            }
            catch (Exception ex)
            {
                LbMessages.Text = ex.Message;

            }
    }
}
