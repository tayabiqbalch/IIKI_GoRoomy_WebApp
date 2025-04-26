using IIKI.BaseApp.Localization.Resources;
using IIKI.BaseApp.Utils;
using System.ComponentModel.DataAnnotations;
using System.Data;


namespace IIKI.GoRoomy.Business.Objects
{
    [DataTable("dbo.tblHotelDocuments")]
    [StoreProcedure("dbo.usp_GetHotelDocuments")]
    public class HotelDocument : BaseApp.Business.Objects.DocumentReadonly
    {
        public HotelDocument()
        {
            Document = new BaseApp.Business.Objects.Document();
        }

        [Display(Name = "HotelId", ResourceType = typeof(IIKI.GoRoomy.Localization.Resources.HotelLabels))]
        [DataField(Type = DbType.Int64)]
        public long HotelId { get; set; }

        [Display(Name = "DocumentId", ResourceType = typeof(DocumentLabels))]
        [DataField(Type = DbType.Int64)]
        public long DocumentId { get; set; }

        [Display(Name = "IsPrimary", ResourceType = typeof(DocumentLabels))]
        [DataField(Type = DbType.Boolean)]
        public bool IsPrimary { get; set; }

        [Display(Name = "RecordStatus", ResourceType = typeof(CommonLabels))]
        [DataField(Type = DbType.Int32)]
        public int RecordStatus { get; set; }



        [Display(Name = "DocumentPath", ResourceType = typeof(DocumentLabels))]
        [ReadOnlyField(Type = DbType.String)]
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public string DocumentFullName { get; set; }

        //[Display(Name = "FirstName", ResourceType = typeof(HotelInfoLabels))]
        //[StringLength(50, ErrorMessageResourceName = "StringMinMaxLength", ErrorMessageResourceType = typeof(CommonLabels), MinimumLength = 0)]
        //[ReadOnlyField(Type = DbType.String)]
        //[System.ComponentModel.DataAnnotations.Schema.NotMapped]
        //public string FirstName { get; set; }

        //[Display(Name = "FirstNameUrdu", ResourceType = typeof(HotelInfoLabels))]
        //[StringLength(50, ErrorMessageResourceName = "StringMinMaxLength", ErrorMessageResourceType = typeof(CommonLabels), MinimumLength = 0)]
        //[ReadOnlyField(Type = DbType.String)]
        //[System.ComponentModel.DataAnnotations.Schema.NotMapped]
        //public string FirstNameUrdu { get; set; }

        //[Display(Name = "LastName", ResourceType = typeof(HotelInfoLabels))]
        //[StringLength(50, ErrorMessageResourceName = "StringMinMaxLength", ErrorMessageResourceType = typeof(CommonLabels), MinimumLength = 0)]
        //[ReadOnlyField(Type = DbType.String)]
        //[System.ComponentModel.DataAnnotations.Schema.NotMapped]
        //public string LastName { get; set; }

        //[Display(Name = "LastNameUrdu", ResourceType = typeof(HotelInfoLabels))]
        //[StringLength(50, ErrorMessageResourceName = "StringMinMaxLength", ErrorMessageResourceType = typeof(CommonLabels), MinimumLength = 0)]
        //[ReadOnlyField(Type = DbType.String)]
        //[System.ComponentModel.DataAnnotations.Schema.NotMapped]
        //public string LastNameUrdu { get; set; }

        //[Display(Name = "FullName", ResourceType = typeof(HotelInfoLabels))]
        //[StringLength(128, ErrorMessageResourceName = "StringMinMaxLength", ErrorMessageResourceType = typeof(CommonLabels), MinimumLength = 0)]
        //[ReadOnlyField(Type = DbType.String)]
        //[System.ComponentModel.DataAnnotations.Schema.NotMapped]
        //public string FullName { get; set; }

        //[Display(Name = "FullNameUrdu", ResourceType = typeof(HotelInfoLabels))]
        //[StringLength(128, ErrorMessageResourceName = "StringMinMaxLength", ErrorMessageResourceType = typeof(CommonLabels), MinimumLength = 0)]
        //[ReadOnlyField(Type = DbType.String)]
        //[System.ComponentModel.DataAnnotations.Schema.NotMapped]
        //public string FullNameUrdu { get; set; }




        public virtual BaseApp.Business.Objects.Document Document { get; set; }
    }
}
