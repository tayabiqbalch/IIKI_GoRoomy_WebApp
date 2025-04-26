using IIKI.GoRoomy.Business.Objects;
using IIKI.BaseApp.DataAccess;
using IIKI.BaseApp.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using IIKI.GoRoomy.Common;

namespace IIKI.GoRoomy.Business.Methods
{
    public class HotelReservationBAL
    {
        public static List<HotelReservation> GetList(HotelReservation hotelReservation = null, long OffSet = 0, long PageSize = 1000000000000, int SortColumn = 0, string SortOrder = "asc", string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    HotelReservation oObj = new HotelReservation();
                    Filters Filter = new Filters();
                    Filter.AddSqlParameters(() => oObj.OffSet, OffSet);
                    Filter.AddSqlParameters(() => oObj.PageSize, PageSize);
                    Filter.AddSqlParameters(() => oObj.SortColumn, SortColumn);
                    Filter.AddSqlParameters(() => oObj.SortOrder, SortOrder);
                    if (hotelReservation != null)
                    {
                        if (hotelReservation.HotelId > 0)
                            Filter.AddSqlParameters(() => oObj.HotelId, hotelReservation.HotelId);

                        if (hotelReservation.HotelRoomId > 0)
                            Filter.AddSqlParameters(() => oObj.HotelRoomId, hotelReservation.HotelRoomId);

                        if (hotelReservation.PaymentMethodId > 0)
                            Filter.AddSqlParameters(() => oObj.PaymentMethodId, hotelReservation.PaymentMethodId);

                        if (hotelReservation.PromotionId > 0)
                            Filter.AddSqlParameters(() => oObj.PromotionId, hotelReservation.PromotionId);

                        if (hotelReservation.ReservationStatusId > 0)
                            Filter.AddSqlParameters(() => oObj.ReservationStatusId, hotelReservation.ReservationStatusId);

                        if (hotelReservation.ReservationMadeByStatusId > 0)
                            Filter.AddSqlParameters(() => oObj.ReservationMadeByStatusId, hotelReservation.ReservationMadeByStatusId);

                        if (!string.IsNullOrEmpty(hotelReservation.UserId))
                            Filter.AddSqlParameters(() => oObj.UserId, hotelReservation.UserId);

                        if (!string.IsNullOrEmpty(hotelReservation.SearchString))
                            Filter.AddSqlParameters(() => oObj.SearchString, hotelReservation.SearchString);
                    }
                    IRepository<HotelReservation> oRepository = new Repository<HotelReservation>(uow.DataContext);
                    return oRepository.LoadSP(Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<HotelReservation> GetListByUser(string UserId = null, int ReservationStatusId = (int)HotelReservationStatus.NONE, long OffSet = 0, long PageSize = 1000000000000, int SortColumn = 0, string SortOrder = "asc", string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    HotelReservation oObj = new HotelReservation();
                    Filters Filter = new Filters();
                    Filter.AddSqlParameters(() => oObj.OffSet, OffSet);
                    Filter.AddSqlParameters(() => oObj.PageSize, PageSize);
                    Filter.AddSqlParameters(() => oObj.SortColumn, SortColumn);
                    Filter.AddSqlParameters(() => oObj.SortOrder, SortOrder);
                    if (ReservationStatusId > 0)
                        Filter.AddSqlParameters(() => oObj.ReservationStatusId, ReservationStatusId);

                    if (!string.IsNullOrEmpty(UserId))
                        Filter.AddSqlParameters(() => oObj.UserId, UserId);
                    IRepository<HotelReservation> oRepository = new Repository<HotelReservation>(uow.DataContext);
                    return oRepository.LoadSP(Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static HotelReservation Get(long Id, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    HotelReservation oObj = new HotelReservation();
                    Filters Filter = new Filters();
                    Filter.AddSqlParameters(() => oObj.Id, Id);
                    IRepository<HotelReservation> oRepository = new Repository<HotelReservation>(uow.DataContext);
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

        public static long Add(HotelReservation oHotelReservation, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelReservation> oRepository = new Repository<HotelReservation>(uow.DataContext);
                    return oRepository.Insert(oHotelReservation);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static long Update(HotelReservation oHotelReservation, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelReservation> oRepository = new Repository<HotelReservation>(uow.DataContext);
                    Filter.AddParameters(() => oHotelReservation.Id, OperatorsList.Equal, oHotelReservation.Id);
                    return oRepository.Update(oHotelReservation, Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static long Delete(HotelReservation oHotelReservation, string ConnectionStringName = "DefaultConnection")
        {
            try
            {
                using (IUnitOfWork uow = new UnitOfWork(ConnectionStringName))
                {
                    Filters Filter = new Filters();
                    IRepository<HotelReservation> oRepository = new Repository<HotelReservation>(uow.DataContext);
                    Filter.AddParameters(() => oHotelReservation.Id, OperatorsList.Equal, oHotelReservation.Id);
                    return oRepository.Delete(oHotelReservation, Filter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}




