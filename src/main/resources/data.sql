INSERT INTO Organisation (id, version, name, full_name, inn, kpp, address, phone, is_active)
VALUES (1, 0, 'ООО "Рога и Копыта"','Общество с ограниченной ответственностью "Рога и копыта"',
        '5835888111', '583501001', 'Ул. Свободы 1', '79375858585', true);

INSERT INTO Organisation (id, version, name, full_name, inn, kpp, address, phone, is_active)
VALUES (2, 0, 'ООО "Хлебобетонстрой"','Общество с ограниченной ответственностью "Хлебобетонстрой"',
        '5835999111', '583501001', 'Ул. Лжи 10', '79375858566', true);

INSERT INTO Office (id, version, name, address, phone, org_id, is_active)
VALUES (1, 0, 'РК-центр','Ул. Свободы 1', '79375858585', 1, true);

INSERT INTO Office (id, version, name, address, phone, org_id, is_active)
VALUES (2, 0, 'ХБС','Ул. Лжи 10', '79375858566', 2, true);

INSERT INTO Country (id, version, name, code) VALUES (1, 0, 'Россия', 643);
INSERT INTO Country (id, version, name, code) VALUES (2, 0, 'США', 826);

INSERT INTO User (id, version, first_name, last_name, middle_name, position, phone, country_id, office_id, is_identified)
VALUES (1, 0, 'Олег', 'Иванов', 'Сергеевич', 'Генеральный директор', '79995552222', 1, 1, true);

INSERT INTO User (id, version, first_name, last_name, middle_name, position, phone, country_id, office_id, is_identified)
VALUES (2, 0, 'Оксана', 'Иванова', 'Львовна', 'Секретарь', '79955672221', 1, 1, true);

INSERT INTO User (id, version, first_name, last_name, middle_name, position, phone, country_id, office_id, is_identified)
VALUES (3, 0, 'Руслан', 'Питонов', 'Михайлович', 'Грузчик', '79005667224', 1, 1, false);

INSERT INTO User (id, version, first_name, last_name, middle_name, position, phone, country_id, office_id, is_identified)
VALUES (4, 0, 'Пётр', 'Иванов', 'Олегович', 'Бухгалтер', '79994562222', 2, 2, true);

INSERT INTO User (id, version, first_name, last_name, middle_name, position, phone, country_id, office_id, is_identified)
VALUES (5, 0, 'Ян', 'Гуглов', 'Антонович', 'Электрик', '79933472271', 1, 2, true);

INSERT INTO User (id, version, first_name, last_name, middle_name, position, phone, country_id, office_id, is_identified)
VALUES (6, 0, 'Степан', 'Онегин', 'Фёдорович', 'Грузчик', '79055667445', 1, 2, true);

INSERT INTO Document_type (id, version, name, code) VALUES (1, 0, 'Паспорт', 21);
INSERT INTO Document_type (id, version, name, code) VALUES (2, 0, 'Военный билет', 07);
INSERT INTO Document_type (id, version, name, code) VALUES (3, 0, 'Свидетельство о рождении', 03);
INSERT INTO Document_type (id, version, name, code) VALUES (4, 0, 'Удостоверение беженца', 13);

INSERT INTO Document (user_id, version, doc_type_id, doc_number, doc_date) VALUES (1, 0, 1, '4599099445', '2002-01-31');
INSERT INTO Document (user_id, version, doc_type_id, doc_number, doc_date) VALUES (2, 0, 1, '6399045442', '2012-04-12');
INSERT INTO Document (user_id, version, doc_type_id, doc_number, doc_date) VALUES (3, 0, 3, '5544099987', '2008-01-17');
INSERT INTO Document (user_id, version, doc_type_id, doc_number, doc_date) VALUES (4, 0, 4, '1515099444', '1995-04-22');
INSERT INTO Document (user_id, version, doc_type_id, doc_number, doc_date) VALUES (5, 0, 2, '4599666487', '2002-01-31');