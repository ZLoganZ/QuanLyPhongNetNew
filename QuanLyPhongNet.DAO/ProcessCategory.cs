namespace QuanLyPhongNet.DAO
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    public class ProcessCategory
    {
        private QuanLyPhongNETDataContext objReader;
        private QuanLyPhongNETDataContext objWriter;

        public ProcessCategory()
        {
            objReader = new QuanLyPhongNETDataContext();
            objWriter = new QuanLyPhongNETDataContext();
        }
        
        public List<QuanLyPhongNet.DTO.Category> LoadAllCategorys()
        {
            return (from category in objReader.Categories
                    select new QuanLyPhongNet.DTO.Category
                    {
                        CategoryName =category.CategoryName
                    }).ToList();
        }

        public List<QuanLyPhongNet.DTO.Category> SearchCategory(string name)
        {
            return (from category in objReader.Categories
                    where category.CategoryName.Contains(name)
                    select new QuanLyPhongNet.DTO.Category
                    {
                        CategoryName = category.CategoryName
                    }).ToList();
        }

        public void InsertCatergory(string name)
        {
            using (QuanLyPhongNETDataContext objWriter = new QuanLyPhongNETDataContext())
            {
                objWriter.Categories.InsertOnSubmit(new Category
                {
                    CategoryName = name
                });
                objWriter.SubmitChanges();
            }
        }

        public void UpdateCategory(string index, string name)
        {
            using (QuanLyPhongNETDataContext objWriter = new QuanLyPhongNETDataContext())
            {
                Category objUpdate;
                objUpdate = objWriter.Categories.FirstOrDefault(x => x.CategoryName.Equals(index));
                objUpdate.CategoryName = name;
                objWriter.SubmitChanges();
            }
        }

        public void DeleteCategory(string name)
        {
            using (QuanLyPhongNETDataContext objWriter = new QuanLyPhongNETDataContext())
            {
                var objDelete = objWriter.Categories.Single(x => x.CategoryName.Equals(name));
                objWriter.Categories.DeleteOnSubmit(objDelete);
                objWriter.SubmitChanges();
            }
        }
    }
}
