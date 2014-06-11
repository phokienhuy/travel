<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" Runat="Server">
                    <nav	class="" >
						        <ul class="sf-menu">
									        <li class="current"><a href="index.html">Trang Chủ</a></li>
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
<h3>Điểm Đến Nổi Bật</h3>
		    </div>
		    <div class="boxes">
		    <div class="grid_4">
					    <figure>
						    <div><img src="resource/images/page1_img1.jpg" alt=""></div>
						    <figcaption>
							    <h3>Venice</h3>
							    Lorem ipsum dolor site geril amet, consectetur cing eliti. Suspendisse nulla leo mew dignissim eu velite a rew qw vehicula lacinia arcufasec ro. Aenean lacinia ucibusy fase tortor ut feugiat. Rabi tur oliti aliquam bibendum olor quis malesuadivamu.
							    <a href="" class="btn">Xem</a>
						    </figcaption>
					    </figure>
				    </div>
				    <div class="grid_4">
					    <figure>
						    <div><img src="resource/images/page1_img2.jpg" alt=""></div>
						    <figcaption>
							    <h3>New York</h3>
							    Psum dolor sit ametylo gerto consectetur ertori hykill holit adipiscing lity. Donecto rtopil osueremo	kollit asec emmodem geteq tiloli. Aliquam dapibus neclol nami wertoli elittro eget vulpoli no
    utaterbil congue turpis in su.
							    <a href="" class="btn">Xem</a>

						    </figcaption>
					    </figure>
				    </div>
				    <div class="grid_4">
					    <figure>
						    <div><img src="resource/images/page1_img3.jpg" alt=""></div>
						    <figcaption>
							    <h3>Paris</h3>
							     Lorem ipsum dolor site geril amet, consectetur cing eliti. Suspendisse nulla leo mew dignissim eu velite a rew qw vehicula lacinia arcufasec ro. Aenean lacinia ucibusy fase tortor ut feugiat. Rabi tur oliti aliquam bibendum olor quis malesuadivamu.
							    <a href="" class="btn">Xem</a>
						    </figcaption>
					    </figure>
				    </div>
				    <div class="clear"></div>
				    </div>
</asp:Content>

