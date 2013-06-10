<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" style="padding-top:0px">
      <div class="carousel-inner">
        <div class="item active">
          <img src="assets/img/slide-01.jpg" alt="">
          <div class="container">
            <div class="carousel-caption">
              <h1>We're getting married!</h1>
              <p class="lead">As of December 28, 2012 we are engaged! Thanks to all of our family and friends for the continuing love and support!</p>
              <a class="btn btn-large" href="about-us.aspx">Read More</a>
            </div>
          </div>
        </div>
        <div class="item">
          <img src="assets/img/slide-02.jpg" alt="">
          <div class="container">
            <div class="carousel-caption">
              <h1>Ryan, Katie, and Oliver!</h1>
              <p class="lead">Ryan, Katie & Oliver - In the mountains of Todd, NC shortly after the proposal under a waterfall...</p>
              <a class="btn btn-large" href="our-proposal.aspx">Our Story</a>
            </div>
          </div>
        </div>
        <div class="item">
          <img src="assets/img/slide-03.jpg" alt="">
          <div class="container">
            <div class="carousel-caption">
              <h1>The Venue</h1>
              <p class="lead">The Loom was chosen for the wedding.<br />Ceremony will take place on August 10, 2013</p>
              <a class="btn btn-large" href="ceremony.aspx">Venue Info</a>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
    </div><!-- /.carousel -->
      <!--  <div class="modal hide fade">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3>Modal header</h3>
            </div>
            <div class="modal-body">
                <p>One fine body…</p>
            </div>
            <div class="modal-footer">
                <a href="#" class="btn">Close</a>
                <a href="#" class="btn btn-primary">Save changes</a>
            </div>
        </div>
        <a href="#myModal" role="button" class="btn" data-toggle="modal">Launch demo modal</a>--
</div>-->
<script type="text/javascript">
    $("#hometab").addClass("active");
    $("#gallerytab").removeClass();
</script>
</asp:Content>
