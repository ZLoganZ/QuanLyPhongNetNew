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
    public partial class OrderServiceGUI : Form
    {

        //private HomeGUI frmHome;
        public OrderServiceGUI()
        {
            InitializeComponent();
            //frmHome = new HomeGUI();
        }    

        private void OrderServiceGUILoadEventHandler(object sender, EventArgs e)
        {
            this.Location = new Point(400, 200);
            LoadSourceToAllControls();
        }
        
        private void LoadSourceToAllControls()
        {
            //txtName.Text = frmHome.serviceName;
        }

        private void CancelClickEventHandler(object sender, EventArgs e)
        {
            HomeGUI frmHome = new HomeGUI();
            this.Close();
            frmHome.ShowDialog();
        }

        private void OKClickEventHandler(object sender, EventArgs e)
        {
            HomeGUI frmHome = new HomeGUI();
            this.Close();
            frmHome.ShowDialog();
        }
    }
}
