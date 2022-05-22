namespace QuanLyPhongNet.Common 
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using System.Data.SqlClient;
    using System.Data.Sql;

    public class SqlData
    {
        private string strConnect;
        private SqlConnection cnn;

        public SqlData()
        {
            strConnect = QuanLyPhongNet.Common.Properties.Settings.Default.strConnect;
        }

        /// <summary>
        /// Kiểm tra kết nối để sử dụng LINQ.
        /// </summary>
        /// <returns>Trả về true nếu mở kết nối thành công, false nếu thất bại.</returns>
        public bool TestConnection()
        {
            cnn = new SqlConnection(strConnect);
            try
            {
                cnn.Open();
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.Message);

                return false;
            }

            return true;
        }

        /// <summary>
        /// Kết nối để sử dụng ADO.net.
        /// </summary>
        /// <returns>Trả về đối tượng SqlConnection.</returns>
        public SqlConnection Connect()
        {
            cnn = new SqlConnection(strConnect);
            cnn.Open();

            return cnn;
        }

        /// <summary>
        /// Đóng kết nối.
        /// </summary>
        public void DisConnect()
        {
            try
            {
                if (cnn != null)
                    cnn.Close();
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.Message);
            }
            finally
            {
                cnn.Close();
                cnn.Dispose();
                cnn = null; 
            }
        }

        public string StrConnect
        {
            get
            {
                return strConnect;
            }

            set
            {
                strConnect = value;
            }
        }

    }
}
