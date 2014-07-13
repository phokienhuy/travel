<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="activate.aspx.cs" Inherits="activate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <nav	class="" >
						        <ul class="sf-menu">
									        <li><a href="main.aspx">Trang Chủ</a></li>
									         <li ><a href="places.aspx" >Địa Điểm</a></li>
									         <li><a href="restaurant.aspx">Nhà Hàng</a></li>
									         <li><a href="hotels.aspx">Khách sạn</a></li>
									         <li><a href="events.aspx">Sự kiện</a></li>
									         <li><a href="foods.aspx">Ẩm thực</a></li>
						        </ul>
				    </nav>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
    <div class="grid_12">
        <h3>KÍCH HOẠT TÀI KHOẢN</h3>
    </div>
    <div class="boxes">
        <asp:Label ID="VerificationMessageLabel" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>

