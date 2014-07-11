<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" Runat="Server">
                    <nav	class="" >
						        <ul class="sf-menu">
									        <li class="current"><a href="main.aspx">Trang Chủ</a></li>
									         <li><a href="places.aspx">Địa Điểm</a></li>
									         <li><a href="restaurant.aspx">Nhà Hàng</a></li>
									         <li><a href="hotels.aspx">Khách sạn</a></li>
									         <li><a href="events.aspx">Sự kiện</a></li>
									         <li><a href="foods.aspx">Ẩm thực</a></li>
						        </ul>
				    </nav>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Slider" runat="server">

<div class="container_12">
		    <div class="grid_12">
	     <div class="slider-relative">
			    <div class="slider-block">
				    <div class="slider">
					    <a href="#" class="prev"></a><a href="#" class="next"></a>
					    <ul class="items">
						    <li><img src="resource/images/slide.jpg" alt="">
								    <div class="banner">
									    <div>CÓ RẤT NHIỀU NƠI</div><br>
									    <span> bạn chưa khám phá</span>
								    </div>
						    </li>
						    <li><img src="resource/images/slide1.jpg" alt=""></li>
						    <li><img src="resource/images/slide2.jpg" alt=""></li>
						    <li><img src="resource/images/slide3.jpg" alt=""></li>
					    </ul>
				    </div>
			    </div>
		    </div>
	    </div></div>
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

