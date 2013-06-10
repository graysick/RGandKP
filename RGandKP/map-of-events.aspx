<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="map-of-events.aspx.cs" Inherits="assets_img_map_of_events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="header" style="color:White;padding-top:70px">
        <h2>
            <span class="fancytext" style="text-shadow: black 0.05em 0.05em 0.2em">Map of Events</span>
        </h2>
    </div>
    <div class="container-body" style="width:1024px;">
        <div id="stuff" style="padding-left:20px;padding-top:20px;background-color:White;border-radius: 8px 8px 8px 8px;">
                <div id="ma" style="padding-top:20px;height:400px;width:984px;">
                    <script type="text/javascript">
                    /*    $(document).ready(function () {
                            $("#map").goMap({
                                markers: [{
                                    latitude: 34.736023,
                                    longitude: -82.258523,
                                    title: 'The Wedding/Reception\nThe Loom',
                                    icon: 'assets/img/chapel.png'
                                }, {
                                    latitude: 34.718343,
                                    longitude: -82.258115,
                                    title: 'The Hotel\nThe Holiday Inn',
                                    icon: 'assets/img/hotel.png'
                                }],
                                latitude: 34.730697,
                                longitude: -82.258115,
                                zoom: 13
                            });
                        }); */
	                </script>
                </div>
                <br />
             <br />
             <span style="color:White">_</span>
        </div>
    </div>
</asp:Content>

