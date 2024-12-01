set search_path to hse_project, public;

-- Group by + Having
-- Число фильмов для каждого языка по убыванию, при условии, что для языка есть хотя бы 1 фильм
select l.language, count(m.id) as moviesCnt from Movies m
left join MovieLanguages ml on ml.movieId = m.id
right join Languages l on l.id = ml.languageId
group by l.language
having count(m.id) >= 1
order by count(m.id) desc;

-- Пользователи отсортированные по числу минут в онлайне
with OnlineDurations as (
    select
        u.username,
        extract(epoch from (lg.leftAt - lg.gotOnlineAt)) / 60 AS minutesDiff
    from Users u
    left join UsersOnlineLog lg on lg.userId = u.id
)
select username, sum(minutesDiff) from OnlineDurations
group by username
order by sum(minutesDiff) desc;

-- Order by
-- Самые дорогие фильмы по убыванию цены и пользователь, которых их купил
select u.username, m.title, mp.price from Purchases pc
left join MoviePrices mp on pc.movieId = mp.movieId and pc.purchasedAt >= mp.validSince and pc.purchasedAt <= mp.validUntil
left join Movies m on m.id = pc.movieId
left join Users u on u.id = pc.userId
order by mp.price desc;

-- Window function
-- Фильмы с самой маленькой актуальной ценой для каждого языка
with RankedMovies as (
    select l.language,
        m.title,
        p.price as minPrice,
        row_number() over (partition by ml.languageId order by p.price) as rankByPrice
   from Movies m
        left join MoviePrices p on p.movieId = m.id
        left join MovieLanguages ml on ml.movieId = m.id
        left join Languages l on l.id = ml.languageId
   where p.validSince <= now() and p.validUntil >= now()
)
select language, title, minPrice from RankedMovies
where rankByPrice = 1;