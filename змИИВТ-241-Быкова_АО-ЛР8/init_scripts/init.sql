CREATE TABLE IF NOT EXISTS Клиенты (
    id_клиента SERIAL PRIMARY KEY,
    ФИО_клиента VARCHAR(255),
    Данные_паспорта VARCHAR(255),
    Адрес VARCHAR(255),
    Телефон VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Транспорт (
    id_транспорта SERIAL PRIMARY KEY,
    Длительность_пути INT
);

CREATE TABLE IF NOT EXISTS Рейсы (
    id_рейса SERIAL PRIMARY KEY,
    Время_отправления VARCHAR(255),
    Вид_транспорта INT references Транспорт (id_транспорта)
);

CREATE TABLE IF NOT EXISTS Маршруты (
    id_маршрута SERIAL PRIMARY KEY,
    Страна_назначения VARCHAR(255),
    Стоимость_транспортных_услуг MONEY,
    Стоимость_оформления_визы MONEY,
    Номер_рейса INT references Рейсы (id_рейса)
);

CREATE TABLE IF NOT EXISTS Поездки (
    id_поездки SERIAL PRIMARY KEY,
    Цель_поездки VARCHAR(255),
    Дата_начала_поездки DATE,
    Количество_дней INT,
    Стоимость_одного_дня_пребывания MONEY,
    Номер_маршрута INT references Маршруты (id_маршрута)
);

CREATE TABLE IF NOT EXISTS Клиенты_поездки (
    id_кл_поезд SERIAL PRIMARY KEY,
    id_клиента INT references Клиенты (id_клиента),
    id_поездки INT references Поездки (id_поездки)
);












