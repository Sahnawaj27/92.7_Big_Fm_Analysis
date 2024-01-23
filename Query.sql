use big_fm;
-- 1)Retrieve all stations in the "East" region? --

select *
from stations
where location= "East";

-- 2)List all shows hosted by "Vrajesh Hirjee"? --

select s.showname
from shows s join hosts h 
on s.hostid=h.hostid
where hostname="Vrajesh Hirjee";

-- 3)Count the number of awards each show has won? --

select showname,count(awardname) as no_of_awards
from awards join shows
on awards.showid=shows.showid
group by 1;

-- 4)Find shows that have partnerships with "Spotify"?--

select showname
from shows join showpartnerships
on shows.showid=showpartnerships.showid
join partnerships 
on showpartnerships.partnershipid = partnerships.partnershipid
where partnername= "Spotify";

-- 5)Retrieve hosts who joined before 2010? --

select hostname
from hosts
where joindate < "2010-01-01";

-- 6)List the shows and their launch dates in descending order of launch date?--

select showname,launchdate
from shows
order by launchdate desc;

-- 7)Find the total count of shows for each host?--

select hostname, showcount 
from hosts;

-- 8)Show the online presence platforms with their links?--

select platformname,link
from onlinepresence;

-- 9)Retrieve the stations in the "South" region launched after 2010?--

select *
from stations
where location= "South" and launchdate >"2010-12-31";

-- 10)Rank hosts based on the number of shows they have hosted?--

select hostname,showcount,
dense_rank() over (order by showcount desc) as rnks
from hosts;