use sakila;

select title, length as min_duration
from film
order by length asc
limit 1;

select title, length as max_duration
from film
order by length desc
limit 1;

select floor(avg(length))
from film;

select datediff(max(rental_date),min(rental_date))
from rental;

select *, date_format(return_date, "%a") as day, date_format(return_date, "%M") as month
from rental 
limit 20;

select *, date_format(return_date, "%a") as day, date_format(return_date, "%M") as month,
	case
		when date_format(return_date, "%a") in ('Mon','Tue','Wed','Thu','Fri') then 'workday' 
        when date_format(return_date, "%a") in ('Sat','Sun') then 'weekend' 
	end as day_type
from rental
limit 20;

select title, length, ifnull(rental_duration, 'not available') as availability
from film;

select count(film_id)
from film;

select rating, count(film_id)
from film
group by rating;

select rating, count(film_id)
from film
group by rating
order by count(film_id) desc;

select rating, round(avg(length),2)
from film
group by rating
order by round(avg(length),2) desc;

select rating, round(avg(length),2)
from film
where length>120
group by rating
order by round(avg(length),2) desc;



