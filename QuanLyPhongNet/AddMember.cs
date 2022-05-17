using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyPhongNet
{
    public partial class AddMemberGUI : Form
    {
        public AddMemberGUI()
        {
            InitializeComponent();
        }

        private void AddMemberGUILoadEventHandler(object sender, EventArgs e)
        {
            this.Location = new Point(400, 200);
        }

        private void CancelClickEventHandler(object sender, EventArgs e)
        {
            //HomeGUI frmHome = new HomeGUI();
            this.Close();
            //frmHome.ShowDialog();
        }

        private void OKClickEventHandler(object sender, EventArgs e)
        {
            if (txtName.Equals(""))
            {
                MessageBox.Show("Chưa nhập tài khoản!");
                txtName.Select();
            }
            else if (txtPass.Equals(""))
            {
                MessageBox.Show("Chưa nhập mật khẩu!");
                txtPass.Select();
            }
            else
            {
                grbTimeManager.Enabled = true;
                btnOK.Text = "Cập Nhập";
                txtAddMoney.Select();
                
            }
            //HomeGUI frmHome = new HomeGUI();
            this.Close();
            //frmHome.ShowDialog();
        }
    }
}
