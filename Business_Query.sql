# ===========================
# Types of users & Business Metrics
# ===========================


# 1) Sales person: 

# Member information: Expire date of each member
select c.customerid, concat(c.first_name, ' ', c.last_name) full_name, m.expired_date
from Member_mst m, Customer_mst c
where m.Customer_customerid = c.customerid and m.expired_date < now();

# Sales information: Number of new memberships for 2018
select year(created_date), count(*) number from `Initial Fee_txn` group by(year(created_date));

# 4P: The most popular source for our members to get our information.



# 2) Trainer:

# Trainer can check their schedule based on the class name, class time he is involved with his employee id.
select t.trainerid, e.first_name, e.last_name, c.class_name, c.start_time
from Employee_mst e, Trainer_mst t, Class_mst c
where e.employeeid = t.Employee_employeeid and t.trainerid = c.Trainer_trainerid and t.trainerid = 1335;

# Trainer can see his cumulative workload over a period through his class schedules.
create view `workload` as
select cts.schedule_id, (TIMEDIFF(c.end_time, c.start_time))/10000 duration
from Class_mst c, Class_Training_Schedule_txn cts
where c.classid = cts.Class_classid and c.Trainer_trainerid = 1335
union
select pts.schedule_id, (TIMEDIFF(pts.end_time, pts.start_time))/10000 duration
from Personal_Training_Schedule_txn pts
where pts.Trainer_trainerid = 1335;

select sum(duration) from workload;


create view `workload_by_trainer` as
select c.Trainer_trainerid, sum((TIMEDIFF(c.end_time, c.start_time))/10000) duration
from Class_mst c, Class_Training_Schedule_txn cts
where c.classid = cts.Class_classid 
group by c.Trainer_trainerid
union all
select pts.Trainer_trainerid, sum((TIMEDIFF(pts.end_time, pts.start_time))/10000) duration
from Personal_Training_Schedule_txn pts
group by pts.Trainer_trainerid;

select Trainer_trainerid, sum(duration) from workload_by_trainer group by Trainer_trainerid;


# Trainer can find their rating of his class with his employee id and class id. 
create view `rating` as
select cts.schedule_id, cts.rating
from Class_mst c, Class_Training_Schedule_txn cts
where c.classid = cts.Class_classid and c.Trainer_trainerid = 1335
union
select pts.schedule_id, pts.rating
from Personal_Training_Schedule_txn pts
where pts.Trainer_trainerid = 1335;

select avg(rating) from rating;


create view `rating_by_trainer` as 
select c.Trainer_trainerid, avg(cts.rating) `overall_rating`
from Class_mst c, Class_Training_Schedule_txn cts
where c.classid = cts.Class_classid 
group by c.Trainer_trainerid
union
select pts.Trainer_trainerid, avg(pts.rating)
from Personal_Training_Schedule_txn pts
group by pts.Trainer_trainerid;

select Trainer_trainerid, avg(overall_rating) from rating_by_trainer group by Trainer_trainerid;


# 3) Member:

# Member may track their membership status with their member ID. 
select memberid, member_type, expired_date from Member_mst where memberid = 1001;

# Member can check the class information such as class availability, class type, class rating and class schedule. 
select classid, class_name, start_time, end_time, level, charge_rate
from class_mst where class_name like '%boxing%';
# member can check his personal activity(date and length of the activity)
select Member_memberid, timestampdiff(hour, start_time, end_time), date(start_time) from `personal activity_txn`
where Member_memberid = 1062;

#check how many hours of personal activity he has in total
select Member_memberid, sum(timestampdiff(hour, start_time, end_time)) from `personal activity_txn`
group by Member_memberid;

#check how many hours of personal trainer training  a member has 
select Member_memberid, sum(timestampdiff(hour, start_time, end_time)) from `Personal_Training_Schedule_txn`
group by Member_memberid;




# 4) Manager:

# Demographic attributes of people coming in: Postal code with the most membership; Age band with the most membership.
select customerid, round(DATEDIFF(now(), date(birthdate))/365) age 
from Customer_mst;

select gender, count(*) from Customer_mst group by gender;

# Revenue from membership or class enrollment fee. 
select year(created_date), round(sum(payment_amount)) revenue from `Initial Fee_txn` group by year(created_date);

# Check customer satisfaction of class or private training rating
select c.class_name, avg(rating)
from Class_Training_Schedule_txn cts, Class_mst c
where cts.Class_classid = c.classid
group by c.class_name;

select pts.Trainer_trainerid, avg(pts.rating)
from Personal_Training_Schedule_txn pts
group by pts.Trainer_trainerid;

# checks the number of new member added each year
select count(*) as new_member_num, year(created_date) as each_year from `Initial Fee_txn`
group by each_year;

#check the sales performance of each sales
Select S.Employee_employeeid, F.payment_amount as Sales_performance from `Initial Fee_txn`F, Salesperson_mst S 
where S.salesid = F.Salesperson_salesid;

