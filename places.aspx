<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="places.aspx.cs" Inherits="places" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
.ratingEmpty
{
background-image: url(ratingStarEmpty.gif);
width:18px;
height:18px;
}
.ratingFilled
{
background-image: url(ratingStarFilled.gif);
width:18px;
height:18px;
}
.ratingSaved
{
 background-image: url(ratingStarSaved.gif);
width:18px;
height:18px;
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
<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
    <div class="grid_12">
    <ajaxtoolkit:ToolkitScriptManager ID="ScripManager1" runat="server" />
<h3>Các địa điểm mới</h3>
		    </div>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Travel_ID" DataSourceID="PlaceList">
        <ItemTemplate>
            <div class="blog">
                <time datetime="2013-01-01"><%# Eval("InsertDay") %><br><%# Eval("InsertMonth") %></time>
                <div class="extra_wrapper">
                <div class="text1 upp"><asp:Label ID="lblTravelName" runat="server" Text='<%# Eval("Name") %>' /> </div>
                <div class="links">
                
                
                <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>--%>
                        <ajaxtoolkit:Rating ID="RatingControl" CurrentRating='<%# Eval("Rating") %>' StarCssClass="ratingEmpty" WaitingStarCssClass="ratingSaved" EmptyStarCssClass="ratingEmpty" FilledStarCssClass="ratingFilled" runat="server">
                        </ajaxtoolkit:Rating>
                    <%--</ContentTemplate>
                </asp:UpdatePanel>--%>
                
                <a href="#" class="comment"><asp:Label ID="Label1" runat="server" Text='<%# Eval("CommentNum") %> '></asp:Label> Comment(s)</a></div>
                </div>
                <div class="clear"></div>
                <img src="<%# Eval("CoverPic") %>" alt="" class="img_inner fleft">
                <div class="extra_wrapper">
                    <p class="text1"></p>
                    <p><asp:Label ID="lblShortDes" runat="server" Text='<%# Eval("ShortDescription") %>' /></p>
                    <br>
                    <a href="place_detail.aspx?tid=<%# Eval("Travel_ID") %>" class="btn">Xem</a>
                </div>
            </div>
            <br>
            <br>
        </ItemTemplate>
    </asp:DataList>
            
            <asp:SqlDataSource ID="PlaceList" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" 
        SelectCommand="SELECT TOP 10 * FROM [ThongTinDuLich]"></asp:SqlDataSource>
            
            


</asp:Content>

