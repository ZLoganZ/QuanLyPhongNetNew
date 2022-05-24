using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyPhongNet.DAO
{
    public class ProcessOrder
    {
        private QuanLyPhongNETDataContext objReader;
        private QuanLyPhongNETDataContext objWriter;

        public ProcessOrder()
        {
            objReader = new QuanLyPhongNETDataContext();
            objWriter = new QuanLyPhongNETDataContext();
        }

        public void AddOrderDrink(string Clientname, int ID, int quantity, int price)
        {
            objWriter.OrderDrinks.InsertOnSubmit(new OrderDrink()
            {
                ClientName = Clientname,
                DrinkID = ID,
                Quantity = quantity,
                PriceTotal = price
            });
            objWriter.SubmitChanges();
        }
        
        public void AddOrderCard(string Clientname, int ID, int quantity, int price)
        {
            objWriter.OrderCards.InsertOnSubmit(new OrderCard()
            {
                ClientName = Clientname,
                CardID = ID,
                Quantity = quantity,
                PriceTotal = price
            });
            objWriter.SubmitChanges();
        }
        
        public void AddOrderFood(string Clientname, int ID, int quantity, int price)
        {
            objWriter.OrderFoods.InsertOnSubmit(new OrderFood()
            {
                ClientName = Clientname,
                FoodID = ID,
                Quantity = quantity,
                PriceTotal = price
            });
            objWriter.SubmitChanges();
        }
    }
}
