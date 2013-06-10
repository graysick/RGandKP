<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="music-request.aspx.cs" Inherits="music_request" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<script type="text/javascript">
    
</script>
<div id="header" style="color:White;padding-top:70px">
        <h2>
            <span class="fancytext" style="text-shadow: black 0.05em 0.05em 0.2em">Music Requests</span>
        </h2>
    </div>
<div class="container-body" style="width:1024px;">
    <div id="stuff" style="padding-left:20px;background-color:White;border-radius: 8px 8px 8px 8px;width:auto;">
        <br />
            <div class="span5 pull-right">
                <i style="font-size:70px;color:white;margin-left:150px" class="icon-music"></i><i style="font-size:70px;margin-left:150px" class="icon-music"></i>
            </div>
            <div class="row">
                <div class="span4" style="padding-top:20px">
                    <i style="font-size:28px;color:#0099CC;vertical-align:top" class="icon-star-empty"></i>&nbsp;&nbsp;&nbsp;<span class="fancytext" style="font-size:36px">Vote for Songs</span>
                </div>
            </div>
            <hr />
            <div id="commentZone">
                <asp:Label ID="comments" runat="server" Text=""></asp:Label>
            </div>
        <span class="clearfix" style="color:White">_</span>
    </div>
</div>
<div id="myModal2" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModal2Label" aria-hidden="true">
              <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="myModalLabel">Request a Song</h3>
              </div>
              <div class="modal-body" style="margin-left:auto;margin-right:auto;width:515px">
                <form id="Form1" runat="server" style="margin-left:auto;margin-right:auto">
                    Please request a song to be played during the reception.  You can also vote for other songs once you've submitted your request!<br /><br />
                    <div style="margin-left:auto;margin-right:auto;text-align:center">
                        First Name:&nbsp;&nbsp;<input class="input-large" type="text" id="txtFirstName" placeholder="First Name" /><br />
                        &nbsp;Last Name:&nbsp;&nbsp;<input class="input-large" type="text" id="txtLastName" placeholder="Last Name" /><hr style="width:505px" />
                        &nbsp;Song Name:&nbsp;&nbsp;<input class="input-large" type="text" id="txtSongName" placeholder="Song Name" /><br />
                        <span style="padding-left:42px">Artist:</span>&nbsp;&nbsp;<input class="input-large" type="text" id="txtArtist" placeholder="Artist" /><br />
                        Link to Song:&nbsp;&nbsp;<input class="input-large" type="text" id="txtYoutube" placeholder="Link to Song (Youtube)" /><br />
                    </div>
                    <asp:Label runat="server" ID="errorLabel" style="color:Red"></asp:Label>
              </div>
              <div class="modal-footer">
                    <button ID="Button2" onclick="showMessage" class="btn btn-primary" disabled="disabled">Add Song</button>&nbsp;
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
              </div>
              </form>
        </div>
<script type="text/javascript">
    $("#myModal2").modal('show');
    $("#txtYoutube").keydown(function () {
        var song = $("#txtSongName").val();
        var artist = $("#txtArtist").val();
        var youtube = $("#txtYoutube").val();
        var test = youtube.indexOf("youtube");
        if (song == "" || artist == "" || song == null || artist == null) {
            
        }
        else {
            if (test !== -1) {
                $("#Button2").prop("disabled",false);
            }
        }
    });
</script>
</asp:Content>

