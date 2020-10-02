import { PassengerDetail } from "./passenger";
import { BookingDetails } from "./BookingDetails";
import { Transaction } from "./Transaction";
import { GuestUser } from "./GuesUser";

export class FinalDetails{
 Passengers: PassengerDetail[];
 Bookings: BookingDetails[];
 Transactions: Transaction[];
 GuestUser: GuestUser;
}