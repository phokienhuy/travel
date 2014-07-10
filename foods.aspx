<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="foods.aspx.cs" Inherits="foods" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .ratingEmpty
    {
        background-image: url(resource/images/ratingStarEmpty.gif);
        width:18px;
        height:18px;
    }
    .ratingFilled
    {
        background-image: url(resource/images/ratingStarFilled.gif);
        width:18px;
        height:18px;
    }
    .ratingSaved
    {
        background-image: url(resource/images/ratingStarSaved.gif);
        width:18px;
        height:18px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" Runat="Server">
    <nav class="" >
						        <ul class="sf-menu">
									         <li><a href="main.aspx">Trang Chủ</a></li>
									         <li ><a href="places.aspx" >Địa Điểm</a></li>
									         <li><a href="restaurant.aspx">Nhà Hàng</a></li>
									         <li ><a href="hotels.aspx">Khách sạn</a></li>
									         <li><a href="events.aspx">Sự kiện</a></li>
									         <li class="current"><a href="foods.aspx">Ẩm thực</a></li>
						        </ul>
				    </nav>
                    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
    <div class="grid_12">
    <ajaxtoolkit:ToolkitScriptManager ID="ScripManager1" runat="server" />
<h3>Các khách sạn mới</h3>
		    </div>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Event_ID" 
        DataSourceID="EventList">
        <ItemTemplate>
            <div class="blog">
                <time datetime="2013-01-01"><%# Eval("InsertDay") %><br><%# Eval("InsertMonth") %></time>
                <div class="extra_wrapper">
                <div class="text1 upp"><asp:Label ID="lblFoodlName" runat="server" Text='<%# Eval("Title") %>' /> </div>
                <div class="links">
                
                
                <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>--%>
                        <ajaxtoolkit:Rating ID="RatingControl" ReadOnly="true" CurrentRating='<%# Eval("Rating") %>' StarCssClass="ratingEmpty" WaitingStarCssClass="ratingSaved" EmptyStarCssClass="ratingEmpty" FilledStarCssClass="ratingFilled" runat="server">
                        </ajaxtoolkit:Rating>
                    <%--</ContentTemplate>
                </asp:UpdatePanel>--%>
                
                <a href="#" class="comment"><asp:Label ID="Commentnum" runat="server" Text='<%# Eval("CommentNum") %> '></asp:Label> Comment(s) 
                    <asp:Label ID="Likenum" runat="server" Text='<%# Eval("LikeNum") %> '></asp:Label> Like(s)</a></div>
                </div>
                <div class="clear"></div>
                <img src="<%# Eval("CoverPic") %>" alt="" class="img_inner fleft">
                <div class="extra_wrapper">
                    <p class="text1"></p>
                    <p><asp:Label ID="lblShortDes" runat="server" Text='<%# Eval("Content") %>' /></p>
                    <br>
                    <a href="food_detail.aspx?fid=<%# Eval("AmThuc_ID") %>" class="btn">Xem</a>
                </div>
            </div>
            <br>
            <br>
        </ItemTemplate>
    </asp:DataList>
            
            <asp:SqlDataSource ID="EventList" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" 
        SelectCommand="SELECT TOP 10 * FROM [ThongTinAmThuc]"></asp:SqlDataSource>
            
            


</asp:Content>

