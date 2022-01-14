-- Task 2

--1 название и год выхода альбомов, вышедших в 2018 году;
select a.name_, a.p_year 
	from albums as a 
	where a.p_year  = 2018
;

--2 название и продолжительность самого длительного трека;
select name_, duration 
	from tracks 
	order by duration desc 
	limit 1
;

--3 название треков, продолжительность которых не менее 3,5 минуты;
select t.name_
	from tracks as t
	where t.duration >= 210
;

--4 названия сборников, вышедших в период с 2018 по 2020 год включительно;
select c.name_ 
	from collection as c 
	where c.p_year between 2018 and 2020
;

--5 исполнители, чье имя состоит из 1 слова;
select s.name_ 
	from singer as s 
	where s.name_ not like '% %'
;

--6 название треков, которые содержат слово "мой"/"my".
select t.name_ 
	from tracks as t 
	where t.name_ ilike '%мой%' or t.name_ ilike '%my%'
;


--Домашнее задание к лекции «Группировки, выборки из нескольких таблиц»

--1 количество исполнителей в каждом жанре;
select s.name_, count(s2.id)
from style_ s inner join
	style_singer ss on s.id = ss.id_style inner join 
	singer s2 on ss.id_singer = s2.id 
		group by s.name_ 
;

--2 количество треков, вошедших в альбомы 2019-2020 годов;
select count(*)
from tracks t inner join
	albums a on t.album_id = a.id 
	where a.p_year in (2019, 2020)
;

--3 средняя продолжительность треков по каждому альбому;
select a.name_ , avg(t.duration) 
from tracks t inner join 
	albums a on t.album_id = a.id 
	group by a.name_ 
;

--4 все исполнители, которые не выпустили альбомы в 2020 году;
select s.name_, a.p_year 
from singer s inner join
	album_singer as2 on s.id = as2.id_singer right join 
	albums a on as2.id_album = a.id 
where a.p_year != 2020
;

--5 названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
select c.name_ 
from collection c inner join
	track_collection tc on c.id = tc.id_coll inner join 
	tracks t on tc.id_track = t.id inner join 
	albums a on t.album_id = a.id inner join 
	album_singer as2 on a.id = as2.id_album inner join 
	singer s on as2.id_singer = s.id 
where s.name_ = 'Fan'
;

--6 название альбомов, в которых присутствуют исполнители более 1 жанра;
select a.name_
from albums a inner join
	album_singer as2 on a.id = as2.id_album inner join 
	singer s on s.id = as2.id_singer inner join 
	style_singer ss on ss.id_singer = s.id inner join 
	(select id_style, count(*) "count"
		from style_singer 
		group by id_style) t on ss.id_style = t.id_style
where t.count > 1
;

--7 наименование треков, которые не входят в сборники;
select t.name_
from tracks t left join
	track_collection tc on t.id =tc.id_track 
where tc.id_coll is null
;

--8 исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
select distinct s.name_ 
from tracks t inner join
	albums a on t.album_id = a.id inner join
	album_singer as2 on as2.id_album = a.id  inner join 
	singer s on s.id = as2.id_singer 
where t.duration = (select min(duration) from tracks t2)
;

--9 название альбомов, содержащих наименьшее количество треков.
select a.name_, t1.count
from albums a inner join
	(select album_id, count(id) "count"
	from tracks t  
	group by album_id
	having  count(id)=(select min("count") from
						(select album_id, count(id) "count"
						from tracks t 
						group by album_id) tt
						)	 
	) t1 on t1.album_id = a.id 
