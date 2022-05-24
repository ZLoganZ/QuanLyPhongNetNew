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
        bool check = false;
        DTO.Member mem;
        public AddTimeMemberGUI()
        {
            InitializeComponent();
            objWriter = new NetRoomWriter();
            objreader = new NetRoomReader();
        }

        public AddTimeMemberGUI(string name, float money) : this()
        {
            txtName.Text = name;
            txtName.Enabled = false;
            textBox5.Text = money.ToString();
            check = true;
            List<DTO.Member> list = objreader.GetAllMembers();
            foreach (var member in list)
            {
                if (member.AccountName == txtName.Text)
                {
                    check = true;
                    textBox5.Text = member.CurrentMoney.ToString();
                    mem = member;
                    return;
                }
            }
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
        float basaumuoi = 3600;
        private void OKClickEventHandler(object sender, EventArgs e)
        {
            if (txtName.Equals(""))
            {
                MessageBox.Show("Chưa nhập tài khoản!");
                txtName.Select();
                return;
            }
            List<DTO.Member> list = objreader.GetAllMembers();
            foreach (var member in list)
            {
                if (member.AccountName == txtName.Text && check == false)
                {
                    check = true;
                    textBox5.Text = member.CurrentMoney.ToString();
                    mem = member;
                    return;
                }
            }
            if(!check)
            {
                MessageBox.Show("Tài khoản không tồn tại!");
                txtName.Select();
                return;
            }
            //MessageBox.Show((TimeSpan.Parse((TimeSpan.FromSeconds((float.Parse(txtAddMoney.Text) * (basaumuoi / 10000))) + m.TimeInAccount).ToString()).ToString()));
            objWriter.UpdateMember(mem.MemberID, mem.AccountName, mem.Password, mem.GroupUserName, TimeSpan.Parse((TimeSpan.FromSeconds((float.Parse(txtAddMoney.Text) * (basaumuoi / 10000))) + mem.TimeInAccount).ToString()), mem.CurrentMoney + float.Parse(txtAddMoney.Text), "Cho Phép");
            MessageBox.Show("Thêm thành công!");
            //HomeGUI frmHome = new HomeGUI();
            this.Close();
            //frmHome.ShowDialog();
        }
    }
}
