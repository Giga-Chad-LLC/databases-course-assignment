set search_path to hse_project, public;

-- 1. Когда новый пользователь u добавляется в таблицу `Users`,
--    мы добавляем новую запись в `UsersOnlineLog`, где помечаем юзера u как
--    'онлайн' с `now()` по `INFINITY`.
create or replace function mark_user_as_online()
returns trigger as $$
begin
    insert into UsersOnlineLog(userId, gotOnlineAt, leftAt)
    values (
        new.id,
        now(),
        '9999-12-31 23:59:59'::timestamptz /* add to the timestamp with timezone */
   );
    return new;
end;
$$ language plpgsql;

create trigger log_user_after_registration
after insert on Users
for each row
execute function mark_user_as_online();

-- Below are test-queries to see how trigger works (note, that the newly created user
-- will be marked as 'isOnline=true' in the `hse_project_views.UsersOnlineView`, which is expected behaviour).
-- insert into Users(email, username, password) values
--     ('new-user@mail.com', 'I am NEW!', 'new-pass');
-- select * from UsersOnlineLog;
-- select * from hse_project_views.UsersOnlineView;



-- 2. При добавлении новой актуальной цены на фильм, прошлая цена должна в поле
--    `validUntil` вписать значение из поля новой строки `validSince`.
create or replace function mark_movie_price_as_obsolete()
returns trigger as $$
begin
    update MoviePrices
    set validUntil = new.validSince
    where validSince <= now() and
          validUntil >= now() and
          new.movieId = movieId;
    return new;
end;
$$ language plpgsql;

create trigger update_previous_movie_price_valid_until_after_new_price
before insert on MoviePrices
for each row
execute function mark_movie_price_as_obsolete();

-- Below are test-queries to see how trigger works (note, that the previous up-to-date movie price
-- `validUntil` field will be updated with the `validSince` time of the created movie price,
-- which is expected behavior.
-- insert into MoviePrices(movieId, price, validSince, validUntil) values
--     (1, 0.99, now(), '9999-12-31 23:59:59');
-- select * from MoviePrices;
-- select * from hse_project_views.MoviePricesView;