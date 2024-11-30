set search_path to hse_project, public;

-- Users
insert into Users(email, username, password) values
    ('dima2@example.com', 'dima2', 'password-dima2');

select * from Users
    where username = 'dima2';

update Users
    set email = 'dima2-new-mail@example.com', password = 'strong-password'
    where username = 'dima2';

delete from Users where email = 'dima2-new-mail@example.com';

-- Movies
insert into Movies(title, description, durationSec, resourceUrl) values
    ('Your Name', 'Wrong description....', 106 * 60, 'https://www.imdb.com/title/tt5311514');

select title, durationSec, resourceUrl from Movies
    where durationSec > 100 * 60;

update Movies
    set description = 'Two teenagers share a profound, magical connection upon discovering they are swapping bodies. Things manage to become even more complicated when the boy and girl decide to meet in person.'
    where title = 'Your Name';

delete from Movies
    where title = 'Your Name';