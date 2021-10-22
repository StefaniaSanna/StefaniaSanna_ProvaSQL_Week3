create database NegozioDischi

create table Band(
IDBand int identity(1,1) constraint PK_Band primary key,
Nome nvarchar(40) not null,
NumeroComponenti int not null
);

create table Brano (
IDBrano int identity(1,1) constraint PK_Brano primary key,
TitoloBrano nvarchar(30) not null,
Durata int not null
);

create table Album(
IDAlbum int identity(1,1) constraint PK_Album primary key,
Titolo nvarchar(30) not null,
AnnoUscita int not null,
CasaDiscografica nvarchar(40) not null,
Genere nvarchar(20) not null check (Genere = 'Classico' or Genere = 'Jazz' or Genere = 'Pop' or Genere = 'Rock' or Genere = 'Metal'),
SupportoDistribuzione nvarchar(20) not null check (SupportoDistribuzione = 'CD' or SupportoDistribuzione = 'Vinile' or SupportoDistribuzione = 'Streaming'),
IDBand int not null,
constraint FK_Band foreign key (IDBand) references Band(IDBand),
constraint UNQ_Album unique (Titolo,AnnoUscita,CasaDiscografica,Genere,SupportoDistribuzione)
);

create table AlbumBrano(
IDAlbum int not null,
IDBrano int not null,
constraint PK_Album_Brano primary key (IDAlbum, IDBrano),
constraint FK_Brano foreign key (IDBrano) references Brano(IDBrano),
constraint FK_Album foreign key (IDAlbum) references Album(IDAlbum)
);

insert Album values ('Hanno ucciso l''uomo ragno',1992,'Fri Records','Pop','CD',1)
insert Album values ('Nord sud ovest est',1993,'Fri Records','Pop','CD',1)
insert Album values ('La dura legge del gol!',1997,'Fri Records','Pop','CD',1)
insert Album values('Paranoia AirLines',2019,'Sony Records','Pop','CD',2)
insert Album values('Il ballo della vita',2018,'Sony Records','Rock','Vinile',3)
insert Album values('Il teatro dell''ira',2020,'Sony Records','Rock','CD',3)
insert Album values('Vecchio',2012,'Carosello','Pop','Vinile',4)
insert Album values('Fuoricampo',2017,'Carosello','Pop','CD',4)
insert Album values('La vie en rose',1945,'Sconosciuto','Classico','Vinile',5)
insert Album values('Exuvia',2021,'Universal Music','Metal', 'CD',6)

insert Band values ('883',2)
insert Band values ('Fedez',1)
insert Band values ('Maneskin',4)
insert Band values ('TheGiornalisti',3)
insert Band values ('Edith Piaf',1)
insert Band values ('Caparezza',1)

insert Brano values ('Hanno ucciso l''uomo ragno',250) --mettila negli 883 omonimo
insert Brano values ('Tieni il tempo',180)
insert Brano values ('Non me la menare',130)
insert Brano values ('chosen',300)
insert Brano values ('Il ballo della vita',254)
insert Brano values ('Zitti e buoni',187)
insert brano values ('Imagine',185)

insert AlbumBrano values (1,1)
insert AlbumBrano values (2,2)
insert AlbumBrano values (3,3)
insert AlbumBrano values (5,4)
insert AlbumBrano values (5,5)
insert AlbumBrano values (6,5)
insert AlbumBrano values (1,7)
insert AlbumBrano values (3,7)
insert AlbumBrano values (8,3)
insert AlbumBrano values (7,5)


--1 Scrivere una query che restituisca i titoli degli album degli “883” in ordine alfabetico

select distinct a.Titolo
from Album a join Band b on b.IDBand=a.IDBand
where b.Nome = '883'
order by a.Titolo


--2 Selezionare tutti gli album della casa discografica “Sony Music” relativi all’anno 2020

select a.Titolo
from Album a 
where a.CasaDiscografica = 'Sony Records' and a.AnnoUscita = 2020 


--3 Scrivere una query che restituisca tutti i titoli delle canzoni dei “Maneskin” appartenenti
--ad album pubblicati prima del 2019

select b.TitoloBrano
from Brano b join AlbumBrano ab on b.IDBrano=ab.IDBrano
join Album a on a.IDAlbum= ab.IDAlbum
join Band ba on ba.IDBand=a.IDBand
where ba.Nome = 'Maneskin' and a.AnnoUscita < 2019


--4 Individuare tutti gli album in cui è contenuta la canzone “Imagine”select a.Titolofrom Brano b join AlbumBrano ab on b.IDBrano=ab.IDBrano
join Album a on a.IDAlbum= ab.IDAlbumwhere b.TitoloBrano = 'Imagine';--5 Restituire il numero totale di canzoni eseguite dalla band “The Giornalisti”select count(b.IDBrano) as ' NUmero Canzoni dei TheGiornalisti'from Brano b join AlbumBrano ab on b.IDBrano=ab.IDBrano
join Album a on a.IDAlbum= ab.IDAlbum
join Band ba on ba.IDBand=a.IDBandwhere ba.Nome = 'TheGiornalisti'group by ba.Nome

--6 Contare per ogni album, la “durata totale” cioè la somma dei secondi dei suoi brani

select a.Titolo,  sum(b.Durata) as 'Durata totale album'
from Brano b join AlbumBrano ab on b.IDBrano=ab.IDBrano
join Album a on a.IDAlbum= ab.IDAlbum
group by a.Titolo

--7 Mostrare i brani (distinti) degli “883” che durano più di 3 minuti (in alternativa usare i
--secondi quindi 180 s).

select distinct b.TitoloBrano
from Brano b join AlbumBrano ab on b.IDBrano=ab.IDBrano
join Album a on a.IDAlbum= ab.IDAlbum
join Band ba on ba.IDBand=a.IDBand
where ba.Nome = '883' and b.Durata > 180

--8 Mostrare tutte le Band il cui nome inizia per “M” e finisce per “n”

select distinct ba.Nome
from  Band ba
where ba.Nome like 'M%' and ba.Nome like '%n'

-- 9 Mostrare il titolo dell’Album e di fianco un’etichetta che stabilisce che si tratta di un Album:
--‘Very Old’ se il suo anno di uscita è precedente al 1980,
--‘New Entry’ se l’anno di uscita è il 2021,
--‘Recente’ se il suo anno di uscita è compreso tra il 2010 e 2020,
--‘Old’ altrimenti

select distinct a.Titolo, 
case
when a.AnnoUscita < 1980 then 'Very Old'
when a.AnnoUscita = 2021 then 'New Entry'
when a.AnnoUscita between 2010 and 2020  then 'Recente'
else 'Old'
end as 'Tipologia Album'
from Album a 

--10 Mostrare i brani non contenuti in nessun album

select b.TitoloBrano
from Brano b
where b.TitoloBrano not in (select b.TitoloBrano
from Brano b join  AlbumBrano ab on b.IDBrano=ab.IDBrano)


