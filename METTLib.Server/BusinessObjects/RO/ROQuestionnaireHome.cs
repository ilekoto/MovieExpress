// Generated 19 Jul 2018 14:53 - Singular Systems Object Generator Version 2.2.694
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


namespace METTLib.RO
{
	[Serializable]
	public class ROQuestionnaireHome
	 : METTReadOnlyBase<ROQuestionnaireHome>
	{
		#region " Properties and Methods "

		#region " Properties "

		public static PropertyInfo<int> QuestionnaireAnswerSetIDProperty = RegisterProperty<int>(c => c.QuestionnaireAnswerSetID, "ID");
		/// <summary>
		/// Gets the ID value
		/// </summary>
		[Display(AutoGenerateField = false), Key]
		public int QuestionnaireAnswerSetID
		{
			get { return GetProperty(QuestionnaireAnswerSetIDProperty); }
		}

		public static PropertyInfo<String> METTReportingNameProperty = RegisterProperty<String>(c => c.METTReportingName, "METT Reporting Name");
		/// <summary>
		/// Gets the METT Reporting Name value
		/// </summary>
		[Display(Name = "METT Reporting Name", Description = "")]
		public String METTReportingName
		{
			get { return GetProperty(METTReportingNameProperty); }
		}

		public static PropertyInfo<String> OfficialNameProperty = RegisterProperty<String>(c => c.OfficialName, "Official Name");
		/// <summary>
		/// Gets the Official Name value
		/// </summary>
		[Display(Name = "Official Name", Description = "")]
		public String OfficialName
		{
			get { return GetProperty(OfficialNameProperty); }
		}

		public static PropertyInfo<String> OrganisationNameProperty = RegisterProperty<String>(c => c.OrganisationName, "Organisation Name");
		/// <summary>
		/// Gets the Organisation Name value
		/// </summary>
		[Display(Name = "Organisation Name", Description = "")]
		public String OrganisationName
		{
			get { return GetProperty(OrganisationNameProperty); }
		}

		public static PropertyInfo<String> LegalDesignationProperty = RegisterProperty<String>(c => c.LegalDesignation, "Legal Designation");
		/// <summary>
		/// Gets the Legal Designation value
		/// </summary>
		[Display(Name = "Legal Designation", Description = "")]
		public String LegalDesignation
		{
			get { return GetProperty(LegalDesignationProperty); }
		}

		public static PropertyInfo<int> LeadAssessorIDProperty = RegisterProperty<int>(c => c.LeadAssessorID, "Lead Assessor");
		/// <summary>
		/// Gets the Lead Assessor value
		/// </summary>
		[Display(Name = "Lead Assessor", Description = "")]
		public int LeadAssessorID
		{
			get { return GetProperty(LeadAssessorIDProperty); }
		}

		public static PropertyInfo<int> AuditedByProperty = RegisterProperty<int>(c => c.AuditedBy, "Audited By");
		/// <summary>
		/// Gets the Audited By value
		/// </summary>
		[Display(Name = "Audited By", Description = "")]
		public int AuditedBy
		{
			get { return GetProperty(AuditedByProperty); }
		}

		public static PropertyInfo<String> AssessmentStepProperty = RegisterProperty<String>(c => c.AssessmentStep, "Assessment Step");
		/// <summary>
		/// Gets the Assessment Step value
		/// </summary>
		[Display(Name = "Assessment Step", Description = "")]
		public String AssessmentStep
		{
			get { return GetProperty(AssessmentStepProperty); }
		}


		public static PropertyInfo<int> AssessmentStepIdProperty = RegisterProperty<int>(c => c.AssessmentStepId, "Assessment Step Id");
		/// <summary>
		/// Gets the Assessment Step value
		/// </summary>
		[Display(Name = "Assessment Step", Description = "")]
		public int AssessmentStepId
		{
			get { return GetProperty(AssessmentStepIdProperty); }
		}

		public static PropertyInfo<Boolean> IsUnofficialProtectedAreaIndProperty = RegisterProperty<Boolean>(c => c.IsUnofficialProtectedAreaInd, "Is Unofficial Protected Area", false);
		/// <summary>
		/// Gets the Is Unofficial Protected Area value
		/// </summary>
		[Display(Name = "Is Unofficial Protected Area / Site", Description = "")]
		public Boolean IsUnofficialProtectedAreaInd
		{
			get { return GetProperty(IsUnofficialProtectedAreaIndProperty); }
		}

		public static PropertyInfo<Boolean> AcceptedIndProperty = RegisterProperty<Boolean>(c => c.AcceptedInd, "Accepted", false);
		/// <summary>
		/// Gets the Accepted value
		/// </summary>
		[Display(Name = "Accepted", Description = "")]
		public Boolean AcceptedInd
		{
			get { return GetProperty(AcceptedIndProperty); }
		}

		public static PropertyInfo<DateTime> CreatedDateTimeProperty = RegisterProperty<DateTime>(c => c.CreatedDateTime, "Created Date Time", new SmartDate(DateTime.Now));
		/// <summary>
		/// Gets the Created Date Time value
		/// </summary>
		[Display(Name = "Date Created", Description = "")]
		public DateTime CreatedDateTime
		{
			get { return GetProperty(CreatedDateTimeProperty); }
		}

		public static PropertyInfo<DateTime> ModifiedDateTimeProperty = RegisterProperty<DateTime>(c => c.ModifiedDateTime, "Modified Date Time", new SmartDate(DateTime.Now));
		/// <summary>
		/// Gets the Modified Date Time value
		/// </summary>
		[Display(Name = "Last Modified", Description = "")]
		public DateTime ModifiedDateTime
		{
			get { return GetProperty(ModifiedDateTimeProperty); }
		}




		#endregion

		#region " Methods "

		protected override object GetIdValue()
		{
			return GetProperty(QuestionnaireAnswerSetIDProperty);
		}

		public override string ToString()
		{
			return this.METTReportingName;
		}

		#endregion

		#endregion

		#region " Data Access & Factory Methods "

		internal static ROQuestionnaireHome GetROQuestionnaireHome(SafeDataReader dr)
		{
			var r = new ROQuestionnaireHome();
			r.Fetch(dr);
			return r;
		}

		protected void Fetch(SafeDataReader sdr)
		{
			int i = 0;
			LoadProperty(QuestionnaireAnswerSetIDProperty, sdr.GetInt32(i++));
			LoadProperty(METTReportingNameProperty, sdr.GetString(i++));
			LoadProperty(OfficialNameProperty, sdr.GetString(i++));
			LoadProperty(OrganisationNameProperty, sdr.GetString(i++));
			LoadProperty(LegalDesignationProperty, sdr.GetString(i++));
			LoadProperty(LeadAssessorIDProperty, Singular.Misc.ZeroNothing(sdr.GetInt32(i++)));
			LoadProperty(AuditedByProperty, sdr.GetInt32(i++));
			LoadProperty(AssessmentStepProperty, sdr.GetString(i++));
			LoadProperty(AssessmentStepIdProperty, sdr.GetInt32(i++));
			LoadProperty(IsUnofficialProtectedAreaIndProperty, sdr.GetBoolean(i++));
			LoadProperty(AcceptedIndProperty, sdr.GetBoolean(i++));
			LoadProperty(CreatedDateTimeProperty, sdr.GetDateTime(i++));
			LoadProperty(ModifiedDateTimeProperty, sdr.GetDateTime(i++));
		}

		#endregion

	}

}