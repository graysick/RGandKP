using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void showMessage(object sender, EventArgs e)
    {
        //if (textComment.Text == "" || textComment.Text == null || inputName.Text == "" || inputName.Text == null)
       // {
       //     errorLabel.Text = "Please fill all fields!";
            //asterisk1.Text = "*";
            //asterisk2.Text = "*";
       // }
       // else
       // {
            //String name = inputName.Text;
            //String comment = textComment.Text;
            String[] responses = { "Bass Quake!", "Who is screaming at me?", "Shut up Cindy...", "Do you like it?", "Whose grenades are NOT in the fire", "I JUST found this amazing spot", "Kerplowskis", "HAAGEN DAZS!", "Teddy Ruxpin", "Who has the EMP's?" };

          //  if (name.Contains("http://") || comment.Contains("http://") || name.Contains(";") || comment.Contains(";"))
          //  {
          //      Random random = new Random();
          //      int randomNumber = random.Next(0, 10);
               // errorLabel.Text = "** " + responses[randomNumber] + " **";
         //   }
        //    else
        //    {
        //       // inputName.Text = "";
               // textComment.Text = "";
                String date = DateTime.Now.ToString("MM/dd/yyyy");

                // set Access connection and select strings
                string conn = System.Configuration.ConfigurationManager.ConnectionStrings["godaddy"].ConnectionString;
            //    string strSQL = "INSERT INTO guestbook ( name,comment,date) VALUES ('" + name + " ',' " + comment + " ', '" + date + "')";

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
          //  }
        //}
    }
}
