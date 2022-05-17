using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QuanLyPhongNet.DTO;


namespace QuanLyPhongNet
{
    public partial class LoginGUI : Form
    {
        public LoginGUI()
        {
            InitializeComponent();
        }

        private void LoginEventHandler(object sender, EventArgs e)
        {
            if (cboUser.Text.Equals("") || cboUser.Text.Equals("--Lựa Chọn--"))
            {
                MessageBox.Show("Chưa chọn loại tài khoản! Vui lòng chọn!");
                cboUser.Select();
            }
            else if (txtPassword.Text.Equals(""))
            {
                MessageBox.Show("Chưa nhập mật khẩu! Vui lòng nhập vào");
                txtPassword.Select();
            }
            else
            {
                if (cboUser.Text.Equals("Staff") &&txtPassword.Text.Equals("123456"))
                {
                    HomeGUI frmHome = new HomeGUI();
                    this.Hide();
                    frmHome.ShowDialog();
                }
                else if (cboUser.Text.Equals("Manager") && txtPassword.Text.Equals("123456"))
                {
                    OptionGUI frmOption = new OptionGUI();
                    this.Hide();
                    frmOption.ShowDialog();
                }
                else
                {
                    MessageBox.Show("Tài khoản hoặc mật khẩu không đúng","Thông báo",MessageBoxButtons.OK,MessageBoxIcon.Error);
                }
            }


        }

        private void LoginGUILoadEventHandler(object sender, EventArgs e)
        {
            this.Location = new Point(100, 200);
            Account managerAccount = new Account("Manager", "123456");
            Account staffAccount = new Account("Staff", "123456");
        }
    }
}
