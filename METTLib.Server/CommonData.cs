using System;
using MELib.Categories;
using Singular.CommonData;

namespace MELib
{
    public class CommonData : CommonDataBase<MELib.CommonData.MECachedLists>
    {
        [Serializable]
        public class MECachedLists : CommonDataBase<MECachedLists>.CachedLists
        {
            /// <summary>
            /// Gets cached ROUserList
            /// </summary>
            public MELib.RO.ROUserList ROUserList
            {
                get
                {
                    return RegisterList<MELib.RO.ROUserList>(Misc.ContextType.Application, c => c.ROUserList, () => { return MELib.RO.ROUserList.GetROUserList(); });
                }
            }
            /// <summary>
            /// Gets cached ROMovieGenreList
            /// </summary>
            public RO.ROMovieGenreList ROMovieGenreList
            {
                get
                {
                    return RegisterList<MELib.RO.ROMovieGenreList>(Misc.ContextType.Application, c => c.ROMovieGenreList, () => { return MELib.RO.ROMovieGenreList.GetROMovieGenreList(); });
                }
            }
            public MELib.RO.ROSubCategoryList ROSubCategoryList
            {
                get
                {
                    return RegisterList<MELib.RO.ROSubCategoryList>(Misc.ContextType.Application, c => c.ROSubCategoryList, () => { return MELib.RO.ROSubCategoryList.GetROSubCategoryList(); });

                }
            }
            public MELib.Products.DeliveryTypeList DeliveryTypeList
            {
                get
                {
                    return RegisterList<MELib.Products.DeliveryTypeList>(Misc.ContextType.Application, c => c.DeliveryTypeList, () => { return MELib.Products.DeliveryTypeList.GetDeliveryTypeList(); });

                }
            }
            public MELib.Accounts.TransactionTypeList TransactionTypeList
            {
                get
                {
                    return RegisterList<MELib.Accounts.TransactionTypeList>(Misc.ContextType.Application, c => c.TransactionTypeList, () => { return MELib.Accounts.TransactionTypeList.GetTransactionTypeList(); });

                }
            }
            //public MELib.Products.DeliveryTypeList DeliveryTypeList //MELib.Accounts.TransactionTypeList TransactionTypeList
            //{
            //    get
            //    {
            //        return RegisterList<MELib.Products.DeliveryTypeList>(Misc.ContextType.Application, c => c.DeliveryTypeList, () => { return MELib.Products.DeliveryTypeList.GetDeliveryTypeList(); });

            //    }
            //}

            /* public Categories.CategoryList CategoryList
             {
                 get
                 {
                     return RegisterList<MELib.Categories.CategoryList>(Misc.ContextType.Application, c => c.CategoryList, () => { return MELib.Categories.CategoryList.GetCategoryList(); });
                 }
             }*/

            //

            //int SubCategoryID;

        }
    }

  public class Enums
  {
		public enum AuditedInd
		{
			Yes = 1,
			No = 0
		}
    public enum DeletedInd
    {
      Yes = 1,
      No = 0
    }
  }
}
