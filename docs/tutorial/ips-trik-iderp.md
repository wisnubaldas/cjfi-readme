
#### CARA UBAH KONEKSI DATABASE
 - Klik 1. Task Pane Manager - Start.
 - Pada panel Project Manager - Mimis pilih sub panel Code.
 - Klik 2x pada file amain, lalu klik Modify.
 - Ubah koneksi database.

#### CARA UPDATE IDERP (APLIKASI)
 - List item
 - Buka project IDERP, klik 2x pada file ```mimis.pjx```.
 - Pilih Window pada header bar.
 - Klik 1. Task Pane Manager - Start.
 - Pada panel Project Manager - Mimis pilih sub panel Code.
 - Akan muncul pop up, pada koloh pertama muncul pilihan berupa radio buttton, pilih baris ke 3. Pada kolom ke dua muncul pilihan berupa checkbox, pilih baris 1 & 2.
 - Klik Ok, tunggu proses selesai. Jika sudah selesai, copy and replace ```iderp.exe``` ke direktori pabrik ```(192.168.0.202)``` & jakarta ```(192.168.10.2)```.
 
#### CARA UPDATE IDERP (REPORT)
- Buka project ```IDERP/MisRpt```, klik 2x pada file ```misrpt.pjx```.
- Pilih Window pada header bar.
- Klik 1. Task Pane Manager - Start.
- Pada panel Project Manager - MisRptpilih sub panel Code.
- Akan muncul pop up, pada koloh pertama muncul pilihan berupa radio buttton, pilih baris ke 3. Pada kolom ke dua muncul pilihan berupa checkbox, pilih baris 1 & 2.
- Klik Ok, tunggu proses selesai.
- Jika sudah selesai, copy and replace iderp.exe ke direktori pabrik ```(192.168.0.202)``` & jakarta ```(192.168.10.2)```.

#### CARA UPDATE JADWAL KERJA PARBIK (SQL SERVER)
- Hapus data periode sebelumnya, jalankan sql query trunctae ```tim_tmp```.
- Buka dokumen excel, sisipkan 1 kolom kosong paling depan untuk auto increment.
- Copy semua data ke tabel ```tim_tmp``` di SQL Server.
- Execute query.

#### CARA TUTUP BUKU (PABRIK)
- Masuk ke IDERP pabrik lewat Radmin.
- Pilih menu COS MENU.
- Pilih sub menu ```COS102Z1```.
- Pilih tombol ```(+)```.
- Isi ```COSYM``` (tahun & bulan) ex : ```2020.09``` .
- Isi ```COSS OPR``` (F : Costing Finished Good & Creating Finance Statment)
- Klik Tombol Data Convert > Setelah selesai calculate, klik tombol orang hijau (User Last Record).
- Kalau data muncul lanjut ke point 8, jika tidak kembali dari point 1.
- Pilih menu PAR MENU.
- Pilih sub menu ```CLS100Z1```.
- Cari all data.
- Isi data di kolom ```SAL202D1``` sesuai tanggal hari ini.
- Klik tombol save (Data Save).
#### CARA BUKA BUKU BULAN SEBELUMNYA (PABRIK)
- Masuk ke IDERP pabrik lewat Radmin.
- Pilih menu ```PAR MENU```.
- Pilih sub menu ```CLS100Z1```.
- Ganti tanggal sesuai yang diinginka (tanggal hari ini + 2 hari) di kolom ```SAL202D1```.
- Klik tombol save (Data Save).
- Jika sudah selesai, ulangi proses ``CARA TUTUP BUKU (PABRIK)``.

#### CARA BUKA BUKU LEBIH DARI 1 BULAN SEBELUMNYA (PABRIK)
- Masuk ke IDERP pabrik lewat Radmin.
- Hapus Fix Aset di menu ```ACC201D1```.
- Ubah Y.M di menu ```CLS100Z1``` sebulan sebelumnya. Jika default nya ```2019.04``` ubah menjadi ```2019.03``` atau bulan yang sudah dilakukan costing dan tutup buku.
- Beri akses pada menu-menu yang ingin digunakan, dengan cara isi data menjadi ``“Y”`` pada menu ```CLS100Z1```.
- Klik tombol save (Data Save).
- Jika sudah selesai, ulangi proses ``CARA TUTUP BUKU (PABRIK)``.

#### CARA GANTI SAMPLE JADI BERBAYAR
- Masuk ke SQL SERVER IDERP, buka database IDERP.
- Cari tahu nomor SJ.
- Cari tahu nomor SO berdasarkan nomor SJ, jalankan query di bawah padadatabase IDERP.
    ```sql
    SELECT DDDH_C FROM SAL211B1 WHERE JHDH_C='SJ-18100478'
    ```
- Buka tabel ```sal201h1``` dan ```sal211b1```, lalu ubah isi field ```kddm_c``` menjadi ``“Y”`` atau jalankan query di bawah ini.
    ```sql
    UPDATE SAL201H1 SET KDDM_C='Y' WHERE DDDH_C='SO-18100356'
    UPDATE SAL211B1 SET KDDM_C='Y' WHERE JHDH_C='SJ-18100478'
    ```

#### CARA GANTI SAMPLE JADI GRATIS
- Masuk ke SQL SERVER IDERP, buka database IDERP.
- Cari tahu nomor SJ.
- Buka tabel ```SAL211B1```, lalu kosongkan isi field KDDM_Catau jalankan query di bawah ini.
``` sql 
UPDATE SAL211B1 SET KDDM_C='' WHERE JHDH_C='SJ-18100625Y'
```
#### CARA UPDATE PRODUK PROMO
- Buka menu ```PKT101Z1```.
- Edit data sesauai request dept. Marketing.
#### CARA MENAMBAH DEPT. DI MENU PURCHASE ORDER
- Buka menu ```PRO101Z1```.
- Atau jalankan query pencatian di tabel PRO101S1 seperti di bawah ini.  
```sql 
SELECT * FROM [dbo].[PRO101S1] WHERE ZYDM_C IN( 'D','P');
```

#### CARA MENGUBAH STOK STATIS DAN REALTIME DI MENU WAH103Z1
- Buka database IDERP.
- Untuk ubah stok statis buka tabel ```WAH103S1```, cari berdasarkan kode barang dan kode gudang. Berikut contoh query pencarin dan update stok statis seperti di bawah ini.  
    ``` sql 
    SELECT CWCL_N FROM [dbo].[WAH103S1] 
        WHERE LPDH_C= 'FG.K59PNM<GBG3L2' AND CWDM_C= 'GS'; 
    ```
Ket. Query di atas adalah pencarian jumlah stok statis, kode barang ```FG.K59PNM<GBG3L2``` pada lokasi gudang GS  
    ```sql 
        UPDATE [dbo].[WAH103S1] SET CWCL_N='100' 
            WHERE LPDH_C='FG.K59PNM<GBG3L2' AND CWDM_C='GS'; 
    ```
Ket. Query di atas adalah update jumlah stok statis menjadi 100, kode barang ```FG.K59PNM<GBG3L2``` pada lokasi gudang GS  
- Untuk ubah stok real time buka tabel ``WAH103W1``, cari berdasarkan kode barang dan kode gudang.
 Berikut contoh query pencrin dan updte stok statis seperti di bawah ini.
    ```sql 
        SELECT CWCL_N FROM [dbo].[WAH103W1] 
            WHERE LPDH_C='FG.K59PNM<GBG3L2' AND CWDM_C='GS';
    ```
Ket. Query di atas adalah pencarian jumlah stok real time, kode barang ```FG.K59PNM<GBG3L2``` pada lokasi gudang GS
    ```sql 
    UPDATE [dbo].[WAH103W1] SET CWCL_N='100' 
    WHERE LPDH_C='FG.K59PNM<GBG3L2' AND CWDM_CS='GS';
    ```
Ket. Query di atas adalah update jumlah stok real time menjadi 100, kode barang``` FG.K59PNM<GBG3L2``` pada lokasi gudang GS
- Update menu ```INV103Z1```  
    ``` sql 
    UPDATE INV103S1 SET ZKCL_N='0' WHERE LPDH_C='FG.H60GNZ<LBG6L2';
    SELECT * FROM INV103S1 WHERE LPDH_C='FG.H60GNZ<LBG6L2';
    ```
#### CARA UPDATE CONTINUE / DISCONTINUE BARANG
- Buka menu SALMENU lalu pilih sub menu ```MBO101Z2```.
- Edit data data berdasarkan Price Type.
#### CARA HAPUS ARINV MENU SAL201L4
- Langsung update query berdasarkan SJ yang ARINV nya dihapus :
    ```sql
    UPDATE SAL211B1 SET DZSL_N='0' 
    WHERE KDDM_C='' AND (JHDH_C BETWEEN 'SJ-20100648' AND 'SJ-20100708');
    ```