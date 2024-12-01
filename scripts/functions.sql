set search_path to hse_project, public;

-- 1. Возвращает просмотренные пользователем с id=checkedUserId
--    фильмы за переданный временной промежуток и язык просмотра.
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


-- 2. Возвращает для пользователя c id = checkUserId для каждого языка
--    кол-во минут просмотра фильмов на этом языке.
create or replace function get_minutes_watched_for_language_by_user(checkedUserId int)
returns table(language text, minutesWatched bigint) as $$
begin
    return query
    with CalculatedWatchMinutes as (
        select u.id as userId,
            l.language,
            coalesce(
                extract(epoch from (vh.viewingFinishedAt - vh.viewingStartedAt)) / 60,
                0
            )::int as minutesViewed
        from ViewingHistory vh
            full join Movies mv on mv.id = vh.movieId
            left join Languages l on vh.languageId = l.id
            left join Users u on u.id = vh.userId
        where vh.userId = checkedUserId
    )
    select cwm.language, sum(minutesViewed) from CalculatedWatchMinutes cwm
    group by cwm.language;
end;
$$ language plpgsql;

-- Usage example:
-- select * from get_minutes_watched_for_language_by_user(1);