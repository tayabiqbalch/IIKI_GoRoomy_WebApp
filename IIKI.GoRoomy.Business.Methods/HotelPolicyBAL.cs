
using System.Collections.Generic;
using IIKI.BaseApp.Business.Objects;
using IIKI.BaseApp.DataAccess;
using System.Linq;
using IIKI.BaseApp.Utils;
using System;
using IIKI.GoRoomy.Business.Objects;
namespace IIKI.GoRoomy.Business.Methods
{
    public class HotelPolicyBAL
    {
        public static List<HotelPolicy> GetList(long HotelId=0,string SearchString = null, long OffSet = 0, long PageSize = 1000000000000, int SortColumn = 0, string SortOrder = "asc", string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    HotelPolicy oObj = new HotelPolicy();
                    Filters Filter = new Filters();
                    Filter.AddSqlParameters(() => oObj.OffSet, OffSet);
                    Filter.AddSqlParameters(() => oObj.PageSize, PageSize);
                    Filter.AddSqlParameters(() => oObj.SortColumn, SortColumn);
                    Filter.AddSqlParameters(() => oObj.SortOrder, SortOrder);
                    if (!string.IsNullOrEmpty(SearchString))
                        Filter.AddSqlParameters(() => oObj.SearchString, SearchString);
                    if (HotelId > 0)
                        Filter.AddSqlParameters(() => oObj.HotelId, HotelId);

                    IRepository<HotelPolicy> oRepository = new Repository<HotelPolicy>(uow.DataContext);
                    return oRepository.LoadSP(Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static HotelPolicy Get(long Id, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    HotelPolicy oObj = new HotelPolicy();
                    Filters Filter = new Filters();
                    Filter.AddSqlParameters(() => oObj.Id, Id);
                    IRepository<HotelPolicy> oRepository = new Repository<HotelPolicy>(uow.DataContext);
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

        public static long Add(HotelPolicy oHotelPolicy, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelPolicy> oRepository = new Repository<HotelPolicy>(uow.DataContext);
                    return oRepository.Insert(oHotelPolicy);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static long Update(HotelPolicy oHotelPolicy, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelPolicy> oRepository = new Repository<HotelPolicy>(uow.DataContext);
                    Filter.AddParameters(() => oHotelPolicy.Id, OperatorsList.Equal, oHotelPolicy.Id);
                    return oRepository.Update(oHotelPolicy, Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static long Delete(HotelPolicy oHotelPolicy, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelPolicy> oRepository = new Repository<HotelPolicy>(uow.DataContext);
                    Filter.AddParameters(() => oHotelPolicy.Id, OperatorsList.Equal, oHotelPolicy.Id);
                    return oRepository.Delete(oHotelPolicy, Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}