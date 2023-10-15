--Необхідно створити базу даних Академія (Academy), яка міститиме інформацію 
--про співробітників та внутрішній порядок академії.
--Викладачі, що читають лекції в академії, представлені у вигляді 
--таблиці Викладачі (Teachers), в якій зібрана основна інформація, така як: 
--ім’я, прізвище, дані про зарплату, а також дата прийому на роботу.
--Також у базі даних є інформація про групи, що зберігається в таблиці Групи (Groups).
--Дані про факультети та кафедри містяться у таблицях Факультети (Faculties) 
--та Кафедри (Departments) відповідно.
--Таблиці
--Нижче наведено детальний опис структури кожної таблиці.
--1. Групи(Groups)
--? Ідентифікатор(Id). Унікальний ідентифікатор групи.
--? Тип даних — int.
--? Авто збільшення.
--? Не може містити null-значення.
--? Первинний ключ.
--? Назва(Name). Назва групи.
--? Тип даних — nvarchar(10).
--? Не може містити null-значення.
--? Не може бути порожнім.
--? Має бути унікальним.
--? Рейтинг (Rating). Рейтинг групи.
--? Тип даних — int.
--? Не може містити null-значення.
--? Має бути в діапазоні від 0 до 5.
--? Курс (Year). Курс (рік) у якому навчається група.
--? Тип даних — int.
--? Не може містити null-значення.
--? Має бути в діапазоні від 1 до 5.
--2. Кафедри (Departments)
--? Ідентифікатор (Id). Унікальний ідентифікатор кафедри.
--? Тип даних — int.
--? Авто збільшення.
--? Не може містити null-значення.
--? Первинний ключ.
--? Фінансування (Financing). Фонд фінансування кафедри.
--? Тип даних — money.
--? Не може містити null-значення.
--? Не може бути менше ніж 0.
--? Значення за замовчуванням — 0.
--? Назва (Name). Назва кафедри.
--? Тип даних — nvarchar(100).
--? Не може містити null-значення.
--? Не може бути порожнім.
--? Має бути унікальним.
--3. Факультети (Faculties)
--? Ідентифікатор (Id). Унікальний ідентифікатор факультету.
--? Тип даних — int.
--? Авто збільшення.
--? Не може містити null-значення.
--? Первинний ключ.
--? Назва(Name). Назва факультету.
--? Тип даних — nvarchar(100).
--? Не може містити null-значення.
--? Не може бути порожнім.
--? Має бути унікальним.
--4. Викладачі (Teachers)
--? Ідентифікатор (Id). Унікальний ідентифікатор викладача.
--? Тип даних — int.
--? Авто збільшення.
--? Не може містити null-значення.
--? Первинний ключ.
--? Дата працевлаштування (EmploymentDate). Дата прийому викладача на роботу.
--? Тип даних — date.
--? Не може містити null-значення.
--? Не може бути меншим 01.01.1990.
--? Ім’я (Name). Ім’я викладача.
--? Тип даних — nvarchar(max).
--? Не може містити null-значення.
--? Не може бути порожнім.
--? Надбавка (Premium). Надбавка викладача.
--? Тип даних — money.
--? Не може містити null-значення.
--? Не може бути меншим ніж 0.
--? Значення за замовчуванням — 0.
--? Ставка (Salary). Ставка викладача.
--? Тип даних — money.
--? Не може містити null-значення.
--? Не може бути менше або рівним 0.
--? Прізвище (Surname). Прізвище викладача.
--? Тип даних — nvarchar(max).
--? Не може містити null-значення.
--? Не може бути порожнім.

CREATE DATABASE Academy--Створення БД Academy
GO
USE Academy--Перехід у БД Academy
GO
CREATE TABLE Teachers
(
idTeachers int primary key identity(1,1) not null,
NameTeachers nvarchar(max) not null default('---'),
SurnameTeachers nvarchar(max) not null default('---'),
EmploymentDate date not null CHECK(EmploymentDate>'01.01.1990.'),
SalaryTeachers money not null CHECK(SalaryTeachers > 0 and SalaryTeachers != 0),
Premium money not null CHECK(Premium > 0) default(0)
)
GO
CREATE TABLE Groups
(
idGroups int primary key identity(1, 1) not null,
NameGroups nvarchar(10) not null default('---') unique,
Rating int not null check(Rating > 0 and Rating < 5),
Year int not null check(Year > 1 and Year < 5)
)
GO
CREATE TABLE Departments
(
idDepartments int primary key identity(1, 1) not null,
NameDepartments nvarchar(100) not null default('---') unique,
Financing money not null check(Financing > 0) default(0)
)
GO
CREATE TABLE Faculties
(
idFaculties int primary key identity(1, 1) not null,
NameFaculties nvarchar(100) not null default('---') unique
)