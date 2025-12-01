SHOW databases;
create database OLA_PROJECT;
USE OLA_PROJECT;

# 1. Retrieve all successful bookings
create view Successful_Booking as 
select * from booking where Booking_Status = 'success';

#2.  Find the average ride distance for each vehicle type:
create view Average_distance as
select Vehicle_Type, AVG(Ride_distance) as Average_Distance 
from  booking 
group by Vehicle_Type;

#3.  Get the total number of cancelled rides by customers:
select count(*) 
from booking 
where Booking_Status = 'Canceled by Customer';

#4.  List the top 5 customers who booked the highest number of rides:
select Customer_ID, count(Booking_ID) as Rides_booked 
from booking
group by Customer_ID Order by Rides_booked DESC LIMIT 5;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select count(*)
from booking 
where Canceled_Rides_by_Driver= 'Personal & Car related issue';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select max(Driver_Ratings), min(Driver_Ratings)
from booking 
where Vehicle_Type = 'Prime Sedan' and Booking_Status = 'success';

#7. Retrieve all rides where payment was made using UPI:
 Select *
 from booking
 where Payment_Method= 'UPI';
 
 #8.  Find the average customer rating per vehicle type:
 Select Vehicle_Type, avg(Customer_Rating)
 from booking
 group by Vehicle_Type;
 
 #9. Calculate the total booking value of rides completed successfully:
 select sum(Booking_Value)
 from booking 
 where Incomplete_Rides='no';
 
 #10. List all incomplete rides along with the reason:
select Incomplete_Rides_Reason
from booking 
where Incomplete_Rides='yes';
 

