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

public partial class event_detail : User
{
    SqlConnection conn = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter adapter = new SqlDataAdapter();
    ThongTinDuLich_DataSet SuKienDS = new ThongTinDuLich_DataSet();

    SqlConnection conn_c = new SqlConnection();
    SqlCommand cmd_c = new SqlCommand();
    SqlDataAdapter adapter_c = new SqlDataAdapter();
    ThongTinDuLich_DataSet SuKienDS_c = new ThongTinDuLich_DataSet();

    SqlConnection conn_like = new SqlConnection();
    SqlCommand cmd_like = new SqlCommand();
    SqlDataAdapter adapter_like = new SqlDataAdapter();
    ThongTinDuLich_DataSet SuKienDS_like = new ThongTinDuLich_DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        string eid = Request.QueryString["eid"];
        string UName = Convert.ToString(Session["User"]);

        conn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Travel.mdf;Integrated Security=True;User Instance=True";
        conn.Open();


        cmd.Connection = conn;
        cmd.CommandText = "select top 50 * from Event_Comment_Rating where Event_ID='" + eid + "'";
        cmd.CommandType = System.Data.CommandType.Text;

        adapter.SelectCommand = cmd;
        SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
        adapter.Fill(SuKienDS.Event_Comment_Rating);
        lst_cmt.DataSource = SuKienDS.Event_Comment_Rating;
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
        cmd_like.CommandText = "select Like_Status from Event_Like where Event_ID='" + eid + "'and UserName='" + UName + "'";
        cmd_like.CommandType = System.Data.CommandType.Text;

        adapter_like.SelectCommand = cmd_like;
        SqlCommandBuilder builder_like = new SqlCommandBuilder(adapter_like);
        adapter_like.Fill(SuKienDS_like.Event_Like);


        if (SuKienDS_like.Event_Like.Count == 1)
        {
            ThongTinDuLich_DataSet.Event_LikeRow LikeChecking = SuKienDS_like.Event_Like[0];
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
        string eid = Request.QueryString["eid"];
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
                cmd_c.CommandText = "select * from Event_Comment_Rating where Event_ID='" + eid + "' and UserName='" + uid + "'";
                cmd_c.CommandType = System.Data.CommandType.Text;

                adapter_c.SelectCommand = cmd_c;
                SqlCommandBuilder builder_c = new SqlCommandBuilder(adapter_c);
                adapter_c.Fill(SuKienDS_c.Event_Comment_Rating);

                if (SuKienDS_c.Event_Comment_Rating.Count == 0)
                {
                    ThongTinDuLich_DataSet.Event_Comment_RatingRow add_comment = SuKienDS_c.Event_Comment_Rating.NewEvent_Comment_RatingRow();
                    add_comment.UserName = uid;
                    add_comment.Event_ID = Convert.ToInt32(eid);
                    add_comment.Content = tbx_cmt.Text;
                    add_comment.Rating = Convert.ToInt32(RatingControl.CurrentRating);
                    SuKienDS_c.Event_Comment_Rating.AddEvent_Comment_RatingRow(add_comment);
                    adapter_c.Update(SuKienDS_c.Event_Comment_Rating);

                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
                else
                {
                    ThongTinDuLich_DataSet.Event_Comment_RatingRow edit_comment = SuKienDS_c.Event_Comment_Rating[0];
                    edit_comment.Content = tbx_cmt.Text;
                    edit_comment.Rating = Convert.ToInt32(RatingControl.CurrentRating);
                    adapter_c.Update(SuKienDS_c.Event_Comment_Rating);
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }
        }
    }
    protected void UpdateRating(int current)
    {
        Event rest = db.Events.Single(x => x.Event_ID == Convert.ToInt32(Request.QueryString["eid"]));

        rest.Rating = (RatingControl.CurrentRating + rest.Rating * rest.CommentNum) / (rest.CommentNum + 1); // Assign the new value
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

    //Like & Unlike
    SqlConnection conn_hit = new SqlConnection();
    SqlCommand cmd_hit = new SqlCommand();
    SqlDataAdapter adapter_hit = new SqlDataAdapter();
    ThongTinDuLich_DataSet Like_DS = new ThongTinDuLich_DataSet();

    protected void btn_like_Click(object sender, EventArgs e)
    {
        string T_ID = Request.QueryString["eid"];
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
            cmd_hit.CommandText = "select * from Event_Like where Event_ID='" + T_ID + "'and UserName='" + UN + "'";
            cmd_hit.CommandType = System.Data.CommandType.Text;
            adapter_hit.SelectCommand = cmd_hit;
            SqlCommandBuilder builder_hit = new SqlCommandBuilder(adapter_hit);
            adapter_hit.Fill(Like_DS.Event_Like);

            if (Like_DS.Event_Like.Count == 0)
            {
                ThongTinDuLich_DataSet.Event_LikeRow add_like = Like_DS.Event_Like.NewEvent_LikeRow();
                add_like.UserName = UN;
                add_like.Event_ID = Convert.ToInt32(T_ID);
                add_like.Like_Status = true;
                Like_DS.Event_Like.AddEvent_LikeRow(add_like);
                adapter_hit.Update(Like_DS.Event_Like);
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
            else
            {
                ThongTinDuLich_DataSet.Event_LikeRow edit_like = Like_DS.Event_Like[0];
                edit_like.Like_Status = true;
                adapter_hit.Update(Like_DS.Event_Like);
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
        }
    }

    protected void btn_unlike_Click(object sender, EventArgs e)
    {
        string T_ID = Request.QueryString["eid"];
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
            cmd_hit.CommandText = "select * from Event_Like where Event_ID='" + T_ID + "'and UserName='" + UN + "'";
            cmd_hit.CommandType = System.Data.CommandType.Text;
            adapter_hit.SelectCommand = cmd_hit;
            SqlCommandBuilder builder_hit = new SqlCommandBuilder(adapter_hit);
            adapter_hit.Fill(Like_DS.Event_Like);

            ThongTinDuLich_DataSet.Event_LikeRow edit_like = Like_DS.Event_Like[0];
            edit_like.Like_Status = false;
            adapter_hit.Update(Like_DS.Event_Like);
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }

    protected void RatingControlChanged(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        btn_cmt.Enabled = true;
    }
}