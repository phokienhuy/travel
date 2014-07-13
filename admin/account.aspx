<%@ Page Language="C#" AutoEventWireup="true" CodeFile="account.aspx.cs" Inherits="admin_account" %>

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
                    <li><a href="event.aspx"><span>Sự Kiện</span></a></li>
                    <li><a href="account.aspx" class="active"><span>Tài Khoản</span></a></li>
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
                                Danh Sách Tài Khoản</h2>
                        </div>
                        <!-- End Box Head -->
                        <!-- Table -->
                        <div class="table">
                            <asp:GridView ID="gvAccount" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="username" 
        DataSourceID="sqlAccount" ForeColor="#333333" GridLines="None" 
        Width="100%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="False" ShowEditButton="True" 
                EditText="" ButtonType="Image" 
                CancelImageUrl="~/resource/images/cancel.png" CancelText="" DeleteText="" 
                EditImageUrl="~/resource/images/edit.png" InsertText="" NewText="" 
                SelectText="" UpdateImageUrl="~/resource/images/ok.png" UpdateText="" />
            <asp:BoundField DataField="username" HeaderText="Tên tài khoản" ReadOnly="True" 
                SortExpression="username" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" ReadOnly="true" />
            <asp:BoundField DataField="name" HeaderText="Họ Tên" SortExpression="name" />
            <asp:BoundField DataField="phone" HeaderText="Số điện thoại" SortExpression="phone" />
            <asp:BoundField DataField="address" HeaderText="Địa chỉ" SortExpression="address" />

            <%--<asp:TemplateField  HeaderText="Loại tài khoản" SortExpression="type"  >
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlType" runat="server">
                        <asp:ListItem Text="Quản trị viên" Value="true"></asp:ListItem>
                        <asp:ListItem Text="Người dùng" Value="false"></asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                    
                <ItemTemplate>
                    <asp:Label ID="lblType" runat="server" Text='<%# if(DataBinder.Eval(Container.DataItem,"Type").ToString()=="true","Quản trị viên","Người dùng") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="Kích hoạt" SortExpression="active"  >
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlActive" runat="server">
                        <asp:ListItem Text="Kích hoạt" Value="true"></asp:ListItem>
                        <asp:ListItem Text="Không kích hoạt" Value="false"></asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                    
                <ItemTemplate>
                    <asp:Label ID="lblActive" runat="server" Text='<%# Bind("Active") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="Loại tài khoản" >
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        SelectedValue='<%# Bind("Type") %>' >
                        
                        <asp:ListItem Value="1">Quản trị viên</asp:ListItem>
                        <asp:ListItem Value="0">Người dùng</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlType" runat="server" 
                        SelectedValue='<%# Bind("Type") %>' Enabled="false" >
                        
                        <asp:ListItem Value="1">Quản trị viên</asp:ListItem>
                        <asp:ListItem Value="0">Người dùng</asp:ListItem>
                    </asp:DropDownList>
                    </ItemTemplate>
                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kích hoạt">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlActive" runat="server" 
                    SelectedValue='<%# Bind("Active") %>'>
                        
                        <asp:ListItem Value="1" Selected="True">Mở</asp:ListItem>
                        <asp:ListItem Value="0">Khóa</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" 
                    SelectedValue='<%# Bind("Active") %>' Enabled="false">
                        
                        <asp:ListItem Value="1" Selected="True">Mở</asp:ListItem>
                        <asp:ListItem Value="0">Khóa</asp:ListItem>
                    </asp:DropDownList>
                    </ItemTemplate>
                
            </asp:TemplateField>
           
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:SqlDataSource ID="sqlAccount" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" 
        InsertCommand="INSERT INTO [Account] ([User_ID], [UserName], [Pass], [Email], [Name], [Phone], [Address], [Type], [Active] ) VALUES (@ID, @username, @password, @email, @name, @phone, @address, @type, @active)" 
        SelectCommand="SELECT * FROM [Account]"
        UpdateCommand="UPDATE [Account] SET [Name] = @name, [Phone] = @phone, [Address] = @address, [Type] = @type, [Active] = @active WHERE [Username] = @username">
        
        
        <InsertParameters>
            <asp:Parameter Name="ID" Type="Object" />
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="type" Type="String" />
            <asp:Parameter Name="active" Type="String" />
            
        </InsertParameters>
        <UpdateParameters>
            
            <asp:Parameter Name="username" Type="String" />
            
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="type" Type="String" />
            <asp:Parameter Name="active" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
                        </div>
                        <!-- Table -->
                    </div>
                    <!-- End Box -->
                    <!-- Box -->
                    
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

