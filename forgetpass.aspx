<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="forgetpass.aspx.cs" Inherits="forgetpass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" Runat="Server">
<nav	class="" >
						        <ul class="sf-menu">
									         <li><a href="main.aspx">Trang Chủ</a></li>
									         <li><a href="places.aspx" >Địa Điểm</a></li>
									         <li><a href="restaurant.aspx">Nhà Hàng</a></li>
									         <li><a href="hotel.aspx">Khách sạn</a></li>
									         <li><a href="events.aspx">Sự kiện</a></li>
									         <li><a href="foods.aspx">Ẩm thực</a></li>
						        </ul>
				    </nav>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Slider" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <h3>BẠN QUÊN MẬT KHẨU?</h3>
            <br />
            <table>
                <tr>
                    <td>Tài khoản của bạn: </td>
                    <td><asp:TextBox ID="ReqUN" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Email đăng kí:</td>
                    <td><asp:TextBox ID="ReqEM" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan = "2"><asp:Label ID="mess" runat="server" ForeColor="Red" 
                    Font-Bold="True" Font-Size="Small" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btn_Req" runat="server" Text="OK" onclick="btn_Req_Click" /></td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <h3>ĐỔI MẬT KHẨU</h3>
            <br />
            <table>
                <tr>
                    <td>Mật khẩu mới: </td>
                    <td><asp:TextBox ID="newPW" runat="server" TextMode="Password" MaxLength="15"></asp:TextBox></td>
                    <td>
                        
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="newPW" ErrorMessage="Yêu cầu từ 5 - 15 kí tự" ForeColor="Red" 
                            Font-Bold="True" Font-Size="Small" Display="Dynamic"
                            ValidationExpression="^[a-zA-Z0-9]{5,}$"></asp:RegularExpressionValidator>
                        
                    </td>
                </tr>
                <tr>
                    <td>Nhập lại mật khẩu mới:</td>
                    <td><asp:TextBox ID="rePW" runat="server" TextMode="Password"></asp:TextBox></td>
                    <td><asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="newPW" ControlToValidate="rePW" 
                    ErrorMessage="Mật khẩu nhập lại không chính xác" ForeColor="Red" 
                    Font-Bold="True" Font-Size="Small" Display="Dynamic"></asp:CompareValidator></td>
                </tr>
                <tr>
                    <td colspan = "2"><asp:Label ID="messChange" ForeColor="Green" 
                    Font-Bold="True" Font-Size="Small" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btn_Change" runat="server" Text="Xác nhận" 
                            onclick="btn_Change_Click" /></td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
    <br />
    <br />
</asp:Content>

