using IIKI.GoRoomy.Business.Objects;
using IIKI.BaseApp.DataAccess;
using IIKI.BaseApp.Utils;
using System;
using System.Collections.Generic;
using System.Linq;

namespace IIKI.GoRoomy.Business.Methods
{
    public class HotelAddressBAL
    {
        public static List<HotelAddress> GetList(string SearchString = null, long OffSet = 0, long PageSize = 1000000000000, int SortColumn = 0, string SortOrder = "asc", string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    HotelAddress oObj = new HotelAddress();
                    Filters Filter = new Filters();
                    Filter.AddSqlParameters(() => oObj.OffSet, OffSet);
                    Filter.AddSqlParameters(() => oObj.PageSize, PageSize);
                    Filter.AddSqlParameters(() => oObj.SortColumn, SortColumn);
                    Filter.AddSqlParameters(() => oObj.SortOrder, SortOrder);
                    if (!string.IsNullOrEmpty(SearchString))
                        Filter.AddSqlParameters(() => oObj.SearchString, SearchString);
                    IRepository<HotelAddress> oRepository = new Repository<HotelAddress>(uow.DataContext);
                    return oRepository.LoadSP(Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static HotelAddress Get(long Id, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    HotelAddress oObj = new HotelAddress();
                    Filters Filter = new Filters();
                    Filter.AddSqlParameters(() => oObj.Id, Id);
                    IRepository<HotelAddress> oRepository = new Repository<HotelAddress>(uow.DataContext);
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

        public static long Add(HotelAddress oHotelAddress, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelAddress> oRepository = new Repository<HotelAddress>(uow.DataContext);
                    return oRepository.Insert(oHotelAddress);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static long Update(HotelAddress oHotelAddress, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelAddress> oRepository = new Repository<HotelAddress>(uow.DataContext);
                    Filter.AddParameters(() => oHotelAddress.Id, OperatorsList.Equal, oHotelAddress.Id);
                    return oRepository.Update(oHotelAddress, Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static long Delete(HotelAddress oHotelAddress, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelAddress> oRepository = new Repository<HotelAddress>(uow.DataContext);
                    Filter.AddParameters(() => oHotelAddress.Id, OperatorsList.Equal, oHotelAddress.Id);
                    return oRepository.Delete(oHotelAddress, Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}