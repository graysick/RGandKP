<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="hotel.aspx.cs" Inherits="Account_hotel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div id="header" style="color:White;padding-top:52px">
        <h2>
            <span class="fancytext" style="text-shadow: black 0.05em 0.05em 0.2em">Lodging Information</span>
        </h2>
    </div>
<div class="container-body" style="width:1024px;">
    <div id="stuff" style="padding-left:20px;background-color:White;border-radius: 8px 8px 8px 8px;">
        <br />
        <div class="row" style="padding-right:20px">
                <div class="span4">
                    <h4>
                        <i class="icon-star-empty" style="font-size:24px;color:#0099CC"></i>&nbsp;<span class="fancytext" style="font-size:24px"> Hotel Information</span>
                    </h4><hr />
                    <div style="padding-left:35px;font-size:16px">
                        <strong>Hampton Inn</strong><br />
                        3934 Grandview Dr<br />
                        Simpsonville, SC<br />
                        <i class="icon-phone"></i> <i>(864) 963-9292</i>
                        <br /><br />
                        <a class="btn btn-primary" href="http://hamptoninn.hilton.com/en/hp/groups/personalized/G/GSPSMHX-PGW-20130808/index.jhtml">Reserve Now</a>
                    </div>
                    <br />
                    <i class="icon-building center-text" style="font-size:250px;padding-left:80px"></i>
                </div>
            <div class="span6">
                <div id="map" style="width:580px; height:500px; position: relative; background-color: rgb(229, 227, 223); overflow: hidden; -webkit-transform: translateZ(0);"></div>
                    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script> 
                    <script type="text/javascript" src="assets/scripts/jquery.gomap-1.3.2.min.js"></script> 
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $("#map").goMap({
                                markers: [{
                                    latitude: 34.725918,
                                    longitude: -82.256355,
                                    icon: 'assets/img/blank.png'
                                }, {
                                    latitude: 34.736023,
                                    longitude: -82.258523,
                                    icon: 'assets/img/chapel.png'
                                }, {
                                    latitude: 34.714969,
                                    longitude: -82.251621,
                                    icon: 'assets/img/hotel.png'
                                }],
                                zoom: 14
                            });
                        });
                    </script>
                </div>
            </div>
        <br />
        <center><span class="fancytext">*** Please be sure to get a room by July 9, 2013 at 5:00pm to qualify for the discount rate ***</span></center>
        <span style="color:White">http://hamptoninn3.hilton.com/en/hotels/south-carolina/hampton-inn-greenville-simpsonville-GSPSMHX/index.html</span>
    </div>
</div>
</asp:Content>

