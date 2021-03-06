// Generated 10 Nov 2021 15:00 - Singular Systems Object Generator Version 2.2.694
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


namespace MELib.User
{
    [Serializable]
    public class UserList
     : SingularBusinessListBase<UserList, User>
    {
        #region " Business Methods "

        public User GetItem(int UserID)
        {
            foreach (User child in this)
            {
                if (child.UserID == UserID)
                {
                    return child;
                }
            }
            return null;
        }

        public override string ToString()
        {
            return "Users";
        }

        #endregion

        #region " Data Access "

        [Serializable]
        public class Criteria
          : CriteriaBase<Criteria>
        {
            public Criteria()
            {
            }

        }

        public static UserList NewUserList()
        {
            return new UserList();
        }

        public UserList()
        {
            // must have parameter-less constructor
        }

        public static UserList GetUserList()
        {
            return DataPortal.Fetch<UserList>(new Criteria());
        }

        protected void Fetch(SafeDataReader sdr)
        {
            this.RaiseListChangedEvents = false;
            while (sdr.Read())
            {
                this.Add(User.GetUser(sdr));
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
                        cm.CommandText = "GetProcs.getUserList";
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