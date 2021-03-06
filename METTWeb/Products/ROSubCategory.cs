// Generated 26 Oct 2021 14:51 - Singular Systems Object Generator Version 2.2.694
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


namespace MEWeb.ROSubCategories
{
    [Serializable]
    public class ROSubCategory
     : SingularReadOnlyBase<ROSubCategory>
    {
        #region " Properties and Methods "

        #region " Properties "

        public static PropertyInfo<int> SubCategoryIDProperty = RegisterProperty<int>(c => c.SubCategoryID, "ID", 0);
        /// <summary>
        /// Gets the ID value
        /// </summary>
        [Display(AutoGenerateField = false), Key]
        public int SubCategoryID
        {
            get { return GetProperty(SubCategoryIDProperty); }
        }

        public static PropertyInfo<int?> CategoryIDProperty = RegisterProperty<int?>(c => c.CategoryID, "Category", null);
        /// <summary>
        /// Gets the Category value
        /// </summary>
        [Display(Name = "Category", Description = "")]
        public int? CategoryID
        {
            get { return GetProperty(CategoryIDProperty); }
        }

        public static PropertyInfo<String> SubCategoryNameProperty = RegisterProperty<String>(c => c.SubCategoryName, "Sub Category Name", "");
        /// <summary>
        /// Gets the Sub Category Name value
        /// </summary>
        [Display(Name = "Sub Category Name", Description = "")]
        public String SubCategoryName
        {
            get { return GetProperty(SubCategoryNameProperty); }
        }

        public static PropertyInfo<String> SubCategoryDescriptionProperty = RegisterProperty<String>(c => c.SubCategoryDescription, "Sub Category Description", "n/a");
        /// <summary>
        /// Gets the Sub Category Description value
        /// </summary>
        [Display(Name = "Sub Category Description", Description = "")]
        public String SubCategoryDescription
        {
            get { return GetProperty(SubCategoryDescriptionProperty); }
        }

        public static PropertyInfo<Boolean> IsActiveIndProperty = RegisterProperty<Boolean>(c => c.IsActiveInd, "Is Active", true);
        /// <summary>
        /// Gets the Is Active value
        /// </summary>
        [Display(Name = "Is Active", Description = "Indicator showing if the Movie is Active")]
        public Boolean IsActiveInd
        {
            get { return GetProperty(IsActiveIndProperty); }
        }

        public static PropertyInfo<DateTime?> DeletedDateProperty = RegisterProperty<DateTime?>(c => c.DeletedDate, "Deleted Date");
        /// <summary>
        /// Gets the Deleted Date value
        /// </summary>
        [Display(Name = "Deleted Date", Description = "When this record was deleted")]
        public DateTime? DeletedDate
        {
            get
            {
                return GetProperty(DeletedDateProperty);
            }
        }

        public static PropertyInfo<int> DeletedByProperty = RegisterProperty<int>(c => c.DeletedBy, "Deleted By", 0);
        /// <summary>
        /// Gets the Deleted By value
        /// </summary>
        [Display(Name = "Deleted By", Description = "User that deleted the record")]
        public int DeletedBy
        {
            get { return GetProperty(DeletedByProperty); }
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
            return GetProperty(SubCategoryIDProperty);
        }

        public override string ToString()
        {
            return this.SubCategoryName;
        }

        #endregion

        #endregion

        #region " Data Access & Factory Methods "

        internal static ROSubCategory GetROSubCategory(SafeDataReader dr)
        {
            var r = new ROSubCategory();
            r.Fetch(dr);
            return r;
        }

        protected void Fetch(SafeDataReader sdr)
        {
            int i = 0;
            LoadProperty(SubCategoryIDProperty, sdr.GetInt32(i++));
            LoadProperty(CategoryIDProperty, Singular.Misc.ZeroNothing(sdr.GetInt32(i++)));
            LoadProperty(SubCategoryNameProperty, sdr.GetString(i++));
            LoadProperty(SubCategoryDescriptionProperty, sdr.GetString(i++));
            LoadProperty(IsActiveIndProperty, sdr.GetBoolean(i++));
            LoadProperty(DeletedDateProperty, sdr.GetValue(i++));
            LoadProperty(DeletedByProperty, sdr.GetInt32(i++));
            LoadProperty(CreatedDateProperty, sdr.GetSmartDate(i++));
            LoadProperty(CreatedByProperty, sdr.GetInt32(i++));
            LoadProperty(ModifiedDateProperty, sdr.GetSmartDate(i++));
            LoadProperty(ModifiedByProperty, sdr.GetInt32(i++));
        }

        #endregion

    }

}