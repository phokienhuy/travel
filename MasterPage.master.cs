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
        Account user = db.Accounts.Single(n => n.UserName == Session["User"].ToString());
        MultiView1.ActiveViewIndex = 1;
        lblInfoUN.Text = Session["User"].ToString();
        lblInfoName.Text = user.Name.ToString();
        lblInfoEmail.Text = user.Email.ToString();
        lblInfoPhone.Text = user.Phone.ToString();
        lblInfoAdd.Text = user.Address.ToString();
        hplChangePW.NavigateUrl = "forgetpass.aspx?ID=" + user.User_ID.ToString();
    }

    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        string UN = txtUN.Text;
        string PW = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPW.Text, "MD5");
        Account user = db.Accounts.SingleOrDefault(n => n.UserName == UN);

        if (user == null || txtPW == null || txtUN == null)
        {
            if (txtUN == null || txtPW == null)
                {
                    LbMessages.Visible = true;
                    LbMessages.Text = "Tên đăng nhập hoặc mật khẩu không được trống";
                }
            else
            if (user == null)
            {
                LbMessages.Visible = true;
                LbMessages.Text = "tài khoản không tồn tại";
                
                txtUN.Focus();
            }
                
        }
        else
            try
            {
                if (PW == user.Pass)
                {
                    if (user.Active == 0)
                    {
                        LbMessages.Visible = true;
                        LbMessages.Text = "Tài khoản chưa được kích hoạt";
                        //FormsAuthentication.HashPasswordForStoringInConfigFile(n.password, "MD5") == PW
                    }
                    else
                    {
                        if (user.Active == 1)
                        {
                            
                            Session["User"] = user.UserName;
                            Response.Redirect(Page.Request.RawUrl, false);
                            
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
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Remove("User");
        Response.Redirect("main.aspx");
    }
}
