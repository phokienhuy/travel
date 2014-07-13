<%@ Page Title="" Language="C#" MasterPageFile="~/DetailMasterpage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Travel_Web.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" runat="server">
<nav	class="" >
						        <ul class="sf-menu">
									        <li><a href="main.aspx">Trang Chủ</a></li>
									         <li><a href="places.aspx">Địa Điểm</a></li>
									         <li><a href="restaurant.aspx">Nhà Hàng</a></li>
									         <li><a href="index-3.html">Khách sạn</a></li>
									         <li><a href="events.aspx">Sự kiện</a></li>
									         <li><a href="foods.aspx">Ẩm thực</a></li>
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
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="TextBox1" ErrorMessage="Không được để trống , vui lòng nhập thông tin bạn muốn tìm" ForeColor="Red" Font-Bold="True" Font-Size="Small" Display="Dynamic"></asp:RequiredFieldValidator>
    <br />
    <span style="font-family: 'Courier New', Courier, monospace">
    <strong style="font-size: x-large">
    <br />
    Kết quả :
    </strong></span>
    <br />
    <br />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="Travel_ID" 
        DataSourceID="SqlDataSource1">
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
            Rating:
            <asp:Label ID="RatingLabel" runat="server" Text='<%# Eval("Rating") %>' />
            <br />
            InsertDay:
            <asp:Label ID="InsertDayLabel" runat="server" Text='<%# Eval("InsertDay") %>' />
            <br />
            InsertMonth:
            <asp:Label ID="InsertMonthLabel" runat="server" 
                Text='<%# Eval("InsertMonth") %>' />
            <br />
            Travel_ID:
            <asp:Label ID="Travel_IDLabel" runat="server" Text='<%# Eval("Travel_ID") %>' />
            <br />
            CoverPic:
            <asp:Label ID="CoverPicLabel" runat="server" Text='<%# Eval("CoverPic") %>' />
            <br />
<br /></span>
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
            Rating:
            <asp:TextBox ID="RatingTextBox" runat="server" Text='<%# Bind("Rating") %>' />
            <br />
            InsertDay:
            <asp:TextBox ID="InsertDayTextBox" runat="server" 
                Text='<%# Bind("InsertDay") %>' />
            <br />
            InsertMonth:
            <asp:TextBox ID="InsertMonthTextBox" runat="server" 
                Text='<%# Bind("InsertMonth") %>' />
            <br />
            Travel_ID:
            <asp:Label ID="Travel_IDLabel1" runat="server" 
                Text='<%# Eval("Travel_ID") %>' />
            <br />
            CoverPic:
            <asp:TextBox ID="CoverPicTextBox" runat="server" 
                Text='<%# Bind("CoverPic") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Cancel" />
            <br /><br /></span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span></span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <br />Address:
            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
            <br />Phone:
            <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
            <br />ShortDescription:
            <asp:TextBox ID="ShortDescriptionTextBox" runat="server" 
                Text='<%# Bind("ShortDescription") %>' />
            <br />Content:
            <asp:TextBox ID="ContentTextBox" runat="server" Text='<%# Bind("Content") %>' />
            <br />Rating:
            <asp:TextBox ID="RatingTextBox" runat="server" Text='<%# Bind("Rating") %>' />
            <br />InsertDay:
            <asp:TextBox ID="InsertDayTextBox" runat="server" 
                Text='<%# Bind("InsertDay") %>' />
            <br />InsertMonth:
            <asp:TextBox ID="InsertMonthTextBox" runat="server" 
                Text='<%# Bind("InsertMonth") %>' />
            <br />CoverPic:
            <asp:TextBox ID="CoverPicTextBox" runat="server" 
                Text='<%# Bind("CoverPic") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Clear" />
            <br /><br /></span>
        </InsertItemTemplate>
        <ItemTemplate>
            <strong>Tên :</strong><span style="">
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
            <br />
            <br />
            <strong>Địa Chỉ : </strong>
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
            <br />
            <br />
            <strong>Điện Thoại :</strong>
            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
            <br />
            <br />
            <strong>Mô Tả Sơ Lược : </strong>
            <asp:Label ID="Label4" runat="server" Text='<%# Eval("ShortDescription") %>'></asp:Label>
            <br />
            <br />
            <strong>Nội Dung :</strong>
            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Content") %>'></asp:Label>
            <br />
            <br />
            <strong>Bình Chọn :</strong>
            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Rating") %>'></asp:Label>
            /5<br />
            <br />
            <strong>Ngày Khởi Hành :</strong>
            <asp:Label ID="Label7" runat="server" Text='<%# Eval("InsertDay") %>'></asp:Label>
            /<asp:Label ID="Label8" runat="server" Text='<%# Eval("InsertMonth") %>'></asp:Label>
            <br />
            <strong>Hình Ảnh :</strong>
            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("CoverPic") %>' />
            <br />
            <br />
            <a href="place_detail.aspx?tid=<%# Eval("Travel_ID") %>" class="btn">Chi Tiết</a>
            </span>
        </ItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" style="">
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
            Rating:
            <asp:Label ID="RatingLabel" runat="server" Text='<%# Eval("Rating") %>' />
            <br />
            InsertDay:
            <asp:Label ID="InsertDayLabel" runat="server" Text='<%# Eval("InsertDay") %>' />
            <br />
            
            InsertMonth:
            <asp:Label ID="InsertMonthLabel" runat="server" 
                Text='<%# Eval("InsertMonth") %>' />
            <br />
            Travel_ID:
            <asp:Label ID="Travel_IDLabel" runat="server" Text='<%# Eval("Travel_ID") %>' />
            <br />
            <br />
            <br />
            CoverPic:
            <asp:Label ID="CoverPicLabel" runat="server" Text='<%# Eval("CoverPic") %>' />
            <br />
<br /></span>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT ThongTinDuLich.Name, ThongTinDuLich.Address, ThongTinDuLich.Phone, ThongTinDuLich.ShortDescription, ThongTinDuLich.Content, ThongTinDuLich.Rating, ThongTinDuLich.InsertDay, ThongTinDuLich.InsertMonth, ThongTinDuLich.Travel_ID, ThongTinDuLich.CoverPic
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
