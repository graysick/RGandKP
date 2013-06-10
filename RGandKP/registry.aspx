<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="registry.aspx.cs" Inherits="registry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="header" style="color:White;padding-top:52px">
        <h2>
            <span class="fancytext" style="text-shadow: black 0.05em 0.05em 0.2em">Our Wedding Registry</span>
        </h2>
    </div>
    <div class="container-body" style="width:1024px;">
        <div id="stuff" style="background-color:White;border-radius: 8px 8px 8px 8px;height:500px">
                <div class="span4" id="image1" style="padding-top:30px;" >
                    <i style="font-size:28px;color:#0099CC;vertical-align:top" class="icon-star-empty"></i>&nbsp;&nbsp;&nbsp;<span class="fancytext" style="font-size:36px">Select a Store</span>
                    <hr style="width:350px" />
                    We registered at Bed Bath and Beyond as well as on Amazon.com!<br /><br /><br /><br />
                    <i style="font-size:300px;margin-left:50px" class="icon-gift"></i>
                </div>
                <div class="span6 center-text" id="image2" style="padding-top:20px" >
                    <a href="http://www.bedbathandbeyond.com/regGiftRegistry.asp?wrn=-2025691093&">
                        <img src="assets/img/bedbath2.png" />
                    </a>
                    <br /><br /><hr style="width:550px" />
                    <a href="http://www.amazon.com/registry/wedding/ON706NLTC6LV">
                        <img src="assets/img/amazon.png" />
                    </a>
                </div>
                <br />
                <span style="padding-top:800px;color:White">_</span>
        </div>
    </div>
</asp:Content>

