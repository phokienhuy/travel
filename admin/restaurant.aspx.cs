using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_restaurant : System.Web.UI.Page
{
    public TravelDataContext db = new TravelDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null && Session["User"] != "")
        {
            Account user = db.Accounts.Single(n => n.UserName == Session["User"].ToString());
            if (user.Type == true)
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
    protected void addButton_Click(object sender, EventArgs e)
    {
        Server.Transfer("newRestaurant.aspx", true);
    }
}