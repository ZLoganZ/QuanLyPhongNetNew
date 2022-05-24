using QuanLyPhongNet.BUS;
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
        private NetRoomWriter objWriter;
        private NetRoomReader objReader;
        public AddMemberGUI()
        {
            InitializeComponent();
            objWriter = new NetRoomWriter();
            objReader = new NetRoomReader();
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
        float basaumuoi = 3600;
        private void OKClickEventHandler(object sender, EventArgs e)
        {
            if (txtName.Equals(""))
            {
                MessageBox.Show("Chưa nhập tài khoản!");
                txtName.Focus();
                return;
            }
            else if (txtPass.Equals(""))
            {
                MessageBox.Show("Chưa nhập mật khẩu!");
                txtPass.Focus();
                return;
            }
            foreach (DTO.Member member in objReader.GetAllMembers())
            {
                if (member.AccountName.Equals(txtName.Text))
                {
                    MessageBox.Show("Tài khoản đã tồn tại!");
                    txtName.Focus();
                    return;
                }
            }
            if (grbTimeManager.Enabled == false)
            {
                grbTimeManager.Enabled = true;
                btnOK.Text = "Cập Nhập";
                txtAddMoney.Focus();
                return;
            }
            if (txtAddMoney.Text == "" || txtAddMoney.Text == "0")
            {
                MessageBox.Show("Chưa nhập số tiền cần cộng!");
                txtAddMoney.Focus();
                return;
            }
            else
            {
                float money = float.Parse(txtAddMoney.Text);
                if (money < 2000)
                {
                    MessageBox.Show("Số tiền cần cộng phải lớn hơn 2000VND!");
                    txtAddMoney.Focus();
                    return;
                }
                else if(money % 1000 != 0)
                {
                    MessageBox.Show("Số tiền cần cộng phải chia hết cho 1000!");
                    txtAddMoney.Focus();
                    return;
                }
                else
                {
                    float money1 = money / basaumuoi;
                    objWriter.InsertMember(txtName.Text, txtPass.Text, "Hội viên", TimeSpan.Parse(TimeSpan.FromSeconds((float.Parse(txtAddMoney.Text) * (basaumuoi / 10000))).ToString()), float.Parse(txtAddMoney.Text), "Cho phép");
                    MessageBox.Show("Thêm thành công!");
                    txtName.Text = "";
                    txtPass.Text = "";
                    txtAddMoney.Text = "";
                    grbTimeManager.Enabled = false;
                    btnOK.Text = "OK";
                }
            }
            //HomeGUI frmHome = new HomeGUI();
            this.Close();
            //frmHome.ShowDialog();
        }
    }
}
