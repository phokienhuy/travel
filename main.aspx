<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="main.aspx.cs" Inherits="main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" runat="Server">
    <nav class="">
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
                            <li>
                                <img src="resource/images/slide.jpg" alt="">
                                <div class="banner">
                                    <div>
                                        CÓ RẤT NHIỀU NƠI</div>
                                    <br>
                                    <span>bạn chưa khám phá</span>
                                </div>
                            </li>
                            <li>
                                <img src="resource/images/slide1.jpg" alt=""></li>
                            <li>
                                <img src="resource/images/slide2.jpg" alt=""></li>
                            <li>
                                <img src="resource/images/slide3.jpg" alt=""></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="grid_12">
        <h3>
            Điểm Đến Nổi Bật</h3>
    </div>
    <div class="boxes">
        <div class="grid_4">
            <figure>
						    <div><img src="resource/images/page1_img1.jpg" alt=""></div>
						    <figcaption>
							    <h3>Venice</h3>
							     Thường gọi "thành phố của các kênh đào" và La Serenissima, là thủ phủ của vùng Veneto và của tỉnh Venezia ở Ý. Trong tiếng Việt, thành phố này được gọi là Vơ-ni-dơ (phiên âm từ Venise trong tiếng Pháp).
							    <a href="http://vi.wikipedia.org/wiki/Venice" class="btn">Xem</a>
						    </figcaption>
					    </figure>
        </div>
        <div class="grid_4">
            <figure>
						    <div><img src="resource/images/page1_img2.jpg" alt=""></div>
						    <figcaption>
							    <h3>New York</h3>
							    Tên chính thức City of New York, là thành phố đông dân nhất tại Hoa Kỳ và trung tâm của Vùng đô thị New York, một trong những vùng đô thị đông dân nhất trên thế giới.
							    <a href="http://vi.wikipedia.org/wiki/New_York" class="btn">Xem</a>

						    </figcaption>
					    </figure>
        </div>
        <div class="grid_4">
            <figure>
						    <div><img src="resource/images/page1_img3.jpg" alt=""></div>
						    <figcaption>
							    <h3>Paris</h3>
							      Là thành phố thủ đô của nước Pháp, cũng là một trong ba thành phố phát triển kinh tế nhanh nhất thế giới cùng Luân Đôn và New York và cũng là một trung tâm hành chính của vùng Île-de-France. 
							    <a href="http://vi.wikipedia.org/wiki/Paris" class="btn">Xem</a>
						    </figcaption>
					    </figure>
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
