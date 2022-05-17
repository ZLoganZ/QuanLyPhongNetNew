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
        public AddTimeMemberGUI()
        {
            InitializeComponent();
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

        private void OKClickEventHandler(object sender, EventArgs e)
        {
            //HomeGUI frmHome = new HomeGUI();
            this.Close();
            //frmHome.ShowDialog();
        }
    }
}
