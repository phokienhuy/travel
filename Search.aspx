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
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Travel_ID" 
        DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <strong>Tên :</strong>&nbsp;
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
            <br />
            <br />
            <strong>Địa Chỉ :</strong>
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Address") %>' />
            <br />
            <br />
            <strong>Điện Thoại : </strong>
            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
            <br />
            <br />
            <strong>Mô Tả Sợ Lược :</strong>
            <asp:Label ID="Label4" runat="server" Text='<%# Eval("ShortDescription") %>' />
            <br />
            <br />
            <strong>Bình Chọn :</strong>
            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Rating") %>' />
            <br />
            <br />
            <strong>CoverPic :</strong>
            <asp:Image ID="Image1" runat="server" Height="131px" 
                ImageUrl='<%# Eval("CoverPic") %>' Width="305px" />
            <br />
<br />
                    <a href="place_detail.aspx?tid=<%# Eval("Travel_ID") %>" class="btn">Chi Tiết</a>
        </ItemTemplate>
    </asp:DataList>
    <br />
    <br />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT ThongTinDuLich.Name, ThongTinDuLich.Address, ThongTinDuLich.Phone, ThongTinDuLich.ShortDescription,ThongTinDuLich.Rating, ThongTinDuLich.InsertDay, ThongTinDuLich.InsertMonth, ThongTinDuLich.Travel_ID, ThongTinDuLich.CoverPic
FROM ThongTinDuLich
WHERE (ThongTinDuLich.Name LIKE '%' + @a + '%') ">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" DefaultValue="-1" Name="a" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:DataList ID="DataList2" runat="server" DataKeyField="Hotel_ID" 
        DataSourceID="SqlDataSource2">
        <ItemTemplate>
            <strong>Tên Khách Sạn :</strong>&nbsp;
            <asp:Label ID="Label8" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
            <br />
            <br />
            <strong>Địa Chỉ :</strong>
            <asp:Label ID="Label9" runat="server" Text='<%# Eval("Address") %>' />
            <br />
            <br />
            <strong>Điện Thoại :</strong>
            <asp:Label ID="Label10" runat="server" Text='<%# Eval("Phone") %>' />
            <br />
            <br />
            <strong>Mô Tả :</strong>
            <asp:Label ID="Label11" runat="server" Text='<%# Eval("ShortDescription") %>' />
            <br />
            <br />
            <strong>Bình Chọn :</strong>
            <asp:Label ID="Label12" runat="server" Text='<%# Eval("Rating") %>' />
            <br />
            <br />
            <strong>Hình Ảnh :</strong>
            <asp:Image ID="Image2" runat="server" Height="126px" 
                ImageUrl='<%# Eval("CoverPic") %>' Width="213px" />
            <br />
            <br />
                    <a href="hotel_detail.aspx?hid=<%# Eval("Hotel_ID") %>" class="btn">Chi Tiết</a>

        </ItemTemplate>
    </asp:DataList>
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT ThongTinKhachSan.Name, ThongTinKhachSan.Address, ThongTinKhachSan.Phone, ThongTinKhachSan.ShortDescription,ThongTinKhachSan.Rating, ThongTinKhachSan.Hotel_ID, ThongTinKhachSan.CoverPic
FROM ThongTinKhachSan
WHERE (ThongTinKhachSan.Name LIKE '%' + @a + '%') ">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" DefaultValue="-1" Name="a" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:DataList ID="DataList3" runat="server" DataKeyField="AmThuc_ID" 
        DataSourceID="SqlDataSource3">
        <ItemTemplate>
            <strong>Tên :</strong>
            <asp:Label ID="Label13" runat="server" Text='<%# Eval("Title") %>' />
            <br />
            <br />
            <strong>Bình Chọn :</strong>
            <asp:Label ID="Label14" runat="server" Text='<%# Eval("Rating") %>' />
            <br />
            <br />
            <strong>Hình Ảnh :</strong>
            <asp:Image ID="Image3" runat="server" Height="136px"
            ImageUrl='<%# Eval("CoverPic") %>' Width="237px" />
            <br />
<br />
                    <a href="food_detail.aspx?fid=<%# Eval("AmThuc_ID") %>" class="btn">Chi Tiết</a>

        </ItemTemplate>
    </asp:DataList>
    <br />
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT ThongTinAmThuc.Title,ThongTinAmThuc.Rating, ThongTinAmThuc.AmThuc_ID, ThongTinAmThuc.CoverPic
FROM ThongTinAmThuc
WHERE (ThongTinAmThuc.Title LIKE '%' + @a + '%') ">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" DefaultValue="-1" Name="a" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:DataList ID="DataList4" runat="server" DataKeyField="Rest_ID" 
        DataSourceID="SqlDataSource4">
        <ItemTemplate>
            <strong>Tên Nhà Hàng :</strong>
            <asp:Label ID="Label15" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
            <br />
            <br />
            <strong>Địa Chỉ :</strong>
            <asp:Label ID="Label16" runat="server" Text='<%# Eval("Address") %>' />
            <br />
            <br />
            <strong>Điện Thoại :</strong>
            <asp:Label ID="Label17" runat="server" Text='<%# Eval("Phone") %>' />
            <br />
            <br />
            <strong>Mô Tả Sơ Lược :</strong>
            <asp:Label ID="Label18" runat="server" Text='<%# Eval("ShortDescription") %>' />
            <br />
            <strong>
            <br />
            Rating :</strong>
            <asp:Label ID="Label19" runat="server" Text='<%# Eval("Rating") %>' />
            <br />
            <br />
            <strong>Hình Ảnh :</strong>
            <asp:Image ID="Image4" runat="server" Height="101px" 
                ImageUrl='<%# Eval("CoverPic") %>' Width="162px" />
            <br />
            <br />
                    <a href="restaurant_detail.aspx?rid=<%# Eval("Rest_ID") %>" class="btn">Xem</a>

        </ItemTemplate>
    </asp:DataList>
    <br />
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT ThongTinNhaHang.Name, ThongTinNhaHang.Address, ThongTinNhaHang.Phone, ThongTinNhaHang.ShortDescription,ThongTinNhaHang.Rating, ThongTinNhaHang.Rest_ID, ThongTinNhaHang.CoverPic
FROM ThongTinNhaHang
WHERE (ThongTinNhaHang.Name LIKE '%' + @a + '%') ">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" DefaultValue="-1" Name="a" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:DataList ID="DataList5" runat="server" DataKeyField="Event_ID" 
        DataSourceID="SqlDataSource5">
        <ItemTemplate>
            <strong>Tên sự kiện : </strong>
            <asp:Label ID="Label20" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
            <br />
            <br />
            <strong>Bình Chọn :</strong>
            <asp:Label ID="Label21" runat="server" Text='<%# Eval("Rating") %>' />
            <br />
            <br />
            <strong>Hình Ảnh :</strong>
            <asp:Image ID="Image5" runat="server" Height="119px" 
                ImageUrl='<%# Eval("CoverPic") %>' Width="213px" />
            <br />
            <br />
            <a href="event_detail.aspx?eid=<%# Eval("Event_ID") %>" class="btn">Chi Tiết</a>
        </ItemTemplate>
    </asp:DataList>
    <br />
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT Event.Title , Event.Rating, Event.Event_ID, Event.CoverPic
FROM Event
WHERE (Event.Title LIKE '%' + @a + '%') ">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" DefaultValue="-1" Name="a" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>
