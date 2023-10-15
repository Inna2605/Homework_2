--��������� �������� ���� ����� ������� (Academy), ��� �������� ���������� 
--��� ����������� �� �������� ������� �����쳿.
--���������, �� ������� ������ � �����쳿, ����������� � ������ 
--������� ��������� (Teachers), � ��� ������ ������� ����������, ���� ��: 
--���, �������, ��� ��� ��������, � ����� ���� ������� �� ������.
--����� � ��� ����� � ���������� ��� �����, �� ���������� � ������� ����� (Groups).
--��� ��� ���������� �� ������� �������� � �������� ���������� (Faculties) 
--�� ������� (Departments) ��������.
--�������
--����� �������� ��������� ���� ��������� ����� �������.
--1. �����(Groups)
--? �������������(Id). ��������� ������������� �����.
--? ��� ����� � int.
--? ���� ���������.
--? �� ���� ������ null-��������.
--? ��������� ����.
--? �����(Name). ����� �����.
--? ��� ����� � nvarchar(10).
--? �� ���� ������ null-��������.
--? �� ���� ���� �������.
--? �� ���� ���������.
--? ������� (Rating). ������� �����.
--? ��� ����� � int.
--? �� ���� ������ null-��������.
--? �� ���� � ������� �� 0 �� 5.
--? ���� (Year). ���� (��) � ����� ��������� �����.
--? ��� ����� � int.
--? �� ���� ������ null-��������.
--? �� ���� � ������� �� 1 �� 5.
--2. ������� (Departments)
--? ������������� (Id). ��������� ������������� �������.
--? ��� ����� � int.
--? ���� ���������.
--? �� ���� ������ null-��������.
--? ��������� ����.
--? Գ���������� (Financing). ���� ������������ �������.
--? ��� ����� � money.
--? �� ���� ������ null-��������.
--? �� ���� ���� ����� �� 0.
--? �������� �� ������������� � 0.
--? ����� (Name). ����� �������.
--? ��� ����� � nvarchar(100).
--? �� ���� ������ null-��������.
--? �� ���� ���� �������.
--? �� ���� ���������.
--3. ���������� (Faculties)
--? ������������� (Id). ��������� ������������� ����������.
--? ��� ����� � int.
--? ���� ���������.
--? �� ���� ������ null-��������.
--? ��������� ����.
--? �����(Name). ����� ����������.
--? ��� ����� � nvarchar(100).
--? �� ���� ������ null-��������.
--? �� ���� ���� �������.
--? �� ���� ���������.
--4. ��������� (Teachers)
--? ������������� (Id). ��������� ������������� ���������.
--? ��� ����� � int.
--? ���� ���������.
--? �� ���� ������ null-��������.
--? ��������� ����.
--? ���� ���������������� (EmploymentDate). ���� ������� ��������� �� ������.
--? ��� ����� � date.
--? �� ���� ������ null-��������.
--? �� ���� ���� ������ 01.01.1990.
--? ��� (Name). ��� ���������.
--? ��� ����� � nvarchar(max).
--? �� ���� ������ null-��������.
--? �� ���� ���� �������.
--? �������� (Premium). �������� ���������.
--? ��� ����� � money.
--? �� ���� ������ null-��������.
--? �� ���� ���� ������ �� 0.
--? �������� �� ������������� � 0.
--? ������ (Salary). ������ ���������.
--? ��� ����� � money.
--? �� ���� ������ null-��������.
--? �� ���� ���� ����� ��� ����� 0.
--? ������� (Surname). ������� ���������.
--? ��� ����� � nvarchar(max).
--? �� ���� ������ null-��������.
--? �� ���� ���� �������.

CREATE DATABASE Academy--��������� �� Academy
GO
USE Academy--������� � �� Academy
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