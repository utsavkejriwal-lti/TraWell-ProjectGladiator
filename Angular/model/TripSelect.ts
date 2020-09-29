export class TripSelect{
    Trip: {
        Id: number,
        BusID: number,
        RouteID: number,
        CostPerKm: number
    }
    BusDetails: {
        Id: number,
        Number: string,
        Name: string,
        hasAc: number,
        hasWifi: number,
        isRecliner: number,
        SeatMap: string
    }
    Details: {
        CostperSeat: number,
        SeatAvailable: number,
        SeatsBooked: number[],
        DurationHours: number,
        DurationMins: number
        FromStop: {
            Place: {
                Code: string,
                Name: string,
                City: string
            },
            Stop: string,
            ArrivalTime: string,
            DepartureTime: string
        },
        ToStop: {
            Place: {
                Code:string,
                Name: string,
                City: string
            },
            Stop: string,
            ArrivalTime: string,
            DepartureTime: string
        }
        
    }
}