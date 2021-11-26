﻿// Generated 26 Nov 2021 08:16 - Singular Systems Object Generator Version 2.2.694
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


namespace MELib.Accounts
{
    [Serializable]
    public class TransactionType
     : SingularBusinessBase<TransactionType>
    {
        #region " Properties and Methods "

        #region " Properties "

        public static PropertyInfo<int> TransactionTypeIDProperty = RegisterProperty<int>(c => c.TransactionTypeID, "ID", 0);
        /// <summary>
        /// Gets the ID value
        /// </summary>
        [Display(AutoGenerateField = false), Key]
        public int TransactionTypeID
        {
            get { return GetProperty(TransactionTypeIDProperty); }
        }

        public static PropertyInfo<String> TransactionTypeProperty = RegisterProperty<String>(c => c.TransactionTypeName, "Transaction Type", "");
        /// <summary>
        /// Gets and sets the Transaction Type value
        /// </summary>
        [Display(Name = "Transaction Type", Description = ""),
        StringLength(250, ErrorMessage = "Transaction Type cannot be more than 250 characters")]
        public String TransactionTypeName
        {
            get { return GetProperty(TransactionTypeProperty); }
            set { SetProperty(TransactionTypeProperty, value); }
        }

        public static PropertyInfo<String> TransactionCodeProperty = RegisterProperty<String>(c => c.TransactionCode, "Transaction Code", "");
        /// <summary>
        /// Gets and sets the Transaction Code value
        /// </summary>
        [Display(Name = "Transaction Code", Description = ""),
        StringLength(50, ErrorMessage = "Transaction Code cannot be more than 50 characters")]
        public String TransactionCode
        {
            get { return GetProperty(TransactionCodeProperty); }
            set { SetProperty(TransactionCodeProperty, value); }
        }

        public static PropertyInfo<Boolean> IsActiveIndProperty = RegisterProperty<Boolean>(c => c.IsActiveInd, "Is Active", true);
        /// <summary>
        /// Gets and sets the Is Active value
        /// </summary>
        [Display(Name = "Is Active", Description = "Indicator showing if the Movie is Active"),
        Required(ErrorMessage = "Is Active required")]
        public Boolean IsActiveInd
        {
            get { return GetProperty(IsActiveIndProperty); }
            set { SetProperty(IsActiveIndProperty, value); }
        }

        public static PropertyInfo<DateTime?> DeletedDateProperty = RegisterProperty<DateTime?>(c => c.DeletedDate, "Deleted Date");
        /// <summary>
        /// Gets and sets the Deleted Date value
        /// </summary>
        [Display(Name = "Deleted Date", Description = "When this record was deleted")]
        public DateTime? DeletedDate
        {
            get
            {
                return GetProperty(DeletedDateProperty);
            }
            set
            {
                SetProperty(DeletedDateProperty, value);
            }
        }

        public static PropertyInfo<int> DeletedByProperty = RegisterProperty<int>(c => c.DeletedBy, "Deleted By", 0);
        /// <summary>
        /// Gets and sets the Deleted By value
        /// </summary>
        [Display(Name = "Deleted By", Description = "User that deleted the record")]
        public int DeletedBy
        {
            get { return GetProperty(DeletedByProperty); }
            set { SetProperty(DeletedByProperty, value); }
        }

        public static PropertyInfo<SmartDate> CreatedDateProperty = RegisterProperty<SmartDate>(c => c.CreatedDate, "Created Date", new SmartDate(DateTime.Now));
        /// <summary>
        /// Gets the Created Date value
        /// </summary>
        [Display(AutoGenerateField = false)]
        public SmartDate CreatedDate
        {
            get { return GetProperty(CreatedDateProperty); }
        }

        public static PropertyInfo<int> CreatedByProperty = RegisterProperty<int>(c => c.CreatedBy, "Created By", 0);
        /// <summary>
        /// Gets the Created By value
        /// </summary>
        [Display(AutoGenerateField = false)]
        public int CreatedBy
        {
            get { return GetProperty(CreatedByProperty); }
        }

        public static PropertyInfo<SmartDate> ModifiedDateProperty = RegisterProperty<SmartDate>(c => c.ModifiedDate, "Modified Date", new SmartDate(DateTime.Now));
        /// <summary>
        /// Gets the Modified Date value
        /// </summary>
        [Display(AutoGenerateField = false)]
        public SmartDate ModifiedDate
        {
            get { return GetProperty(ModifiedDateProperty); }
        }

        public static PropertyInfo<int> ModifiedByProperty = RegisterProperty<int>(c => c.ModifiedBy, "Modified By", 0);
        /// <summary>
        /// Gets the Modified By value
        /// </summary>
        [Display(AutoGenerateField = false)]
        public int ModifiedBy
        {
            get { return GetProperty(ModifiedByProperty); }
        }

        #endregion

        #region " Methods "

        protected override object GetIdValue()
        {
            return GetProperty(TransactionTypeIDProperty);
        }

        public override string ToString()
        {
            if (this.TransactionTypeName.Length == 0)
            {
                if (this.IsNew)
                {
                    return String.Format("New {0}", "Transaction Type");
                }
                else
                {
                    return String.Format("Blank {0}", "Transaction Type");
                }
            }
            else
            {
                return this.TransactionTypeName;
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
            // Set any variables here, not in the constructor or NewTransactionType() method.
        }

        public static TransactionType NewTransactionType()
        {
            return DataPortal.CreateChild<TransactionType>();
        }

        public TransactionType()
        {
            MarkAsChild();
        }

        internal static TransactionType GetTransactionType(SafeDataReader dr)
        {
            var t = new TransactionType();
            t.Fetch(dr);
            return t;
        }

        protected void Fetch(SafeDataReader sdr)
        {
            using (BypassPropertyChecks)
            {
                int i = 0;
                LoadProperty(TransactionTypeIDProperty, sdr.GetInt32(i++));
                LoadProperty(TransactionTypeProperty, sdr.GetString(i++));
                LoadProperty(TransactionCodeProperty, sdr.GetString(i++));
                LoadProperty(IsActiveIndProperty, sdr.GetBoolean(i++));
                LoadProperty(DeletedDateProperty, sdr.GetValue(i++));
                LoadProperty(DeletedByProperty, sdr.GetInt32(i++));
                LoadProperty(CreatedDateProperty, sdr.GetSmartDate(i++));
                LoadProperty(CreatedByProperty, sdr.GetInt32(i++));
                LoadProperty(ModifiedDateProperty, sdr.GetSmartDate(i++));
                LoadProperty(ModifiedByProperty, sdr.GetInt32(i++));
            }

            MarkAsChild();
            MarkOld();
            BusinessRules.CheckRules();
        }

        protected override Action<SqlCommand> SetupSaveCommand(SqlCommand cm)
        {
            LoadProperty(ModifiedByProperty, Settings.CurrentUser.UserID);

            AddPrimaryKeyParam(cm, TransactionTypeIDProperty);

            cm.Parameters.AddWithValue("@TransactionType", GetProperty(TransactionTypeProperty));
            cm.Parameters.AddWithValue("@TransactionCode", GetProperty(TransactionCodeProperty));
            cm.Parameters.AddWithValue("@IsActiveInd", GetProperty(IsActiveIndProperty));
            cm.Parameters.AddWithValue("@DeletedDate", Singular.Misc.NothingDBNull(DeletedDate));
            cm.Parameters.AddWithValue("@DeletedBy", GetProperty(DeletedByProperty));
            cm.Parameters.AddWithValue("@ModifiedBy", GetProperty(ModifiedByProperty));

            return (scm) =>
            {
    // Post Save
    if (this.IsNew)
                {
                    LoadProperty(TransactionTypeIDProperty, scm.Parameters["@TransactionTypeID"].Value);
                }
            };
        }

        protected override void SaveChildren()
        {
            // No Children
        }

        protected override void SetupDeleteCommand(SqlCommand cm)
        {
            cm.Parameters.AddWithValue("@TransactionTypeID", GetProperty(TransactionTypeIDProperty));
        }

        #endregion

    }

}