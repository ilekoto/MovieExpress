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
    public class Cart
     : SingularBusinessBase<Cart>
    {
        #region " Properties and Methods "

        #region " Properties "

        public static PropertyInfo<int> CartsIDProperty = RegisterProperty<int>(c => c.CartsID, "ID", 0);
        /// <summary>
        /// Gets the ID value
        /// </summary>
        [Display(AutoGenerateField = false), Key]
        public int CartsID
        {
            get { return GetProperty(CartsIDProperty); }
        }

        public static PropertyInfo<int?> UserIDProperty = RegisterProperty<int?>(c => c.UserID, "User", null);
        /// <summary>
        /// Gets and sets the User value
        /// </summary>
        [Display(Name = "User", Description = ""),
        Required(ErrorMessage = "User required")]
        public int? UserID
        {
            get { return GetProperty(UserIDProperty); }
            set { SetProperty(UserIDProperty, value); }
        }

        public static PropertyInfo<int?> ProductIDProperty = RegisterProperty<int?>(c => c.ProductID, "Product", null);
        /// <summary>
        /// Gets and sets the Product value
        /// </summary>
        [Display(Name = "Product", Description = ""),
        Required(ErrorMessage = "Product required")]
        public int? ProductID
        {
            get { return GetProperty(ProductIDProperty); }
            set { SetProperty(ProductIDProperty, value); }
        }

        public static PropertyInfo<int> QuantityProperty = RegisterProperty<int>(c => c.Quantity, "Quantity", 0);
        /// <summary>
        /// Gets and sets the Quantity value
        /// </summary>
        [Display(Name = "Quantity", Description = ""),
        Required(ErrorMessage = "Quantity required")]
        public int Quantity
        {
            get { return GetProperty(QuantityProperty); }
            set { SetProperty(QuantityProperty, value); }
        }

        public static PropertyInfo<Decimal> TotalPriceProperty = RegisterProperty<Decimal>(c => c.TotalPrice, "Total Price", 0D);
        /// <summary>
        /// Gets and sets the Total Price value
        /// </summary>
        [Display(Name = "Total Price", Description = ""),
        Required(ErrorMessage = "Total Price required")]
        public Decimal TotalPrice
        {
            get { return GetProperty(TotalPriceProperty); }
            set { SetProperty(TotalPriceProperty, value); }
        }

        #endregion

        #region " Methods "

        protected override object GetIdValue()
        {
            return GetProperty(CartsIDProperty);
        }

        public override string ToString()
        {
            if (this.CartsID.ToString().Length == 0)
            {
                if (this.IsNew)
                {
                    return String.Format("New {0}", "Cart");
                }
                else
                {
                    return String.Format("Blank {0}", "Cart");
                }
            }
            else
            {
                return this.CartsID.ToString();
            }
        }

        #endregion

        #endregion

        #region " Validation Rules "

        protected override void AddBusinessRules()
        {
            base.AddBusinessRules();
        }

        #endregion

        #region " Data Access & Factory Methods "

        protected override void OnCreate()
        {
            // This is called when a new object is created
            // Set any variables here, not in the constructor or NewCart() method.
        }

        public static Cart NewCart()
        {
            return DataPortal.CreateChild<Cart>();
        }

        public Cart()
        {
            MarkAsChild();
        }

        internal static Cart GetCart(SafeDataReader dr)
        {
            var c = new Cart();
            c.Fetch(dr);
            return c;
        }

        protected void Fetch(SafeDataReader sdr)
        {
            using (BypassPropertyChecks)
            {
                int i = 0;
                LoadProperty(CartsIDProperty, sdr.GetInt32(i++));
                LoadProperty(UserIDProperty, Singular.Misc.ZeroNothing(sdr.GetInt32(i++)));
                LoadProperty(ProductIDProperty, Singular.Misc.ZeroNothing(sdr.GetInt32(i++)));
                LoadProperty(QuantityProperty, sdr.GetInt32(i++));
                LoadProperty(TotalPriceProperty, sdr.GetDecimal(i++));
            }

            MarkAsChild();
            MarkOld();
            BusinessRules.CheckRules();
        }

        protected override Action<SqlCommand> SetupSaveCommand(SqlCommand cm)
        {
            AddPrimaryKeyParam(cm, CartsIDProperty);

            cm.Parameters.AddWithValue("@UserID", GetProperty(UserIDProperty));
            cm.Parameters.AddWithValue("@ProductID", GetProperty(ProductIDProperty));
            cm.Parameters.AddWithValue("@Quantity", GetProperty(QuantityProperty));
            cm.Parameters.AddWithValue("@TotalPrice", GetProperty(TotalPriceProperty));

            return (scm) =>
            {
    // Post Save
    if (this.IsNew)
                {
                    LoadProperty(CartsIDProperty, scm.Parameters["@CartsID"].Value);
                }
            };
        }

        protected override void SaveChildren()
        {
            // No Children
        }

        protected override void SetupDeleteCommand(SqlCommand cm)
        {
            cm.Parameters.AddWithValue("@CartsID", GetProperty(CartsIDProperty));
        }

        #endregion

    }

}