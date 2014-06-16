<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script language="javascript" src="resource/js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
    var $j = jQuery.noConflict();
    function checkUN(src, args) {
        var isValid;
        $.ajax({
            type: "POST",
            url: "CheckUserName.aspx/checkUN",
            data: "{'UserName':'" + $j("#<%=txtUN.ClientID %>").val() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (msg) {
                isValid = msg.d;
            }
        });
        args.IsValid = isValid;
    }
    </script>
    
    <script language="javascript" type="text/javascript">
        var $j = jQuery.noConflict();
        function checkEmail(src, args) {
            var isValid;
            $.ajax({
                type: "POST",
                url: "CheckUserName.aspx/checkEmail",
                data: "{'Email':'" + $j("#<%=txtEmail.ClientID %>").val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (msg) {
                    isValid = msg.d;
                }
            });
            args.IsValid = isValid;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" Runat="Server">
<nav	class="" >
						        <ul class="sf-menu">
									         <li><a href="index.html">Trang Chủ</a></li>
									         <li><a href="place.html">Địa Điểm</a></li>
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
<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
    <div class="grid_12">
        <h3>ĐĂNG KÍ TÀI KHOẢN</h3>
    </div>
<div class="boxes">
<table id="tablesignup" runat="server" align="center" width="1500" >
   
        <tr>
            <td width="200"></td>
            <td width="100"></td>
            <td width="400"></td>
        </tr>
        
        <tr>
            <td width="100" align="right" class="style2" >Tên đăng nhập: </td>
            <td>
                <asp:TextBox ID="txtUN" runat="server" MaxLength="20" Width="200px"></asp:TextBox>
            </td>
            <td align="left">
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtUN" ErrorMessage="Không được để trống" 
                    ForeColor="Red" Font-Bold="True" Font-Size="Small" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" 
                    Font-Bold="True" 
                    Font-Size="Small" ForeColor="Red"
                    ErrorMessage="Tài khoản tồn tại" ClientValidationFunction="checkUN" 
                    ControlToValidate="txtUN" Display="Dynamic" ValidateEmptyText="True"></asp:CustomValidator>
                </td>
        </tr>
        <tr>
            <td  align="right" class="style2">Mật khẩu: </td>
            <td>
                <asp:TextBox ID="txtPW" runat="server" TextMode="Password" MaxLength="10" 
                    Width="200px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtPW" ErrorMessage="Không được để trống" 
                    ForeColor="Red" Font-Bold="True" Font-Size="Small" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td  align="right">Nhập lại mật khẩu: </td>
            <td>
                <asp:TextBox ID="TXTRePW" runat="server" TextMode="Password" MaxLength="10" 
                    Width="200px"></asp:TextBox></td>
            <td>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtPW" ControlToValidate="TXTRePW" 
                    ErrorMessage="Mật khẩu nhập lại không chính xác" ForeColor="Red" 
                    Font-Bold="True" Font-Size="Small" Display="Dynamic"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style2">Email: </td>
            <td class="style1">
                <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox></td>
            <td class="style1">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ErrorMessage="Không được để trống" ForeColor="Red" 
                    ControlToValidate="txtEmail" Font-Bold="True" Font-Size="Small" 
                    Display="Dynamic"></asp:RequiredFieldValidator>


                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Email không hợp lệ"  Font-Bold="True" 
                    Font-Size="Small" ForeColor="Red" 
                    ValidationExpression="^.+@[^\.].*\.[a-z]{2,}$" Display="Dynamic"></asp:RegularExpressionValidator>
                
                <asp:CustomValidator ID="CustomValidator2" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Email tồn tại" 
                    Font-Bold="True" 
                    Font-Size="Small" ForeColor="Red"
                    ClientValidationFunction="checkEmail" Display="Dynamic" 
                    ValidateEmptyText="True"></asp:CustomValidator>
                <span id="checkReturnEmail"></span>
                
                  

           </td>
        </tr>
        <tr>
            <td colspan="2" align="center" class="style2">-------------------------------------------------------------------------</td>
            <td></td>
        </tr>
        <tr>
            <td align="right" class="style2">Họ & tên: </td>
            <td>
                <asp:TextBox ID="txtName" runat="server" Width="200px" CausesValidation="True"></asp:TextBox></td>
            <td>
                
            </td>
        </tr>
        <tr>
            <td align="right" class="style2">Số điện thoại: </td>
            <td>
                <asp:TextBox ID="txtPhone" runat="server" Width="200px"></asp:TextBox></td>
            <td></td>
        </tr>
        <tr>
            <td align="right" class="style2">Địa chỉ: </td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server" Width="200px"></asp:TextBox></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button ID="btnSubmit" runat="server" Text="Đăng Kí" 
                    onclick="btnSubmit_Click" /></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Label ID="Label1" runat="server"></asp:Label></td>
        </tr>
    </table>
    </div>
</asp:Content>

