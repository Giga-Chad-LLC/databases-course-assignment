set search_path to hse_project, public;

-- 1. Возвращает просмотренные пользователем с id=checkedUserId
--    фильмы за переданный временной промежуток и язык просмотра
create or replace function get_fully_watched_movies_by_user(checkedUserId int, from_time timestamp, to_time timestamp)
returns table(userId int, email text, title text, language text) as $$
begin
    return query
    select vh.userId,
           u.email,
           m.title,
           l.language
    from ViewingHistory vh
    left join Movies m on m.id = vh.movieId
    left join Users u on u.id = vh.userId
    left join Languages l on l.id = vh.languageId
    where vh.viewedMovieFully = true and
          vh.viewingStartedAt >= from_time and
          vh.viewingFinishedAt <= to_time and
          vh.userId = checkedUserId
    order by vh.userId;
end;
$$ language plpgsql;

-- Usage example:
-- select * from get_fully_watched_movies_by_user(1, '2023-11-01 00:00:00', '2024-12-10 00:00:00');


-- 2. группировка по языкам числа просмотренных фильмов для пользователя


-- 3. для пользователя u для каждого языка посчитать минут просмотра на этом языке

