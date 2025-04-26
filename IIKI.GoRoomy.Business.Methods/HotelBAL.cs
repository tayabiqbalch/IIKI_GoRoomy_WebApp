using IIKI.GoRoomy.Business.Objects;
using IIKI.BaseApp.DataAccess;
using IIKI.BaseApp.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;

namespace IIKI.GoRoomy.Business.Methods
{
    public class HotelBAL
    {
        public static List<Hotel> GetList(string SearchString = null, long OffSet = 0, long PageSize = 1000000000000, int SortColumn = 0, string SortOrder = "asc", string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Hotel oObj = new Hotel();
                    Filters Filter = new Filters();
                    Filter.AddSqlParameters(() => oObj.OffSet, OffSet);
                    Filter.AddSqlParameters(() => oObj.PageSize, PageSize);
                    Filter.AddSqlParameters(() => oObj.SortColumn, SortColumn);
                    Filter.AddSqlParameters(() => oObj.SortOrder, SortOrder);
                    if (!string.IsNullOrEmpty(SearchString))
                        Filter.AddSqlParameters(() => oObj.SearchString, SearchString);
                    IRepository<Hotel> oRepository = new Repository<Hotel>(uow.DataContext);
                    return oRepository.LoadSP(Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<Hotel> GetWithDependentsList(string SearchString = null, long OffSet = 0, long PageSize = 1000000000000, int SortColumn = 0, string SortOrder = "asc", string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Hotel oObj = new Hotel();
                    Filters Filter = new Filters();
                    Filter.AddSqlParameters(() => oObj.OffSet, OffSet);
                    Filter.AddSqlParameters(() => oObj.PageSize, PageSize);
                    Filter.AddSqlParameters(() => oObj.SortColumn, SortColumn);
                    Filter.AddSqlParameters(() => oObj.SortOrder, SortOrder);
                    if (!string.IsNullOrEmpty(SearchString))
                        Filter.AddSqlParameters(() => oObj.SearchString, SearchString);
                    IRepository<Hotel> oRepository = new Repository<Hotel>(uow.DataContext);
                    var list = oRepository.LoadWithDependentsSP(Filter, "usp_GetHotelWithDependents");
                    list = GetWithDependents(list);

                    return list;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<Hotel> GetWithDependents(List<Hotel> hotels)
        {
            try
            {
                foreach (var oObj in hotels)
                {
                    oObj.HotelServices = IIKI.GoRoomy.Business.Methods.HotelRoomServiceBAL.GetList(HotelId: oObj.Id);
                }
                return hotels;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static Hotel Get(long Id, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Hotel oObj = new Hotel();
                    Filters Filter = new Filters();
                    Filter.AddSqlParameters(() => oObj.Id, Id);
                    IRepository<Hotel> oRepository = new Repository<Hotel>(uow.DataContext);
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

        private static Hotel getSubItems(Hotel oObj)
        {
            oObj.HotelImages = IIKI.BaseApp.Business.Methods.EntityDocumentBAL.GetList((int)IIKI.GoRoomy.Common.EntityTypes.Hotels, oObj.Id);

            oObj.HotelRooms = IIKI.GoRoomy.Business.Methods.HotelRoomBAL.GetList(HotelId: oObj.Id);
            oObj.HotelPolicies = IIKI.GoRoomy.Business.Methods.HotelPolicyBAL.GetList(HotelId: oObj.Id);
            oObj.HotelServices = IIKI.GoRoomy.Business.Methods.HotelRoomServiceBAL.GetList(HotelId: oObj.Id);

            return oObj;
        }

        public static long Add(Hotel oHotel, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<Hotel> oRepository = new Repository<Hotel>(uow.DataContext);
                    return oRepository.Insert(oHotel);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static long Update(Hotel oHotel, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<Hotel> oRepository = new Repository<Hotel>(uow.DataContext);
                    Filter.AddParameters(() => oHotel.Id, OperatorsList.Equal, oHotel.Id);
                    return oRepository.Update(oHotel, Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static long Delete(Hotel oHotel, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<Hotel> oRepository = new Repository<Hotel>(uow.DataContext);
                    Filter.AddParameters(() => oHotel.Id, OperatorsList.Equal, oHotel.Id);
                    return oRepository.Delete(oHotel, Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}