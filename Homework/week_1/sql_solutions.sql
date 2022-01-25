Q3
SELECT count(1)
 FROM public.yellow_taxi_trips
 WHERE EXTRACT(DAY FROM tpep_pickup_datetime) = 15
 AND EXTRACT(MONTH FROM tpep_pickup_datetime) = 1
 LIMIT 10;

Q4
SELECT tpep_pickup_datetime, tip_amount
 FROM public.yellow_taxi_trips
 WHERE EXTRACT(MONTH FROM tpep_pickup_datetime) = 1
 ORDER BY tip_amount DESC
 LIMIT 1;

Q5
SELECT zdo.“LocationID”, zdo.“Borough”, zdo.“Zone”, zdo.“service_zone”, count(zdo.“LocationID”) as cnt FROM public.yellow_taxi_trips, public.zones zpu, public.zones zdo
WHERE “PULocationID” = zpu.“LocationID” AND “DOLocationID” = zdo.“LocationID”
AND EXTRACT(DAY FROM tpep_pickup_datetime) = 14
AND EXTRACT(MONTH FROM tpep_pickup_datetime) = 1
group BY zdo.“LocationID”, zdo.“Borough”, zdo.“Zone”, zdo.“service_zone”
ORDER BY cnt DESC
LIMIT 1;

Q6
SELECT CONCAT(zpu.“Zone”, ‘/’, zdo.“Zone”) as pair,
AVG(total_amount)
FROM public.yellow_taxi_trips, public.zones zpu, public.zones zdo
WHERE “PULocationID” = zpu.“LocationID” AND “DOLocationID” = zdo.“LocationID”
group BY pair
ORDER BY AVG(total_amount) DESC
LIMIT 1;