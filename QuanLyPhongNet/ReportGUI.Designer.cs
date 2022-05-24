namespace QuanLyPhongNet
{
    partial class ReportGUI
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            Microsoft.Reporting.WinForms.ReportDataSource reportDataSource1 = new Microsoft.Reporting.WinForms.ReportDataSource();
            this.AfterPayClientBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.dsBill = new QuanLyPhongNet.dsBill();
            this.MemberInformationBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.dsMember = new QuanLyPhongNet.dsMember();
            this.reportViewer1 = new Microsoft.Reporting.WinForms.ReportViewer();
            this.MemberInformationTableAdapter = new QuanLyPhongNet.dsMemberTableAdapters.MemberInformationTableAdapter();
            this.AfterPayClientTableAdapter = new QuanLyPhongNet.dsBillTableAdapters.AfterPayClientTableAdapter();
            ((System.ComponentModel.ISupportInitialize)(this.AfterPayClientBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dsBill)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.MemberInformationBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dsMember)).BeginInit();
            this.SuspendLayout();
            // 
            // AfterPayClientBindingSource
            // 
            this.AfterPayClientBindingSource.DataMember = "AfterPayClient";
            this.AfterPayClientBindingSource.DataSource = this.dsBill;
            // 
            // dsBill
            // 
            this.dsBill.DataSetName = "dsBill";
            this.dsBill.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // MemberInformationBindingSource
            // 
            this.MemberInformationBindingSource.DataMember = "MemberInformation";
            this.MemberInformationBindingSource.DataSource = this.dsMember;
            // 
            // dsMember
            // 
            this.dsMember.DataSetName = "dsMember";
            this.dsMember.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // reportViewer1
            // 
            this.reportViewer1.Dock = System.Windows.Forms.DockStyle.Fill;
            reportDataSource1.Name = "DataSet1";
            reportDataSource1.Value = this.AfterPayClientBindingSource;
            this.reportViewer1.LocalReport.DataSources.Add(reportDataSource1);
            this.reportViewer1.LocalReport.ReportEmbeddedResource = "QuanLyPhongNet.ReportBill.rdlc";
            this.reportViewer1.Location = new System.Drawing.Point(0, 0);
            this.reportViewer1.Margin = new System.Windows.Forms.Padding(2);
            this.reportViewer1.Name = "reportViewer1";
            this.reportViewer1.ServerReport.BearerToken = null;
            this.reportViewer1.Size = new System.Drawing.Size(1133, 542);
            this.reportViewer1.TabIndex = 0;
            // 
            // MemberInformationTableAdapter
            // 
            this.MemberInformationTableAdapter.ClearBeforeFill = true;
            // 
            // AfterPayClientTableAdapter
            // 
            this.AfterPayClientTableAdapter.ClearBeforeFill = true;
            // 
            // ReportGUI
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1133, 542);
            this.Controls.Add(this.reportViewer1);
            this.Name = "ReportGUI";
            this.Text = "ReportGUI";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.ReportGUI_FormClosed);
            this.Load += new System.EventHandler(this.ReportGUI_Load);
            ((System.ComponentModel.ISupportInitialize)(this.AfterPayClientBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dsBill)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.MemberInformationBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dsMember)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer reportViewer1;
        private System.Windows.Forms.BindingSource MemberInformationBindingSource;
        private dsMember dsMember;
        private dsMemberTableAdapters.MemberInformationTableAdapter MemberInformationTableAdapter;
        private System.Windows.Forms.BindingSource AfterPayClientBindingSource;
        private dsBill dsBill;
        private dsBillTableAdapters.AfterPayClientTableAdapter AfterPayClientTableAdapter;
    }
}