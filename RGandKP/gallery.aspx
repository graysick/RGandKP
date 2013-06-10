<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="gallery.aspx.cs" Inherits="gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <link href="assets/styles/galleria.classic.css" rel="Stylesheet" />
        <div id="header" style="color:White;padding-top:52px">
            <h2>
                <span class="fancytext" style="text-shadow: black 0.05em 0.05em 0.2em">Gallery</span>
            </h2>
        </div>
        <div class="container" style="width:1024px;">
           <div class="container-body" style="width:1024px;">
               <div id="stuff" style="padding-left:20px;background-color:White;border-radius: 8px 8px 8px 8px;">
                    <br />
                     <div id="galleria" style="width:984px;height:600px;">
                        <img src="assets/img/gallery/1 (1).jpg" data-title="My title" data-description="My description">
                        <img src="assets/img/gallery/1 (2).jpg" data-title="Another title" data-description="My <em>HTML</em> description">
                        <img src="assets/img/gallery/1 (3).jpg" data-title="My title" data-description="My description">
                        <img src="assets/img/gallery/1 (4).jpg" data-title="Another title" data-description="My <em>HTML</em> description">
                        <img src="assets/img/gallery/1 (5).jpg" data-title="My title" data-description="My description">
                        <img src="assets/img/gallery/1 (6).jpg" data-title="Another title" data-description="My <em>HTML</em> description">
                        <img src="assets/img/gallery/1 (7).jpg" data-title="My title" data-description="My description">
                        <img src="assets/img/gallery/1 (8).jpg" data-title="Another title" data-description="My <em>HTML</em> description">
                        <img src="assets/img/gallery/1 (9).jpg" data-title="My title" data-description="My description">
                        <img src="assets/img/gallery/1 (10).jpg" data-title="Another title" data-description="My <em>HTML</em> description">
                        <img src="assets/img/gallery/1 (11).jpg" data-title="My title" data-description="My description">
                        <img src="assets/img/gallery/1 (12).jpg" data-title="Another title" data-description="My <em>HTML</em> description">
                        <img src="assets/img/gallery/1 (13).jpg" data-title="My title" data-description="My description">
                        <img src="assets/img/gallery/1 (14).jpg" data-title="Another title" data-description="My <em>HTML</em> description">
                        <img src="assets/img/gallery/1 (15).jpg" data-title="My title" data-description="My description">
                        <img src="assets/img/gallery/1 (16).jpg" data-title="Another title" data-description="My <em>HTML</em> description">
                        <img src="assets/img/gallery/1 (17).jpg" data-title="My title" data-description="My description">
                        <img src="assets/img/gallery/1 (18).jpg" data-title="Another title" data-description="My <em>HTML</em> description">
                        <img src="assets/img/gallery/1 (19).jpg" data-title="My title" data-description="My description">
                        <img src="assets/img/gallery/1 (20).jpg" data-title="Another title" data-description="My <em>HTML</em> description">
                        <img src="assets/img/gallery/1 (21).jpg" data-title="My title" data-description="My description">
                        <img src="assets/img/gallery/1 (22).jpg" data-title="Another title" data-description="My <em>HTML</em> description">
                    </div>
                    <span style="color:White">_</span>
               </div>
           </div>
           <script type="text/javascript">
               Galleria.loadTheme('assets/scripts/galleria.classic.min.js');
               Galleria.run('#galleria');
           </script>
        </div>
</asp:Content>

