DROP TABLE IF EXISTS "artists";
CREATE TABLE "artists" (
	"id" INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,
	"name" VARCHAR
);
INSERT INTO "artists" VALUES(1,'Prince');
INSERT INTO "artists" VALUES(2,'Joe Satriani');
INSERT INTO "artists" VALUES(3,'Laura Beg');
INSERT INTO "artists" VALUES(4,'Gerard Lenormand');
INSERT INTO "artists" VALUES(5,'Andrea Bocelli');
INSERT INTO "artists" VALUES(6,'Monique Seka');
INSERT INTO "artists" VALUES(7,'Olombelo Ricky');
INSERT INTO "artists" VALUES(8,'Matisyahu');
INSERT INTO "artists" VALUES(9,'Acapella');
INSERT INTO "artists" VALUES(10,'Buraka Som Sistema');

DROP TABLE IF EXISTS "albums";
CREATE TABLE "albums" (
	"id" INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,
	"album" VARCHAR,
	"year" VARCHAR,
	"artist" INTEGER NOT NULL
);
INSERT INTO "albums" VALUES(1,'Duos de Mes Chansons','2011',4);
INSERT INTO "albums" VALUES(2,'Passione','2013',5);
INSERT INTO "albums" VALUES(3,'Musicology','2004',1);
INSERT INTO "albums" VALUES(4,'Le Best de Moniqe Seka','2015',6);
INSERT INTO "albums" VALUES(5,'The Electric Joe Satriani: An Anthology','2003',2);
INSERT INTO "albums" VALUES(6,'Mpaka Fo','2007',7);
INSERT INTO "albums" VALUES(7,'Acapella Gold','2005',9);
INSERT INTO "albums" VALUES(8,'Travelin Shoes','2004',9);
INSERT INTO "albums" VALUES(9,'Black Diamond','2008',10);
INSERT INTO "albums" VALUES(10,'Tik Tike','2011',3);
INSERT INTO "albums" VALUES(11,'Youth','2006',8);

DROP TABLE IF EXISTS "songs";
CREATE TABLE "songs" (
	"id" INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,
	"title" VARCHAR, "track" INTEGER,
	"length" INTEGER,
	"album" INTEGER NOT NULL
);
INSERT INTO "songs" VALUES(1,'La Ballade Des Gens Heureux',4,236,1);
INSERT INTO "songs" VALUES(2,'Si Fuera Presidente',6,191,1);
INSERT INTO "songs" VALUES(3,'Champagne',3,229,2);
INSERT INTO "songs" VALUES(4,'Era Gia Tutto Previsto',6,223,2);
INSERT INTO "songs" VALUES(5,'Always With Me, Always With You',3,201,5);
INSERT INTO "songs" VALUES(6,'Missounwa',3,302,4);
INSERT INTO "songs" VALUES(7,'Life O'' the Party',4,269,3);
INSERT INTO "songs" VALUES(8,'Aya Lakile',9,182,6);
INSERT INTO "songs" VALUES(9,'Rock-A-My-Soul',10,136,7);
INSERT INTO "songs" VALUES(10,'Kalemba (Wegue Wegue)',4,233,9);
INSERT INTO "songs" VALUES(11,'Tik Tike',1,246,10);
INSERT INTO "songs" VALUES(12,'King Without A Crown',13,222,11);
INSERT INTO "songs" VALUES(13,'Travelin Shoes',5,144,8);

SELECT 
	AT.name AS Artist, 
	AB.album AS Album, 
	AB.year as Year, 
	SO.title AS Title, 
	SO.track as Track, 
	SO.length as Seconds  
	FROM ARTISTS AS AT 
		LEFT JOIN ALBUMS AS AB ON AT.id = AB.artist 
			LEFT JOIN SONGS AS SO ON AB.id = SO.album;