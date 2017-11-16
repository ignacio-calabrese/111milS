CREATE TABLE cars (
    patent          text PRIMARY KEY,
    make            text,
    model           text,
    displacement    integer,
    kind            text CHECK(
                                kind = 'Sedàn'
                                OR kind = 'Coupè'
                            )NOT NULL
    
);

INSERT INTO cars VALUES
    ('AAA101','Wolkswagen','Golf A7 Trendline',1598,'Sedàn'),
    ('AAA111','Wolkswagen','Golf A7 Trendline',1598,'Coupè'),
    ('ABA101','Chevrolet','Onix YOY LS MT',1389,'Sedàn'),
    ('ABA111','Renault','Sandero 1.6 Privilège',1598,'Sedàn'),
    ('ACA101','Toyota','Ceica 1.8 VVT-i',1794,'Coupè'),
    ('ACA111','Peugeot','208 Feline 1.6',1567,'Sedàn'),
    ('ADA101','Toyota','Yaris',1496,'Sedàn'),
    ('ADA111','Toyota','Yaris',1496,'Coupè'),
    ('AEA101','Toyota','Prius',1798,'Sedàn'),
    ('AEA111','Toyota','Prius',1798,'Coupè'),
    ('AFA101','Toyota','Etios Hatchback XLS',1496,'Sedàn'),
    ('AFA111','Ford','Fiesta Kinetic Titanium',1596,'Sedàn'),
    ('AGA101','Chevrolet','Prisma LT',1389,'Sedàn'),
    ('AGA111','Fiat','Palio Fire 1.4',1368,'Sedàn'),
    ('AHA101','Fiat','Palio Fire 1.4',1368,'Coupè'),
    ('AHA111','FORD','KA S',1499,'Sedàn'),
    ('AIA101','FORD','Ecosport S 1.6L SE',1597,'Sedàn'),
    ('AIA111','Toyota','Corolla 1.8 XEi Aut',1798,'Sedàn'),
    ('AJA101','BMW','750 i (E32)',4988,'Sedàn'),
    ('AJA111','Volkswagen','up 5P 1.0 high up',999,'Sedàn');

SELECT
    patent
FROM
    cars
WHERE
    displacement > 1200;

















