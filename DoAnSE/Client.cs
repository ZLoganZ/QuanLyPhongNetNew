using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DoAnSE
{
    public partial class Client : Form
    {
        ClientManager clientManager;
        public Client()
        {
            InitializeComponent();
        }
        public Client(ClientManager x)
        {
            this.clientManager = x;
            InitializeComponent();
        }

        private void ClientFormClosingEventHandler(object sender, FormClosingEventArgs e)
        {
            e.Cancel = true;
        }

        private void ClientLoadEventHandler(object sender, EventArgs e)
        {
            this.TopMost = true;
            this.WindowState = FormWindowState.Maximized;
        }

        public void Clear()
        {
            txtPassword.Clear();
        }
        
        private void LoginClickEventHandler(object sender, EventArgs e)
        {
            string userName = txtUserName.Text.ToString();
            string passWord = txtPassword.Text.ToString();
            clientManager.Login(userName, passWord);
            if (clientManager.message.Equals("Acount not exist !! Or Wrong Username, Password"))
            {
                MessageBox.Show("Acount not exist !! Or Wrong Username, Password. Or Your Account is exhauted");
            }

        }
    }
}
