
using System.Collections.Generic;
using IIKI.BaseApp.DataAccess;
using System.Linq;
using IIKI.BaseApp.Utils;
using System;
using IIKI.GoRoomy.Business.Objects;

namespace IIKI.GoRoomy.Business.Methods
{
    public class HotelRoomServiceBAL
    {
        public static List<HotelRoomService> GetList(long HotelId=0, long RoomId=0,string SearchString = null, long OffSet = 0, long PageSize = 1000000000000, int SortColumn = 0, string SortOrder = "asc", string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    HotelRoomService oObj = new HotelRoomService();
                    Filters Filter = new Filters();
                    Filter.AddSqlParameters(() => oObj.OffSet, OffSet);
                    Filter.AddSqlParameters(() => oObj.PageSize, PageSize);
                    Filter.AddSqlParameters(() => oObj.SortColumn, SortColumn);
                    Filter.AddSqlParameters(() => oObj.SortOrder, SortOrder);
                    if (!string.IsNullOrEmpty(SearchString))
                    {
                        Filter.AddSqlParameters(() => oObj.SearchString, SearchString);
                    }

                    if (HotelId > 0)
                    {
                        Filter.AddSqlParameters(()=>oObj.HotelId, HotelId);
                    }
                    if (RoomId > 0)
                    {
                        Filter.AddSqlParameters(() => oObj.RoomId, RoomId);
                    }

                    IRepository<HotelRoomService> oRepository = new Repository<HotelRoomService>(uow.DataContext);
                    return oRepository.LoadSP(Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static HotelRoomService Get(long Id, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    HotelRoomService oObj = new HotelRoomService();
                    Filters Filter = new Filters();
                    Filter.AddSqlParameters(() => oObj.Id, Id);
                    IRepository<HotelRoomService> oRepository = new Repository<HotelRoomService>(uow.DataContext);
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

        public static long Add(HotelRoomService oHotelRoomService, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelRoomService> oRepository = new Repository<HotelRoomService>(uow.DataContext);
                    return oRepository.Insert(oHotelRoomService);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static long Update(HotelRoomService oHotelRoomService, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelRoomService> oRepository = new Repository<HotelRoomService>(uow.DataContext);
                    Filter.AddParameters(() => oHotelRoomService.Id, OperatorsList.Equal, oHotelRoomService.Id);
                    return oRepository.Update(oHotelRoomService, Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static long Delete(HotelRoomService oHotelRoomService, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelRoomService> oRepository = new Repository<HotelRoomService>(uow.DataContext);
                    Filter.AddParameters(() => oHotelRoomService.Id, OperatorsList.Equal, oHotelRoomService.Id);
                    return oRepository.Delete(oHotelRoomService, Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}
