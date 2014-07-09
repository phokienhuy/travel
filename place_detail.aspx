<%@ Page Title="" Language="C#" MasterPageFile="~/DetailMasterpage.master" AutoEventWireup="true" CodeFile="place_detail.aspx.cs" Inherits="place_detail" %>

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
    <nav	class="" >
						        <ul class="sf-menu">
									         <li><a href="main.aspx">Trang Chủ</a></li>
									         <li class="current"><a href="places.aspx" >Địa Điểm</a></li>
									         <li class="with_ul"><a href="index-2.html">Nhà Hàng</a>
										         <ul>
												        <li><a href="#">Agency</a></li>
												        <li><a href="#">News</a></li>
												        <li><a href="#">Team</a></li>
										         </ul>
									         </li>
									         <li><a href="index-3.html">Khách sạn</a></li>
									         <li><a href="#">Đặt Trước</a></li>
									         <li><a href="index-5.html">Liên Hệ</a></li>
						        </ul>
				    </nav>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
    <ajaxtoolkit:ToolkitScriptManager ID="ScripManager1" runat="server" />
<asp:DataList ID="PlaceDetail" runat="server" DataKeyField="Travel_ID" 
                DataSourceID="SQLPlaceDetail">
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
              <div class="text1"><a href="#">Pellentesque imperdiet. </a></div>Quisque sed quam justo. Nulla kilor congue sed turpis nec lacinia. Nulla facilisi. Ut sit amet gravida telluswil. Morbi id consequat erosivamus. 
            </div>
          </li>
          <li>
            <div class="count">2</div>
            <div class="extra_wrapper">
              <div class="text1"><a href="#">Aellentesque omperdie. </a></div>Fuisque sed quam justo. Cngueteri sed turpis nec lacinia. Nulla facilisi. Ut sit amet gravida tellus. Morbi idy consequat eros. Vivamus imperdiet
            </div>
          </li>
          <li>
            <div class="count">3</div>
            <div class="extra_wrapper">
              <div class="text1"><a href="#">Grellentesque imperdik. </a></div>Yisque sed quam justo. Nullaongue sed turpis nec lacinia. Julla facilisi. Ut sit amet gravida tellus. Morbi idy consequat erosamus imperdiet. 
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
            <asp:SqlDataSource ID="SQLPlaceDetail" runat="server" 
                ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" 
                
        SelectCommand="SELECT * FROM [ThongTinDuLich] WHERE ([Travel_ID] = @Travel_ID)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="Travel_ID" 
                        QueryStringField="tid" Type="Int32" />
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

