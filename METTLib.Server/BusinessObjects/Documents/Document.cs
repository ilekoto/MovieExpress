﻿// Generated 31 Jul 2020 10:51 - Singular Systems Object Generator Version 2.2.694
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


namespace MELib.Documents
{
  [Serializable]
  public class Document
   : MEBusinessBase<Document>
  {
    #region " Properties and Methods "

    #region " Properties "

    public static PropertyInfo<int> DocumentIDProperty = RegisterProperty<int>(c => c.DocumentID, "ID", 0);
    /// <summary>
    /// Gets the ID value
    /// </summary>
    [Display(AutoGenerateField = false), Key]
    public int DocumentID
    {
      get { return GetProperty(DocumentIDProperty); }
    }

    public static PropertyInfo<String> DocumentNameProperty = RegisterProperty<String>(c => c.DocumentName, "Document Name", "");
    /// <summary>
    /// Gets and sets the Document Name value
    /// </summary>
    [Display(Name = "Document Name", Description = ""),
    StringLength(255, ErrorMessage = "Document Name cannot be more than 255 characters")]
    public String DocumentName
    {
      get { return GetProperty(DocumentNameProperty); }
      set { SetProperty(DocumentNameProperty, value); }
    }

    public static PropertyInfo<String> DocumentDescriptionProperty = RegisterProperty<String>(c => c.DocumentDescription, "Document Description", "n/a");
    /// <summary>
    /// Gets and sets the Document Description value
    /// </summary>
    [Display(Name = "Document Description", Description = "")]
    public String DocumentDescription
    {
      get { return GetProperty(DocumentDescriptionProperty); }
      set { SetProperty(DocumentDescriptionProperty, value); }
    }

    public static PropertyInfo<String> DocumentURLProperty = RegisterProperty<String>(c => c.DocumentURL, "Document URL", "");
    /// <summary>
    /// Gets and sets the Document URL value
    /// </summary>
    [Display(Name = "Document URL", Description = "")]
    public String DocumentURL
    {
      get { return GetProperty(DocumentURLProperty); }
      set { SetProperty(DocumentURLProperty, value); }
    }
    
    public static PropertyInfo<int> SortOrderProperty = RegisterProperty<int>(c => c.SortOrder, "Sort Order", 0);
    /// <summary>
    /// Gets and sets the Sort Order value
    /// </summary>
    [Display(Name = "Sort Order", Description = "")]
    public int SortOrder
    {
      get { return GetProperty(SortOrderProperty); }
      set { SetProperty(SortOrderProperty, value); }
    }

    public static PropertyInfo<SmartDate> CreatedDateTimeProperty = RegisterProperty<SmartDate>(c => c.CreatedDateTime, "Created Date Time", new SmartDate(DateTime.Now));
    /// <summary>
    /// Gets the Created Date Time value
    /// </summary>
    [Display(AutoGenerateField = false)]
    public SmartDate CreatedDateTime
    {
      get { return GetProperty(CreatedDateTimeProperty); }
    }

    public static PropertyInfo<int> CreatedByProperty = RegisterProperty<int>(c => c.CreatedBy, "Created By", 0);
    /// <summary>
    /// Gets the Created By value
    /// </summary>
    [Display(AutoGenerateField = false)]
    public int? CreatedBy
    {
      get { return GetProperty(CreatedByProperty); }
    }

    public static PropertyInfo<SmartDate> ModifiedDateTimeProperty = RegisterProperty<SmartDate>(c => c.ModifiedDateTime, "Modified Date Time", new SmartDate(DateTime.Now));
    /// <summary>
    /// Gets the Modified Date Time value
    /// </summary>
    [Display(AutoGenerateField = false)]
    public SmartDate ModifiedDateTime
    {
      get { return GetProperty(ModifiedDateTimeProperty); }
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
      return GetProperty(DocumentIDProperty);
    }

    public override string ToString()
    {
      if (this.DocumentName.Length == 0)
      {
        if (this.IsNew)
        {
          return String.Format("New {0}", "Document");
        }
        else
        {
          return String.Format("Blank {0}", "Document");
        }
      }
      else
      {
        return this.DocumentName;
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
      // Set any variables here, not in the constructor or NewDocument() method.
    }

    public static Document NewDocument()
    {
      return DataPortal.CreateChild<Document>();
    }

    public Document()
    {
      MarkAsChild();
    }

    internal static Document GetDocument(SafeDataReader dr)
    {
      var d = new Document();
      d.Fetch(dr);
      return d;
    }

    protected void Fetch(SafeDataReader sdr)
    {
      using (BypassPropertyChecks)
      {
        int i = 0;
        LoadProperty(DocumentIDProperty, sdr.GetInt32(i++));
        LoadProperty(DocumentNameProperty, sdr.GetString(i++));
        LoadProperty(DocumentDescriptionProperty, sdr.GetString(i++));
        LoadProperty(DocumentURLProperty, sdr.GetString(i++));
        LoadProperty(SortOrderProperty, sdr.GetInt32(i++));
        LoadProperty(CreatedDateTimeProperty, sdr.GetSmartDate(i++));
        LoadProperty(CreatedByProperty, sdr.GetInt32(i++));
        LoadProperty(ModifiedDateTimeProperty, sdr.GetSmartDate(i++));
        LoadProperty(ModifiedByProperty, sdr.GetInt32(i++));
      }

      MarkAsChild();
      MarkOld();
      BusinessRules.CheckRules();
    }

    protected override Action<SqlCommand> SetupSaveCommand(SqlCommand cm)
    {
      LoadProperty(ModifiedByProperty, Settings.CurrentUser.UserID);

      AddPrimaryKeyParam(cm, DocumentIDProperty);

      cm.Parameters.AddWithValue("@DocumentName", GetProperty(DocumentNameProperty));
      cm.Parameters.AddWithValue("@DocumentDescription", GetProperty(DocumentDescriptionProperty));
      cm.Parameters.AddWithValue("@DocumentURL", GetProperty(DocumentURLProperty));
      cm.Parameters.AddWithValue("@ModifiedBy", GetProperty(ModifiedByProperty));

      return (scm) =>
      {
  // Post Save
  if (this.IsNew)
        {
          LoadProperty(DocumentIDProperty, scm.Parameters["@DocumentID"].Value);
        }
      };
    }

    protected override void SaveChildren()
    {
      // No Children
    }

    protected override void SetupDeleteCommand(SqlCommand cm)
    {
      cm.Parameters.AddWithValue("@DocumentID", GetProperty(DocumentIDProperty));
    }

    #endregion

  }

}