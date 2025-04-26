
using System;
using System.Data;
using IIKI.BaseApp.Utils;
using System.ComponentModel.DataAnnotations;
using System;

namespace IIKI.GoRoomy.Business.Objects
{
    [DataTable("dbo.tblHotelPolicies")]
    [StoreProcedure("dbo.usp_GetHotelPolicies")]
    public class HotelPolicy : IIKI.BaseApp.Business.Objects.BaseEntity
    {

        [DataField(Type = DbType.Int64)]
        [Display(Name = "Id", Prompt = "Id"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/)]
        [Required(ErrorMessage = "Id is Required"/*, AllowEmptyStrings = false*/)]
        public long Id { get; set; }

        [DataField(Type = DbType.Int64)]
        [Display(Name = "HotelId", Prompt = "HotelId"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/)]
        [Required(ErrorMessage = "HotelId is Required"/*, AllowEmptyStrings = false*/)]
        public long? HotelId { get; set; }

        [DataField(Type = DbType.Int64)]
        [Display(Name = "RoomId", Prompt = "RoomId"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/)]
        [Required(ErrorMessage = "RoomId is Required"/*, AllowEmptyStrings = false*/)]
        public long? RoomId { get; set; }

        [DataField(Type = DbType.Int32)]
        [Display(Name = "PolicyType", Prompt = "PolicyType"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/)]

        [Required(ErrorMessage = "PolicyType is Required"/*, AllowEmptyStrings = false*/)]
        public byte? PolicyType { get; set; }

        [DataField(Type = DbType.String)]
        [Display(Name = "RecordName", Prompt = "RecordName"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/)]
        [Required(ErrorMessage = "RecordName is Required"/*, AllowEmptyStrings = false*/)]

        [StringLength(100, ErrorMessage = "StringMinMaxLength", MinimumLength = 0)]
        public string PolicyTypeName { get; set; }

        [DataField(Type = DbType.String)]
        [Display(Name = "RecordDescription", Prompt = "RecordDescription"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/)]

        [Required(ErrorMessage = "RecordDescription is Required"/*, AllowEmptyStrings = false*/)]

        [StringLength(512, ErrorMessage = "StringMinMaxLength", MinimumLength = 0)]
        public string PolicyDescription { get; set; }

        [DataField(Type = DbType.Int32, IsShowOnForm = false)]
        [Display(Name = "RecordStatus", Prompt = "RecordStatus"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/)]
        public byte RecordStatus { get; set; }

        [DataField(Type = DbType.String, IsShowOnForm = false, IsShowInGrid = false)]
        [Display(Name = "CreatedBy", Prompt = "CreatedBy"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/)]
        public string CreatedBy { get; set; }

        [DataField(Type = DbType.DateTimeOffset, IsShowOnForm = false, IsShowInGrid = false)]
        [Display(Name = "CreatedDate", Prompt = "CreatedDate"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/)]
        public DateTimeOffset? CreatedDate { get; set; }

        [DataField(Type = DbType.String, IsShowOnForm = false, IsShowInGrid = false)]
        [Display(Name = "UpdatedBy", Prompt = "UpdatedBy"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/)]
        public string UpdatedBy { get; set; }

        [DataField(Type = DbType.DateTimeOffset, IsShowOnForm = false, IsShowInGrid = false)]
        [Display(Name = "UpdatedDate", Prompt = "UpdatedDate"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/)]
        public DateTimeOffset? UpdatedDate { get; set; }

    }
}

