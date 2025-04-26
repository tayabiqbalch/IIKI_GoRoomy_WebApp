namespace IIKI.GoRoomy.Common
{
    /// <summary>
    /// New entity type start with 9 
    /// 1 to 8 entity tyes already defined in base app
    /// </summary>
    public enum EntityTypes
    {
        Hotels = 9,
        Rooms = 10,
    }

    public enum HotelPolicyTypes
    {
        General = 1,
        Calcellation = 2,
    }

    public enum Navigations
    {
        HotelCategories = 45,
        Hotels = 46,
        HotelBookings = 47,
        HotelBookingRequests = 48,
    }

    public enum CommonStatusAndTypes
    {
        ReservationStatus = 6,
        PaymentMethod = 7,
        ReservationMadeBy = 8
    }
    /// <summary>
    /// Reservation status, pending, paid, etc
    /// </summary>
    public enum HotelReservationStatus
    {
        NONE = 0,
        AddedToCart = 1,
        Inprocess = 2,
        PaymentPending = 3,
        Paid = 4,
        ApprovalPending = 5,
        Confirmed = 6,
        CheckedIn = 7,
        CheckedOut = 8,
        Canceled = 9,
        Refunded = 10,
        Expired = 11
    }
    /// <summary>
    /// Reservation source, 
    /// reservation made by email/call/sms/inperson/online etc
    /// </summary>
    public enum HotelReservationMadeByStatus
    {
        NONE = 0,
        InPerson = 1,
        Online = 2,
        Mail = 3,
        Phone = 4
    }

}
