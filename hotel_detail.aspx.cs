using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Runtime.Remoting;
using System.Web.UI.HtmlControls;
using System.Data.Linq;


public partial class hotel_detail : User
{
    SqlConnection conn = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter adapter = new SqlDataAdapter();
    ThongTinDuLich_DataSet KhachSanDS = new ThongTinDuLich_DataSet();

    SqlConnection conn_c = new SqlConnection();
    SqlCommand cmd_c = new SqlCommand();
    SqlDataAdapter adapter_c = new SqlDataAdapter();
    ThongTinDuLich_DataSet KhachSanDS_c = new ThongTinDuLich_DataSet();

    SqlConnection conn_like = new SqlConnection();
    SqlCommand cmd_like = new SqlCommand();
    SqlDataAdapter adapter_like = new SqlDataAdapter();
    ThongTinDuLich_DataSet KhachSanDS_like = new ThongTinDuLich_DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        string hid = Request.QueryString["hid"];
        string UName = Convert.ToString(Session["User"]);

        conn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Travel.mdf;Integrated Security=True;User Instance=True";
        conn.Open();


        cmd.Connection = conn;
        cmd.CommandText = "select top 50 * from Hotel_Comment_Rating where Hotel_ID='" + hid + "'";
        cmd.CommandType = System.Data.CommandType.Text;

        adapter.SelectCommand = cmd;
        SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
        adapter.Fill(KhachSanDS.Hotel_Comment_Rating);
        lst_cmt.DataSource = KhachSanDS.Hotel_Comment_Rating;
        lst_cmt.DataBind();

        //Facebook share button
        lblShare.Text = "<a name=\"fb_share\" type=\"button\"></a>" + "<script " + "src=\"http://static.ak.fbcdn.net/connect.php/js/FB.Share\" " + "type=\"text/javascript\"></script>";
        HtmlMeta tag = new HtmlMeta();
        tag.Name = "title";
        tag.Content = "This is the page title";
        Page.Header.Controls.Add(tag);
        HtmlMeta tag1 = new HtmlMeta();
        tag.Name = "description";
        tag.Content = "This is a page description.";
        Page.Header.Controls.Add(tag1);

        //Chuc nang Like
        conn_like.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Travel.mdf;Integrated Security=True;User Instance=True";
        conn_like.Open();

        cmd_like.Connection = conn_like;

        //if (UName != "")
        //{
        cmd_like.CommandText = "select Like_Status from Hotel_Like where Hotel_ID='" + hid + "'and UserName='" + UName + "'";
        cmd_like.CommandType = System.Data.CommandType.Text;

        adapter_like.SelectCommand = cmd_like;
        SqlCommandBuilder builder_like = new SqlCommandBuilder(adapter_like);
        adapter_like.Fill(KhachSanDS_like.Hotel_Like);


        if (KhachSanDS_like.Hotel_Like.Count == 1)
        {
            ThongTinDuLich_DataSet.Hotel_LikeRow LikeChecking = KhachSanDS_like.Hotel_Like[0];
            if (LikeChecking.Like_Status == true)
            {
                SetUnlikeView();
            }
            else
            {
                SetLikeView();
            }
        }
        else
        {
            SetLikeView();
        }
    }
    private void SetLikeView()
    {
        MultiView_Like.ActiveViewIndex = 0;
    }

    private void SetUnlikeView()
    {
        MultiView_Like.ActiveViewIndex = 1;
    }

    protected void btn_cmt_Click(object sender, EventArgs e)
    {
        string hid = Request.QueryString["hid"];
        string uid = Convert.ToString(Session["User"]);
        if (uid.Length == 0)
        {

            Response.Redirect("main.aspx");
        }
        else
        {
            if (tbx_cmt.Text == "")
            {
                MessageBox.Show("Bình luận không được để trống!");
            }
            else
            {


                conn_c.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Travel.mdf;Integrated Security=True;User Instance=True";
                conn_c.Open();

                cmd_c.Connection = conn_c;
                cmd_c.CommandText = "select * from Hotel_Comment_Rating where Hotel_ID='" + hid + "' and UserName='" + uid + "'";
                cmd_c.CommandType = System.Data.CommandType.Text;

                adapter_c.SelectCommand = cmd_c;
                SqlCommandBuilder builder_c = new SqlCommandBuilder(adapter_c);
                adapter_c.Fill(KhachSanDS_c.Hotel_Comment_Rating);

                if (KhachSanDS_c.Hotel_Comment_Rating.Count == 0)
                {
                    ThongTinDuLich_DataSet.Hotel_Comment_RatingRow add_comment = KhachSanDS_c.Hotel_Comment_Rating.NewHotel_Comment_RatingRow();
                    add_comment.UserName = uid;
                    add_comment.Hotel_ID = Convert.ToInt32(hid);
                    add_comment.Content = tbx_cmt.Text;
                    add_comment.Rating = Convert.ToInt32(RatingControl.CurrentRating);
                    KhachSanDS_c.Hotel_Comment_Rating.AddHotel_Comment_RatingRow(add_comment);
                    adapter_c.Update(KhachSanDS_c.Hotel_Comment_Rating);

                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
                else
                {
                    ThongTinDuLich_DataSet.Hotel_Comment_RatingRow edit_comment = KhachSanDS_c.Hotel_Comment_Rating[0];
                    edit_comment.Content = tbx_cmt.Text;
                    edit_comment.Rating = Convert.ToInt32(RatingControl.CurrentRating);
                    adapter_c.Update(KhachSanDS_c.Hotel_Comment_Rating);
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }
        }
    }
    protected void UpdateRating(int current)
    {
        ThongTinKhachSan hotel = db.ThongTinKhachSans.Single(x => x.Hotel_ID == Convert.ToInt32(Request.QueryString["hid"]));

        hotel.Rating = (RatingControl.CurrentRating + hotel.Rating * hotel.CommentNum) / (hotel.CommentNum + 1); // Assign the new value
        try
        {
            db.SubmitChanges();
        }
        catch (ChangeConflictException)
        {
            db.ChangeConflicts.ResolveAll(RefreshMode.KeepChanges);
            db.SubmitChanges();
        }
    }
    SqlConnection conn_hit = new SqlConnection();
    SqlCommand cmd_hit = new SqlCommand();
    SqlDataAdapter adapter_hit = new SqlDataAdapter();
    ThongTinDuLich_DataSet Like_DS = new ThongTinDuLich_DataSet();

    protected void btn_like_Click(object sender, EventArgs e)
    {
        string T_ID = Request.QueryString["hid"];
        string UN = Convert.ToString(Session["User"]);

        if (Session["User"] == null)
        {
            Response.Redirect("main.aspx");
        }
        else
        {
            conn_hit.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Travel.mdf;Integrated Security=True;User Instance=True";
            conn_hit.Open();
            cmd_hit.Connection = conn_hit;
            cmd_hit.CommandText = "select * from Hotel_Like where Hotel_ID='" + T_ID + "'and UserName='" + UN + "'";
            cmd_hit.CommandType = System.Data.CommandType.Text;
            adapter_hit.SelectCommand = cmd_hit;
            SqlCommandBuilder builder_hit = new SqlCommandBuilder(adapter_hit);
            adapter_hit.Fill(Like_DS.Hotel_Like);

            if (Like_DS.Hotel_Like.Count == 0)
            {
                ThongTinDuLich_DataSet.Hotel_LikeRow add_like = Like_DS.Hotel_Like.NewHotel_LikeRow();
                add_like.UserName = UN;
                add_like.Hotel_ID = Convert.ToInt32(T_ID);
                add_like.Like_Status = true;
                Like_DS.Hotel_Like.AddHotel_LikeRow(add_like);
                adapter_hit.Update(Like_DS.Hotel_Like);
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
            else
            {
                ThongTinDuLich_DataSet.Hotel_LikeRow edit_like = Like_DS.Hotel_Like[0];
                edit_like.Like_Status = true;
                adapter_hit.Update(Like_DS.Hotel_Like);
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
        }
    }

    protected void btn_unlike_Click(object sender, EventArgs e)
    {
        string T_ID = Request.QueryString["hid"];
        string UN = Convert.ToString(Session["User"]);

        if (Session["User"] == null)
        {
            Response.Redirect("main.aspx");
        }
        else
        {
            conn_hit.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Travel.mdf;Integrated Security=True;User Instance=True";
            conn_hit.Open();
            cmd_hit.Connection = conn_hit;
            cmd_hit.CommandText = "select * from Hotel_Like where Hotel_ID='" + T_ID + "'and UserName='" + UN + "'";
            cmd_hit.CommandType = System.Data.CommandType.Text;
            adapter_hit.SelectCommand = cmd_hit;
            SqlCommandBuilder builder_hit = new SqlCommandBuilder(adapter_hit);
            adapter_hit.Fill(Like_DS.Hotel_Like);

            ThongTinDuLich_DataSet.Hotel_LikeRow edit_like = Like_DS.Hotel_Like[0];
            edit_like.Like_Status = false;
            adapter_hit.Update(Like_DS.Hotel_Like);
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
    protected void RatingControlChanged(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        btn_cmt.Enabled = true;
    }
}