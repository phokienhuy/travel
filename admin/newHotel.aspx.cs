using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_newHotel : System.Web.UI.Page
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
    protected void submit_Click(object sender, EventArgs e)
    {
        String coverPath = "";
        String pic1 = "";
        String pic2 = "";
        String pic3 = "";
        String pic4 = "";
        String pic5 = "";
        String pic6 = "";

        if (coverImage.HasFile)
        {
            String filename = coverImage.FileName;
            coverImage.SaveAs(Server.MapPath("~/resource/images/") + filename);
            coverPath = "resource/images/" + filename;
        }

        if (imageOne.HasFile)
        {
            String filename = imageOne.FileName;
            imageOne.SaveAs(Server.MapPath("~/resource/images/") + filename);
            pic1 = "resource/images/" + filename;
        }

        if (imageTwo.HasFile)
        {
            String filename = imageTwo.FileName;
            imageTwo.SaveAs(Server.MapPath("~/resource/images/") + filename);
            pic2 = "resource/images/" + filename;
        }

        if (imageThree.HasFile)
        {
            String filename = imageThree.FileName;
            imageThree.SaveAs(Server.MapPath("~/resource/images/") + filename);
            pic3 = "resource/images/" + filename;
        }

        if (imageFour.HasFile)
        {
            String filename = imageFour.FileName;
            imageFour.SaveAs(Server.MapPath("~/resource/images/") + filename);
            pic4 = "resource/images/" + filename;
        }

        if (imageFive.HasFile)
        {
            String filename = imageFive.FileName;
            imageFive.SaveAs(Server.MapPath("~/resource/images/") + filename);
            pic5 = "resource/images/" + filename;
        }

        if (imageSix.HasFile)
        {
            String filename = imageSix.FileName;
            imageSix.SaveAs(Server.MapPath("~/resource/images/") + filename);
            pic6 = "resource/images/" + filename;
        }


        ThongTinKhachSan hotel = new ThongTinKhachSan
        {
            Name = name.Text,
            Address = address.Text,
            Phone = phone.Text,
            Content = mieuta.Text,
            ShortDescription = shortDes.Text,
            CoverPic = coverPath,
            Pic1 = pic1,
            Pic2 = pic2,
            Pic3 = pic3,
            Pic4 = pic4,
            Pic5 = pic5,
            Pic6 = pic6,
            InsertDay = insertDay.Text,
            InsertMonth = insertMonth.Text,
        };

        try
        {
            db.ThongTinKhachSans.InsertOnSubmit(hotel);
            db.SubmitChanges();
            Server.Transfer("hotel.aspx", true);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}