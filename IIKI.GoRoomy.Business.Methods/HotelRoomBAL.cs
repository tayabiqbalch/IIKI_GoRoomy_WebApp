using IIKI.GoRoomy.Business.Objects;
using IIKI.BaseApp.DataAccess;
using IIKI.BaseApp.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using IIKI.BaseApp.Common;

namespace IIKI.GoRoomy.Business.Methods
{
    public class HotelRoomBAL
    {
        public static List<HotelRoom> GetList(long HotelId = 0, string SearchString = null, long OffSet = 0, long PageSize = 1000000000000, int SortColumn = 0, string SortOrder = "asc", string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    HotelRoom oObj = new HotelRoom();
                    Filters Filter = new Filters();
                    Filter.AddSqlParameters(() => oObj.OffSet, OffSet);
                    Filter.AddSqlParameters(() => oObj.PageSize, PageSize);
                    Filter.AddSqlParameters(() => oObj.SortColumn, SortColumn);
                    Filter.AddSqlParameters(() => oObj.SortOrder, SortOrder);
                    if (!string.IsNullOrEmpty(SearchString))
                        Filter.AddSqlParameters(() => oObj.SearchString, SearchString);
                    if (HotelId > 0)
                        Filter.AddSqlParameters(() => oObj.HotelId, HotelId);


                    IRepository<HotelRoom> oRepository = new Repository<HotelRoom>(uow.DataContext);
                    return oRepository.LoadSP(Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static HotelRoom Get(long Id, long HotelId = 0, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    HotelRoom oObj = new HotelRoom();
                    Filters Filter = new Filters();
                    if (Id > 0)
                        Filter.AddSqlParameters(() => oObj.Id, Id);
                    if (HotelId > 0)
                        Filter.AddSqlParameters(() => oObj.HotelId, HotelId);
                    IRepository<HotelRoom> oRepository = new Repository<HotelRoom>(uow.DataContext);
                    var list = oRepository.LoadSP(Filter);
                    if (list.Count > 0)
                        oObj = list.FirstOrDefault();
                    oObj = getSubItems(oObj);
                    return oObj;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static HotelRoom getSubItems(HotelRoom oObj)
        {
            oObj.RoomImages = IIKI.BaseApp.Business.Methods.EntityDocumentBAL.GetList((int)IIKI.GoRoomy.Common.EntityTypes.Rooms, oObj.Id);

            //oObj.Hotel = IIKI.GoRoomy.Business.Methods.HotelBAL.Get(oObj.HotelId);
            oObj.HotelRoomSlotsList = IIKI.GoRoomy.Business.Methods.HotelRoomSlotBAL.GetList(oObj.Id);
            oObj.RoomSlotsIdsCSV= string.Join(",", oObj.HotelRoomSlotsList.Select(x => x.HotelSlotId));
            oObj.RoomSlotsIdsList= oObj.HotelRoomSlotsList.Select(x => x.HotelSlotId).ToList();

            return oObj;
        }

        public static long Add(HotelRoom oHotelRoom, string connectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(connectionStringName))
                {
                    IRepository<HotelRoom> repository = new Repository<HotelRoom>(uow.DataContext);

                    long insertedId = repository.Insert(oHotelRoom);
                    if (insertedId > 0 && !string.IsNullOrEmpty(oHotelRoom.RoomSlotsIdsCSV))
                    {
                        oHotelRoom.Id = insertedId;
                        AddRoomSlots(oHotelRoom);
                    }

                    return insertedId;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static void AddRoomSlots(HotelRoom hotelRoom)
        {
            try
            {
                var roomSlotIds = hotelRoom.RoomSlotsIdsCSV.ToList<int>();

                foreach (var slotId in roomSlotIds)
                {
                    var slot = new HotelRoomSlot
                    {
                        HotelRoomId = hotelRoom.Id,
                        HotelSlotId = slotId,
                        RecordStatus = (int)IIKI.BaseApp.Common.CommonStatus.RecordStatus.Active,
                        CreatedBy = hotelRoom.CreatedBy,
                        UpdatedBy = hotelRoom.CreatedBy,
                        CreatedDate = hotelRoom.CreatedDate,
                        UpdatedDate = hotelRoom.UpdatedDate
                    };

                    HotelRoomSlotBAL.Add(slot);

                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static long Update(HotelRoom oHotelRoom, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelRoom> oRepository = new Repository<HotelRoom>(uow.DataContext);
                    Filter.AddParameters(() => oHotelRoom.Id, OperatorsList.Equal, oHotelRoom.Id);
                    long updateId = oRepository.Update(oHotelRoom, Filter);

                    // Delete existing slots
                    HotelRoomSlotBAL.Delete(oHotelRoom.Id);

                    AddRoomSlots(oHotelRoom);

                    return updateId;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static long Delete(HotelRoom oHotelRoom, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelRoom> oRepository = new Repository<HotelRoom>(uow.DataContext);
                    Filter.AddParameters(() => oHotelRoom.Id, OperatorsList.Equal, oHotelRoom.Id);
                    return oRepository.Delete(oHotelRoom, Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}