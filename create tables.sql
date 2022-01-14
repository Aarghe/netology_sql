--Жанры
create table if not exists style_ (
	id serial primary key,
	name_ varchar(40) not null
);

--Сборники
create table if not exists collection (
	id serial primary key,
	name_ varchar(40) not null,
	p_year integer check(p_year > 1900) not null
);

--Альбомы
create table if not exists albums (
	id serial primary key,
	name_ varchar(40) not null,
	p_year integer check(p_year > 1900) not null
);

--Исполнители
create table if not exists singer (
	id serial primary key,
	nikname varchar(40),
	name_ varchar(40) not null
);

--Треки
create table if not exists tracks (
	id serial primary key,
	album_id integer references albums(id),
	name_ varchar(40) not null,
	duration integer check(duration > 0) not null
);

--Жанр + Исполнитель
create table if not exists style_singer (
	id_singer integer references singer(id),
	id_style integer references style_(id),
	constraint coll_s primary key (id_singer, id_style)
);

--Трек + Сборник
create table if not exists track_collection (
	id_track integer references tracks(id),
	id_coll integer references collection(id),
	constraint tr_coll primary key (id_track, id_coll)
);

--Альбом + Исполнитель
create table if not exists album_singer (
	id_album integer references albums(id),
	id_singer integer references singer(id),
	constraint alb_s primary key (id_album, id_singer)
);
















