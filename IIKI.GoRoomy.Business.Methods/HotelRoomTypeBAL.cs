using IIKI.GoRoomy.Business.Objects;
using IIKI.BaseApp.DataAccess;
using IIKI.BaseApp.Utils;
using System;
using System.Collections.Generic;
using System.Linq;

namespace IIKI.GoRoomy.Business.Methods
{
    public class HotelRoomTypeBAL
    {
        public static List<HotelRoomType> GetList(long HotelId = 0, string SearchString = null, long OffSet = 0, long PageSize = 1000000000000, int SortColumn = 0, string SortOrder = "asc", string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    HotelRoomType oObj = new HotelRoomType();
                    Filters Filter = new Filters();
                    if (HotelId > 0)
                        Filter.AddSqlParameters(() => oObj.HotelId, HotelId);

                    Filter.AddSqlParameters(() => oObj.OffSet, OffSet);
                    Filter.AddSqlParameters(() => oObj.PageSize, PageSize);
                    Filter.AddSqlParameters(() => oObj.SortColumn, SortColumn);
                    Filter.AddSqlParameters(() => oObj.SortOrder, SortOrder);
                    if (!string.IsNullOrEmpty(SearchString))
                        Filter.AddSqlParameters(() => oObj.SearchString, SearchString);
                    IRepository<HotelRoomType> oRepository = new Repository<HotelRoomType>(uow.DataContext);
                    return oRepository.LoadSP(Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static HotelRoomType Get(long Id, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    HotelRoomType oObj = new HotelRoomType();
                    Filters Filter = new Filters();
                    Filter.AddSqlParameters(() => oObj.Id, Id);
                    IRepository<HotelRoomType> oRepository = new Repository<HotelRoomType>(uow.DataContext);
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

        public static long Add(HotelRoomType oHotelRoomType, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelRoomType> oRepository = new Repository<HotelRoomType>(uow.DataContext);
                    return oRepository.Insert(oHotelRoomType);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static long Update(HotelRoomType oHotelRoomType, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelRoomType> oRepository = new Repository<HotelRoomType>(uow.DataContext);
                    Filter.AddParameters(() => oHotelRoomType.Id, OperatorsList.Equal, oHotelRoomType.Id);
                    return oRepository.Update(oHotelRoomType, Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static long Delete(HotelRoomType oHotelRoomType, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelRoomType> oRepository = new Repository<HotelRoomType>(uow.DataContext);
                    Filter.AddParameters(() => oHotelRoomType.Id, OperatorsList.Equal, oHotelRoomType.Id);
                    return oRepository.Delete(oHotelRoomType, Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}