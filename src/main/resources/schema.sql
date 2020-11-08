CREATE TABLE IF NOT EXISTS Organisation
(
    id        INTEGER COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
    version   INTEGER      NOT NULL COMMENT 'Служебное поле hibernate',
    name      VARCHAR(50)  NOT NULL COMMENT 'Наименование',
    full_name VARCHAR(100) NOT NULL COMMENT 'Полное имя',
    inn       BIGINT(10)   NOT NULL COMMENT 'ИНН',
    kpp       BIGINT(9)    NOT NULL COMMENT 'КПП',
    address   VARCHAR(150) NOT NULL COMMENT 'Адрес',
    phone     BIGINT(11) COMMENT 'Телефон',
    is_active BOOLEAN COMMENT 'Действует'
);
COMMENT ON TABLE Organisation IS 'Организация';
CREATE UNIQUE INDEX UX_Organisation_inn ON Organisation (inn);

CREATE TABLE IF NOT EXISTS Office
(
    id        INTEGER COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
    version   INTEGER      NOT NULL COMMENT 'Служебное поле hibernate',
    name      VARCHAR(50)  NOT NULL COMMENT 'Наименование',
    address   VARCHAR(150) NOT NULL COMMENT 'Адрес',
    phone     BIGINT(11) COMMENT 'Телефон',
    org_id    INTEGER      NOT NULL COMMENT 'Уникальный идентификатор организации',
    is_active BOOLEAN COMMENT 'Действует',
    FOREIGN KEY (org_id) REFERENCES Organisation (id)
);
COMMENT ON TABLE Office IS 'Офис';
CREATE INDEX IX_Office_org_id ON Office (org_id);

CREATE TABLE IF NOT EXISTS Country
(
    id      INTEGER COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
    version INTEGER     NOT NULL COMMENT 'Служебное поле hibernate',
    name    VARCHAR(50) NOT NULL COMMENT 'Наименование',
    code    INTEGER(3),
    CONSTRAINT UX_Country_name_code UNIQUE (name, code)
);
COMMENT ON TABLE Country IS 'Страна';

CREATE TABLE IF NOT EXISTS User
(
    id            INTEGER COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
    version       INTEGER     NOT NULL COMMENT 'Служебное поле hibernate',
    first_name    VARCHAR(50) NOT NULL COMMENT 'Имя',
    last_name     VARCHAR(50) NOT NULL COMMENT 'Фамилия',
    middle_name   VARCHAR(50) NOT NULL COMMENT 'Отчество?',
    position      VARCHAR(20) COMMENT 'Должность',
    phone         BIGINT(11) COMMENT 'Номер телефона',
    country_id    INTEGER     NOT NULL COMMENT 'Уникальный идентификатор страны',
    office_id     INTEGER     NOT NULL COMMENT 'Уникальный идентификатор офиса',
    is_identified BOOLEAN COMMENT 'Идентифицирован',
    FOREIGN KEY (country_id) REFERENCES Country (id),
    FOREIGN KEY (office_id) REFERENCES Office (id)
);
COMMENT ON TABLE User IS 'Пользователь';
CREATE INDEX IX_User_office_id ON User (office_id);
CREATE INDEX IX_User_country_id ON User (country_id);

CREATE TABLE IF NOT EXISTS Document_type
(
    id      INTEGER COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
    version INTEGER     NOT NULL COMMENT 'Служебное поле hibernate',
    name    VARCHAR(25) NOT NULL COMMENT 'Название типа документа',
    CONSTRAINT UX_Document_name UNIQUE (name)
);
COMMENT ON TABLE Document_type IS 'Тип документа';

CREATE TABLE IF NOT EXISTS Document
(
    user_id     INTEGER COMMENT 'Уникальный идентификатор пользователя' PRIMARY KEY,
    version     INTEGER NOT NULL COMMENT 'Служебное поле hibernate',
    doc_type_id INTEGER COMMENT 'Уникальный идентификатор типа документа',
    doc_number  BIGINT(15) COMMENT 'Номер документа',
    doc_date    DATE COMMENT 'Дата выдачи документа',
    FOREIGN KEY (doc_type_id) REFERENCES Document_type (id),
    FOREIGN KEY (user_id) REFERENCES User (id)
);
COMMENT ON TABLE Document IS 'Документ';
CREATE INDEX IX_Document_doc_type_id ON Document (doc_type_id);
CREATE INDEX IX_Document_user_id ON Document (user_id);



