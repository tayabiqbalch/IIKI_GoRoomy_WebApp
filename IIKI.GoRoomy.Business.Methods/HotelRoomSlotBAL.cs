
using System.Collections.Generic;
using IIKI.BaseApp.Business.Objects;
using IIKI.BaseApp.DataAccess;
using System.Linq;
using IIKI.BaseApp.Utils;
using System;
using IIKI.GoRoomy.Business.Objects;
using IIKI;

namespace IIKI.GoRoomy.Business.Methods
{
    public class HotelRoomSlotBAL
    {
        public static List<HotelRoomSlot> GetList(long RoomId = 0, string SearchString = null, long OffSet = 0, long PageSize = 1000000000000, int SortColumn = 0, string SortOrder = "asc", string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    HotelRoomSlot oObj = new HotelRoomSlot();
                    Filters Filter = new Filters();
                    Filter.AddSqlParameters(() => oObj.OffSet, OffSet);
                    Filter.AddSqlParameters(() => oObj.PageSize, PageSize);
                    Filter.AddSqlParameters(() => oObj.SortColumn, SortColumn);
                    Filter.AddSqlParameters(() => oObj.SortOrder, SortOrder);
                    if (RoomId > 0)
                        Filter.AddSqlParameters(() => oObj.HotelRoomId, RoomId);

                    if (!string.IsNullOrEmpty(SearchString))
                        Filter.AddSqlParameters(() => oObj.SearchString, SearchString);
                    IRepository<HotelRoomSlot> oRepository = new Repository<HotelRoomSlot>(uow.DataContext);
                    return oRepository.LoadSP(Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static HotelRoomSlot Get(long Id, long RoomId = 0, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    HotelRoomSlot oObj = new HotelRoomSlot();
                    Filters Filter = new Filters();
                    if (RoomId > 0)
                        Filter.AddSqlParameters(() => oObj.HotelRoomId, RoomId);
                    if (Id > 0)
                        Filter.AddSqlParameters(() => oObj.Id, Id);
                    IRepository<HotelRoomSlot> oRepository = new Repository<HotelRoomSlot>(uow.DataContext);
                    var list = oRepository.LoadSP(Filter);
                    if (list.Count > 0)
                        return list.FirstOrDefault();
                    return oObj;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static long Add(HotelRoomSlot oHotelRoomSlot, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelRoomSlot> oRepository = new Repository<HotelRoomSlot>(uow.DataContext);
                    return oRepository.Insert(oHotelRoomSlot);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static long Update(HotelRoomSlot oHotelRoomSlot, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelRoomSlot> oRepository = new Repository<HotelRoomSlot>(uow.DataContext);
                    Filter.AddParameters(() => oHotelRoomSlot.Id, OperatorsList.Equal, oHotelRoomSlot.Id);
                    return oRepository.Update(oHotelRoomSlot, Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static long Delete(HotelRoomSlot oHotelRoomSlot, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelRoomSlot> oRepository = new Repository<HotelRoomSlot>(uow.DataContext);
                    Filter.AddParameters(() => oHotelRoomSlot.Id, OperatorsList.Equal, oHotelRoomSlot.Id);
                    return oRepository.Delete(oHotelRoomSlot, Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static long Delete(long HotelRoomId, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                HotelRoomSlot oObj = new HotelRoomSlot();
                oObj.HotelRoomId = HotelRoomId;
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelRoomSlot> oRepository = new Repository<HotelRoomSlot>(uow.DataContext);
                    Filter.AddParameters(() => oObj.HotelRoomId, OperatorsList.Equal, HotelRoomId);
                    return oRepository.Delete(oObj, Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static List<long> GetHotelSlotIds(long HotelRoomId, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    HotelRoomSlot oObj = new HotelRoomSlot();
                    Filters Filter = new Filters();
                    Filter.AddSqlParameters(() => oObj.HotelRoomId, HotelRoomId);
                    IRepository<HotelRoomSlot> oRepository = new Repository<HotelRoomSlot>(uow.DataContext);
                    var list = oRepository.LoadQuery<HotelRoomSlot>("Select Id, HotelSlotId from HotelRoomSlots Where HotelRoomId=@HotelRoomId ", Filter);

                    return list.Select(x => x.HotelRoomId).ToList();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}