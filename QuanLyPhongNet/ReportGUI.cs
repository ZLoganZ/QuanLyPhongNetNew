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
    public partial class ReportGUI : Form
    {
        public ReportGUI()
        {
            InitializeComponent();
        }

        private void ExitClickEventHandler(object sender, EventArgs e)
        {
            OptionGUI frmOption = new OptionGUI();
            frmOption.ShowDialog();
            this.Close();
        }
    }
}
