using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Web.Security;
using System.Web.Script.Services;


public partial class signup : User
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Account newuser = new Account
        {
            User_ID = Guid.NewGuid(),
            UserName = txtUN.Text,
            Pass = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPW.Text, "MD5"),
            Email = txtEmail.Text,
            Name = txtName.Text,
            Phone = txtPhone.Text,
            Address = txtAddress.Text,
            Active = false,
            Type = false,
        };
        try
        {
            db.Accounts.InsertOnSubmit(newuser);
            db.SubmitChanges();

            //send verification email

            string urlBase = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath;
            string verifyUrl = "/activate.aspx?ID=" + newuser.User_ID.ToString();
            string fullPath = urlBase + verifyUrl;
            string AppPath = Request.PhysicalApplicationPath;
            StreamReader sr = new StreamReader(AppPath + "resource/EmailTemplates/VerifyNewUser.txt");

            MailMessage message = new MailMessage();
            message.IsBodyHtml = true;
            message.From = new MailAddress("No-reply@gmail.com");
            message.To.Add(new MailAddress(newuser.Email));
            message.Subject = "Xác Thực Tài Khoản !!!";

            message.Body = sr.ReadToEnd();
            sr.Close();

            message.Body = message.Body.Replace("<%UserName%>", newuser.UserName);
            message.Body = message.Body.Replace("<%VerificationUrl%>", fullPath);


            String email = "noreplyminibookstore@gmail.com";
            String password = "phokienhuy";
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential(email, password);
            client.Send(message);

            tablesignup.Visible = false;
            Label1.Text = "Tài khoản của bạn đã được tạo thành công, kiểm tra Email để kích hoạt tài khoản";

            Response.AddHeader("REFRESH", "10;URL=main.aspx");
        }
        catch (Exception ex)
        {

        }
    }
}