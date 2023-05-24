select apk_finanse.użytkownik.imię,apk_finanse.użytkownik.nazwisko, apk_finanse.cel_finansowy.cel from apk_finanse.użytkownik left join apk_finanse.cel_finansowy on apk_finanse.użytkownik.id = apk_finanse.cel_finansowy.Użytkownik_id;

select apk_finanse.użytkownik.email, apk_finanse.wydatek.nazwa from apk_finanse.użytkownik left join apk_finanse.wydatek on apk_finanse.użytkownik.id = apk_finanse.wydatek.Użytkownik_id;

select apk_finanse.użytkownik.email, apk_finanse.wydatek.nazwa, apk_finanse.wydatek.kwota from apk_finanse.użytkownik left join apk_finanse.wydatek on apk_finanse.użytkownik.id = apk_finanse.wydatek.Użytkownik_id order by apk_finanse.wydatek.kwota ASC;

select MAX(apk_finanse.wydatek.kwota), apk_finanse.użytkownik.id from apk_finanse.użytkownik left join apk_finanse.wydatek on apk_finanse.użytkownik.id = apk_finanse.wydatek.Użytkownik_id group by apk_finanse.użytkownik.id;

select apk_finanse.użytkownik.imię, apk_finanse.przychód.nazwa, apk_finanse.szczegóły_przychodu.opis 
from apk_finanse.użytkownik
right join apk_finanse.przychód on apk_finanse.użytkownik.id=apk_finanse.przychód.Użytkownik_id
inner join apk_finanse.szczegóły_przychodu on apk_finanse.przychód.Szczegóły_przychodu_id=apk_finanse.szczegóły_przychodu.id;

select * from apk_finanse.kategoria_przychodów;

select apk_finanse.użytkownik.nazwisko, apk_finanse.plan_wydatków.kwota_wydana,apk_finanse.kategoria_wydatków.nazwa as 'Nazwa kategorii'
from apk_finanse.użytkownik 
inner join apk_finanse.plan_wydatków on apk_finanse.użytkownik.id=plan_wydatków.Użytkownik_id
inner join apk_finanse.kategoria_wydatków on apk_finanse.plan_wydatków.Kategoria_wydatków_id=apk_finanse.kategoria_wydatków.id
 where apk_finanse.użytkownik.id=1;
 
 SELECT SUM(apk_finanse.wydatek.kwota) AS 'Suma wydatków'
FROM apk_finanse.wydatek
INNER JOIN apk_finanse.kategoria_wydatków ON apk_finanse.wydatek.Kategoria_wydatków_id = apk_finanse.kategoria_wydatków.id
WHERE apk_finanse.wydatek.Użytkownik_id = 1 AND apk_finanse.kategoria_wydatków.nazwa = 'Elektronika';


SELECT apk_finanse.użytkownik.nazwisko, SUM(apk_finanse.wydatek.kwota) AS 'Suma wydatków'
FROM apk_finanse.użytkownik 
INNER JOIN apk_finanse.wydatek ON apk_finanse.użytkownik.id = apk_finanse.wydatek.Użytkownik_id
GROUP BY apk_finanse.użytkownik.id;

SELECT apk_finanse.użytkownik.nazwisko, MAX(apk_finanse.wydatek.kwota) AS 'Największy wydatek'
FROM apk_finanse.użytkownik 
LEFT JOIN apk_finanse.wydatek ON apk_finanse.użytkownik.id = apk_finanse.wydatek.Użytkownik_id
GROUP BY apk_finanse.użytkownik.id;

SELECT apk_finanse.użytkownik.nazwisko, SUM(apk_finanse.przychód.kwota) AS 'Suma przychodów', SUM(apk_finanse.wydatek.kwota) AS 'Suma wydatków'
FROM apk_finanse.użytkownik 
LEFT JOIN apk_finanse.przychód ON apk_finanse.użytkownik.id = apk_finanse.przychód.Użytkownik_id
LEFT JOIN apk_finanse.wydatek ON apk_finanse.użytkownik.id = apk_finanse.wydatek.Użytkownik_id
GROUP BY apk_finanse.użytkownik.id;

SELECT COUNT(*) as 'Total Customers' 
FROM apk_finanse.użytkownik;


