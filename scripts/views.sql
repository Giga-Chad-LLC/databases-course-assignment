-- Create project views schema
create schema if not exists hse_project_views;
set search_path to hse_project_views, public;

-- enable hashing functions
create extension if not exists pgcrypto;

-- [Users] возвращает юзеров с захэшированным паролем
create view UsersView as
select
    id,
    email,
    username,
    crypt(password, gen_salt('bf')) as hashed_password,
    registeredAt
from hse_project.Users;

-- [UsersOnlineLog] возвращает для каждого юзера флаг, онлайн ли он или нет
create view UsersOnlineView as
with OnlineLogsSorted as (
    select userId,
        gotOnlineAt,
        leftAt,
        row_number() over (partition by userId order by gotOnlineAt desc) as rn
    from hse_project.UsersOnlineLog
)
select
    userId,
    case
        when gotOnlineAt <= now() and leftAt >= now() then true
        else false
    end as isOnline
from OnlineLogsSorted
where rn = 1;

-- [Movies] для фильмов особо нечего вьюить 🤷‍♂️

-- [MoviePrices] возвращает актуальную стоимость каждого фильма
create view MoviePricesView as
select m.title, mp.price from hse_project.MoviePrices mp
left join hse_project.Movies m on m.id = mp.movieId
where mp.validSince <= now() and mp.validUntil >= now()
order by m.id;

-- [Languages] для языков тоже нечего вьюить

-- [MovieLanguages] выводятся название фильма, его язык и дата выпуска
create view MovieLanguagesView as
select m.title, l.language, ml.releasedate from hse_project.MovieLanguages ml
left join hse_project.Movies m on m.id = ml.movieid
left join hse_project.Languages l on l.id = ml.languageId
order by m.id;

-- [Genres] нечего разумного не повьюить тоже

-- [MovieGenres] выводит название фильма с его жанрами через запятую
--               (то есть получается, что поле с жанрами это своего рода массив)
create view MovieGenresView as
select m.title, array_agg(g.genre) as genres from hse_project.MovieGenres mg
left join hse_project.Movies m on m.id = mg.movieid
left join hse_project.Genres g on g.id = mg.genreId
group by m.id
order by m.id;

-- [ViewingHistory] возвращает для каждого пользователя и каждого купленного фильма то,
--                  досмотрел ли пользователь его до конца или нет, а также название фильма и язык просмотра
create view ViewingHistoryView as
select u.username, m.title, l.language, vh.viewedMovieFully from hse_project.ViewingHistory vh
left join hse_project.Users u on u.id = vh.userId
left join hse_project.Movies m on m.id = vh.movieId
left join hse_project.Languages l on l.id = vh.languageId
order by u.id;

-- [Purchases] возвращает данные о покупках фильмов с ценами, именами пользователей,
--             названиями фильмов и их языками
create view PurchasesView as
select u.username, m.title, mp.price, l.language, p.purchasedAt from hse_project.Purchases p
left join hse_project.Users u on u.id = p.userId
left join hse_project.Movies m on m.id = p.movieId
left join hse_project.MoviePrices mp on mp.id = p.moviePriceId
left join hse_project.Languages l on l.id = p.languageId
order by u.id;
