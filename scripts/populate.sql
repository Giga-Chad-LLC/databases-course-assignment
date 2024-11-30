set search_path to hse_project, public;

-- Users
insert into Users(email, username, password, registeredAt) values
    ('dima@example.com', 'dima', 'password-dima', '2024-12-01 12:30:00'),
    ('vlad@example.com', 'vlad', 'password-vlad', '2024-11-30 00:30:00'),
     ('alice.johnson@example.com', 'aliceJ21', 'mypassword789', '2024-10-10 11:30:00'),
    ('bob.brown@example.com', 'bobbyB123', 'pass987654', '2024-10-15 16:45:00'),
    ('charlie.white@example.com', 'charlieW88', 'charliePassword!', '2024-10-20 08:00:00');

-- Movies
insert into Movies(title, description, durationSec, resourceUrl) values
    ('Garfield: The Movie', 'Jon Arbuckle buys a second pet, a dog named Odie. However, Odie is then abducted and it is up to Jon''s cat, Garfield, to find and rescue the canine.', 80 * 60, 'https://www.imdb.com/title/tt0356634'),
    ('Finding Nemo', 'After his son is captured in the Great Barrier Reef and taken to Sydney, a timid clownfish sets out on a journey to bring him home.', 100 * 60, 'https://www.imdb.com/title/tt0266543'),
    ('Aladdin', 'A kind-hearted street urchin and a power-hungry Grand Vizier vie for a magic lamp that has the power to make their deepest wishes come true.', 90 * 60, 'https://www.imdb.com/title/tt0103639'),
    ('The Intouchables', 'After he becomes a quadriplegic from a paragliding accident, an aristocrat hires a young man from the projects to be his caregiver.', 112 * 60, 'https://www.imdb.com/title/tt1675434'),
    ('Green Book', 'A working-class Italian-American bouncer becomes the driver for an African-American classical pianist on a tour of venues through the 1960s American South.', 130 * 60, 'https://www.imdb.com/title/tt6966692'),
    ('The Terminal', 'An Eastern European tourist unexpectedly finds himself stranded in JFK airport, and must take up temporary residence there.', 128 * 60, 'https://www.imdb.com/title/tt0362227'),
    ('The Green Mile', 'Paul Edgecomb, the head guard of a prison, meets an inmate, John Coffey, a black man who is accused of murdering two girls. His life changes drastically when he discovers that John has a special gift.', 189 * 60, 'https://www.imdb.com/title/tt0120689'),
    ('The Hateful Eight', 'In the dead of a Wyoming winter, a bounty hunter and his prisoner find shelter in a cabin currently inhabited by a collection of nefarious characters.', 168 * 60, 'https://www.imdb.com/title/tt3460252'),
    ('Bambi', 'The story of a young deer growing up in the forest.', 69 * 60, 'https://www.imdb.com/title/tt0034492'),
    ('Bambi II', 'The story of Bambi growing up in the care of his father, The Great Prince of the Forest.', 75 * 60, 'https://www.imdb.com/title/tt0447854'),
    ('Shrek', 'A mean lord exiles fairytale creatures to the swamp of a grumpy ogre, who must go on a quest and rescue a princess for the lord in order to get his land back.', 90 * 60, 'https://www.imdb.com/title/tt0126029'),
    ('Shrek 2', 'Shrek and Fiona travel to the Kingdom of Far Far Away, where Fiona''s parents are King and Queen, to celebrate their marriage. When they arrive, they find they are not as welcome as they thought they would be.', 93 * 60, 'https://www.imdb.com/title/tt0298148');

-- Languages
insert into Languages(language) values
    ('English'),
    ('Russian'),
    ('German'),
    ('Spanish'),
    ('French'),
    ('Japanese'),
    ('Italian'),
    ('Polish'),
    ('Ukrainian'),
    ('Czech'),
    ('Chinese (Mandarin)'),
    ('Chinese (Cantonese)');

-- Genres
insert into Genres(genre) values
    ('Action'),
    ('Adventure'),
    ('Biography'),
    ('Comedy'),
    ('Crime'),
    ('Drama'),
    ('Horror'),
    ('Romance'),
    ('Thriller'),
    ('Sci-Fi'),
    ('Mystery'),
    ('Fantasy'),
    ('Family'),
    ('Documentary'),
    ('Western');

-- MoviePrices
insert into MoviePrices(movieId, price, validSince, validUntil) values
    -- Garfield: The Movie
    (1, 5.99, '2004-06-11 00:00:00', '2022-01-01 00:00:00'),
    (1, 6.99, '2022-01-01 00:00:00', '9999-12-31 23:59:59'),

    -- Finding Nemo
    (2, 7.99, '2003-05-30 00:00:00', '2020-01-01 00:00:00'),
    (2, 8.99, '2020-01-01 00:00:00', '2021-05-10 00:00:00'),
    (2, 6.99, '2021-05-10 00:00:00', '9999-12-31 23:59:59'),

    -- Aladdin
    (3, 6.50, '1992-11-25 00:00:00', '9999-12-31 23:59:59'),

    -- The Intouchables
    (4, 8.50, '2011-11-02 00:00:00', '9999-12-31 23:59:59'),

    -- Green Book
    (5, 9.99, '2018-11-16 00:00:00', '9999-12-31 23:59:59'),

    -- The Terminal
    (6, 6.99, '2004-06-18 00:00:00', '2020-01-01 00:00:00'),
    (6, 7.49, '2020-01-01 00:00:00', '9999-12-31 23:59:59'),

    -- The Green Mile
    (7, 10.99, '1999-12-10 00:00:00', '2020-05-01 00:00:00'),
    (7, 12.99, '2020-05-01 00:00:00', '9999-12-31 23:59:59'),

    -- The Hateful Eight
    (8, 11.99, '2015-12-25 00:00:00', '9999-12-31 23:59:59'),

    -- Bambi
    (9, 4.99, '1942-08-21 00:00:00', '9999-12-31 23:59:59'),

    -- Bambi II
    (10, 5.50, '2006-02-07 00:00:00', '2010-01-01 00:00:00'),
    (10, 6.00, '2010-01-01 00:00:00', '2015-01-01 00:00:00'),
    (10, 7.00, '2015-01-01 00:00:00', '2020-01-01 00:00:00'),
    (10, 8.00, '2020-01-01 00:00:00', '2022-06-01 00:00:00'),
    (10, 9.00, '2022-06-01 00:00:00', '2023-06-01 00:00:00'),
    (10, 10.00, '2023-06-01 00:00:00', '9999-12-31 23:59:59'),

    -- Shrek
    (11, 7.49, '2001-04-22 00:00:00', '9999-12-31 23:59:59'),

    -- Shrek 2
    (12, 6.99, '2004-05-19 00:00:00', '9999-12-31 23:59:59');

-- MovieLanguages
insert into MovieLanguages(movieId, languageId, releaseDate) values
    -- Garfield: The Movie
    (1, 1, '2004-06-11'), -- English
    (1, 2, '2004-08-15'), -- Russian
    (1, 3, '2004-07-10'), -- German
    (1, 4, '2004-09-01'), -- Spanish
    (1, 5, '2004-07-25'), -- French
    (1, 11, '2004-10-05'), -- Chinese (Mandarin)

    -- Finding Nemo
    (2, 1, '2003-05-30'), -- English
    (2, 2, '2003-07-01'), -- Russian
    (2, 3, '2003-06-15'), -- German
    (2, 4, '2003-08-01'), -- Spanish
    (2, 5, '2003-07-10'), -- French
    (2, 6, '2003-06-25'), -- Japanese
    (2, 7, '2003-07-05'), -- Italian
    (2, 9, '2003-09-01'), -- Ukrainian

    -- Aladdin
    (3, 1, '1992-11-25'), -- English
    (3, 2, '1993-02-01'), -- Russian
    (3, 3, '1992-12-10'), -- German
    (3, 4, '1993-01-01'), -- Spanish
    (3, 5, '1992-12-20'), -- French
    (3, 6, '1993-02-15'), -- Japanese
    (3, 7, '1993-01-10'), -- Italian
    (3, 10, '1993-03-01'), -- Czech

    -- The Intouchables
    (4, 1, '2011-11-02'), -- English
    (4, 2, '2011-12-01'), -- Russian
    (4, 3, '2011-11-15'), -- German
    (4, 4, '2011-12-10'), -- Spanish
    (4, 5, '2011-11-20'), -- French
    (4, 6, '2011-12-05'), -- Japanese
    (4, 7, '2011-12-15'), -- Italian
    (4, 11, '2011-12-20'), -- Chinese (Mandarin)

    -- Green Book
    (5, 1, '2018-11-16'), -- English
    (5, 2, '2018-11-25'), -- Russian
    (5, 3, '2018-11-20'), -- German
    (5, 4, '2018-12-01'), -- Spanish
    (5, 5, '2018-11-18'), -- French
    (5, 6, '2018-11-22'), -- Japanese
    (5, 7, '2018-11-28'), -- Italian
    (5, 8, '2018-12-05'), -- Polish

    -- The Terminal
    (6, 1, '2004-06-18'), -- English
    (6, 2, '2004-07-05'), -- Russian
    (6, 3, '2004-06-25'), -- German
    (6, 4, '2004-07-15'), -- Spanish
    (6, 5, '2004-06-30'), -- French
    (6, 7, '2004-07-10'), -- Italian
    (6, 9, '2004-08-01'), -- Ukrainian

    -- The Green Mile
    (7, 1, '1999-12-10'), -- English
    (7, 2, '1999-12-15'), -- Russian
    (7, 3, '1999-12-05'), -- German
    (7, 4, '1999-12-20'), -- Spanish
    (7, 5, '1999-12-12'), -- French
    (7, 6, '1999-12-18'), -- Japanese
    (7, 8, '1999-12-25'), -- Polish

    -- The Hateful Eight
    (8, 1, '2015-12-25'), -- English
    (8, 2, '2016-01-05'), -- Russian
    (8, 3, '2015-12-30'), -- German
    (8, 4, '2016-01-10'), -- Spanish
    (8, 5, '2016-01-01'), -- French
    (8, 6, '2016-01-15'), -- Japanese
    (8, 7, '2016-01-20'), -- Italian
    (8, 10, '2016-02-01'), -- Czech

    -- Bambi
    (9, 1, '1942-08-21'), -- English
    (9, 2, '1942-08-25'), -- Russian
    (9, 3, '1942-08-22'), -- German
    (9, 4, '1942-08-23'), -- Spanish
    (9, 5, '1942-08-24'), -- French
    (9, 6, '1942-08-26'), -- Japanese

    -- Bambi II
    (10, 1, '2006-02-07'), -- English
    (10, 2, '2006-02-10'), -- Russian
    (10, 3, '2006-02-08'), -- German
    (10, 4, '2006-02-12'), -- Spanish
    (10, 5, '2006-02-11'), -- French

      -- Shrek
    (11, 1, '2001-05-22'), -- English
    (11, 2, '2001-06-01'), -- Russian
    (11, 3, '2001-05-30'), -- German
    (11, 4, '2001-06-10'), -- Spanish
    (11, 5, '2001-06-05'), -- French
    (11, 6, '2001-06-15'), -- Japanese
    (11, 7, '2001-06-12'), -- Italian
    (11, 8, '2001-06-20'), -- Polish

    -- Shrek 2
    (12, 1, '2004-05-19'), -- English
    (12, 2, '2004-06-01'), -- Russian
    (12, 3, '2004-05-25'), -- German
    (12, 4, '2004-06-05'), -- Spanish
    (12, 5, '2004-05-30'), -- French
    (12, 6, '2004-06-10'), -- Japanese
    (12, 7, '2004-06-08'), -- Italian
    (12, 10, '2004-06-15'); -- Czech

-- MovieGenres
insert into MovieGenres(movieId, genreId) values
     -- Garfield: The Movie
    (1, 2), -- Adventure
    (1, 4), -- Comedy
    (1, 12), -- Fantasy
    (1, 13), -- Family

    -- Finding Nemo
    (2, 2), -- Adventure
    (2, 4), -- Comedy
    (2, 13), -- Family

    -- Aladdin
    (3, 2), -- Adventure
    (3, 4), -- Comedy
    (3, 8), -- Romance
    (3, 12), -- Fantasy
    (3, 13), -- Family

    -- The Intouchables
    (4, 4), -- Comedy
    (4, 6), -- Drama

    -- Green Book
    (5, 3), -- Biography
    (5, 4), -- Comedy
    (5, 6), -- Drama

    -- The Terminal
    (6, 4), -- Comedy
    (6, 6), -- Drama
    (6, 8), -- Romance

    -- The Green Mile
    (7, 5), -- Crime
    (7, 6), -- Drama
    (7, 11), -- Mystery
    (7, 12), -- Fantasy

    -- The Hateful Eight
    (8, 5), -- Crime
    (8, 6), -- Drama
    (8, 9), -- Thriller
    (8, 11), -- Mystery
    (8, 15), -- Western

    -- Bambi
    (9, 2), -- Adventure
    (9, 6), -- Drama
    (9, 13), -- Family

    -- Bambi II
    (10, 2), -- Adventure
    (10, 6), -- Drama
    (10, 8), -- Romance
    (10, 13), -- Family

    -- Shrek
    (11, 2), -- Adventure
    (11, 4), -- Comedy
    (11, 8), -- Romance
    (11, 12), -- Fantasy
    (11, 13), -- Family

    -- Shrek 2
    (12, 2), -- Adventure
    (12, 4), -- Comedy
    (12, 8), -- Romance
    (12, 12), -- Fantasy
    (12, 13); -- Family

-- UsersOnlineLog
insert into UsersOnlineLog(userId, gotOnlineAt, leftAt) values
    -- dima@example.com
    (1, '2024-12-01 12:00:00+00', '2024-12-01 13:00:00+00'), -- Online for 1 hour
    (1, '2024-12-01 15:30:00+00', '2024-12-01 16:30:00+00'), -- Online for 1 hour
    (1, '2024-12-02 08:15:00+00', '2024-12-02 10:00:00+00'), -- Online for 1 hour 45 mins

    -- vlad@example.com
    (2, '2024-11-30 00:00:00+00', '2024-11-30 02:00:00+00'), -- Online for 2 hours
    (2, '2024-11-30 12:00:00+00', '2024-11-30 12:45:00+00'), -- Online for 45 mins
    (2, '2024-12-01 11:00:00+00', '2024-12-01 11:30:00+00'), -- Online for 30 mins

    -- alice.johnson@example.com
    (3, '2024-10-10 11:00:00+00', '2024-10-10 11:30:00+00'), -- Online for 30 mins
    (3, '2024-10-10 13:00:00+00', '2024-10-10 13:50:00+00'), -- Online for 50 mins
    (3, '2024-10-11 09:00:00+00', '2024-10-11 09:45:00+00'), -- Online for 45 mins

    -- bob.brown@example.com
    (4, '2024-10-15 16:00:00+00', '2024-10-15 16:30:00+00'), -- Online for 30 mins
    (4, '2024-10-15 18:00:00+00', '2024-10-15 18:20:00+00'), -- Online for 20 mins
    (4, '2024-10-16 08:00:00+00', '2024-10-16 09:00:00+00'), -- Online for 1 hour
    (4, '2024-10-16 17:00:00+00', '2024-10-16 18:00:00+00'), -- Online for 1 hour

    -- charlie.white@example.com
    (5, '2024-10-20 07:45:00+00', '2024-10-20 08:30:00+00'), -- Online for 45 mins
    (5, '2024-10-20 10:00:00+00', '2024-10-20 11:15:00+00'), -- Online for 1 hour 15 mins
    (5, '2024-10-21 09:00:00+00', '2024-10-21 10:30:00+00'); -- Online for 1 hour 30 mins


-- ViewingHistory
insert into ViewingHistory(userId, movieId, languageId, viewingStartedAt, viewingFinishedAt, viewedMovieFully) values
    -- dima@example.com (Watching in Russian - Moscow Time Zone)
    (1, 1, 2, '2024-12-01 12:30:00+03', '2024-12-01 13:50:00+03', true), -- Garfield: The Movie (Russian) - 1 hour 20 minutes
    (1, 2, 2, '2024-12-01 14:00:00+03', '2024-12-01 15:30:00+03', true), -- Finding Nemo (Russian) - 1 hour 30 minutes

    -- vlad@example.com (Watching in Russian - Moscow Time Zone)
    (2, 1, 2, '2024-11-30 00:30:00+03', '2024-11-30 02:00:00+03', false), -- Garfield: The Movie (Russian) - 1 hour 30 minutes
    (2, 5, 2, '2024-11-30 12:00:00+03', '2024-11-30 13:30:00+03', true), -- Green Book (Russian) - 1 hour 30 minutes

    -- alice.johnson@example.com (Watching in German - Berlin Time Zone)
    (3, 3, 3, '2024-10-10 11:30:00+02', '2024-10-10 13:00:00+02', true), -- Aladdin (German) - 1 hour 30 minutes
    (3, 6, 3, '2024-10-10 13:00:00+02', '2024-10-10 14:50:00+02', false), -- The Terminal (German) - 1 hour 50 minutes

    -- bob.brown@example.com (Watching in Spanish - Madrid Time Zone)
    (4, 4, 4, '2024-10-15 16:45:00+02', '2024-10-15 18:15:00+02', true), -- The Intouchables (Spanish) - 1 hour 30 minutes
    (4, 7, 4, '2024-10-15 18:30:00+02', '2024-10-15 20:00:00+02', true), -- The Green Mile (Spanish) - 1 hour 30 minutes

    -- charlie.white@example.com (Watching in French - Paris Time Zone)
    (5, 9, 5, '2024-10-20 08:00:00+02', '2024-10-20 09:15:00+02', true), -- Bambi (French) - 1 hour 15 minutes
    (5, 11, 5, '2024-10-20 09:30:00+02', '2024-10-20 11:00:00+02', true); -- Shrek (French) - 1 hour 30 minutes


-- Purchases
insert into Purchases(userId, movieId, moviePriceId, languageId, purchasedAt) values
    -- dima@example.com
    (1, 1, 1, 2, '2024-12-01 13:00:00+03'), -- Garfield: The Movie (Russian) (Purchased shortly after registration)
    (1, 2, 2, 2, '2024-12-01 16:00:00+03'), -- Finding Nemo (Russian) (Purchased shortly after registration)
    (1, 5, 5, 2, '2024-12-01 17:00:00+03'), -- Green Book (Russian) (Additional movie purchase)

    -- vlad@example.com
    (2, 1, 1, 2, '2024-11-30 03:00:00+03'), -- Garfield: The Movie (Russian) (Purchased shortly after registration)
    (2, 2, 2, 2, '2024-11-30 04:30:00+03'), -- Finding Nemo (Russian) (Purchased shortly after registration)
    (2, 2, 2, 3, '2024-11-30 04:30:00+03'), -- Finding Nemo (German) (Purchased shortly after registration)

    -- alice.johnson@example.com
    (3, 3, 3, 3, '2024-10-10 14:00:00+02'), -- Aladdin (German) (Purchased shortly after registration)
    (3, 6, 6, 3, '2024-10-10 15:30:00+02'), -- The Terminal (German) (Purchased shortly after registration)
    (3, 7, 7, 3, '2024-10-10 16:00:00+02'), -- The Green Mile (German) (Additional movie purchase)

    -- bob.brown@example.com
    (4, 4, 4, 4, '2024-10-15 19:00:00+02'), -- The Intouchables (Spanish) (Purchased shortly after registration)
    (4, 7, 7, 4, '2024-10-15 20:30:00+02'), -- The Green Mile (Spanish) (Purchased shortly after registration)
    (4, 9, 9, 4, '2024-10-15 21:30:00+02'), -- Shrek 2 (Spanish) (Additional movie purchase)

    -- charlie.white@example.com
    (5, 9, 9, 5, '2024-10-20 11:00:00+02'), -- Bambi (French) (Purchased shortly after registration)
    (5, 11, 11, 5, '2024-10-20 12:00:00+02'); -- Shrek (French) (Purchased shortly after registration)
