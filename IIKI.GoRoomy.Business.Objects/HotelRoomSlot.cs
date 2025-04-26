using IIKI.BaseApp.Localization.Resources;
using IIKI.BaseApp.Utils;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System;
using IIKI.BaseApp.Business.Objects;
using IIKI.BaseApp.Common;

namespace IIKI.GoRoomy.Business.Objects
{
    [DataTable("dbo.tblHotelRoomSlots")]
    [StoreProcedure("dbo.usp_GetHotelRoomSlots")]
    public class HotelRoomSlot : BaseEntity
    {
        [DataField(IsShowInGrid = false, IsShowOnForm = false, Type = DbType.Int64, FieldOrderOnForm = 0.1f, RenderMode = BaseApp.Common.InputRenderModes.Hidden)]
        [Display(Name = "HotelRoomId", Prompt = "HotelRoomId"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.GoRoomy.Localization.Resources.HotelRoomLabels))]
        [Required(ErrorMessageResourceName = "HotelRoomIdRequired"/*, AllowEmptyStrings = false*/, ErrorMessageResourceType = typeof(IIKI.GoRoomy.Localization.Resources.HotelRoomLabels))]
        public long HotelRoomId { get; set; }

        [DataField(Type = DbType.Int32, IsShowInGrid = false, FieldOrderOnForm = 0.1f, RenderMode = BaseApp.Common.InputRenderModes.Dropdown)]
        [Display(Name = "HotelSlotId", Prompt = "HotelSlotId"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.GoRoomy.Localization.Resources.HotelSlotLabels))]
        [Required(ErrorMessageResourceName = "HotelSlotIdRequired"/*, AllowEmptyStrings = false*/, ErrorMessageResourceType = typeof(IIKI.GoRoomy.Localization.Resources.HotelSlotLabels))]
        public int HotelSlotId { get; set; }

        [DataField(Type = DbType.Decimal, IsShowInGrid = true, FieldOrderInGrid = 2)]
        [Display(Name = "Rate", Prompt = "Rate"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/, ResourceType = typeof(IIKI.GoRoomy.Localization.Resources.HotelSlotLabels))]
        [Required(ErrorMessageResourceName = "RateRequired"/*, AllowEmptyStrings = false*/, ErrorMessageResourceType = typeof(IIKI.GoRoomy.Localization.Resources.HotelSlotLabels))]
        public decimal Rate { get; set; }

        [DataField(Type = DbType.Int32, IsShowOnForm = false)]
        [Display(Name = "RecordStatus", ResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels))]
        public int? RecordStatus { get; set; }

        [DataField(Type = DbType.String, IsShowOnForm = false, IsShowInGrid = false)]
        [Display(Name = "CreatedBy", ResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels))]
        public string CreatedBy { get; set; }

        [DataField(Type = DbType.DateTimeOffset, IsShowOnForm = false, IsShowInGrid = false)]
        [Display(Name = "CreatedDate", ResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels))]
        public DateTimeOffset? CreatedDate { get; set; }

        [DataField(Type = DbType.String, IsShowOnForm = false, IsShowInGrid = false)]
        [Display(Name = "UpdatedBy", ResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels))]
        public string UpdatedBy { get; set; }

        [DataField(Type = DbType.DateTimeOffset, IsShowOnForm = false, IsShowInGrid = false)]
        [Display(Name = "UpdatedDate", ResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels))]
        public DateTimeOffset? UpdatedDate { get; set; }


        [Display(Name = "TotalCount", ResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels))]
        [ReadOnlyField(Type = DbType.Int32, IsShowInGrid = false)]
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public int TotalCount { get; set; }




        [Display(Name = "HotelName", ResourceType = typeof(IIKI.GoRoomy.Localization.Resources.HotelLabels))]
        [ReadOnlyField(Type = DbType.Int64, IsShowInGrid = false, RenderMode = BaseApp.Common.InputRenderModes.Hidden)]
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public long HotelId { get; set; }

        [Display(Name = "HotelName", ResourceType = typeof(IIKI.GoRoomy.Localization.Resources.HotelLabels))]
        [ReadOnlyField(Type = DbType.String, IsShowInGrid = false)]
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public string HotelName { get; set; }

        [Display(Name = "SlotDescription", ResourceType = typeof(IIKI.GoRoomy.Localization.Resources.HotelSlotLabels))]
        [ReadOnlyField(Type = DbType.String, IsShowInGrid = true, FieldOrderInGrid = 1)]
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public string SlotDescription { get; set; }


        [Display(Name = "RoomNumber", ResourceType = typeof(IIKI.GoRoomy.Localization.Resources.HotelRoomLabels))]
        [ReadOnlyField(Type = DbType.String, IsShowInGrid = false)]
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public string RoomNumber { get; set; }

        [Display(Name = "RoomNumber", ResourceType = typeof(IIKI.GoRoomy.Localization.Resources.HotelRoomLabels))]
        [ReadOnlyField(Type = DbType.String, IsShowInGrid = false)]
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public string RoomName { get; set; }

    }

}