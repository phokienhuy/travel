using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class place_detail : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter adapter = new SqlDataAdapter();
    ThongTinDuLich_DataSet DuLichDS = new ThongTinDuLich_DataSet();

    SqlConnection conn_c = new SqlConnection();
    SqlCommand cmd_c = new SqlCommand();
    SqlDataAdapter adapter_c = new SqlDataAdapter();
    ThongTinDuLich_DataSet DuLichDS_c = new ThongTinDuLich_DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        string tID = Request.QueryString["tid"];
        conn.ConnectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Travel.mdf;Integrated Security=True;User Instance=True";
        conn.Open();

        cmd.Connection = conn;
        cmd.CommandText = "select top 50 * from Travel_Comment_Rating where Travel_ID='" + tID + "'";
        cmd.CommandType = System.Data.CommandType.Text;

        adapter.SelectCommand = cmd;
        SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
        adapter.Fill(DuLichDS.Travel_Comment_Rating);
        lst_cmt.DataSource = DuLichDS.Travel_Comment_Rating;
        lst_cmt.DataBind();
    }

    protected void btn_cmt_Click(object sender, EventArgs e)
    {
        string tID = Request.QueryString["tid"];
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
                cmd_c.CommandText = "select * from Travel_Comment_Rating where Travel_ID='" + tID + "' and UserName='" + uid + "'";
                cmd_c.CommandType = System.Data.CommandType.Text;

                adapter_c.SelectCommand = cmd_c;
                SqlCommandBuilder builder_c = new SqlCommandBuilder(adapter_c);
                adapter_c.Fill(DuLichDS_c.Travel_Comment_Rating);

                if (DuLichDS_c.Travel_Comment_Rating.Count == 0)
                {
                    ThongTinDuLich_DataSet.Travel_Comment_RatingRow add_comment = DuLichDS_c.Travel_Comment_Rating.NewTravel_Comment_RatingRow();
                    add_comment.UserName = uid;
                    add_comment.Travel_ID = Convert.ToInt32(tID);
                    add_comment.Content = tbx_cmt.Text;
                    DuLichDS_c.Travel_Comment_Rating.AddTravel_Comment_RatingRow(add_comment);
                    adapter_c.Update(DuLichDS_c.Travel_Comment_Rating);
                }
                else
                {
                    ThongTinDuLich_DataSet.Travel_Comment_RatingRow edit_comment = DuLichDS_c.Travel_Comment_Rating[0];
                    edit_comment.Content = tbx_cmt.Text;
                    adapter_c.Update(DuLichDS_c.Travel_Comment_Rating);
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }
        }
    }
}