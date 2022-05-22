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
            txtGroupName.Enabled = false;
            textBox5.Enabled = false;
            //frmHome = new HomeGUI();
        }
        public OrderServiceGUI(string name,  float price, string unit, string group, int inventory) : this()
        {
            txtName.Text = name;
            txtPrice.Text = price.ToString();
            txtUnit.Text = unit;
            txtGroupName.Text = group;
            textBox5.Text = inventory.ToString();
        }

        private void OrderServiceGUILoadEventHandler(object sender, EventArgs e)
        {
            this.Location = new Point(400, 200);
            LoadSourceToAllControls();
        }
        
        private void LoadSourceToAllControls()
        {
            
        }

        private void CancelClickEventHandler(object sender, EventArgs e)
        {
            this.Close();
        }

        private void OKClickEventHandler(object sender, EventArgs e)
        {
            
            this.Close();
        }
    }
}
