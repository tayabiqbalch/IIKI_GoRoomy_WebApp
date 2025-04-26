using IIKI.GoRoomy.Business.Objects;
using IIKI.BaseApp.DataAccess;
using IIKI.BaseApp.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using IIKI.BaseApp.Business.Objects;

namespace IIKI.GoRoomy.Business.Methods
{
    public class HotelCategoryBAL
    {
        public static List<HotelCategory> GetList(long ParentId = 0, int RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.All, string SearchString = null, long OffSet = 0, long PageSize = 1000000000000, int SortColumn = 0, string SortOrder = "asc", string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    HotelCategory oObj = new HotelCategory();
                    Filters Filter = new Filters();
                    Filter.AddSqlParameters(() => oObj.OffSet, OffSet);
                    Filter.AddSqlParameters(() => oObj.PageSize, PageSize);
                    Filter.AddSqlParameters(() => oObj.SortColumn, SortColumn);
                    Filter.AddSqlParameters(() => oObj.SortOrder, SortOrder);
                    if (!string.IsNullOrEmpty(SearchString))
                        Filter.AddSqlParameters(() => oObj.SearchString, SearchString);
                    IRepository<HotelCategory> oRepository = new Repository<HotelCategory>(uow.DataContext);
                    return oRepository.LoadSP(Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<HotelCategory> GetParentsList(int RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.All, string SearchString = null, long OffSet = 0, long PageSize = 1000000000000, int SortColumn = 0, string SortOrder = "asc", string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    HotelCategory oObj = new HotelCategory();
                    Filters Filter = new Filters();


                    Filter.AddSqlParameters(() => oObj.Command, IIKI.BaseApp.Common.SQLCommandTypes.SelectParentOnly.ToString());

                    Filter.AddSqlParameters(() => oObj.OffSet, OffSet);
                    Filter.AddSqlParameters(() => oObj.PageSize, PageSize);
                    Filter.AddSqlParameters(() => oObj.SortColumn, SortColumn);
                    Filter.AddSqlParameters(() => oObj.SortOrder, SortOrder);
                    if (!string.IsNullOrEmpty(SearchString))
                        Filter.AddSqlParameters(() => oObj.SearchString, SearchString);

                    Filter.AddSqlParameters(() => oObj.RecordStatus, RecordStatus);


                    IRepository<HotelCategory> oRepository = new Repository<HotelCategory>(uow.DataContext);
                    return oRepository.LoadSP(Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static HotelCategory Get(long Id, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    HotelCategory oObj = new HotelCategory();
                    Filters Filter = new Filters();
                    Filter.AddSqlParameters(() => oObj.Id, Id);
                    IRepository<HotelCategory> oRepository = new Repository<HotelCategory>(uow.DataContext);
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

        public static long Add(HotelCategory oHotelCategory, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelCategory> oRepository = new Repository<HotelCategory>(uow.DataContext);
                    return oRepository.Insert(oHotelCategory);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static long Update(HotelCategory oHotelCategory, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelCategory> oRepository = new Repository<HotelCategory>(uow.DataContext);
                    Filter.AddParameters(() => oHotelCategory.Id, OperatorsList.Equal, oHotelCategory.Id);
                    return oRepository.Update(oHotelCategory, Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static long Delete(HotelCategory oHotelCategory, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelCategory> oRepository = new Repository<HotelCategory>(uow.DataContext);
                    Filter.AddParameters(() => oHotelCategory.Id, OperatorsList.Equal, oHotelCategory.Id);
                    return oRepository.Delete(oHotelCategory, Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}