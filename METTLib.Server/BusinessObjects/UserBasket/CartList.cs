﻿// Generated 19 Nov 2021 08:58 - Singular Systems Object Generator Version 2.2.694
//<auto-generated/>
using System;
using Csla;
using Csla.Serialization;
using Csla.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using Singular;
using System.Data;
using System.Data.SqlClient;


namespace MELib.UserBasket
{
    [Serializable]
    public class CartList
     : SingularBusinessListBase<CartList, Cart>
    {
        #region " Business Methods "

        public Cart GetItem(int CartsID)
        {
            foreach (Cart child in this)
            {
                if (child.CartsID == CartsID)
                {
                    return child;
                }
            }
            return null;
        }

        public override string ToString()
        {
            return "Carts";
        }

        #endregion

        #region " Data Access "

        [Serializable]
        public class Criteria
          : CriteriaBase<Criteria>
        {

            public int? UserID { get; set; }
            public Criteria()
            {
            }


            public Criteria(int UserID)
            {
                this.UserID = UserID;
            }
        }

        public static CartList NewCartList()
        {
            return new CartList();
        }

        public CartList()
        {
            // must have parameter-less constructor
        }

        public static CartList GetCartList()
        {
            return DataPortal.Fetch<CartList>(new Criteria());
        }


        public static CartList GetCartList(int UserID)
        {
            return DataPortal.Fetch<CartList>(new Criteria(UserID=UserID));
        }
        protected void Fetch(SafeDataReader sdr)
        {
            this.RaiseListChangedEvents = false;
            while (sdr.Read())
            {
                this.Add(Cart.GetCart(sdr));
            }
            this.RaiseListChangedEvents = true;
        }

        protected override void DataPortal_Fetch(Object criteria)
        {
            Criteria crit = (Criteria)criteria;
            using (SqlConnection cn = new SqlConnection(Singular.Settings.ConnectionString))
            {
                cn.Open();
                try
                {
                    using (SqlCommand cm = cn.CreateCommand())
                    {
                        cm.CommandType = CommandType.StoredProcedure;
                        cm.CommandText = "GetProcs.getUserCartList";
                        cm.Parameters.AddWithValue("@UserID", Singular.Misc.NothingDBNull(crit.UserID));
                        using (SafeDataReader sdr = new SafeDataReader(cm.ExecuteReader()))
                        {
                            Fetch(sdr);
                        }
                    }
                }
                finally
                {
                    cn.Close();
                }
            }
        }

        #endregion

    }

}