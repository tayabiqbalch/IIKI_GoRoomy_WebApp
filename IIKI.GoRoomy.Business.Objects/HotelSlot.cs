using IIKI.BaseApp.Localization.Resources;
using IIKI.BaseApp.Utils;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System;
using IIKI.BaseApp.Business.Objects;

namespace IIKI.GoRoomy.Business.Objects
{
    [DataTable("dbo.tblHotelSlots")]
    [StoreProcedure("dbo.usp_GetHotelSlots")]
    public class HotelSlot : BaseEntity
    {
        [DataField(Type = DbType.String, IsShowInGrid = false)]
        [Display(Name = "RecordDescription", Prompt = "RecordDescription"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels))]
        [Required(ErrorMessageResourceName = "RecordDescriptionRequired"/*, AllowEmptyStrings = false*/, ErrorMessageResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels))]
        [DropDownText]
        [StringLength(100, ErrorMessageResourceName = "StringMinMaxLength", ErrorMessageResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels), MinimumLength = 0)]
        public string SlotDescription { get; set; }

        [DataField(Type = DbType.Decimal)]
        [Display(Name = "SlotHours", Prompt = "SlotHours"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.GoRoomy.Localization.Resources.HotelSlotLabels))]
        [Required(ErrorMessageResourceName = "SlotHoursRequired"/*, AllowEmptyStrings = false*/, ErrorMessageResourceType = typeof(IIKI.GoRoomy.Localization.Resources.HotelSlotLabels))]
        public decimal SlotHours { get; set; }

        [DataField(Type = DbType.Decimal)]
        [Display(Name = "SlotMinRate", Prompt = "SlotMinRate"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.GoRoomy.Localization.Resources.HotelSlotLabels))]
        [Required(ErrorMessageResourceName = "SlotMinRateRequired"/*, AllowEmptyStrings = false*/, ErrorMessageResourceType = typeof(IIKI.GoRoomy.Localization.Resources.HotelSlotLabels))]
        public decimal SlotMinRate { get; set; }

        [DataField(Type = DbType.Decimal)]
        [Display(Name = "SlotMaxRate", Prompt = "SlotMaxRate"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.GoRoomy.Localization.Resources.HotelSlotLabels))]
        [Required(ErrorMessageResourceName = "SlotMaxRateRequired"/*, AllowEmptyStrings = false*/, ErrorMessageResourceType = typeof(IIKI.GoRoomy.Localization.Resources.HotelSlotLabels))]
        public decimal SlotMaxRate { get; set; }

        [DataField(Type = DbType.Decimal)]
        [Display(Name = "Rate", Prompt = "Rate"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.GoRoomy.Localization.Resources.HotelSlotLabels))]
        [Required(ErrorMessageResourceName = "RateRequired"/*, AllowEmptyStrings = false*/, ErrorMessageResourceType = typeof(IIKI.GoRoomy.Localization.Resources.HotelSlotLabels))]
        public decimal SlotRate { get; set; }

        [Display(Name = "TotalCount", ResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels))]
        [ReadOnlyField(Type = DbType.Int32, IsShowInGrid = false)]
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public int TotalCount { get; set; }
    }

}