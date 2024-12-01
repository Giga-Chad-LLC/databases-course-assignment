set search_path to hse_project, public;

-- 1. Когда новый пользователь u добавляется в таблицу `Users`,
--    мы добавляем новую запись в `UsersOnlineLog`, где помечаем юзера u как
--    онлайн с `u.registeredAt` по `INFINITY`.

create or replace function mark_user_as_online()
returns trigger as $$
begin
    insert into UsersOnlineLog(userId, gotOnlineAt, leftAt)
    values (new.id, now(), '9999-12-31 23:59:59'::timestamptz);
    return new;
end;
$$ language plpgsql;

create trigger log_user_after_registration
after insert on Users
for each row
execute function mark_user_as_online();

-- Below are test method to see the difference (note, that the newly created user will be marked
-- as 'online' in the `hse_project_views.UsersOnlineView`, which is expected behaviour.
-- insert into Users(email, username, password) values
--     ('new-user2@mail.com', 'I am NEW!', 'new-pass');
-- select * from UsersOnlineLog;
-- select * from hse_project_views.UsersOnlineView;