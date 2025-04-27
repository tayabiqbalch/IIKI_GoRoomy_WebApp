
//// Usage Example:
////
//// To access individual time zone details:
//var timeZoneDetails = CommonFunctions.getTimeZoneDetails();
//console.log(timeZoneDetails.timeZone); // Time zone name
//console.log(timeZoneDetails.offset);   // UTC offset in minutes
//console.log(timeZoneDetails.isDST);   // Whether DST is in effect
//console.log(timeZoneDetails.currentDate); // Current date and time

class CommonFunctions {
    // Constructor for initializing if needed
    constructor() {
        // You can initialize any common properties if required
    }

    // Method to get full time zone details
    static getTimeZoneDetails() {
        return {
            timeZone: Intl.DateTimeFormat().resolvedOptions().timeZone, // Time zone name (e.g., "America/New_York")
            offset: new Date().getTimezoneOffset(), // The offset in minutes from UTC (e.g., -240 for UTC-4)
            isDST: CommonFunctions.isDST(), // Whether DST is in effect (true or false)
            currentDate: new Date() // Current date and time
        };
    }

    // Helper function to determine if DST is in effect
    static isDST() {
        var january = new Date(new Date().getFullYear(), 0, 1);
        var july = new Date(new Date().getFullYear(), 6, 1);
        return Math.max(january.getTimezoneOffset(), july.getTimezoneOffset()) !== new Date().getTimezoneOffset();
    }

}
