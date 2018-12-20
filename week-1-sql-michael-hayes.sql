# Week 1 - SQL Bridge Workshop
# Michael Hayes
# https://github.com/murphystout/bridge-workshop


#Question 1
#Answer: Destination - HNL

#SQL Statement:

SELECT dest, distance FROM flights ORDER BY distance DESC LIMIT 


#Question 2

#EMBRAER			EMB-145XR	2	400
#CESSNA				150			1	16
#AIRBUS INDUSTRIE	A340-313	4	450
#AIRBUS				A330-223	3	379

SELECT manufacturer, model, engines, MAX(seats) FROM planes GROUP BY engines


#Question 3
# 673552

SELECT COUNT(*) FROM flights

#Question 4

#UA	117330
#AA	65458
#B6	109270
#DL	96220
#EV	108346
#MQ	52794
#US	41072
#WN	24550
#VX	10324
#FL	6520
#AS	1428
#9E	36920
#F9	1370
#HA	684
#YV	1202
#OO	64

SELECT carrier, COUNT(*) FROM flights GROUP BY carrier



#Question 5

#UA	117330
#B6	109270
#EV	108346
#DL	96220
#AA	65458
#MQ	52794
#US	41072
#9E	36920
#WN	24550
#VX	10324
#FL	6520
#AS	1428
#F9	1370
#YV	1202
#HA	684
#OO	64

SELECT carrier, COUNT(*) FROM flights GROUP BY carrier ORDER BY Count(*) DESC

#Question 6

#UA	117330
#B6	109270
#EV	108346
#DL	96220
#AA	65458

SELECT carrier, COUNT(*) FROM flights GROUP BY carrier ORDER BY COUNT(*) DESC LIMIT 5


#Question 7

#UA	82270
#B6	60044
#DL	56192
#AA	47166
#EV	12496

SELECT carrier, COUNT(*) FROM flights WHERE distance > 1000 GROUP BY carrier ORDER BY COUNT(*) DESC LIMIT 5

# Question 8
# Show the top 5 airlines based on highest average departure delay.

SELECT carrier, AVG(dep_delay) FROM flights GROUP BY carrier ORDER BY AVG(dep_delay) DESC LIMIT 5

#F9	20.2155
#EV	19.9554
#YV	18.9963
#FL	18.7261
#WN	17.7117