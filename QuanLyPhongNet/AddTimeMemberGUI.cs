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
    public partial class AddTimeMemberGUI : Form
    {
        private NetRoomWriter objWriter;
        private NetRoomReader objreader;
        public AddTimeMemberGUI()
        {
            InitializeComponent();
            objWriter = new NetRoomWriter();
            objreader = new NetRoomReader();
        }

        private void AddTimeMemberGUILoadEventHandler(object sender, EventArgs e)
        {
            this.Location = new Point(400, 200);
        }

        private void CancelClickEventHandler(object sender, EventArgs e)
        {
            //HomeGUI frmHome = new HomeGUI();
            this.Close();
            //frmHome.ShowDialog();
        }
        bool check = false;
        float basaumuoi = 3600;
        DTO.Member m;
        private void OKClickEventHandler(object sender, EventArgs e)
        {
            if (txtName.Equals(""))
            {
                MessageBox.Show("Chưa nhập tài khoản!");
                txtName.Select();
                return;
            }
            List<DTO.Member> list = objreader.GetAllMembers();
            foreach(var member in list)
            {
                if (member.AccountName == txtName.Text && check == false)
                {
                    check = true;
                    textBox5.Text = member.CurrentMoney.ToString();
                    m = member;
                    return;
                }
            }
            if(check == false)
            {
                MessageBox.Show("Tài khoản không tồn tại!");
                txtName.Select();
                return;
            }
            objWriter.UpdateMember(m.MemberID, m.AccountName, m.Password, m.GroupUserName, m.TimeInAccount + TimeSpan.FromSeconds((float.Parse(txtAddMoney.Text) * (basaumuoi / 10000))), m.CurrentMoney + float.Parse(txtAddMoney.Text), "Cho Phép");
            MessageBox.Show("Thêm thành công!");
            //HomeGUI frmHome = new HomeGUI();
            this.Close();
            //frmHome.ShowDialog();
        }
    }
}
