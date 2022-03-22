

SELECT *
FROM [Student]

SELECT *
FROM [StudentCourse]

SELECT NEWID()

INSERT INTO
    [Student]
VALUES
    (
        '79b82071-80a8-4e78-a79c-92c8cd1fd052',
        'Eduardo Queiroz',
        'hello@queiroz.io',
        '12345678901',
        '12345678',
        NULL,
        GETDATE()
)

INSERT INTO
    [StudentCourse]
VALUES
    (
        '5d9d035c-e717-9a02-2449-fe9200000000',
        '79b82071-80a8-4e78-a79c-92c8cd1fd052',
        50,
        0,
        GETDATE(),
        GETDATE()
)