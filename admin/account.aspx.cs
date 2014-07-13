using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class admin_account : System.Web.UI.Page
{
    public TravelDataContext db = new TravelDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null && Session["User"] != "")
        {
            Account user = db.Accounts.Single(n => n.UserName == Session["User"].ToString());
            if (user.Type == 1)
            {
                username.Text = Session["User"].ToString();
            }
            else
            {
                Response.Redirect("~/main.aspx");
            }
        }
        else
        {
            Response.Redirect("~/main.aspx");
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //TravelDataContext db = new TravelDataContext();
        //try
        //{
        //    Account acc = new Account
        //    {
        //        User_ID = Guid.NewGuid(),
        //        UserName = txtUserName.Text,
        //        Pass = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "MD5"),
        //        Email = txtEmail.Text,
        //        Name = txtName.Text,
        //        Phone = txtPhone.Text,
        //        Address = txtAddress.Text,
        //        Type = int.Parse(ddlRole.SelectedValue),
        //        Active = int.Parse(ddlRole.SelectedValue)
        //    };
        //    db.Accounts.InsertOnSubmit(acc);
        //    db.SubmitChanges();

        //    lblError.Text = "Thành công!";

        //    gvAccount.DataBind();
        //}
        //catch (Exception ex)
        //{
        //    lblError.Text = ex.Message;
        //}
    }
}