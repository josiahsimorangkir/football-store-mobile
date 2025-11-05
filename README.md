# Tugas 7
##  Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget?
Semua yang dilihat di layar itu sebenarnya adalah widget. Mulai dari tulisan, tombol, gambar, sampai struktur layout seperti baris dan kolom, semuanya disusun dari widget. Nah, kumpulan widget yang saling bertumpuk dan saling membungkus satu sama lain itu disebut widget tree. Misalnya kita bikin tampilan dengan Scaffold yang di dalamnya ada AppBar, lalu di bawahnya ada Center yang berisi Column, dan di dalam kolom itu ada Text dan ElevatedButton. Nah, Scaffold di situ jadi induk dari semuanya, Column jadi induk dari Text dan ElevatedButton, dan seterusnya. Jadi hubungan parent–child di Flutter itu intinya kayak widget besar yang membungkus widget lain di dalamnya. Si parent biasanya ngatur posisi atau gaya dari anaknya. Contohnya, kalau pakai Center, semua child di dalamnya bakal otomatis ditaruh di tengah layar.

## Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya
Layout Dasar
Pertama, kita punya Scaffold sebagai kerangka utama aplikasi yang ngebantu bikin struktur dasar. Di bagian atasnya ada AppBar yang nampung judul aplikasi "Football News". Buat ngatur tata letaknya, kita pake Column dan Row - Column buat nyusun widget secara vertikal (atas-bawah), sedangkan Row buat nyusun horizontal (kiri-kanan).

Komponen Utama
Di dalem aplikasi, ada beberapa widget :

1. InfoCard yang nampung info NPM, nama, dan kelas. Widget ini dibungkus pake Card biar ada efek bayangan yang kece.
2. ItemCard yang isinya menu-menu utama dengan ikon dan teks. Pake Material buat kasih warna background yang beda-beda, plus InkWell biar bisa di-klik dan muncul efek ripple yang keren.

Pengaturan Tata Letak
Buat ngatur jarak dan posisi, kita pake:

1. Container buat ngasih padding dan ngatur ukuran
2. Center buat mastiin konten ada di tengah
3. GridView.count yang bikin menu-menu tersusun rapi dalam grid 3 kolom
4. SizedBox dan Padding buat ngasih jarak antar elemen

Elemen Tampilan:

1. Text buat nampilin semua tulisan
2. Icon buat nampilin ikon-ikon yang sesuai sama menunya
3. SnackBar yang muncul di bawah waktu pencet menu

## Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root?

MaterialApp adalah widget yang sangat penting dalam Flutter dan biasanya digunakan sebagai root widget. Berikut penjelasan lengkapnya:

Fungsi Utama MaterialApp

1. Implementasi Material Design

    a. Menyediakan tema default Material Design
    b. Mengatur style, warna, dan animasi sesuai guidelines Google

2. Konfigurasi Aplikasi

    a. Mengatur judul aplikasi
    b. Menentukan tema (light/dark mode)
    c. Mengatur lokalisasi (multi-bahasa)
    d. Mengelola navigasi dan routing

3. Fitur Built-in

    a. Navigator untuk manajemen route
    b. Scaffold Messenger untuk menampilkan SnackBar
    c. Material Design components

Mengapa Digunakan Sebagai Root?
1. Inisialisasi Aplikasi

    a. Menyediakan context yang dibutuhkan widget child
    b. Mengatur konfigurasi global aplikasi
    c. Menginisialisasi sistem navigasi

2. Efisiensi

    a. Memastikan resource Material Design dimuat sekali
    b. Mengoptimalkan performa dengan shared resources
    
3. Konsistensi

    a. Menjamin konsistensi UI di seluruh aplikasi
    b. Memudahkan maintenance dan styling


## Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

1. StatelessWidget
    a. Sifat: Immutable (tidak bisa berubah)
    b. State: Tidak memiliki internal state
    c. Performa: Lebih ringan dan cepat
    d. Use Case: UI statis yang tidak perlu update

    Pakai ketika:

    a. Menampilkan data statis
    b. Widget hanya bergantung pada parameter konstruktor
    c. Tidak ada interaksi user yang mengubah tampilan
    Contoh: Text, Icon, InfoCard

2. StatefulWidget
    a. Sifat: Mutable (bisa berubah)
    b. State: Memiliki internal state yang bisa diupdate
    c. Performa: Lebih berat karena harus manage state
    d. Use Case: UI dinamis yang butuh update

    Pakai ketika:

    a. Ada data yang berubah seiring waktu
    b. Ada interaksi user yang mengubah tampilan
    c. Perlu melakukan HTTP request
    Contoh: Form, Counter, Shopping Cart


## Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?


Pengertian BuildContext

BuildContext adalah lokasi widget dalam widget tree Flutter. Ia seperti "alamat" yang memberi tahu posisi sebuah widget relatif terhadap widget lainnya.

Kenapa BuildContext Penting?

1. Akses Theme & MediaQuery

    a. Mendapatkan tema aplikasi
    b. Mengakses ukuran layar
    c. Mendapatkan orientasi device

2. Navigasi

    a. Mengatur perpindahan antar halaman
    b. Menampilkan dialog/bottom sheet

3. State Management

    a. Mencari widget ancestor
    b. Mengakses inherited widgets

Best Practices
a. Selalu gunakan BuildContext yang diberikan di method build
b. Hindari menyimpan BuildContext sebagai variable class
c. Pastikan context masih valid saat digunakan (tidak disposed)
d. Gunakan context.mounted untuk cek validitas context


## Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Hot Reload 
Cara Kerja:

    a. Meng-inject kode yang diubah ke Dart VM
    b. Membangun ulang widget tree
    c. Mempertahankan state aplikasi
    d. Sangat cepat (biasanya < 1 detik)

Kapan Digunakan:

    a. Perubahan UI/layout
    b. Menambah/mengubah method
    c. Mengubah widget tree

Hot Restart (🔄)

Cara Kerja:

    a. Mereset Dart VM
    b. Memuat ulang seluruh aplikasi
    c. Menghapus semua state
    d. Lebih lambat dari hot reload

Kapan Digunakan:

    a. Mengubah state initialization
    b. Menambah package baru
    c. Mengubah variable static/global
    d. Hot reload tidak bekerja