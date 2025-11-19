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



# Tugas 8

## Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

Navigator.push() digunakan untuk menampilkan halaman baru di atas halaman saat ini, sehingga user masih bisa kembali dengan tombol back, sedangkan Navigator.pushReplacement() mengganti halaman yang sedang aktif dengan halaman baru dan menghapus halaman sebelumnya dari stack navigasi. Pada aplikasi saya, Navigator.push() cocok digunakan untuk halaman seperti Add Product agar user dapat kembali ke halaman produk, sementara Navigator.pushReplacement() lebih sesuai untuk berpindah ke Home Page karena halaman utama tidak perlu kembali ke halaman sebelumnya.

## Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

Dalam Flutter, Scaffold digunakan sebagai kerangka utama halaman yang menyediakan struktur dasar seperti AppBar, Drawer, dan body. AppBar menampilkan judul atau aksi utama di bagian atas halaman, sedangkan Drawer digunakan untuk navigasi antarhalaman seperti Home, My Products, dan Add Products. Dengan menggunakan hierarki ini secara konsisten di setiap halaman Football Store, tampilan aplikasi jadi teratur, mudah dinavigasi.

## Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

Widget seperti Padding, SingleChildScrollView, dan ListView membantu menciptakan tampilan form yang rapi, responsif, dan nyaman digunakan. Padding memberi jarak antar elemen agar tidak menempel di tepi layar, SingleChildScrollView memungkinkan halaman di-scroll saat konten melebihi layar, dan ListView mempermudah penataan banyak elemen form secara vertikal. Dalam aplikasi saya, kombinasi ketiga widget ini digunakan pada halaman Add Product agar form produk tampil bersih dan tetap bisa diakses meskipun keyboard muncul

## Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Warna tema penting untuk menciptakan identitas visual yang konsisten di seluruh aplikasi. Pada Football Store, tema warna disesuaikan dengan karakteristik brand menggunakan kombinasi hijau dan putih yang mencerminkan nuansa lapangan sepak bola. Pengaturan ini dilakukan melalui ThemeData di MaterialApp, yang mengatur warna utama (primaryColor), warna tombol, serta tampilan AppBar. Dengan penerapan warna yang seragam, aplikasi terlihat profesional, mudah dikenali, dan memiliki kesan visual yang kuat.


# Tugas 9

## Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

kita perlu membuat model Dart saat mengambil atau mengirim data JSON karena model memberi struktur dan jaminan tipe yang jelas, sehingga setiap field yang diterima atau dikirim memiliki tipe yang benar dan tidak berubah-ubah. Jika kita hanya pake Map<String, dynamic>, kita kehilangan validasi tipe, rentan terjadi error runtime (misalnya field price ternyata null atau bukan int), dan kode menjadi sulit dirawat karena tidak ada kontrak data yang pasti. Dengan model, semua operasi lebih aman secara null-safety, autocomplete lebih akurat, refactor lebih mudah, dan kesalahan bisa terdeteksi di compile-time, bukan saat aplikasi berjalan.

## Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

package http dipakai untuk melakukan request HTTP biasa seperti GET atau POST tanpa manajemen sesi. Artinya setiap request berdiri sendiri, tidak menyimpan cookie login, dan cocok untuk endpoint publik seperti mengambil daftar produk atau memanggil API yang tidak membutuhkan autentikasi.

Sementara itu, CookieRequest (dari package pbp_django_auth) berperan sebagai session manager yang menyimpan cookie autentikasi setelah user login. Dengan ini, request ke backend Django akan membawa sessionid secara otomatis, sehingga bisa mengakses endpoint yang membutuhkan login—misalnya membuat produk, melihat produk milik sendiri, atau fitur “My Products”.

Jadi bedanya: http = request stateless tanpa sesi, sedangkan CookieRequest = request dengan sesi dan autentikasi otomatis.

##  Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Instance CookieRequest perlu dibagikan ke semua komponen (melalui Provider) karena objek ini menyimpan state autentikasi, termasuk cookie sesi (sessionid) yang membuat user tetap login. Jika tiap halaman membuat instance CookieRequest baru, maka cookie tidak akan tersimpan, user dianggap belum login di halaman lain, dan semua request ke endpoint Django yang membutuhkan autentikasi akan gagal. Dengan membagikan instance yang sama ke seluruh widget, seluruh bagian aplikasi dapat mengakses status login, mengirim request terautentikasi, dan menjaga pengalaman pengguna tetap konsisten tanpa harus login berulang-ulang.

 ## Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

 Agar Flutter bisa berkomunikasi dengan Django, beberapa konfigurasi harus disetel dengan benar. Alamat 10.0.2.2 perlu dimasukkan ke ALLOWED_HOSTS karena emulator Android tidak bisa mengakses localhost secara langsung, dan tanpa itu Django akan menolak request. Django juga harus mengaktifkan CORS dan mengizinkan pengiriman cookie lintas origin—termasuk mengatur SameSite=None dan Secure—supaya session login dapat terkirim ke Flutter; jika tidak, aplikasi akan selalu dianggap belum login meskipun kredensial benar. Di sisi Android, aplikasi harus diberikan izin INTERNET agar bisa melakukan request ke server; tanpa izin ini, seluruh API call akan gagal. Jika salah satu konfigurasi ini tidak dilakukan dengan benar, Flutter dapat gagal terhubung ke server, request diblokir, atau session login tidak terbaca.

 ## Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

 Mekanisme pengiriman data di Flutter dimulai dari user masukin input melalui widget seperti TextField, lalu nilai tersebut ditangkap oleh controller dan diformat/ divalidasi sebelum dikirim ke backend melalui HTTP request. Backend kemudian memproses data dan mengirimkan respons berupa JSON. Flutter menerima respons ini, mengonversinya ke model Dart, lalu memperbarui state (menggunakan setState, Provider, Bloc, dan lain-lain). Setelah state berubah, Flutter otomatis melakukan rebuild UI, sehingga data yang diterima dapat ditampilkan di layar.

 ## Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

 Mekanisme autentikasi Flutter–Django dimulai ketika pengguna mengisi data akun (untuk login atau register) di Flutter. Data ini dikirim ke Django melalui HTTP request dalam format JSON. Untuk register, Django menerima data, memvalidasi, membuat akun baru, lalu mengembalikan respons (misalnya status sukses). Untuk login, Django memeriksa kecocokan email/username dan password, lalu jika benar Django membuat dan mengirimkan token autentikasi (misalnya JWT atau token session) kembali ke Flutter. Flutter kemudian menyimpan token ini (misalnya di SharedPreferences atau SecureStorage) dan menggunakan token tersebut untuk setiap request selanjutnya agar pengguna tetap terautentikasi. Setelah token tersimpan, Flutter memperbarui state (logged-in) dan menampilkan menu utama atau halaman beranda. Saat logout, Flutter menghapus token dari penyimpanan lokal dan (opsional) mengirim request logout ke Django. Setelah token dihapus, Flutter kembali ke halaman login karena pengguna dianggap tidak lagi memiliki izin akses.