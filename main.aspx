<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="main.aspx.cs" Inherits="main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" runat="Server">
    <nav class="">
						        <ul class="sf-menu">
									        <li class="current"><a href="main.aspx">Trang Chủ</a></li>
									         <li><a href="places.aspx">Địa Điểm</a></li>
									         <li><a href="restaurant.aspx">Nhà Hàng</a></li>
									         <li><a href="hotels.aspx">Khách sạn</a></li>
									         <li><a href="events.aspx">Sự kiện</a></li>
									         <li><a href="foods.aspx">Ẩm thực</a></li>
						        </ul>
				    </nav>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Slider" runat="server">
    <div class="container_12">
        <div class="grid_12">
            <div class="slider-relative">
                <div class="slider-block">
                    <div class="slider">
                        <a href="#" class="prev"></a><a href="#" class="next"></a>
                        <ul class="items">
                            <li>
                                <img src="resource/images/slide.jpg" alt="">
                                <div class="banner">
                                    <div>
                                        CÓ RẤT NHIỀU NƠI</div>
                                    <br>
                                    <span>bạn chưa khám phá</span>
                                </div>
                            </li>
                            <li>
                                <img src="resource/images/slide1.jpg" alt=""></li>
                            <li>
                                <img src="resource/images/slide2.jpg" alt=""></li>
                            <li>
                                <img src="resource/images/slide3.jpg" alt=""></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="grid_12">
        <h3>
            Điểm Đến Nổi Bật</h3>
    </div>
    <div class="boxes">
        
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
                RepeatColumns="3">
                <ItemTemplate>
                <div class="grid_4">
                            <figure>
						                    <div><img src='<%# Eval("CoverPic") %>' alt="" width="360px" height="337px"></div>
						                    <figcaption>
							                    <h3><%# Eval("Name") %></h3>
                                                
							                     <%# Eval("ShortDescription") %>
							                    <a href="place_detail.aspx?tid=<%# Eval("Travel_ID") %>" class="btn">Xem</a>
						                    </figcaption>
					                    </figure>
                        </div>
                        
                </ItemTemplate>
            </asp:DataList>
            
            
        <div class="clear">
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" 
                
        SelectCommand="SELECT TOP 3 [Travel_ID], [Name], [CoverPic], [ShortDescription] FROM [ThongTinDuLich] ORDER BY [Rating] DESC">
            </asp:SqlDataSource>
</asp:Content>


