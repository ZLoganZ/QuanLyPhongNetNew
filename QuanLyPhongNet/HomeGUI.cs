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
using QuanLyPhongNet.BUS;
using System.Threading;

namespace QuanLyPhongNet
{
    public partial class HomeGUI : Form
    {
        ServerManager serverManager;
        private NetRoomReader objReader;
        private NetRoomWriter objWriter;
        private TabControl tab;

        public HomeGUI()
        {
            InitializeComponent();
            if (serverManager == null)
            {
                serverManager = new ServerManager();
            }
            CheckForIllegalCrossThreadCalls = false;
            timerHome.Interval = 1000;
            timerHome.Enabled = true;
            timerHome.Start();
            objReader = new NetRoomReader();
            objWriter = new NetRoomWriter();
            tab = new TabControl();
        }
        public HomeGUI(bool check) : this()
        {
            picExit.Enabled = check;
            picExit.Visible = check;
            label37.Visible = check;
        }
        private void HomeGUILoadEventHandler(object sender, EventArgs e)
        {
            this.Location = new Point(0, 0);
            LoadSourceToDRGV();
        }

        private void LinkLabelLinkClickedEventHandler(object sender, LinkLabelLinkClickedEventArgs e)
        {
            serverManager.socketServer.Close();
            this.Close();
        }
        public void LoadClient()
        {

            drgvClient.DataSource = (from client in serverManager.arrClient select new { ComputerName = client.nameClient,State=client.stateClient,StartTime=client.startTime }).ToArray();
        }

        private void TimeHomeTickEventHandler(object sender, EventArgs e)
        {
            if (ServerManager.refreshClient != serverManager.arrClient.Count)
            {
               
                ServerManager.refreshClient = serverManager.arrClient.Count;
                LoadClient();
            }
            LoadClient();
        }

        private void LoadSourceToDRGV()
        {
            drgvFood.DataSource = objReader.GetAllFoods();
            drgvFood.Columns[0].HeaderText = "Mã Định Danh";
            drgvFood.Columns[1].HeaderText = "Tên Món Ăn";
            drgvFood.Columns[2].HeaderText = "Thuộc Loại";
            drgvFood.Columns[3].HeaderText = "Đơn Giá";
            drgvFood.Columns[4].HeaderText = "Đơn Vị Tính";
            drgvFood.Columns[5].HeaderText = "Số Lượng Tồn";
            drgvDrink.DataSource = objReader.GetAllDrinks();
            drgvDrink.Columns[0].HeaderText = "Mã Định Danh";
            drgvDrink.Columns[1].HeaderText = "Tên Món Ăn";
            drgvDrink.Columns[2].HeaderText = "Thuộc Loại";
            drgvDrink.Columns[3].HeaderText = "Đơn Giá";
            drgvDrink.Columns[4].HeaderText = "Đơn Vị Tính";
            drgvDrink.Columns[5].HeaderText = "Số Lượng Tồn";
            drgvCard.DataSource = objReader.GetAllCards();
            drgvCard.Columns[0].HeaderText = "Mã Định Danh";
            drgvCard.Columns[1].HeaderText = "Tên Món Ăn";
            drgvCard.Columns[2].HeaderText = "Thuộc Loại";
            drgvCard.Columns[3].HeaderText = "Đơn Giá";
            drgvCard.Columns[4].HeaderText = "Đơn Vị Tính";
            drgvCard.Columns[5].HeaderText = "Số Lượng Tồn";
            drgvMember.DataSource = objReader.GetAllMembers();
            drgvMember.Columns[0].HeaderText = "Tên Tài Khoản";
            drgvMember.Columns[1].HeaderText = "Mật Khẩu";
            drgvMember.Columns[2].HeaderText = "Thuộc Nhóm";
            drgvMember.Columns[3].HeaderText = "Thời Gian Hiện Có";
            drgvMember.Columns[4].HeaderText = "Số Tiền Hiện Có";
            drgvMember.Columns[5].HeaderText = "Trạng Thái";
            drgvStaff.DataSource = objReader.GetAllUsers();

            drgvClientGroup.DataSource = objReader.GetAllGroupClients();
            drgvClient.DataSource = objReader.GetAllClient();
            drgvUserGroup.DataSource = objReader.GetAllGroupUsers();
        }

        private void PicCalculateMoneyMouseHoverEventHandler(object sender, EventArgs e)
        {
            picCalculateMoney.BorderStyle = BorderStyle.Fixed3D;
        }

        private void PicCalculateMoneyMouseLeaveEventHandler(object sender, EventArgs e)
        {
            picCalculateMoney.BorderStyle = BorderStyle.None;
        }

        private void PicOpenClientMouseHoverEventHandler(object sender, EventArgs e)
        {
            picOpenClient.BorderStyle = BorderStyle.Fixed3D;
        }

        private void PicOpenClientMouseLeaveEventHandler(object sender, EventArgs e)
        {
            picOpenClient.BorderStyle = BorderStyle.None;
        }

        private void PicOpenClientEventHandler(object sender, EventArgs e)
        {
            if (drgvClient.SelectedRows.Count < 1)
            {
                MessageBox.Show("Chưa chọn máy để mở!");
                return;
            }
            int index = drgvClient.SelectedRows[0].Index;
            serverManager.UsingWithGuess(serverManager.arrClient[index].nameClient);
            serverManager.arrClient[index].stateClient = "USING";
            LoadClient();
        }

        private void PicCalculateMoneyEventhandler(object sender, EventArgs e)
        {
            try
            {
                int index = drgvClient.SelectedRows[0].Index;
                txtTotalPrice.Text = serverManager.TotalPrice(index).ToString();
                if (serverManager.arrClient[index].stateClient == "MEMBER USING")
                {
                    MessageBox.Show("Không thể tính tiền khách này!!");
                    return;
                }
                serverManager.arrClient[index].stateClient = "WAITING";
                serverManager.arrClient[index].startTime = new DateTime();
                LoadClient();
            }
            catch
            {
                MessageBox.Show("Chưa chọn máy để thanh toán");
            }
        }

         private void picOrder_MouseHover(object sender, EventArgs e)
        {
            picOrder.BorderStyle = BorderStyle.Fixed3D;
        }

        private void picOrder_MouseLeave(object sender, EventArgs e)
        {
            picOrder.BorderStyle = BorderStyle.None;
        }

        private void picOrderEventHandler(object sender, EventArgs e)
        {

            OrderServiceGUI frmOrder = new OrderServiceGUI();
            frmOrder.ShowDialog();
            LoadSourceToDRGV();
        }
		
		 private void drgvFood_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            OrderServiceGUI frmOrder = new OrderServiceGUI();
            frmOrder.ShowDialog();
            LoadSourceToDRGV();
        }
		
		private void drgvCard_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            OrderServiceGUI frmOrder = new OrderServiceGUI();
            frmOrder.ShowDialog();
            LoadSourceToDRGV();
        }
		
		private void picAddMember_Click(object sender, EventArgs e)
        {
            AddMemberGUI frmAddMember = new AddMemberGUI();
            frmAddMember.ShowDialog();
            LoadSourceToDRGV();

        }
		
		private void drgvMember_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            AddTimeMemberGUI frmAddTime = new AddTimeMemberGUI();
            frmAddTime.ShowDialog();
            LoadSourceToDRGV();
        }
		
		private void picUpdateMember_Click(object sender, EventArgs e)
        {
            AddTimeMemberGUI frmAddTime = new AddTimeMemberGUI();
            frmAddTime.ShowDialog();
            LoadSourceToDRGV();
        }
		
		private void picAddMember_MouseHover(object sender, EventArgs e)
        {
            picAddMember.BorderStyle = BorderStyle.Fixed3D;
        }

        private void picAddMember_MouseLeave(object sender, EventArgs e)
        {
            picAddMember.BorderStyle = BorderStyle.None;
        }

        private void picUpdateMember_MouseHover(object sender, EventArgs e)
        {
            picUpdateMember.BorderStyle = BorderStyle.Fixed3D;
        }

        private void picUpdateMember_MouseLeave(object sender, EventArgs e)
        {
            picUpdateMember.BorderStyle = BorderStyle.None;
        }

        private void picDeleteMember_MouseHover(object sender, EventArgs e)
        {
            picDeleteMember.BorderStyle = BorderStyle.Fixed3D;
        }

        private void picDeleteMember_MouseLeave(object sender, EventArgs e)
        {
            picDeleteMember.BorderStyle = BorderStyle.None;
        }

        private void PicLockClientClickEventHandler(object sender, EventArgs e)
        {
            try
            {
                int index = drgvClient.SelectedRows[0].Index;
                serverManager.LockClient(index);
                serverManager.arrClient[index].stateClient = "WAITING";
                serverManager.arrClient[index].startTime = new DateTime();
                LoadClient();
            }
            catch
            {
                MessageBox.Show("Chưa chọn máy để khoá!");
            }
        }

        private void drgvCard_CellDoubleClick_1(object sender, DataGridViewCellEventArgs e)
        {
            OrderServiceGUI frmOrder = new OrderServiceGUI();
            frmOrder.ShowDialog();
            LoadSourceToDRGV();
        }

        private void drgvDrink_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            OrderServiceGUI frmOrder = new OrderServiceGUI();
            frmOrder.ShowDialog();
            LoadSourceToDRGV();
        }

        private void picDeletememberEventHandler(object sender, EventArgs e)
        {
                DialogResult CheckYN;
                CheckYN = MessageBox.Show("Có chắc xóa không?", "Trả lời", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (CheckYN == DialogResult.Yes)
                {
                    int r = drgvMember.CurrentRow.Index;
                int id = int.Parse(drgvMember.Rows[r].Cells[0].Value.ToString());
                objWriter.DeleteMember(id);
                    MessageBox.Show("Đã xoá thành công!");
                    LoadSourceToDRGV();
                }
        }

        private void ExitEventHandler(object sender, EventArgs e)
        {
            serverManager.socketServer.Close();
            this.Close();
        }

        private void HomeGUI_FormClosed(object sender, FormClosedEventArgs e)
        {
            serverManager.socketServer.Close();
            this.Close();
        }
    }
}
