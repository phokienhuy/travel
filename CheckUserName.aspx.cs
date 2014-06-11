using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Services;
using System.Web.UI.WebControls;
using System.Web.Script.Services;

public partial class CheckUserName : User
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public bool getuser(string un)
    {
        string username = un;
        Account user = db.Accounts.SingleOrDefault(n => n.UserName == username);
        if (user != null)
        {
            return false;

        }
        else return true;
    }
    [WebMethod]
    [ScriptMethod]
    public static bool CheckUN(string UserName)
    {
        bool check = false;
        CheckUserName user = new CheckUserName();
        check = user.getuser(UserName);
        return check;
    }
    public bool getEmail(string mail)
    {
        string email = mail;
        Account user = db.Accounts.SingleOrDefault(n => n.Email == email);
        if (user != null)
        {
            return false;

        }
        else return true;
    }
    [WebMethod]
    [ScriptMethod]
    public static bool checkEmail(string Email)
    {
        bool check = false;
        CheckUserName user = new CheckUserName();
        check = user.getEmail(Email);
        return check;
    }
}