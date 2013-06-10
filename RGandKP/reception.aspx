<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="reception.aspx.cs" Inherits="reception" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div id="header" style="color:White;padding-top:70px">
        <h2>
            <span class="fancytext" style="text-shadow: black 0.05em 0.05em 0.2em">The Honeymoon</span>
        </h2>
    </div>
<div class="container-body" style="width:1024px;">
    <div id="stuff" style="padding-left:20px;background-color:White;border-radius: 8px 8px 8px 8px;">
    <p>
        <div id="image1" style="padding-top:20px;width=984px;">
        <img width="984px" src="assets/img/gold-beach.jpg" />
        </div>
        <br />
        <button class="btn" onclick="showMap()">Show Map</button>
        <br />
        <span style="color:White">_</span>
    </p>
    </div>
    </div>
</asp:Content>

