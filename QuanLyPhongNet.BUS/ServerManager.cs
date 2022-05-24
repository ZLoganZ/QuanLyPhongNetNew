using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;
using QuanLyPhongNet.DTO;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Threading;
using QuanLyPhongNet.BUS;

namespace QuanLyPhongNet.BUS
{
   public class ServerManager
    {
       IPEndPoint iP;
       public Socket socketServer;
       public List<InfoClient> arrClient;
       const int portCode = 9999;
       const int maxGetByte = 1024 * 5000;
       public static int refreshClient = -1;
       public const int change = -1;
       const int request = 0;
       const string wait = "WAITING";
       const string USING = "USING";
       public TimeSpan totalTime;

       public ServerManager()
       {
           arrClient = new List<InfoClient>();
           iP = new IPEndPoint(IPAddress.Parse("127.0.0.1"), portCode);
           socketServer = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.IP);
           socketServer.Bind(iP);
           Thread OkeFine = new Thread(StartAceptClient);
           OkeFine.IsBackground = true;
           OkeFine.Start();
       }
       public void StartAceptClient()
       {
           try
           {
               while (true)
               {
                   socketServer.Listen(100);
                   Socket newClient = socketServer.Accept();
                   Thread listenClient = new Thread(ReceiveDataFromClient);
                   listenClient.IsBackground = true;
                   listenClient.Start(newClient);
               }

           }
           catch
           {

           }
       }
       public void ReceiveDataFromClient(object obj)
       {
           Socket currentClient = obj as Socket;
           try
           {
               while (true)
               {
                   byte[] messegeFromClient = new byte[1024*5000];
                   currentClient.Receive(messegeFromClient);
                   string messege = (string)CovertToMessege(messegeFromClient);
                   List<string> lstMessege = messege.Split('|').ToList();
                   if (lstMessege[request].Equals("ConnectWithMePls!!"))
                   {
                       arrClient.Add(
                       new InfoClient()
                       {
                           stateClient = wait,
                           client = currentClient,
                           nameClient = lstMessege[1],
                           nameRoom = lstMessege[2]
                       });
                       refreshClient = change;
                   }
                   if (lstMessege[request].Equals("AllowToLogInPls!!"))
                   {
                       if (CheckLogin(lstMessege[1],lstMessege[2]))
                       {
                           currentClient.Send(ConvertToByte("OkePlayGo|"+lstMessege[1]+"|"+totalTime+"|"));
                           ChangeStateClient(currentClient, "MEMBER USING", lstMessege[1]);
                       }
                       else 
                       {
                           currentClient.Send(ConvertToByte("Acount not exist !! Or Wrong Username, Password"));
                           ChangeStateClient(currentClient, "WAITING", lstMessege[1]);
                       }

                   }
                   if (lstMessege[request].Equals("LogOutPls!!"))
                   {
                        UpdateRemainTime(lstMessege[1], TimeSpan.Parse(lstMessege[2]));
                        if (lstMessege[1] == "")
                            ChangeStateClient(currentClient, "WAIT FOR PAYMENT", lstMessege[2]);
                        else
                            ChangeStateClient(currentClient, "WAITING", "");
                   }
                   if(!currentClient.Connected)
                   {
                        ChangeStateClient(currentClient, "DISCONNECTED", "");
                   }
               }
               
           }
           catch
           {

           }

       }
       public void UpdateRemainTime(string userName,TimeSpan remainTime)
       {
           //userName = userName.ToUpper();
           List<Member> lstMember = new NetRoomReader().GetAllMembers();
           
           foreach (Member m in lstMember)
           {
               //m.AccountName = m.AccountName.ToUpper();
               if (m.AccountName.Equals(userName))
               {
                   float money = ChangeUseTimeToMinutes(remainTime.ToString()) * 10000 / 60;
                   new NetRoomWriter().UpdateMember(m.MemberID, m.AccountName, m.Password, m.GroupUserName, remainTime, money, m.Status);
               }
           }
       }

       private bool CheckLogin(string userName,string pass)
       {
           //userName = userName.ToUpper();
           List<Member> lstMember = new NetRoomReader().GetAllMembers();
           foreach(Member m in lstMember)
           {
               //m.AccountName = m.AccountName.ToUpper();
               if (m.AccountName.Equals(userName) && m.Password.Equals(pass))
               {
                   if (ChangeUseTimeToMinutes(m.TimeInAccount.ToString()) > 0)
                   {
                       totalTime = m.TimeInAccount;
                       return true;
                   }
                   else
                   {
                       return false;
                   }
               }
           }
           return false;
       }


       private int ChangeUseTimeToMinutes(String useTime)
       {
           int minutes = 0;
           string[] arrListStr = useTime.Split(':');
           if (int.Parse(arrListStr[1]) > 0)
           {
               minutes = minutes + int.Parse(arrListStr[1]);
           }
           if (int.Parse(arrListStr[0]) > 0)
           {
               minutes = minutes + int.Parse(arrListStr[0]) * 60;
           }
           return minutes;
       }
       public float TotalPrice(int index)
       {
           InfoClient client = arrClient[index];
           if (client.stateClient=="MEMBER USING")
           {
               return 0;
           }
           TimeSpan time = DateTime.Now.Subtract(client.startTime);
           client.stateClient = "WAITING";
           client.client.Send(ConvertToByte("PAYMENT"));
           float total = 0;
           string useTime = time.ToString();
           float priceperminutes = 100;
           int minutes = ChangeUseTimeToMinutes(useTime);
           if (minutes == 0 || minutes < 20)
               return 2000;
           total = total + minutes * priceperminutes;
           return total;
       }
       public void LockClient(int index)
       {
           InfoClient client = arrClient[index];
           client.stateClient = "WAITING";
           client.client.Send(ConvertToByte("LockClient!"));
       }


       public void ChangeStateClient(Socket client,string state,string userName)
       {
           foreach(InfoClient cli in arrClient)
           {
               if(cli.client==client)
               {
                   cli.stateClient = state;
                   cli.nameCustomer = userName;
               }
           }
       }
      byte[] ConvertToByte(object obj)
       {
           MemoryStream memoryStream = new MemoryStream();
           BinaryFormatter binaryFormatter = new BinaryFormatter();
           binaryFormatter.Serialize(memoryStream,obj);
           return memoryStream.ToArray();
       }
       object CovertToMessege(byte[] messege)
       {
          MemoryStream memoryStream = new MemoryStream(messege);
          BinaryFormatter binaryFormatter = new BinaryFormatter();
          return  binaryFormatter.Deserialize(memoryStream);      
       }
      
       public InfoClient GetInfoClient(string nameClient,string contraint)
       {
           foreach (InfoClient infoClient in arrClient)
           {
               if (infoClient.nameClient.Equals(nameClient) && infoClient.stateClient.Equals(contraint))
               {
                   return infoClient;
               }

           }
           return null;
       }
       
       public bool UsingWithGuess(string nameClient)
       {
           InfoClient currentClient = GetInfoClient(nameClient,wait);
           if (currentClient == null)
               return false;
           try
           {
               currentClient.client.Send(ConvertToByte("UseClient"));
               currentClient.stateClient = USING;
               currentClient.startTime = DateTime.Now;
               return true;
           }
           catch
           {
               return false;
           }
       }

       public bool PaymentNetFee(string nameClient)
       {
           InfoClient currentClient = GetInfoClient(nameClient, USING);
           if (currentClient == null)
               return false;
           try
           {
               currentClient.client.Send(ConvertToByte("Payment"));
               currentClient.stateClient = wait;
               currentClient.startTime = new DateTime();
               return true;
           }
           catch
           {
               return false;
           }
       }
    }
}
