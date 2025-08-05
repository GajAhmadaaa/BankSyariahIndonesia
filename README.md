# Dokumentasi Proyek BankSyariahIndonesia

## 1. Pendahuluan

Repositori ini berisi kumpulan skema database dan query SQL yang digunakan untuk berbagai studi kasus dan latihan terkait sistem informasi perbankan, manufaktur, penjualan, pelatihan, rental kendaraan, dan garansi. Setiap file mewakili skenario atau kebutuhan bisnis yang berbeda.

## 2. Struktur Folder & Daftar File

```
BankSyariahIndonesia/
├── 15juli2025.sql
├── exercise1.sql
├── exercise2.sql
├── exercise3/
│   ├── case1.sql
│   ├── case1.png
│   ├── case2.sql
│   ├── case2.png
│   ├── case3.sql
│   ├── case3.png
│   ├── case4.sql
│   ├── case4.png
│   ├── case5.sql
│   ├── case5.png
│   ├── case6.sql
│   └── case6.png
├── exercise4.sql
```

## 3. Deskripsi File Utama

### [`15juli2025.sql`](/15juli2025.sql:1)
Kumpulan query SQL sederhana untuk seleksi data pada tabel produk dan karyawan, seperti filter harga produk, tanggal perekrutan, dan pencarian nama produk.

### [`exercise1.sql`](/exercise1.sql:1)
Berisi pembuatan skema database untuk sistem manufaktur otomotif, meliputi tabel Plant, CarModel, ProductionPlan, Dealer, Customer, CarSale, MaintenanceLog, PartInventory, dan CustomerFeedback. Setiap tabel dilengkapi constraint dan relasi antar entitas.

### [`exercise2.sql`](/exercise2.sql:1)
Kumpulan query SQL lanjutan untuk analisis data penjualan, produk, karyawan, dan pelanggan. Meliputi operasi join, agregasi, grouping, dan filter data pada berbagai tabel.

### [`exercise4.sql`](/exercise4.sql:1)
Berisi pembuatan beberapa view (vw_*) untuk menampilkan katalog produk aktif, direktori karyawan, ringkasan order penjualan, harga produk per kategori, pelanggan loyal, dan performa salesperson.

### Folder [`exercise3/`](/exercise3/)
Berisi enam studi kasus pembuatan skema database beserta ilustrasi diagram (PNG) untuk masing-masing kasus.

## 4. Detail exercise3

- **[`case1.sql`](/exercise3/case1.sql:1)**  
  Skema database untuk sistem pengujian kendaraan (VehicleTesting): tabel CarModel, PrototypeVehicle, TestEngineer, TestLocation, dan VehicleTest.

- **[`case2.sql`](/exercise3/case2.sql:1)**  
  Skema database pelatihan karyawan (EmployeeTraining): tabel Employee, Instructor, TrainingCourse, TrainingSession, dan ParticipationRecord.

- **[`case3.sql`](/exercise3/case3.sql:1)**  
  Skema database pengadaan sparepart (SparePartProcurement): tabel PartCategory, Part, Supplier, dan SupplierPartOffer.

- **[`case4.sql`](/exercise3/case4.sql:1)**  
  Skema database rental mobil (CarRental): tabel RentalBranch, Vehicle, Customer, Employee, dan RentalContract.

- **[`case5.sql`](/exercise3/case5.sql:1)**  
  Skema database sistem garansi kendaraan (WarrantySystem): tabel Customer, Car, WarrantyRegistration, dan WarrantyClaim.

- **[`case6.sql`](/exercise3/case6.sql:1)**  
  (File tersedia, isi dapat berupa skema database lain, silakan cek file terkait.)

Setiap kasus dilengkapi file PNG sebagai ilustrasi diagram relasi antar tabel.

## 5. Catatan Tambahan

- Seluruh file SQL dapat dijalankan di Microsoft SQL Server.
- Untuk memahami relasi antar tabel, gunakan file PNG pada folder exercise3 sebagai referensi visual.
- Penamaan tabel dan kolom mengikuti standar umum sistem informasi bisnis.
