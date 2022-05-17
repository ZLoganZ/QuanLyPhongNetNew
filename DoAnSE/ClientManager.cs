using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace DoAnSE
{
   public delegate void setInfo(string userName,string timeBalance);
   public class ClientManager
    {
       IPEndPoint iP;
       public Socket client;
       int portCode = 9999;
       const int maxGetByte = 1024 * 4000;
       public static int refreshClient = -1;
       public const int change = -1;
       const int request = 0;
       public static int requestServer = -1;
       const int USECLIENT = 101;
       public const int MEMBERLOGIN = 102;
       public const int PAYMENT = 103;
       public Client lockScreen;
       public string userName = "";
       public string message = "";
       public TimeSpan totalTime;

       public ClientManager()
       {
           iP = new IPEndPoint(IPAddress.Parse("127.0.0.1"), portCode);
           client = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.IP);
           try
           {
               client.Connect(iP);
               client.Send(ConvertToByte("ConnectWithMePls!!|" + "May-1"));
           }
           catch
           {
                System.Windows.Forms.MessageBox.Show("Deo ket noi duoc!!");
           }
          
           Thread listenSever = new Thread(ReceiveDataFromSever);
           listenSever.IsBackground = true;
           listenSever.Start();
           lockScreen = new Client(this);
           lockScreen.Show();
       }
       
       public void Login(string userName, string passWord)
       {
           client.Send(ConvertToByte("AllowToLogInPls!!|" + userName + "|" + passWord+"|"));
       }

       public void LogoutMember(string userName,TimeSpan remainTime)
       {
           client.Send(ConvertToByte("LogOutPls!!|"+userName+"|"+remainTime.ToString()+"|"));
       }

       public void ReceiveDataFromSever()
       {
           
           try
           {
               while (true)
               {
                   byte[] messageFromClient = new byte[maxGetByte];
                   client.Receive(messageFromClient);
                   string message = CovertToMessage(messageFromClient).ToString();
                   List<string> lstMessage = message.Split('|').ToList();
                   message = "";
                   if (lstMessage[request].Equals("UseClient"))
                   {
                       userName = "Customer";
                       requestServer = USECLIENT;
                       lockScreen.Visible = false;
                   }
                   if (lstMessage[request].Equals("PAYMENT"))
                   {
                       lockScreen.Visible = true;
                       requestServer = PAYMENT;
                   }
                   if (lstMessage[request].Equals("LockClient!"))
                   {
                       lockScreen.Visible = true;
                   }
                   if (lstMessage[request].Equals("OkePlayGo"))
                   {
                       userName = lstMessage[1];
                       totalTime = TimeSpan.Parse(lstMessage[2]);
                       requestServer = MEMBERLOGIN;
                       lockScreen.Visible = false;
                       message = "";
                   }
                   if (lstMessage[request].Equals("Acount not exist !! Or Wrong Username, Password"))
                   {
                       lockScreen.Visible = true;
                       message = "Acount not exist !! Or Wrong Username, Password";
                   }
                   if (lstMessage[request].Equals("Your account is exhausted.Recharge to use it!!!"))
                   {
                       lockScreen.Visible = true;
                       message = "Your account is exhausted.Recharge to use it!!!";
                   }
                }      
            }
           catch
           {

           }
       }

       byte[] ConvertToByte(object obj)
       {
           MemoryStream memoryStream = new MemoryStream();
           BinaryFormatter binaryFormatter = new BinaryFormatter();
           binaryFormatter.Serialize(memoryStream, obj);
           return memoryStream.ToArray();
       }
       object CovertToMessage(byte[] messege)
       {
           MemoryStream memoryStream = new MemoryStream(messege);
           BinaryFormatter binaryFormatter = new BinaryFormatter();
           return binaryFormatter.Deserialize(memoryStream);
       }
    }
}
