<%@ Page Language="C#" AutoEventWireup="true" CodeFile="hotel.aspx.cs" Inherits="admin_hotel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../resource/css/admin-style.css" type="text/css" media="all" />
</head>
<body>
    <form id="form1" runat="server">
    <!-- Header -->
    <div id="header">
        <div class="shell">
            <!-- Logo + Top Nav -->
            <div id="top">
                <h1>
                    Travel Web</h1>
                <div id="top-navigation">
                    Xin chào <a href="#"><strong>Administrator</strong></a> <span>|</span> <a href="#">Trợ
                        giúp</a> <span>|</span> <a href="#">Cài Đặt Tài Khoản</a> <span>|</span> <a href="#">
                            Thoát</a>
                </div>
            </div>
            <!-- End Logo + Top Nav -->
            <!-- Main Nav -->
            <div id="navigation">
                <ul>
                    <li><a href="place.aspx"><span>Thông Tin Du Lịch</span></a></li>
                    <li><a href="hotel.aspx" class="active"><span>Khách Sạn</span></a></li>
                    <li><a href="restaurant.aspx"><span>Nhà Hàng</span></a></li>
                    <li><a href="#"><span>Ẩm Thực</span></a></li>
                    <li><a href="#"><span>Sự Kiện</span></a></li>
                    <li><a href="#"><span>Tài Khoản</span></a></li>
                </ul>
            </div>
            <!-- End Main Nav -->
        </div>
    </div>
    <!-- End Header -->
    <!-- Container -->
    <div id="container">
        <div class="shell">
            <!-- Message OK -->
            <div class="msg msg-ok hidden">
                <p>
                    <strong>Your file was uploaded succesifully!</strong></p>
                <a href="#" class="close">close</a>
            </div>
            <!-- End Message OK -->
            <!-- Message Error -->
            <div class="msg msg-error hidden">
                <p>
                    <strong>You must select a file to upload first!</strong></p>
                <a href="#" class="close">close</a>
            </div>
            <!-- End Message Error -->
            <br />
            <!-- Main -->
            <div id="main">
                <div class="cl">
                    &nbsp;</div>
                <!-- Content -->
                <div id="content">
                    <!-- Box -->
                    <div class="box">
                        <!-- Box Head -->
                        <div class="box-head">
                            <h2>
                                Danh Sách Địa Điểm</h2>
                        </div>
                        <!-- End Box Head -->
                        <!-- Table -->
                        <div class="table">
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                DataKeyNames="Hotel_ID" DataSourceID="SqlDataSource1" BorderWidth="0px" CellPadding="0"
                                GridLines="Horizontal" Width="100%">
                                <Columns>
                                    <asp:BoundField DataField="Hotel_ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                        SortExpression="Hotel_ID" />
                                    <asp:BoundField DataField="Name" HeaderText="Tên Khách Sạn" SortExpression="Name" />
                                    <asp:BoundField DataField="Address" HeaderText="Địa Chỉ" SortExpression="Address" />
                                    <asp:BoundField DataField="Phone" HeaderText="Số điện thoại" SortExpression="Phone" />
                                    <asp:CommandField HeaderText="Thao tác" ShowDeleteButton="True" ShowEditButton="True" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>"
                                SelectCommand="SELECT [Hotel_ID], [Name], [Address], [Phone] FROM [ThongTinKhachSan]"
                                ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [ThongTinKhachSan] WHERE [Hotel_ID] = @original_Hotel_ID AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL))"
                                InsertCommand="INSERT INTO [ThongTinKhachSan] ([Name], [Address], [Phone]) VALUES (@Name, @Address, @Phone)"
                                OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [ThongTinKhachSan] SET [Name] = @Name, [Address] = @Address, [Phone] = @Phone WHERE [Hotel_ID] = @original_Hotel_ID AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL))">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_Hotel_ID" Type="Int32" />
                                    <asp:Parameter Name="original_Name" Type="String" />
                                    <asp:Parameter Name="original_Address" Type="String" />
                                    <asp:Parameter Name="original_Phone" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Name" Type="String" />
                                    <asp:Parameter Name="Address" Type="String" />
                                    <asp:Parameter Name="Phone" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Name" Type="String" />
                                    <asp:Parameter Name="Address" Type="String" />
                                    <asp:Parameter Name="Phone" Type="String" />
                                    <asp:Parameter Name="original_Hotel_ID" Type="Int32" />
                                    <asp:Parameter Name="original_Name" Type="String" />
                                    <asp:Parameter Name="original_Address" Type="String" />
                                    <asp:Parameter Name="original_Phone" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                        <!-- Table -->
                    </div>
                    <!-- End Box -->
                    <!-- Box -->
                    <div class="box">
                        <!-- Box Head -->
                        <div class="box-head">
                            <h2>
                                Thao tác</h2>
                        </div>
                        <!-- End ofBox Head -->
                        <div class="box-content">
                            <div class="buttons">
                                <asp:LinkButton ID="addButton" runat="server" Font-Underline="false" CssClass="button"
                                    OnClick="addButton_Click">Thêm Khách Sạn</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Content -->
                <div class="cl">
                    &nbsp;</div>
            </div>
            <!-- Main -->
        </div>
    </div>
    <!-- End Container -->
    <!-- Footer -->
    <div id="footer">
        <div class="shell">
            <span class="left">&copy; 2010 - VNWeb</span> <span class="right">Design by <a href="http://chocotemplates.com"
                target="_blank" title="The Sweetest CSS Templates WorldWide">VNWeb.vn</a> </span>
        </div>
    </div>
    <!-- End Footer -->
    </form>
</body>
</html>
