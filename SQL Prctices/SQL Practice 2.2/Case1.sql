-- Exercise 2.2 Case-1 

create table activity
(
	player_id int ,
    device_id int ,
    event_date date ,
    games_played int ,
    primary key (player_id , event_date)
);

insert into activity values ( 1 , 2 , '2016-03-01' , 5),
							( 1 , 2 , '2016-05-02' , 6),
                            ( 2 , 3 , '2017-06-25' , 1),
                            ( 3 , 1 , '2016-03-02' , 0),
                            ( 3 , 4 , '2018-07-03' , 5);
                            
select * from activity;

-- Question 1: Write an SQL query to report the first login date for each player. Return the result table in any order.

select player_id, min(event_date) as first_login from activity group by player_id;


-- Question 2: Write an SQL query to report the device that is first logged in for each player. Return the result table in any order.

select player_id, min(device_id) as device_id from activity group by player_id;


-- Question 3: Write an SQL query to report for each player and date, how many games played so far by the player. That is, the total number of games played by the player until that date. Check the example for clarity. Return the result table in any order.

select player_id , event_date , sum(games_played) OVER (partition by player_id order by event_date) as games_played_so_far from activity; 