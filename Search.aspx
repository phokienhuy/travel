<%@ Page Title="" Language="C#" MasterPageFile="~/DetailMasterpage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Travel_Web.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" runat="server">
<nav	class="" >
						        <ul class="sf-menu">
									        <li><a href="main.aspx">Trang Chủ</a></li>
									         <li><a href="places.aspx">Địa Điểm</a></li>
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
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    
    <strong>Tìm Kiếm :
    <br />
    </strong>
    <br />
    &nbsp;
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Tìm" />
    <br />
    <br />
    <span style="font-family: 'Courier New', Courier, monospace">
    <strong style="font-size: x-large">Kết quả :
    </strong></span>
    <br />
    <br />
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <span style="">Name:
            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
            <br />
            Address:
            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
            <br />
            Phone:
            <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
            <br />
            ShortDescription:
            <asp:Label ID="ShortDescriptionLabel" runat="server" 
                Text='<%# Eval("ShortDescription") %>' />
            <br />
            Content:
            <asp:Label ID="ContentLabel" runat="server" Text='<%# Eval("Content") %>' />
            <br />
            CoverPic:
            <asp:Label ID="CoverPicLabel" runat="server" Text='<%# Eval("CoverPic") %>' />
            <br />
            <br />
            </span>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="">Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            Address:
            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
            <br />
            Phone:
            <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
            <br />
            ShortDescription:
            <asp:TextBox ID="ShortDescriptionTextBox" runat="server" 
                Text='<%# Bind("ShortDescription") %>' />
            <br />
            Content:
            <asp:TextBox ID="ContentTextBox" runat="server" Text='<%# Bind("Content") %>' />
            <br />
            CoverPic:
            <asp:TextBox ID="CoverPicTextBox" runat="server" 
                Text='<%# Bind("CoverPic") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Cancel" />
            <br />
            <br />
            </span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span> Chưa thấy kết quả nào </span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            Address:
            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
            <br />
            Phone:
            <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
            <br />
            ShortDescription:
            <asp:TextBox ID="ShortDescriptionTextBox" runat="server" 
                Text='<%# Bind("ShortDescription") %>' />
            <br />
            Content:
            <asp:TextBox ID="ContentTextBox" runat="server" Text='<%# Bind("Content") %>' />
            <br />
            CoverPic:
            <asp:TextBox ID="CoverPicTextBox" runat="server" 
                Text='<%# Bind("CoverPic") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Clear" />
            <br />
            <br />
            </span>
        </InsertItemTemplate>
        <ItemTemplate>
            <strong>Tên</strong> <span style="">:
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>' />
            <br />
            <strong>
            <br />
            Địa Chỉ</strong>:
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Address") %>' />
            <br />
            <strong>
            <br />
            Điện Thoại</strong> :
            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Phone") %>' />
            <br />
            <strong>
            <br />
            ShortDescription </strong>:
            <asp:Label ID="Label4" runat="server" Text='<%# Eval("ShortDescription") %>' />
            <br />
            <strong>
            <br />
            Content </strong>:
            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Content") %>' />
            <br />
            <strong>
            <br />
            Hình Ảnh</strong> :
            <asp:Image ID="Image1" runat="server" Height="284px" 
                ImageUrl='<%# Eval("CoverPic") %>' Width="643px" />
            <br />
            <br />
            </span>
        </ItemTemplate>
        <LayoutTemplate>
            <div style="" ID="itemPlaceholderContainer" runat="server">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="">Name:
            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
            <br />
            Address:
            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
            <br />
            Phone:
            <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
            <br />
            ShortDescription:
            <asp:Label ID="ShortDescriptionLabel" runat="server" 
                Text='<%# Eval("ShortDescription") %>' />
            <br />
            Content:
            <asp:Label ID="ContentLabel" runat="server" Text='<%# Eval("Content") %>' />
            <br />
            CoverPic:
            <asp:Label ID="CoverPicLabel" runat="server" Text='<%# Eval("CoverPic") %>' />
            <br />
            <br />
            </span>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT ThongTinDuLich.Name, ThongTinDuLich.Address, ThongTinDuLich.Phone, ThongTinDuLich.ShortDescription, ThongTinDuLich.Content, ThongTinDuLich.CoverPic
FROM ThongTinDuLich
WHERE (ThongTinDuLich.Name LIKE '%' + @a + '%') ">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" DefaultValue="-1" Name="a" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
</asp:Content>
