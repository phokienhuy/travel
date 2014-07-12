<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newPlace.aspx.cs" Inherits="admin_newPlace" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="../resource/css/admin-style.css" type="text/css" media="all" />
    <script src="ckeditor/ckeditor.js"></script>
    <title></title>
</head>
<body>
    <!-- Header -->
    <div id="header">
        <div class="shell">
            <!-- Logo + Top Nav -->
            <div id="top">
                <h1>
                    Travel Web</h1>
                <div id="top-navigation">
                    Xin chào <a href="#"><strong><asp:Literal ID="username" runat="server"></asp:Literal></strong></a> <span>|</span> <a href="#">Trợ
                        giúp</a> <span>|</span> <a href="#">Cài Đặt Tài Khoản</a> <span>|</span> <a href="#">
                            Thoát</a>
                </div>
            </div>
            <!-- End Logo + Top Nav -->
            <!-- Main Nav -->
            <div id="navigation">
                <ul>
                    <li><a href="place.aspx" class="active"><span>Thông Tin Du Lịch</span></a></li>
                    <li><a href="hotel.aspx"><span>Khách Sạn</span></a></li>
                    <li><a href="restaurant.aspx"><span>Nhà Hàng</span></a></li>
                    <li><a href="cuisine.aspx"><span>Ẩm Thực</span></a></li>
                    <li><a href="event.aspx"><span>Sự Kiện</span></a></li>
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
            <div class="small-nav">
                <a href="product.html">Dashboard</a> <span>&gt;</span> Quần Nam Ninomax
            </div>
            <!-- End Small Nav -->
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
                                Thêm Sản Phẩm</h2>
                        </div>
                        <!-- End Box Head -->
                        <form id="form1" runat="server">
                        <asp:FormView ID="FormView1" runat="server">
                        </asp:FormView>
                        <!-- Form -->
                        <div class="form">
                            <p>
                                <label>
                                    Tên</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="name" ErrorMessage="*Bắt buộc" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="name" runat="server" class="field size1"></asp:TextBox>
                            </p>
                            <p>
                                <label>
                                    Địa Chỉ</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="address" ErrorMessage="*Bắt buộc" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="address" runat="server" class="field size1"></asp:TextBox>
                            </p>
                            <p>
                                <label>
                                    Số Điện Thoại</label>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ControlToValidate="phone" ErrorMessage="*Bắt buộc" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="phone" runat="server" class="field size1"></asp:TextBox>
                            </p>
                            <p>
                                <label>
                                    Đánh Giá</label>
                                <input type="text" class="field size1" disabled="disabled" value="*****" />
                            </p>
                            <p>
                                <label>
                                    Miêu tả ngắn gọn:</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="shortDes" ErrorMessage="*Bắt buộc" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="shortDes" runat="server" class="field size1"></asp:TextBox>
                            </p>
                            <p>
                                <label>
                                    Ngày tạo:</label>
                                <asp:TextBox ID="insertDay" runat="server" class="field size1"></asp:TextBox>
                            </p>
                            <p>
                                <label>
                                    Tháng tạo:</label>
                                <asp:TextBox ID="insertMonth" runat="server" class="field size1"></asp:TextBox>
                            </p>
                            <p>
                                <label>
                                    Ảnh bìa:</label>
                                <asp:FileUpload ID="coverImage" runat="server" />
                            </p>
                            <p>
                                <label>
                                    Ảnh 1:</label>
                                <asp:FileUpload ID="imageOne" runat="server" />
                            </p>
                            <p>
                                <label>
                                    Ảnh 2:</label>
                                <asp:FileUpload ID="imageTwo" runat="server" />
                            </p>
                            <p>
                                <label>
                                    Ảnh 3:</label>
                                <asp:FileUpload ID="imageThree" runat="server" />
                            </p>
                            <p>
                                <label>
                                    Ảnh 4:</label>
                                <asp:FileUpload ID="imageFour" runat="server" />
                            </p>
                            <p>
                                <label>
                                    Ảnh 5:</label>
                                <asp:FileUpload ID="imageFive" runat="server" />
                            </p>
                            <p>
                                <label>
                                    Ảnh 6:</label>
                                <asp:FileUpload ID="imageSix" runat="server" />
                            </p>
                            <p>
                                <label>
                                    Miêu tả
                                </label>
                                <CKEditor:CKEditorControl ID="mieuta" BasePath="/ckeditor/" runat="server" class="field size1"
                                    Rows="10" cols="30"></CKEditor:CKEditorControl>
                            </p>
                        </div>
                        <!-- End Form -->
                        <!-- Form Buttons -->
                        <div class="buttons">
                            <asp:LinkButton ID="submit" runat="server" class="button" Font-Underline="false"
                                OnClick="submit_Click">Thêm</asp:LinkButton>
                            <input type="button" class="button" value="Xoa Bieu Nhap" />
                            <input type="button" class="button" value="Trở Về" onclick="window.location = 'place.aspx'" />
                        </div>
                        <!-- End Form Buttons -->
                        </form>
                    </div>
                    <!-- End Box -->
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
</body>
</html>
