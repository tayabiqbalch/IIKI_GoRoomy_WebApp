
using System.Collections.Generic;
using IIKI.BaseApp.Business.Objects;
using IIKI.BaseApp.DataAccess;
using System.Linq;
using IIKI.BaseApp.Utils;
using System;
using IIKI.GoRoomy.Business.Objects;

namespace IIKI.GoRoomy.Business.Methods
{
    public class HotelSlotBAL
    {
        public static List<HotelSlot> GetList(string SearchString = null, long OffSet = 0, long PageSize = 1000000000000, int SortColumn = 0, string SortOrder = "asc", string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    HotelSlot oObj = new HotelSlot();
                    Filters Filter = new Filters();
                    Filter.AddSqlParameters(() => oObj.OffSet, OffSet);
                    Filter.AddSqlParameters(() => oObj.PageSize, PageSize);
                    Filter.AddSqlParameters(() => oObj.SortColumn, SortColumn);
                    Filter.AddSqlParameters(() => oObj.SortOrder, SortOrder);
                    if (!string.IsNullOrEmpty(SearchString))
                        Filter.AddSqlParameters(() => oObj.SearchString, SearchString);
                    IRepository<HotelSlot> oRepository = new Repository<HotelSlot>(uow.DataContext);
                    return oRepository.LoadSP(Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static HotelSlot Get(long Id, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    HotelSlot oObj = new HotelSlot();
                    Filters Filter = new Filters();
                    Filter.AddSqlParameters(() => oObj.Id, Id);
                    IRepository<HotelSlot> oRepository = new Repository<HotelSlot>(uow.DataContext);
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

        public static long Add(HotelSlot oHotelSlot, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelSlot> oRepository = new Repository<HotelSlot>(uow.DataContext);
                    return oRepository.Insert(oHotelSlot);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static long Update(HotelSlot oHotelSlot, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelSlot> oRepository = new Repository<HotelSlot>(uow.DataContext);
                    Filter.AddParameters(() => oHotelSlot.Id, OperatorsList.Equal, oHotelSlot.Id);
                    return oRepository.Update(oHotelSlot, Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static long Delete(HotelSlot oHotelSlot, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelSlot> oRepository = new Repository<HotelSlot>(uow.DataContext);
                    Filter.AddParameters(() => oHotelSlot.Id, OperatorsList.Equal, oHotelSlot.Id);
                    return oRepository.Delete(oHotelSlot, Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}