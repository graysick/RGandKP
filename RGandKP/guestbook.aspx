<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="guestbook.aspx.cs" Inherits="guestbook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript">
    $(document).ready(function () {
        $('#cancelBtn').click(function () {
            $("#inputName").val("");
            $("#textComment").val("");
        });
    });
</script>
<div id="header" style="color:White;padding-top:50px">
        <h2>
            <span class="fancytext" style="text-shadow: black 0.05em 0.05em 0.2em">Guestbook</span>
        </h2>
    </div>
<div class="container-body" style="width:1024px;">
    <div id="stuff" style="padding-left:20px;background-color:White;border-radius: 8px 8px 8px 8px;">
        <br />
            <div class="row">
                <div class="span5" style="margin-left:auto;margin-right:auto">
                    <form id="form1" runat="server" style="padding-left:50px">
                      <div class="control-group">
                        <label class="control-label" for="inputName"><i class="icon-user"></i>&nbsp;Name</label>
                        <div class="controls">
                            <asp:TextBox class="input-xlarge" type="text" ID="inputName" placeholder="Name" runat="server">&nbsp;</asp:TextBox><asp:Label ID="asterisk1" runat="server" style="padding-left:50px" ForeColor="Red"></asp:Label>
                        </div>
                      </div>
                      <div class="control-group">
                        <label class="control-label" for="textComment"><i class="icon-comment-alt"></i>&nbsp;Comment</label>
                        <div class="controls">
                            <asp:TextBox TextMode="multiline" class="input-xlarge" rows="3" id="textComment" placeholder="Enter your comment" runat="server" maxlength="200" /><asp:Label ID="asterisk2" runat="server" style="padding-left:50px" ForeColor="Red"></asp:Label>
                        </div>
                      </div>
                      <div class="control-group">
                        <div class="controls">
                          <asp:Button runat="server"  type="button" onclick="showMessage" text="Submit" class="btn btn-primary"></asp:Button>&nbsp;<asp:Button Text="Cancel" id="cancelBtn" runat="server" type="button" OnClientClick="return false" class="btn"></asp:Button>
                        </div>
                      </div>
                    </form>
                    <asp:Label ID="errorLabel" runat="server" style="padding-left:50px" ForeColor="Red"></asp:Label>
                </div>
                <div class="span5 pull-right">
                    <i style="font-size:200px;margin-left:50px" class="icon-comments-alt"></i>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="span4" style="padding-top:20px">
                    <i style="font-size:28px;color:#0099CC;vertical-align:top" class="icon-star-empty"></i>&nbsp;&nbsp;&nbsp;<span class="fancytext" style="font-size:36px">Guestbook Entries</span>
                </div>
            </div>
            <hr />
            <div id="commentZone">
                <asp:Label ID="comments" runat="server" Text=""></asp:Label>
            </div>
        <span class="clearfix" style="color:White">_</span>
    </div>
</div>
</asp:Content>

