using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;
using System.Text;

public partial class music_request : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        StringBuilder htmlString = new StringBuilder();
        htmlString.Append("");

        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["godaddy"].ConnectionString;
        string strSQL = "SELECT name, date, comment, id FROM guestbook ORDER BY id DESC;";

     /*   SqlConnection myConnection = new SqlConnection(conn);

        SqlCommand command = new SqlCommand(strSQL, myConnection);

        try
        {
            myConnection.Open();
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                string name = reader[0].ToString();
                string date = reader[1].ToString();
                string comment = reader[2].ToString();
                htmlString.Append(commentBuilder(name, date, comment) + "<hr />");
            }
            reader.Close();
            comments.Text = htmlString.ToString();
        }
        catch (Exception ex)
        {
            errorLabel.Text += ex.Message;
        }*/
    }
    protected void showMessage(object sender, EventArgs e)
    {
        //if (txtArtist.ToString() == "" || txtArtist.ToString() == null || txtSongName.ToString() == "" || txtSongName.ToString() == null)// || txtYoutube.ToString().Contains("youtube"))
        //{
            errorLabel.Text = "Please fill all fields!";
            //asterisk1.Text = "*";
            //asterisk2.Text = "*";
       // }
      //  else
      //  {
       //     String name = txtSongName.ToString();
        //    String comment = txtArtist.ToString();
            String[] responses = { "Bass Quake!", "Who is screaming at me?", "Shut up Cindy...", "Do you like it?", "Whose grenades are NOT in the fire", "I JUST found this amazing spot", "Kerplowskis", "HAAGEN DAZS!", "Teddy Ruxpin", "Who has the EMP's?" };

   //         if (name.Contains("http://") || comment.Contains("http://") || name.Contains(";") || comment.Contains(";"))
    //        {
                Random random = new Random();
                int randomNumber = random.Next(0, 10);
                //errorLabel.Text = "** " + responses[randomNumber] + " **";
      //      }
     //       else
      //      {
               // txtSongName.ToString() = "";
                //txtArtist.ToString() = "";
                String date = DateTime.Now.ToString("MM/dd/yyyy");

                // set Access connection and select strings
                string conn = System.Configuration.ConfigurationManager.ConnectionStrings["godaddy"].ConnectionString;
       //         string strSQL = "INSERT INTO guestbook ( name,comment,date) VALUES ('" + name + " ',' " + comment + " ', '" + date + "')";

              ///  SqlConnection myConn = new SqlConnection(conn);

               //// SqlCommand command = new SqlCommand(strSQL, myConn);

                //Create ole Db Command And call ExecuteNonQuery to execute
                // a SQL statement
            ///    try
            ///    {
            ///        myConn.Open();
            ///        command.ExecuteNonQuery();
            ///    }
            /*    catch (Exception exp)
                {
                    //errorLabel.Text += exp.Message;
                }
                myConn.Close();
                Response.Redirect("http://www.rgandkp.com/guestbook.aspx");*/
            //}
        //}
    }
    protected StringBuilder commentBuilder(string name, string date, string comment)
    {
        StringBuilder htmlString = new StringBuilder();

        htmlString.Append(" <div class='row' style='height:75px'>");
        htmlString.Append("     <div class='span1'>");
        htmlString.Append("         <i style='font-size:72px' class='icon-quote-right'></i>");
        htmlString.Append("     </div>");
        htmlString.Append("     <div class='span9'>");
        htmlString.Append("         <div class='commentComment'>");
        htmlString.Append(comment);
        htmlString.Append("         </div>");
        htmlString.Append("         <div class='commentNameDate' style='color:#0099CC'>");
        htmlString.Append(name + " &middot; " + date);
        htmlString.Append("         </div>");
        htmlString.Append("     </div>");
        htmlString.Append(" </div>");

        return htmlString;
    }
}