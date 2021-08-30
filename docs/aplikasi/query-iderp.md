# Kumpulan Query Iderp
!!! info "Server IDERP"
    IP: `192.168.0.202` username: `user` password: `12345678`

#### Rubah Golongan SJ jadi sample atau non-sample (official)

Mapping table nya ada di :

- `sal211h1` header base SJ
- `sal211b1` detail base SJ
- `sal201h1` header base SO field `DDDH_C`

contoh query:

``` sql
select * from sal211h1 where jhdh_c IN  ('SJ-21070651','SJ-21070017' ) ;
select * from sal211b1 WHERE jhdh_c IN  ('SJ-21080417' ) ;
select * from sal201h1 where dddh_c IN ('SAM-21070017 ','SO-21061498 ')
```

Update field `kddm_c` untuk berubah golongan menjadi sample dengan `Y` pada SJ official,
``` sql
UPDATE sal211h1 SET kddm_c = 'Y' WHERE jhdh_c IN  ('SJ-21070651','SJ-21070017' ) ;
```
Sebaliknya untuk sample ke official hilangkan `Y` pada field `kddm_c`.
##### Query update harga berdasarkan SJ
``` sql 
UPDATE sal211b1 SET 
	bbje_n = '37000',
	ddsl_n = '1',
	djsl_n = '1',
	jhje_n = '37000',
	jhsl_n = '1',
	zhje_n = '37000',
	dosl_n = '1',
	dzsl_n = '1',
	dddj_n = '37000'
WHERE
	jhdh_c IN ('SJ-21070651','SJ-21070653','SJ-21070664','SJ-21070671' )
```
angka `37000` adalah total harga dan `1` adalah qty barang.

#### Cari User IDERP
``` sql
SELECT * FROM USR101H1 WHERE yhdh_c like '%dian%';
SELECT * from USR101B1  WHERE yhdh_c like '%dian%' AND csdh_c = 'acc201d1';
```

#### Tarik data discontinue
``` sql
SELECT
	A.KODE,
	ISNULL( ( SELECT SFSC_C FROM MBO101S2 WHERE BJLB_C = A.KODE ), 'Y' ) AS STATUS 
FROM
	(
	SELECT SUBSTRING
		( LPDH_C, 4, 6 ) + '.' + SUBSTRING ( LPDH_C, 11, 3 ) AS KODE 
	FROM
		INV101S1 
	WHERE
		LEFT ( LPDH_C, 3 ) = 'FG.' 
		AND SUBSTRING ( LPDH_C, 16, 1 ) IN ( '1', '2', '3', 'P' ) 
	GROUP BY
		SUBSTRING ( LPDH_C, 4, 6 ) + '.' + SUBSTRING ( LPDH_C, 11, 3 ) 
	) AS A 
WHERE
	A.KODE IN ('G40LAZ.MGS','G40POG.MGS','G40PRA.MGN','G40BEA.MBG')
```