<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="place_detail.aspx.cs" Inherits="place_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <meta charset="utf-8">
     <link rel="icon" href="resource/images/favicon.ico">
     <link rel="shortcut icon" href="resource/images/favicon.ico" />
     <link rel="stylesheet" href="resource/css/style.css">
     <link rel="stylesheet" href="resource/css/touchTouch.css">
     <script src="js/jquery.js"></script>
     <script src="js/jquery-migrate-1.1.1.js"></script>
     <script src="js/superfish.js"></script>
     <script src="js/jquery.equalheights.js"></script>
     <script src="js/jquery.easing.1.3.js"></script>
     <script src="js/jquery.ui.totop.js"></script>
     <script src="js/touchTouch.jquery.js"></script>
<script>
    $(window).load(function () {
        $().UItoTop({ easingType: 'easeOutQuart' });
    });
    $(function () {

        // Initialize the gallery
        $('.gallery a.gal').touchTouch();
    });
      
      
      
     </script>
     <!--[if lt IE 8]>
       <div style=' clear: both; text-align:center; position: relative;'>
         <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
           <img src="http://storage.ie6countdown.com/assets/100/resource/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
         </a>
      </div>
    <![endif]-->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <link rel="stylesheet" media="screen" href="resource/css/ie.css">

    <![endif]-->
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
<asp:Content ID="Content3" ContentPlaceHolderID="Slider" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" Runat="Server">
    <div class="content"><div class="ic">More Website Templates @ TemplateMonster.com - August 05, 2013!</div>
        <div class="container_12">
            <asp:DataList ID="PlaceDetail" runat="server" DataKeyField="Travel_ID" 
                DataSourceID="SQLPlaceDetail">
                <ItemTemplate>
                    <div class="grid_9">
                        <div class="">
                          <h3><%# Eval("Name") %></h3>
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
        </div>
    </div>
</asp:Content>
