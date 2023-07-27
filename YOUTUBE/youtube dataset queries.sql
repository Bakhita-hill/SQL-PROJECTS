
select *
from youtube..comments

select *
from youtube..videostats

--What are the most commented-upon videos? 
select top 10 title,[Video ID],max(comments) as total_comments
from youtube..videostats
group by title,[Video ID]
order by total_comments desc

-- top 10 most liked videos 
select top 10 title,[Video ID],max(likes) as total_likes
from youtube..videostats
group by title,[Video ID]
order by total_likes desc

-- top 10 most viewed video
select top 10 title,[Video ID],max(Views) as total_views
from youtube..videostats
group by title,[Video ID]
order by total_views desc


--What are the most-liked comments?

select comment,max(likes) as likes_per_comment,[Video ID]
from youtube..comments
group by comment,[Video ID]
order by likes_per_comment desc


--What is the ratio of views/likes per video? 

select [Video ID],avg(Views/nullif(Likes,0)) as ratio_of_views_to_likes_per_video
from youtube..videostats
group by [Video ID]
order by ratio_of_views_to_likes_per_video desc



--What is the average sentiment score in each keyword category?

select Keyword,avg(sentiment) as average_sentiment_score_per_keyword
from youtube..videostats a
join youtube..comments b
on a.[Video ID]=b.[Video ID]
group by keyword
order by average_sentiment_score_per_keyword desc



-- MOST POPULAR KEYWORD
select count(keyword )as keyword_popularity,Keyword
from youtube..videostats
group by Keyword
order by keyword_popularity desc



-- which day had the most videos published
select count([Video ID])as total_videos_published,[Published At]
from youtube..videostats
group by [Published At]
order by total_videos_published desc

-- HOW MANY VIDEOS WERE PUBLISHED IN A CERTAIN MONTH AND YEAR
select  year([Published At])as year,month([Published At])as month, count([Video ID]) over (partition by year([Published At]),month([Published At]) order by[Published At]) as total_videos_published
from youtube..videostats

-- WHICH YEAR HAD THE MOST VIDEOS PUBLISHED 
select  year([Published At])as year, count([Video ID])as total_videos_published
from youtube..videostats
group by year([Published At])
order by total_videos_published desc


-- WHICH DAY  HAD THE MOST VIEWS 
select sum([Views])as total_views,[Published At]
from youtube..videostats
group by [Published At]
order by total_views desc

-- views  per month and year 
-- shows us how many views were there in a certain year and month
select  year([Published At])as year,month([Published At])as month, sum(views) over (partition by year([Published At]),month([Published At]) order by[Published At]) as total_views
from youtube..videostats


-- WHICH YEAR HAD THE MOST VIEWS 
select  year([Published At])as year, sum(views) total_views
from youtube..videostats
group by year([Published At])
order by total_views desc