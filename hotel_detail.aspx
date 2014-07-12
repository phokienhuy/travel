﻿<%@ Page Title="" Language="C#" MasterPageFile="~/DetailMasterpage.master" AutoEventWireup="true" CodeFile="hotel_detail.aspx.cs" Inherits="hotel_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
    .ratingEmpty
    {
        background-image: url(resource/images/ratingStarEmpty.png);
        width:32px;
        height:32px;
    }
    .ratingFilled
    {
        background-image: url(resource/images/ratingStarFilled.png);
        width:32px;
        height:32px;
    }
    .ratingSaved
    {
        background-image: url(resource/images/ratingStarSaved.png);
        width:32px;
        height:32px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" Runat="Server">
                <nav class="" >
						        <ul class="sf-menu">
									         <li><a href="main.aspx">Trang Chủ</a></li>
									         <li ><a href="places.aspx" >Địa Điểm</a></li>
									         <li><a href="restaurant.aspx">Nhà Hàng</a></li>
									         <li class="current"><a href="hotels.aspx">Khách sạn</a></li>
									         <li><a href="events.aspx">Sự kiện</a></li>
									         <li><a href="foods.aspx">Ẩm thực</a></li>
						        </ul>
				    </nav>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
    <ajaxtoolkit:ToolkitScriptManager ID="ScripManager1" runat="server" />
    <asp:DataList ID="HotelDetail" runat="server" DataKeyField="Hotel_ID" 
                DataSourceID="SQLHotelDetail">
                <ItemTemplate>
                    <div class="grid_9">
                        <div class="">
                          <h3><%# Eval("Name") %></h3>
                          <ajaxtoolkit:Rating ID="CurrentRatingControl" ReadOnly="true" CurrentRating='<%# Eval("Rating") %>' StarCssClass="ratingEmpty" WaitingStarCssClass="ratingSaved" EmptyStarCssClass="ratingEmpty" FilledStarCssClass="ratingFilled" runat="server">
                          </ajaxtoolkit:Rating><br /><br />
                          <img src="<%# Eval("CoverPic") %>" alt="" class="img_inner fleft">
                          <p class="text1"><a href="#"><%# Eval("ShortDescription") %></a></p>
                          <div class="clear"></div>
                          <%# Eval("Content") %>
                          </div>
      </div>
      <div class="grid_3">
        <h3>Phương Châm</h3>
        <ul class="list1">
          <li>
            <div class="count">1</div>
            <div class="extra_wrapper">
              <div class="text1"><a href="#">Tính trung thực</a></div>Chúng tôi trung thực với những người khác cũng như với chính chúng tôi. Trong tất cả các dịch vụ du lịch, chúng tôi luôn đáp ứng những tiêu chuẩn đạo đức cao nhất.  
            </div>
          </li>
          <li>
            <div class="count">2</div>
            <div class="extra_wrapper">
              <div class="text1"><a href="#">Tin cậy</a></div>Chúng tôi tin cậy, tôn trọng và hỗ trợ lẫn nhau và phấn đấu chinh phục niềm tin của đồng nghiệp và đối tác.
            </div>
          </li>
          <li>
            <div class="count">3</div>
            <div class="extra_wrapper">
              <div class="text1"><a href="#">Sáng tạo</a></div>Chúng tôi tìm kiếm các cơ hội mới với những giải pháp độc đáo. Chúng tôi dùng óc sáng tạo của mình để tìm kiếm những giải pháp bất ngờ và khả thi để giải quyết các vấn đề 
            </div>
          </li>
        </ul>
      </div>
      <div class="clear"></div>
      <div class="grid_12">
        <div class="hor_sep"></div>
      </div>
      <div class="clear"></div>
		<div class="grid_12">
        <h3>Hình Ảnh</h3>
      </div>
      <div class="clear"></div>
       <div class="gallery">
      <div class="grid_4">
        <a href="resource/images/big1.jpg" class="gal img_inner"><img src="resource/images/page3_img1.jpg" alt=""></a>
      </div>
      <div class="grid_4">
        <a href="resource/images/big2.jpg" class="gal img_inner"><img src="resource/images/page3_img2.jpg" alt=""></a>
      </div>
      <div class="grid_4">
        <a href="resource/images/big3.jpg" class="gal img_inner"><img src="resource/images/page3_img3.jpg" alt=""></a>
      </div>
      <div class="clear"></div>
      <div class="grid_4">
        <a href="resource/images/big4.jpg" class="gal img_inner"><img src="resource/images/page3_img4.jpg" alt=""></a>
      </div>
      <div class="grid_4">
        <a href="resource/images/big5.jpg" class="gal img_inner"><img src="resource/images/page3_img5.jpg" alt=""></a>
      </div>
      <div class="grid_4">
        <a href="resource/images/big6.jpg" class="gal img_inner"><img src="resource/images/page3_img6.jpg" alt=""></a>
      </div>
    </div>
      <div class="clear"></div>
      <div class="clear"></div>
                </ItemTemplate>
            </asp:DataList>          
            <asp:SqlDataSource ID="SQLHotelDetail" runat="server" 
                ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" 
                
        SelectCommand="SELECT * FROM [ThongTinKhachSan] WHERE ([Hotel_ID] = @Hotel_ID)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="Hotel_ID" 
                        QueryStringField="hid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
    <br />
   <table id="" >
    <tr>
        <td align="right">
            <asp:MultiView ID="MultiView_Like" runat="server">
                <asp:View ID="View_Like" runat="server">
                    <asp:Button ID="btn_like" runat="server" Text="Like" onclick="btn_like_Click" BorderColor="#9966FF" BorderStyle="Solid" ForeColor="White" BackColor="#3366FF" />
                </asp:View>
                <asp:View ID="View_Unlike" runat="server">
                    <asp:Button ID="btn_unlike" runat="server" Text="Unlike" 
                        onclick="btn_unlike_Click" BorderColor="#9966FF" BorderStyle="Solid" ForeColor="White" BackColor="#3366FF" />
                </asp:View>
            </asp:MultiView>
            <asp:Label ID="lblShare" runat="server" Text="" ></asp:Label><br /><br />
        </td>
    </tr>
    <tr>
        <td><asp:Label ID="lbl_cmt" runat="server" Text="Bình luận"></asp:Label><br /></td>
    </tr>
    <tr>
        <td><asp:TextBox ID="tbx_cmt" MaxLength="256" TextMode="MultiLine" Height="88px" Width="372px" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <br />

        <td align="right">
            
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <ajaxtoolkit:Rating ID="RatingControl" AutoPostBack="true" Visible="true" OnChanged="RatingControlChanged" StarCssClass="ratingEmpty" WaitingStarCssClass="ratingSaved" EmptyStarCssClass="ratingEmpty" FilledStarCssClass="ratingFilled" runat="server">
                        </ajaxtoolkit:Rating>
                        <asp:Button ID="btn_cmt" Enabled="false" runat="server" Text="Gửi" Height="32px" onclick="btn_cmt_Click" /><br />
                    </ContentTemplate>
                </asp:UpdatePanel>
                
                

                </td>
    </tr>
    
    </table>
    <asp:DataList ID="lst_cmt" RepeatColumns="4" runat="server" BorderColor="Black" CellSpacing="10">
        <ItemTemplate>
            <table width="280px">
                <tr>
                    <td>
                        <%#DataBinder.Eval(Container.DataItem,"UserName") %><asp:Label ID="lbl_cm" runat="server"
                            Text=" bình luận:" ForeColor="#CC99FF"></asp:Label> 
                    </td><br />
                </tr>
                <tr>
                    <td>
                        <%#DataBinder.Eval(Container.DataItem,"Content") %>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>

