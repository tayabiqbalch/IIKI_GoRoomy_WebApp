using IIKI.GoRoomy.Business.Objects;
using IIKI.BaseApp.DataAccess;
using IIKI.BaseApp.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using IIKI.BaseApp.Business.Methods;

namespace IIKI.GoRoomy.Business.Methods
{
    public class HotelDocumentBAL : BaseBAL
    {

        public static List<HotelDocument> GetList(long HotelId = 0, int RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.All, string SearchString = null, long OffSet = 0, long PageSize = 1000000000000, int SortColumn = 0, string SortOrder = "asc", string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    HotelDocument oObj = new HotelDocument();
                    Filters Filter = new Filters();
                    if (HotelId > 0)
                        Filter.AddSqlParameters(() => oObj.HotelId, HotelId);

                    Filter.AddSqlParameters(() => oObj.OffSet, OffSet);
                    Filter.AddSqlParameters(() => oObj.PageSize, PageSize);
                    Filter.AddSqlParameters(() => oObj.SortColumn, SortColumn);
                    Filter.AddSqlParameters(() => oObj.SortOrder, SortOrder);
                    if (!string.IsNullOrEmpty(SearchString))
                        Filter.AddSqlParameters(() => oObj.SearchString, SearchString);

                    Filter.AddSqlParameters(() => oObj.RecordStatus, RecordStatus);

                    if (RecordStatus == IIKI.BaseApp.Common.CommonStatus.RecordStatus.All)
                        Filter.AddSqlParameters(() => oObj.Command, IIKI.BaseApp.Common.SQLCommandTypes.AllRecordStatus.ToString());

                    IRepository<HotelDocument> oRepository = new Repository<HotelDocument>(uow.DataContext);
                    return oRepository.LoadSP(Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static HotelDocument Get(long Id, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    HotelDocument oObj = new HotelDocument();
                    Filters Filter = new Filters();
                    Filter.AddSqlParameters(() => oObj.Id, Id);

                    IRepository<HotelDocument> oRepository = new Repository<HotelDocument>(uow.DataContext);
                    var list = oRepository.LoadSP(Filter);
                    if (list.Count > 0)
                    {
                        return list.FirstOrDefault();
                    }
                    return oObj;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static long Add(HotelDocument oHotelDocument, string ConnStringName = "DefaultConnection")
        {
            try
            {
                Filters filter = new Filters();
                using (IUnitOfWork uow = new UnitOfWork(ConnStringName))
                {
                    IRepository<HotelDocument> oRepository = new Repository<HotelDocument>(uow.DataContext);
                    return oRepository.Insert(oHotelDocument);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool Update(HotelDocument oHotelDocument, string ConnStringName = "DefaultConnection")
        {
            try
            {
                bool result = true;
                using (IUnitOfWork uow = new UnitOfWork(ConnStringName))
                {
                    IRepository<HotelDocument> oRepository = new Repository<HotelDocument>(uow.DataContext);
                    Filters Filter = new Filters();
                    Filter.AddParameters(() => oHotelDocument.Id, OperatorsList.Equal, oHotelDocument.Id);
                    oRepository.Update(oHotelDocument, Filter);
                    return result;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool Delete(HotelDocument oHotelDocument, string ConnStringName = "DefaultConnection")
        {
            try
            {
                bool result = true;
                using (IUnitOfWork uow = new UnitOfWork(ConnStringName))
                {
                    IRepository<HotelDocument> oRepository = new Repository<HotelDocument>(uow.DataContext);
                    Filters Filter = new Filters();
                    Filter.AddParameters(() => oHotelDocument.Id, OperatorsList.Equal, oHotelDocument.Id);
                    oRepository.Delete(oHotelDocument, Filter);
                    return result;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
