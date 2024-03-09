import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PrivacyView extends GetView {
  const PrivacyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Privacy Policy',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: RichText(
                  text: const TextSpan(
                      text: '''KEBIJAKAN PRIVASI

Kebijakan Privasi berikut ini menjelaskan bagaimana Kami mengumpulkan, menyimpan, menggunakan, memindahkan, mengungkapkan dan melindungi informasi pribadi Anda yang dapat diidentifikasi yang diperoleh melalui Aplikasi kami (sebagaimana didefinisikan di bawah). Mohon Anda membaca Kebijakan Privasi ini dengan seksama untuk memastikan bahwa Anda memahami bagaimana ketentuan Kebijakan Privasi ini kami berlakukan. 

Kebijakan Privasi ini disertakan sebagai bagian dari Ketentuan Penggunaan kami. Kebijakan Privasi ini mencakup hal-hal sebagai berikut: 

Definisi

Informasi yang kami kumpulkan

Penggunaan informasi yang kami kumpulkan

Pemberian informasi yang kami kumpulkan

Keamanan

Perubahan atas Kebijakan Privasi ini

Lain-lain

Pengakuan dan persetujuan

Penarikan Persetujuan dan Pemusnahan

Berhenti menerima e-mail

Cara untuk menghubungi kami

Penggunaan Anda atas Aplikasi dan layanan kami tunduk pada Ketentuan Penggunaan dan Kebijakan Privasi ini dan mengindikasikan persetujuan Anda terhadap Ketentuan Penggunaan dan Kebijakan Privasi tersebut.

Definisi

“Afiliasi” berarti (i) pihak pengendali dari; (ii) anak perusahaan dari; atau (iii) pihak yang berada dalam satu pengendalian dengan FOREST NERD

"Aplikasi" berarti suatu aplikasi piranti lunak dan/atau situs portal yang Kami kembangkan yang merupakan suatu sarana elektronik untuk (i) menemukan Layanan yang disediakan oleh pihak ketiga; (ii) mengelola penyediaan Layanan; dan/atau (iii) fungsi lainnya yang diperlukan untuk mendukung ekosistem Layanan.

"Informasi Pribadi" berarti informasi mengenai Anda yang secara pribadi dapat diidentifikasi yang dikumpulkan melalui Aplikasi, seperti nama, alamat, tanggal lahir dan pekerjaan (apabila Anda adalah seorang individu), data dan dokumen identitas perusahaan (apabila Anda bukan seorang individu), nomor telepon, alamat surat elektronik (e-mail), perizinan dan/atau sejenisnya, dan informasi lain yang mungkin dapat mengidentifikasi Anda sebagai pengguna Aplikasi.

"Kami" berarti FOREST NERD, suatu perusahaan yang didirikan berdasarkan hukum Negara Republik Indonesia, dan/atau Afiliasi-nya.

"Ketentuan Penggunaan" berarti syarat dan ketentuan atau prosedur standar operasi atau ketentuan lainnya sehubungan dengan masing-masing Aplikasi yang dikembangkan oleh FOREST NERD dan/atau Afiliasi-nya (sebagaimana berlaku), sebagaimana dapat diubah atau ditambah dari waktu ke waktu oleh FOREST NERD dan/atau Afiliasi-nya;

"Layanan" berarti berbagai layanan yang ditawarkan Penyedia Layanan melalui Aplikasi, termasuk namun tidak terbatas pada pengantaran atau penjemputan untuk barang dan/atau orang, layanan pembelanjaan pribadi dan/atau layanan lainnya yang disediakan dari waktu ke waktu melalui Aplikasi.

“Pelanggan” berarti pihak yang terdaftar sebagai pelanggan Aplikasi untuk menggunakan Layanan yang disediakan di dalam Aplikasi.

"Penyedia Layanan" berarti pihak yang menyediakan Layanan melalui Aplikasi



Informasi yang Kami Kumpulkan

Kami mengumpulkan Informasi Pribadi tertentu dari Anda agar Aplikasi dapat menjalankan fungsinya baik untuk penggunaan Layanan (apabila Anda adalah Pelanggan) atau pengelolaan penyediaan Layanan (apabila Anda adalah Penyedia Layanan) atau fungsi lainnya yang diperlukan untuk mendukung ekosistem Layanan. Informasi Pribadi dapat Anda berikan secara langsung (sebagai contoh, saat Anda mendaftar sebagai pengguna Aplikasi) maupun terkumpul secara otomatis ketika Anda menggunakan Aplikasi.

Ketika Anda mengunjungi Situs Web, administrator Situs Web akan memproses data teknis seperti alamat protokol internet (internet protocol address) Anda, halaman web yang pernah Anda kunjungi, browser internet yang Anda gunakan, halaman web yang sebelumnya/selanjutnya Anda kunjungi dan durasi setiap kunjungan/sesi yang memungkinkan Kami untuk mengirimkan fungsi-fungsi Situs Web. Sebagai tambahan, dalam beberapa hal, browser dapat menyarankan Anda agar mengaktifkan fungsi geo-location Anda untuk memungkinkan Kami memberikan Anda suatu pengalaman yang lebih baik dalam menggunakan internet dan/atau Aplikasi. Dengan data teknis ini administrator-administrator Situs Web dapat mengelola Situs Web, misalnya dengan menyelesaikan kesulitan-kesulitan teknis atau memperbaiki kemampuan akses bagian-baigan tertentu dari Situs Web. Dengan cara ini, Kami dapat memastikan bahwa Anda dapat (terus) menemukan informasi pada Situs Web dengan cara yang cepat dan sederhana.

Informasi yang Anda berikan secara langsung.

Pada saat mendaftar pada Aplikasi, Anda akan memberikan kepada Kami Informasi Pribadi tertentu sesuai Ketentuan Penggunaan yang disyaratkan masing-masing jenis dan fungsi Aplikasi.

Ketika Anda menggunakan Aplikasi untuk menggunakan atau mengelola suatu Layanan, Anda memberikan informasi pada kami sebagaimana relevan, seperti, apabila Anda adalah Pelanggan, jenis Layanan, lokasi penjemputan/pengantaran barang/jasa yang dipesan dan/atau total biaya transaksi Layanan, atau, apabila Anda adalah Penyedia Layanan, data pesanan dan data terkait pengelolaan Layanan, jumlah dana atas transaksi Layanan dan/atau data lainnya sebagai pendukung ekosistem Layanan. Ketika Anda menggunakan Aplikasi Kami, Kami juga akan memproses data teknis Anda seperti, internet protocol address, identitas (ID) perangkat internet atau alamat kontrol akses media (media access control address), dan informasi mengenai pabrikan, model, dan sistem operasi dari perangkat yang Anda gunakan untuk mengakses Aplikasi. Kami menggunakan data ini untuk memungkinkan Kami untuk mengirimkan fungsi-fungsi dari Aplikasi, menyelesaikan kesulitan-kesulitan teknis, menyediakan bagi Anda versi Aplikasi yang benar dan terkini serta untuk meningkatkan fungsi Aplikasi.

Apabila Anda adalah Pelanggan, Kami akan meminta nomor telepon seseorang yang dapat dihubungi oleh Penyedia Layanan untuk melengkapi pesanan Anda ketika Anda menggunakan Aplikasi untuk menemukan suatu Layanan kurir instan, atau Layanan lainnya yang relevan. Anda harus mendapatkan persetujuan terlebih dahulu dari orang yang nomor teleponnya Anda berikan pada Kami untuk memberikan nomor teleponnya pada Kami dan untuk Kami memberikan nomor telepon tersebut kepada Penyedia Layanan.

Apabila Anda adalah Penyedia Layanan, Kami akan meminta nomor telepon pihak yang dapat dihubungi oleh Pelanggan yang menggunakan Layanan. Anda harus memastikan bahwa persetujuan terlebih dahulu dari pemilik nomor tersebut telah didapatkan untuk Kami memperoleh nomor telepon tersebut dan memberikannya kepada Pelanggan.

Sehubungan dengan fasilitas uang elektronik yang mungkin tersedia dalam Aplikasi, Kami akan mengumpulkan informasi terkait transaksi uang elektronik tersebut oleh Anda, termasuk namun tidak terbatas pada nama bank, nama pemegang rekening, nomor rekening dan jumlah dana yang ditransaksikan melalui fasilitas uang elektronik tersebut.

Informasi yang kami kumpulkan ketika anda menggunakan Aplikasi.

Ketika Anda menggunakan Aplikasi melalui perangkat bergerak/mobile device Anda, Kami akan melacak dan mengumpulkan informasi geo-location secara real-time dan informasi lainnya yang relevan untuk menunjang efisiensi kinerja dan fungsi Aplikasi. Apabila Anda adalah Pelanggan, Kami menggunakan informasi ini untuk, di antaranya, memungkinkan Anda untuk melihat lokasi Penyedia Layanan, mengatur lokasi service dan/atau pengantaran dan mengirimkan informasinya kepada Penyedia Layanan yang diminta, serta untuk memantau pergerakan Penyedia Layanan yang diminta mendekat di suatu peta secara real-time. Apabila Anda adalah Penyedia Layanan, Kami menggunakan informasi geo-location untuk, di antaranya, memungkinkan Anda untuk melihat lokasi Pelanggan, yang sedang membutuhkan service (sebagaimana relevan). Kami juga dapat menggunakan informasi geo-location secara real-time ini untuk memberikan bantuan, menyelesaikan kesulitan-kesulitan teknis atau usaha yang mungkin timbul pada saat Anda menggunakan Aplikasi. Anda dapat mematikan informasi pelacak geo-location pada tingkatan perangkat Anda untuk sementara waktu. Perangkat bergerak/mobile device Anda akan memberitahukan Anda ketika geo-location Anda dilacak dengan menampilkan simbol panah Global Positioning System (GPS).

Informasi geo-location yang kami peroleh dari Penyedia Layanan berarti bahwa Kami juga mengumpulkan informasi pergerakan Anda (apabila Anda adalah Pelanggan) ketika Anda bepergian dengan dengan menggunakan Layanan dalam Aplikasi. Kami juga akan menggunakan informasi geo-location secara keseluruhan dan dalam bentuk tanpa nama untuk mendapatkan informasi statistik dan informasi pengelolaan untuk tujuan peningkatan fungsi Aplikasi.

Penggunaan Cookie

Cookie adalah berkas data kecil yang ditempatkan browser Anda pada perangkat internet Anda. Dengan cookie, fitur aplikasi dan/atau situs web yang Anda akses dapat menyimpan informasi atau mengingat tindakan dan preferensi Anda dari waktu ke waktu.

Sebagian besar browser internet mendukung cookie; namun Anda dapat mengatur browser yang Anda gunakan untuk menolak beberapa jenis cookie tertentu atau cookie spesifik. Di samping itu, Anda dapat menghapus cookie kapan saja.

Kami menggunakan cookie untuk berbagai tujuan. Kami menggunakannya, misalnya, untuk mengingat preferensi penelusuran aman Anda, membantu Anda untuk menggunakan Layanan (apabila Anda adalah Pelanggan) atau mengelola Layanan (apabila Anda adalah Penyedia Layanan), dan melindungi data Anda.

Penggunaan Informasi yang Kami Kumpulkan

Kami menggunakan alamat surat elektronik (e-mail), nama, nomor telepon, dan/atau dan sandi akun Anda untuk tujuan verifikasi kepemilikan Anda atas suatu akun dalam Aplikasi kami, untuk berkomunikasi dengan Anda sehubungan dengan penggunaan atau pengelolaan Layanan dan untuk memberikan Anda informasi mengenai Aplikasi. Kami juga dapat menggunakan nama, alamat surat elektronik (e-mail) dan nomor telepon Anda untuk mengirimkan pesan, pembaharuan yang bersifat umum atas Aplikasi, penawaran-penawaran khusus atau promosi-promosi. Kami juga akan mengirimkan surat elektronik (e-mail) kepada Anda yang meminta Anda untuk berlangganan daftar surat menyurat (mailing list) Kami. Anda dapat setiap saat memilih untuk tidak menerima informasi mengenai pembaharuan ini.

Kami menggunakan geo-location dan informasi tujuan Pelanggan untuk (i) menemukan Penyedia Layanan yang berada di sekitar Pelanggan; (ii) membantu Penyedia Layanan memperhitungkan biaya; dan (iii) menganalisa pola penggunaan Aplikasi untuk meningkatkan kinerja Aplikasi.

Kami menggunakan informasi seperti barang-barang yang di service dibeli dan/atau dipesan melalui Layanan serta biaya transaksi atas Layanan untuk menentukan apakah Aplikasi dapat menerima pesanan Pelanggan berdasarkan Ketentuan Penggunaan.

Kami menggunakan informasi seperti nama bank di mana rekening dibuat dan disimpan dan jumlah yang ditransaksikan dengan menggunakan uang elektronik dalam sistem Aplikasi untuk memastikan penerimaan oleh pihak yang bersangkutan atas dana yang ditransaksikan melalui sistem uang elektronik tersebut.

Kami menggunakan Informasi Pribadi secara keseluruhan untuk menganalisa pola penggunaan Aplikasi. Anda dengan ini setuju bahwa data Anda akan digunakan oleh sistem pemrosesan data internal Kami untuk memastikan diberikannya fungsi yang terbaik dalam Aplikasi untuk Anda.

Pemberian Informasi yang Kami Kumpulkan

Apabila Anda adalah Pelanggan, maka setelah menerima pesanan Anda, Kami akan memberikan informasi seperti nama, nomor telepon, lokasi, tujuan, geo-location, jenis jasa service yang dipesan dan/atau biaya transaksi Anda kepada Penyedia Layanan yang menerima permintaan Anda atas Layanan. Informasi ini dibutuhkan oleh Penyedia Layanan untuk menghubungi Anda, dan/atau menemukan Anda dan/atau memenuhi pesanan Anda. Kami juga akan memberikan nomor telepon pihak yang dapat dihubungi yang telah Anda berikan kepada kami kepada Penyedia Layanan ketika Anda menggunakan Aplikasi untuk menggunakan Layanan berupa kurir instan atau Layanan lainnya yang relevan.

Apabila Anda adalah Penyedia Layanan, maka setelah menerima instruksi pesanan dari Pelanggan, Kami akan memberikan informasi seperti nama, nomor telepon, lokasi, geo-location, nomor identitas kendaraan Anda atau pelaksana penyediaan Layanan di bawah manajemen Anda kepada Pelanggan yang memesan Layanan Anda. Informasi ini dibutuhkan oleh Pelanggan untuk untuk menghubungi Anda dan/atau memantau melihat status perjalanan barang/jasa yang dipesan Pelanggan.

Anda dengan ini setuju dan memberikan wewenang pada Kami untuk memberikan Informasi Pribadi Anda kepada Penyedia Layanan (apabila Anda adalah Pelanggan) atau Pelanggan (apabila Anda adalah Penyedia Layanan) sebagai suatu bagian dari Ketentuan Penggunaan. Informasi Pribadi Anda secara otomatis akan dihapus dari Aplikasi yang digunakan Penyedia Layanan (apabila Anda adalah Pelanggan) atau Pelanggan (apabila Anda adalah Penyedia Layanan) setelah transaksi Layanan dipenuhi. Akan tetapi, terdapat kemungkinan dimana Penyedia Layanan/Pelanggan (sebagaimana relevan) dapat menyimpan data Anda di perangkat mereka dengan cara apapun. Komunikasi antara Pelanggan dan Penyedia Layanan yang dilakukan di luar Aplikasi (seperti komunikasi telefon atau pesan singkat atau fitur komunikasi lainnya di luar Aplikasi milik FOREST NERD dan/atau Afiliasi-nya) juga dapat disimpan di dalam perangkat yang bersangkutan. Kami tidak bertanggung jawab atas penyimpanan data dengan cara-cara tersebut dan atas dasar tersebut Anda setuju untuk membela, memberikan ganti rugi dan membebaskan Kami dari segala tanggung jawab atas segala penyalahgunaan Informasi Pribadi Anda oleh Penyedia Layanan/Pelanggan (sebagaimana relevan) setelah berakhirnya Layanan yang diberikan.

Kami dapat mempekerjakan atau bekerja sama dengan perusahaan-perusahaan dan orang perorangan pihak ketiga untuk memfasilitasi atau memberikan bantuan pengembangan Aplikasi dan layanan-layanan tertentu untuk dan/atau atas nama Kami, untuk, di antaranya, (i) memberikan bantuan konsumen; (ii) memberikan informasi geo-location; (iii) melaksanakan layanan-layanan terkait dengan Situs Web (termasuk namun tidak terbatas pada layanan pemeliharaan, pengelolaan database, analisis web dan penyempurnaan fitur-fitur Situs Web); (iv) membantu Kami dalam menganalisa bagaimana Aplikasi dan Layanan digunakan serta bagaimana pengembangannya; atau (v) untuk membantu penasihat profesional dan auditor eksternal Kami, termasuk penasihat hukum, penasihat keuangan, dan konsultan-konsultan. Para pihak ketiga ini hanya memiliki akses atas Informasi Pribadi Anda untuk melakukan tugas-tugas tersebut untuk dan/atau atas nama Kami dan secara kontraktual terikat untuk tidak mengungkapkan atau menggunakan Informasi Pribadi tersebut untuk tujuan lain apapun.

Kami tidak membagikan Informasi Pribadi Anda kepada pihak manapun selain kepada Penyedia Layanan (apabila Anda adalah Pelanggan) atau Pelanggan (apabila Anda adalah Penyedia Layanan) yang terkait serta pihak ketiga yang disebutkan di paragraf 4 huruf d di atas, tanpa persetujuan dari Anda. Namun demikian, Kami akan mengungkapkan Informasi Pribadi Anda sepanjang diwajibkan secara hukum, atau diperlukan untuk tunduk pada ketentuan peraturan perundang-undangan, institusi pemerintah, atau dalam hal terjadi sengketa, atau segala bentuk proses hukum antara Anda dan Kami, atau antara Anda dan pengguna lain sehubungan dengan, atau terkait dengan Layanan, atau dalam keadaan darurat yang berkaitan dengan kesehatan dan/atau keselamatan Anda.

Informasi Pribadi Anda dapat dialihkan, disimpan, digunakan, dan diproses di suatu yurisdiksi selain Indonesia dimana server-server Kami berada. 

Kami dapat menghilangkan bagian-bagian tertentu dari Informasi Pribadi Anda yang dapat mengidentifikasikan Anda (sehingga Informasi Pribadi tersebut menjadi data anonim) dan mengungkapkan data anonim tersebut tersebut ke pihak ketiga untuk tujuan pengembangan Aplikasi, pengelolaan database, analisa atau peningkatan Layanan. Kami juga dapat mengkombinasikan Informasi Pribadi Anda dengan informasi-informasi lain sedemikan rupa sehingga informasi tersebut tidak lagi ter-asosiasi dengan Anda, kemudian mengungkapkan informasi yang telah dikombinasikan tersebut kepada pihak ketiga, untuk tujuan-tujuan tersebut di atas.

Kami tidak menjual atau menyewakan Informasi Pribadi Anda kepada pihak ketiga.

Keamanan

Kerahasiaan data dan Informasi Pribadi Anda adalah hal yang terpenting bagi kami. Kami akan memberlakukan upaya dan langkah terbaik untuk melindungi dan mengamankan data dan Informasi Pribadi Anda. Akan tetapi Kami tidak dapat sepenuhnya menjamin bahwa sistem Kami tidak akan dapat ditembus sama sekali akibat adanya virus, malware, gangguan atau kejadian luar biasa termasuk akses tanpa otorisasi oleh pihak ketiga. Anda tidak boleh mengungkapkan sandi akun Anda kepada siapapun dan harus senantiasa menjaga keamanan perangkat yang Anda gunakan. 

Perubahan atas Kebijakan Privasi ini

Kami dapat mengubah Kebijakan Privasi ini untuk mencerminkan perubahan dalam kegiatan Kami. Jika Kami mengubah Kebijakan Privasi ini, Kami akan memberitahu Anda melalui surat elektronik (e-mail) atau dengan cara pemberitahuan di Situs Web 1 (satu) hari sebelum perubahan berlaku. Kami menghimbau Anda untuk meninjau halaman ini secara berkala untuk mengetahui informasi terbaru tentang bagaimana ketentuan Kebijakan Privasi ini Kami berlakukan. 

Lain-lain

Hukum yang Mengatur dan Yurisdiksi

Kebijakan Privasi ini diatur oleh dan ditafsirkan menurut hukum Negara Republik Indonesia. Setiap dan seluruh sengketa yang timbul dari Kebijakan Privasi ini akan diatur oleh yurisdiksi eksklusif dari Pengadilan Negeri Jakarta Selatan.

Pengakuan dan Persetujuan

Dengan menggunakan Aplikasi, Anda mengakui bahwa Anda telah membaca dan memahami Kebijakan Privasi ini dan Ketentuan Penggunaan dan setuju dan sepakat terhadap penggunaan, praktek, pemrosesan dan pengalihan Informasi Pribadi Anda oleh Kami sebagaimana dinyatakan di dalam Kebijakan Privasi ini.

Anda juga menyatakan bahwa Anda memiliki hak untuk membagikan seluruh informasi yang telah Anda berikan kepada Kami dan untuk memberikan hak kepada Kami untuk menggunakan dan membagikan informasi tersebut kepada Penyedia Layanan (apabila Anda adalah Pelanggan) atau Pelanggan (apabila Anda adalah Penyedia Layanan) guna mendukung dan melaksanakan fungsi Aplikasi.

Penarikan Persetujuan dan Pemusnahan

Kecuali ditentukan lain pada peraturan perundang-undangan, Anda dapat melakukan penarikan persetujuan Anda atas pengumpulan, penggunaan dan/atau pengungkapan Informasi Pribadi Anda dan/atau pemusnahan Informasi Pribadi Anda yang persyaratan dan tata cara nya sesuai dengan peraturan perundang-undangan yang secara khusus mengatur hal ini.

Penarikan persetujuan atau pemusnahan Informasi Pribadi Anda baik sebagian atau seluruhnya, dapat mengakibatkan Anda tidak lagi dapat menggunakan Aplikasi dan/atau Situs Web kami. Dengan ini Anda menyatakan telah mengetahui dan memahami dampak penarikan persetujuan dan/atau pemusnahan Informasi Pribadi Anda tersebut. 

Berhenti menerima e-mail 

Kami memiliki kebijakan untuk Anda agar dapat memilih untuk masuk atau keluar dari daftar surat-menyurat/mailing list Kami. Jika Anda ingin berhenti menerima surat elektronik (e-mail) dari Kami, silahkan klik link unsubscribe yang disertakan pada masing-masing e-mail tersebut. 

Cara untuk Menghubungi Kami 

Jika Anda memiliki pertanyaan lebih lanjut tentang privasi dan keamanan informasi Anda atau ingin memperbarui atau menghapus data Anda maka silakan hubungi kami di: teamsinergi9@gmail.com atau telepon ke: 085254257455 

  FOREST NERD

Komp Ramayana no 181 RT 23 Batu Ampar

76136 Balikpapan, Kalimantan Timur, Indonesia''',
                      style: TextStyle(color: Colors.black))),
            )
          ],
        ),
      ),
    );
  }
}
