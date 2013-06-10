<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ceremony.aspx.cs" Inherits="ceremony" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<style>
    .carousel .item {
      height: 400px;
    }
    .carousel img {
      position: absolute;
      top: 0;
      left: 0;
      width: 1024px;
      height: 400px;
    }
    .carousel-caption {
      background-color: transparent;
      position: static;
      max-width: 550px;
      padding: 0 20px;
      margin-top: 350px;
      opacity: 0.9;
    }
    .carousel-caption h1,
    .carousel-caption .lead {
      margin: 0;
      line-height: 1.25;
      color: #fff;
      text-shadow: 0 1px 1px rgba(0,0,0,.4);
    }
    .carousel-control {
      z-index: 9999;
    }
    .carousel-caption .btn {
      margin-top: 15px;
    }
</style>
<div id="header" style="color:White;padding-top:52px">
        <h2>
            <span class="fancytext" style="text-shadow: black 0.05em 0.05em 0.2em">The Ceremony & Reception</span>
        </h2>
    </div>
    <div class="container-body" style="width:1024px;">
        <div id="stuff" style="padding-left:20px;background-color:White;border-radius: 8px 8px 8px 8px;">
            <div class="row">
                <br />
                <div class="span4">
                        <i style="font-size:24px;color:#0099CC;vertical-align:top" class="icon-star-empty"></i>&nbsp;&nbsp;<span class="fancytext" style="font-size:30px">Location</span>
                    <hr />
                    <h4>The Loom</h4>
                        300 South Street<br />
                        Simpsonville, SC 29681<br /><br />
                    <a class="btn btn-large btn-primary" href="http://theloomsimpsonville.com/">More Info</a>
                    <br /><br /><br />
                    <i style="font-size:24px;color:#0099CC;vertical-align:top" class="icon-star-empty"></i>&nbsp;&nbsp;<span class="fancytext" style="font-size:30px">Date</span><br />
                    <hr />
                    <h4>August 10, 2013</h4>
                    Time: TBA
                </div>
                <div class="span6">
                    <div id="myCarousel" class="carousel slide" style="width:auto;height:400px">
                      <div class="carousel-inner">
                        <div class="item active">
                          <img src="assets/img/LoomFront.jpg" alt="">
                          <div class="container">
                            <div class="carousel-caption">
                              <h1>The Loom</h1>
                            </div>
                          </div>
                        </div>
                        <div class="item">
                          <img src="assets/img/LoomFloor.jpg" alt="">
                          <div class="container">
                            <div class="carousel-caption">
                              <h1>Inside The Loom</h1>
                            </div>
                          </div>
                        </div>
                        <div class="item">
                          <img src="assets/img/LoomBar.jpg" alt="">
                          <div class="container">
                            <div class="carousel-caption">
                              <h1>Bar at The Loom</h1>
                            </div>
                          </div>
                        </div>
                        <div class="item">
                          <img src="assets/img/LoomSide.jpg" alt="">
                          <div class="container">
                            <div class="carousel-caption">
                              <h1>Inside The Loom</h1>
                            </div>
                          </div>
                        </div>
                        <div class="item">
                          <img src="assets/img/LoomBack.jpg" alt="">
                          <div class="container">
                            <div class="carousel-caption">
                              <h1>Inside The Loom</h1>
                            </div>
                          </div>
                        </div>
                      </div>
                      <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                      <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
                    </div><!-- /.carousel -->
                </div>
            </div>
            <div class="row">
                <div class="span10">
                    <i style="font-size:24px;color:#0099CC;vertical-align:top" class="icon-star-empty"></i>&nbsp;&nbsp;<span class="fancytext" style="font-size:30px">Additional Information</span><br />
                    <hr />
                        <ul>
                            <li>The reception will immediately follow the ceremony and will take place in The Loom.</li>
                            <li>Heavy Hors d'œuvres will be provided, and beer & wine will be available at the bar for the duration of the reception.</li>  
                        </ul>
                    <hr />
                </div>
            </div>
            <span style="color:White">_</span>
        </div>
    </div>
</asp:Content>

