# Semester Project Assignment, Databases, HSE 2024-2025

Ссылка на Google Doc с design-документом проекта: [здесь](https://docs.google.com/document/d/1-Kay0hX3Bs87BjzFrLiHMymQFnPjItti7FSAaeJehDw/edit?usp=sharing).

> Все выполненные задания расписаны в гугл доке.
> README ведется параллельно для тех задач, для которых не трубется пояснения текстом.

## Задание 1 и 2
Эти первичные задания, выполненные в гугл-доке выше.

## Задание 3
Файл [init.sql](./scripts/init.sql), в нем имплементировано:
- Создание отдельной схемы
- Создание всех таблиц из гугл-дока и констрейнтов для них

## Задание 4
Файл [populate.sql](./scripts/populate.sql), в нем имплементировано заполнение таблиц данными.

## Задание 5
Файл [crud.sql](./scripts/crud.sql), в нем имплементирован простейший CRUD для 2ух таблиц:
- `Users`
- `Movies`

## Задание 6
Файл [queries.sql](./scripts/queries.sql), в нем имплементированы 5 более сложных запросов
(`GROUP BY` + `HAVING`, `ORDER BY`, windowed queries).

## Задание 7 и 8
Файл [views.sql](./scripts/views.sql), в нем написаны view для всех таблиц (где это имеет смысл).

**Замечание**: в том же файле есть и более сложные view, которые джоинят несколько таблиц вместе
(например, `MovieLanguagesView`, `MovieGenresView`, `PurchasesView`, которых уже >=3).
Поэтому я предлагаю этот один файл как решение для задачи 7 **и** 8 вместе.

## Задание 9
Файл [triggers.sql](./scripts/triggers.sql), в нем расписаны 2 триггера и пример sql запросов,
которые показывают изменения в таблицах, вызванные триггером (этот тестирующий код закомментирован).

## Задание 10
Файл [functions.sql](./scripts/functions.sql), в нем расписаны 2 функции, что они делают, и примеры их вызовов.