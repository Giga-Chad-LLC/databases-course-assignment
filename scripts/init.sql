-- Create project custom schema
create schema if not exists hse_project;
set search_path to hse_project, public;

-- Create tables
create table if not exists Users(
    id serial primary key,
    email text unique not null,
    username text not null,
    password text not null,
    registeredAt timestamp not null default now()
);

create table if not exists UsersOnlineLog(
    id serial primary key,
    userId int not null references Users(id),
    gotOnlineAt timestamptz not null,
    leftAt timestamptz not null,
    constraint chk_valid_visit_times check (gotOnlineAt <= leftAt)
);

create table if not exists Movies(
    id serial primary key,
    title text not null,
    description text not null,
    durationSec integer not null,
    resourceUrl text not null,
    constraint chk_valid_duration check (durationSec >= 0)
);

create table if not exists MoviePrices(
    id serial primary key,
    movieId int not null references Movies(id),
    price numeric(10, 2) not null,
    validSince timestamp not null,
    validUntil timestamp not null,
    constraint chk_valid_dates check (validSince <= validUntil)
);

create table if not exists Languages(
    id serial primary key,
    language text unique not null,
    createdAt timestamp not null default now()
);

create table if not exists MovieLanguages(
    id serial primary key,
    movieId int not null references Movies(id),
    languageId int not null references Languages(id),
    releaseDate date not null,
    createdAt timestamp not null default now()
);

create table if not exists Genres(
    id serial primary key,
    genre text unique not null,
    createdAt timestamp not null default now()
);

create table if not exists MovieGenres(
    id serial primary key,
    genreId int not null references Genres(id),
    movieId int not null references Movies(id)
);

create table if not exists ViewingHistory(
    id serial primary key,
    userId int not null references Users(id),
    movieId int not null references Movies(id),
    languageId int not null references Languages(id),
    viewingStartedAt timestamptz not null,
    viewingFinishedAt timestamptz not null,
    viewedMovieFully boolean not null,
    constraint chk_valid_viewing_times check (viewingStartedAt <= viewingFinishedAt)
);

create table if not exists Purchases(
    id serial primary key,
    userId int not null references Users(id),
    movieId int not null references Movies(id),
    moviePriceId int not null references MoviePrices(id),
    languageId int not null references Languages(id),
    purchasedAt timestamp not null default now()
);