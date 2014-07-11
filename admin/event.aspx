<%@ Page Language="C#" AutoEventWireup="true" CodeFile="event.aspx.cs" Inherits="admin_event" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
                    <li><a href="hotel.aspx"><span>Khách Sạn</span></a></li>
                    <li><a href="restaurant.aspx"><span>Nhà Hàng</span></a></li>
                    <li><a href="cuisine.aspx"><span>Ẩm Thực</span></a></li>
                    <li><a href="event.aspx" class="active"><span>Sự Kiện</span></a></li>
                    <li><a href="account.aspx"><span>Tài Khoản</span></a></li>
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
                                Danh Sách Sự kiện</h2>
                        </div>
                        <!-- End Box Head -->
                        <!-- Table -->
                        <div class="table">
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                DataKeyNames="Event_ID" DataSourceID="SqlDataSource1" BorderWidth="0px" CellPadding="0"
                                GridLines="Horizontal" Width="100%">
                                <Columns>
                                    <asp:BoundField DataField="Event_ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                        SortExpression="Event_ID" />
                                    <asp:BoundField DataField="Title" HeaderText="Tựa đề" SortExpression="Title" />
                                    <asp:CommandField HeaderText="Thao tác" ShowDeleteButton="True" 
                                        ShowEditButton="True" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>"
                                SelectCommand="SELECT [Event_ID], [Title] FROM [Event]"
                                ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Event] WHERE [Event_ID] = @original_Event_ID AND (([Title] = @original_Title) OR ([Title] IS NULL AND @original_Title IS NULL))"
                                InsertCommand="INSERT INTO [Event] ([Title]) VALUES (@Title)"
                                OldValuesParameterFormatString="original_{0}" 
                                
                                
                                UpdateCommand="UPDATE [Event] SET [Title] = @Title WHERE [Event_ID] = @original_Event_ID AND (([Title] = @original_Title) OR ([Title] IS NULL AND @original_Title IS NULL))">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_Event_ID" Type="Int32" />
                                    <asp:Parameter Name="original_Title" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Title" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Title" Type="String" />
                                    <asp:Parameter Name="original_Event_ID" Type="Int32" />
                                    <asp:Parameter Name="original_Title" Type="String" />
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
                                    OnClick="addButton_Click">Thêm Sự Kiện</asp:LinkButton>
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
            <span class="left">&copy; 2014 - GroupB</span> <span class="right">Design by <a href="http://chocotemplates.com"
                target="_blank" title="The Sweetest CSS Templates WorldWide">GroupB</a> </span>
        </div>
    </div>
    <!-- End Footer -->
    </form>
</body>
</html>
