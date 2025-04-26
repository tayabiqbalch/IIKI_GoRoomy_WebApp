namespace IIKI.GoRoomy.Business.Methods
{
    public static partial class CommonBAL
    {

        public static string GetEntityTypeTitle(Common.EntityTypes entityType)
        {
            string title;
            switch (entityType)
            {
                case Common.EntityTypes.Hotels:
                    title = "Hotels";
                    break;
                case Common.EntityTypes.Rooms:
                    title = "Hotel Rooms";
                    break;
                default:
                    title = "Entity";
                    break;
            }

            return title;
        }

    }
}
