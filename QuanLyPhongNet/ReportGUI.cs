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
            this.Close();
        }

        private void ReportGUI_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }

        private void ReportGUI_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dsBill.AfterPayClient' table. You can move, or remove it, as needed.
            this.AfterPayClientTableAdapter.Fill(this.dsBill.AfterPayClient);
            // TODO: This line of code loads data into the 'dsMember.MemberInformation' table. You can move, or remove it, as needed.
            this.MemberInformationTableAdapter.Fill(this.dsMember.MemberInformation);

            this.reportViewer1.RefreshReport();
        }
    }
}
