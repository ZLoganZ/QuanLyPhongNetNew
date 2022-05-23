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
    public partial class OptionGUI : Form
    {
        public OptionGUI()
        {
            InitializeComponent();
        }

        private void SignOutLinkClickedEventHandler(object sender, LinkLabelLinkClickedEventArgs e)
        {
            this.Close();
        }

        private void PicHomeClickEventHandler(object sender, EventArgs e)
        {
            HomeGUI frmHome = new HomeGUI(true);
            this.Hide();
            frmHome.ShowDialog();
            this.Show();
        }
        private void PicCategoryClickEventHandler(object sender, EventArgs e)
        {
            CategoryManageGUI frmCategory = new CategoryManageGUI();
            this.Hide();
            frmCategory.ShowDialog();
            this.Show();
        }

        private void PicReportClickEventHandler(object sender, EventArgs e)
        {
            ReportGUI frmReport = new ReportGUI();
            this.Hide();
            frmReport.ShowDialog();
            this.Show();
        }

        private void PicHomeMouseHoverEventHandler(object sender, EventArgs e)
        {
            picHome.BorderStyle = BorderStyle.Fixed3D;
        }

        private void PicHomeMouseLeaveEventHandler(object sender, EventArgs e)
        {
            picHome.BorderStyle = BorderStyle.None;
        }

        private void PicCategoryMouseHoverEventHandler(object sender, EventArgs e)
        {
            picCategory.BorderStyle = BorderStyle.Fixed3D;
        }

        private void PicCategoryMouseLeaveEventHandler(object sender, EventArgs e)
        {
            picCategory.BorderStyle = BorderStyle.None;
        }

        private void PicReportMouseHoverEventHandler(object sender, EventArgs e)
        {
            picReport.BorderStyle = BorderStyle.Fixed3D;
        }

        private void PicReportMouseLeaveEventHandler(object sender, EventArgs e)
        {
            picReport.BorderStyle = BorderStyle.None;
        }

        private void OptionGUILoadEventHandler(object sender, EventArgs e)
        {
            this.Location = new Point(50, 50);
        }

        private void OptionGUI_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
    }
}
