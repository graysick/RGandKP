<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="about-us.aspx.cs" Inherits="About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<div id="header" style="color:White;padding-top:52px;text-shadow: 0 1px 4px black">
        <h2>
            <span class="fancytext">About Us</span>
        </h2>
    </div>
<div class="body-container" style="width:1024px;">
    <div id="stuff" style="padding-left:20px;background-color:White;border-radius: 8px 8px 8px 8px;">
    <div class="row">
        <h2 style="padding-left:30px;">
            <i style="font-size:28px;color:#0099CC" class="icon-star-empty"></i> <span class="fancytext">Katie</span>
        </h2>
        <div class="span5">
            <p>
                Katie graduated from Winthrop University in August of 2011 with a Bachelor's degree in Biology.  She is currently pursuing her Master's degree in Nutrition at Winthrop, and is on track to graduate in May.  She enjoys cooking, relaxing, and long walks with Ryan and Ollie.
            </p>
        </div>
        <div class="span5">
            <img class="pull-right" src="assets/img/kateskate.jpg" />
        </div>
    </div>
        <hr />
    <h2>
        <i style="font-size:28px;color:#0099CC" class="icon-star-empty"></i> <span class="fancytext">Ryan</span>
    </h2>
    <div class="row">
        <div class="span5">
            <p>
                Ryan graduated from Winthrop University in May of 2012 with a Bachelor's degree in Computer Science.  He currently lives in Durham, NC and works for Fidelity Investments as a Software Engineer.  He enjoys activities such as playing sports, photography, and tinkering with anything mechanical.
            </p>
        </div>
        <div class="span5">
            <img src="assets/img/ryan.jpg" />
        </div>
    </div>
        <hr />
    <h2>
        <i style="font-size:28px;color:#0099CC" class="icon-star-empty"></i> <span class="fancytext">Ollie</span>
    </h2>
    <div class="row">
        <div class="span5">
            <p>
                Oliver ("Ollie") is our Australian Shepherd mix puppy.  He became a member of the family on November 5, 2011 and is now just about a year and a half old.  He's a big puppy (65lbs!) and enjoys playing frisbee, chasing lasers, and frolicking in meadows.
            </p>
        </div>
        <div class="span5">
            <img src="assets/img/ollie.jpg" />
        </div>
    </div>
        <hr />
    <h2>
        <i style="font-size:28px;color:#0099CC" class="icon-star-empty"></i> <span class="fancytext">Our Story</span>
    </h2>
    <div class="row" style="padding-bottom:50px">
        <div class="span5">
            <p>
                Katie and Ryan met in September of 2008, a few weeks into their freshmen year at Winthrop University.  They first spoke while walking back to the dorms after a general education class that they had together.  He asked if she would like to join him and some friends for lunch and she agreed.  They quickly became friends and remained close before beginning to date in August of 2009.  They have now been together for 3 1/2 years and are still going strong!
            </p>
        </div>
        <div class="span5">
            <img src="assets/img/us.jpg" /> 
        </div>
    </div>
    </div>
    </div>
</asp:Content>
