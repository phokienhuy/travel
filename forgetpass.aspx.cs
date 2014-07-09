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
using System.Data.Linq;
using System.Web.Script.Services;

public partial class forgetpass : User
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Request.QueryString["ID"]))
        {
            Session.Remove("User");
            SetRequestView();
        }
        else
        {
            
            Guid ID;
            Account user = new Account();
            try
            {
                ID = new Guid(Request.QueryString["ID"]);
                user = db.Accounts.SingleOrDefault(x => x.User_ID == ID);
            }
            catch (Exception ex) 
            { }
            
            if (user == null)
            {
                Response.Redirect("main.aspx");
            }
            else
            {
                SetUserView();
            }
        }
        
    }
    private void SetRequestView()
    {
        MultiView1.ActiveViewIndex = 0;
    }
    private void SetUserView()
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void btn_Req_Click(object sender, EventArgs e)
    {
        string UN = ReqUN.Text; 
        string EM = ReqEM.Text;
        Account ReqAcc = db.Accounts.SingleOrDefault(x => x.UserName == UN);
        if (ReqAcc == null)
        {
            mess.Text = "Tài khoản không tồn tại";
            Response.AddHeader("REFRESH", "2;URL=main.aspx");
        }
        else
        {
            if(ReqAcc.Email != EM)
            {
                mess.Text = "Sai Email";
            }
            else
            {
                string urlBase = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath;
                string verifyUrl = "/forgetpass.aspx?ID=" + ReqAcc.User_ID.ToString();
                string fullPath = urlBase + verifyUrl;
                string AppPath = Request.PhysicalApplicationPath;
                StreamReader sr = new StreamReader(AppPath + "resource/EmailTemplates/forgetpass.txt");

                MailMessage message = new MailMessage();
                message.IsBodyHtml = true;
                message.From = new MailAddress("No-reply@gmail.com");
                message.To.Add(new MailAddress(ReqAcc.Email));
                message.Subject = "Cấp lại mật khẩu !!!!";

                message.Body = sr.ReadToEnd();
                sr.Close();

                message.Body = message.Body.Replace("<%UserName%>", ReqAcc.UserName);
                message.Body = message.Body.Replace("<%VerificationUrl%>", fullPath);


                String email = "noreplyminibookstore@gmail.com";
                String password = "phokienhuy";
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential(email, password);
                client.Send(message);

                mess.Text = "Yêu cầu của bạn đã được xử lí, vui long kiểm tra Email để hoàn tất";

                ReqUN.Enabled = false;
                ReqEM.Enabled = false;
            }
        }
    }

    protected void btn_Change_Click(object sender, EventArgs e)
    {
        Session.Remove("User");
        Guid ID;
        Account user = new Account();
        try
            {
                ID = new Guid(Request.QueryString["ID"]);
                user = db.Accounts.SingleOrDefault(x => x.User_ID == ID);
            }
            catch
            {
                messChange.Text = "Tài khoản không hợp lệ";
                return;
            }
        string newPass = FormsAuthentication.HashPasswordForStoringInConfigFile(newPW.Text, "MD5");
        user.Pass = newPass;
        try
        {
            db.SubmitChanges();
            newPW.Enabled = false;
            rePW.Enabled = false;
            messChange.Text = "Mật khẩu đã thay đổi, hãy về lại trang chủ để đăng nhập lại";
            Response.AddHeader("REFRESH", "3;URL=main.aspx");
        }
        catch (ChangeConflictException)
        {
            db.ChangeConflicts.ResolveAll(RefreshMode.KeepChanges);
            db.SubmitChanges();

        }

    }
}