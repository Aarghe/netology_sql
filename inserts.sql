
--Task 1
/*
не менее 8 исполнителей;
не менее 5 жанров;
не менее 8 альбомов;
не менее 15 треков;
не менее 8 сборников.
*/

insert into singer
	values (1, 'Nick', 'Jones Do')
			,(2, 'Saama', 'V D')
			,(3, 'Jihn', 'Great Uncle')
			,(4, 'Mike', 'Jane D')
			,(5, 'Alice', 'Si Lo')
			,(6, 'Peter', 'Gramm')
			,(7, 'Joel', 'Fan')
			,(8, 'Kim', 'Krusty Adams')
;

insert into style_
	values (1, 'Rock')
			,(2, 'Noise')
			,(3, 'Rap')
			,(4, 'Classic')
			,(5, 'Other')
;

insert into albums
	values (1, 'My life', 1984)
			,(2, 'Sound of', 2018)
			,(3, 'No Name', 1971)
			,(4, '1998', 1997)
			,(5, 'Rest of Life', 2018)
			,(6, 'Hobbit', 2020)
			,(7, 'Song of Nature', 1971)
			,(8, 'This is', 1942)
;

insert into tracks
	values (1, 2, 'Elvis Has Left The Building', 23)
			,(2, 2, 'Rain on My Parade', 251)
			,(3, 3, 'Dropping Like Flies', 416)
			,(4, 5, 'My Cup Of Joe', 87)
			,(5, 1, 'In the Red', 78)
			,(6, 6, 'Mouth-watering', 213)
			,(7, 7, 'A Lemon', 187)
			,(8, 2, 'Back to Square One', 112)
			,(9, 1, 'A Cut Below', 864)
			,(10, 7, 'Let Her Rip', 358)
			,(11, 8, 'A Cold Day in Hell', 10)
			,(12, 8, 'A Busy Body', 153)
			,(13, 2, 'Foaming At The Mouth', 168)
			,(14, 1, 'A Dime a Dozen', 47)
			,(15, 6, 'Elephant in the Room', 114)
;

insert into collection
	values (1, 'Tough It Out', 1997)
			,(2, 'Down And Out', 2007)
			,(3, 'Back to Square One', 2017)
			,(4, 'Read Em and Weep', 2010)
			,(5, 'Rain on Your Parade', 1973)
			,(6, 'Barking Up The Wrong Tree', 2003)
			,(7, 'Goody Two-Shoes', 2016)
			,(8, 'Know the Ropes', 2020)
;

insert into album_singer 
	values (1, 8)
			,(2, 7)
			,(3, 6)
			,(4, 5)
			,(5, 4)
			,(6, 3)
			,(7, 2)
			,(8, 1)
;
--delete from style_singer;

insert into style_singer 
	values (1, 5)
			,(2, 4)
			,(3, 3)
			,(4, 2)
			,(5, 1)
			,(6, 3)
			,(7, 5)
			,(8, 1)
;

insert into track_collection 
	values (1, 8)
			,(2, 7)
			,(3, 6)
;