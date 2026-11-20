## Temuan 1: Pembelian ulang sangat rendah

Temuan: Hanya 3,00% pelanggan (2.801 dari 93.358) yang membeli lebih dari sekali. Sekitar 97% pelanggan hanya bertransaksi satu kali.
Pendukung:
	•	Pelanggan repeat rata-rata total belanjanya 260,1, sedangkan pelanggan sekali beli 138,0. Nilai pelanggan repeat sekitar 1,9 kali lipat, dengan selisih 122,1 per pelanggan.
	•	Dari dashboard penjualan, jumlah pesanan (96.478) hampir sama dengan jumlah pelanggan (93.358), yaitu sekitar 1,03 pesanan per pelanggan. Ini konsisten dengan rendahnya pembelian ulang.

Dugaan penyebab (dugaan, belum diuji dengan data):
	1	Karakter produk. Kategori teratas seperti watches_gifts, furniture_decor, dan bed_bath_table cenderung dibeli sesekali atau sebagai hadiah, bukan kebutuhan rutin.
	2	Belum ada alasan untuk kembali. Tidak terlihat program loyalitas, voucher pembelian kedua, atau retargeting setelah transaksi pertama.
	3	Fokus pada akuisisi. Revenue tumbuh pesat lewat pelanggan baru, sehingga retensi mungkin kurang diprioritaskan.
	4	Pengalaman pembelian pertama. Keterlambatan pengiriman atau produk yang tidak sesuai bisa membuat pelanggan tidak kembali (perlu dicek lewat data review dan waktu pengiriman).
	5	Konsentrasi wilayah. Pelanggan terpusat di SP, RJ, dan MG, sehingga pelanggan di wilayah lain mungkin menghadapi ongkir lebih mahal atau pengiriman lebih lama (perlu dicek).
	6	Rentang data terbatas. Data sekitar 2 tahun mungkin terlalu pendek untuk produk dengan siklus pembelian ulang yang panjang.

Rekomendasi:
	1	Kirim voucher atau diskon khusus pembelian kedua dalam 30-60 hari setelah transaksi pertama, lewat email atau WhatsApp.
	2	Buat program loyalitas sederhana, misalnya poin atau gratis ongkir untuk pembelian berikutnya.
	3	Lakukan cross-sell antarkategori yang berkaitan, misalnya dari bed_bath_table ke housewares dan furniture_decor.
	4	Analisis pelanggan yang tidak kembali: bandingkan skor review, waktu pengiriman, dan state mereka dengan pelanggan repeat.
	5	Jadikan repeat rate sebagai KPI bulanan di dashboard, dan tambahkan pemisahan repeat rate per state dan per kategori.
Dampak yang diharapkan: Sebagai ilustrasi, jika repeat rate naik dari 3% menjadi 4% (sekitar 933 pelanggan tambahan) dan setiap pelanggan tambahan bernilai 122,1 lebih tinggi, potensi tambahan revenue sekitar 114 ribu, atau sekitar 0,9% dari total revenue 13,2 juta. Ini perkiraan kasar yang mengasumsikan selisih belanja memang akibat pembelian ulang, padahal pelanggan repeat bisa saja sudah berbeda sejak awal. Manfaat lainnya adalah ketergantungan pada akuisisi pelanggan baru berkurang dan pendapatan lebih stabil.

## Temuan 2: Keterlambatan berkaitan dengan rating rendah

Temuan: Sebanyak 8,11% pesanan terlambat (7.826 dari 96.470 pesanan yang punya tanggal tiba). Sekitar 9 dari 10 pesanan tiba tepat waktu, tetapi pesanan yang terlambat berdampak besar pada kepuasan pelanggan.
Pendukung:
	•	Rating turun bertingkat mengikuti lamanya keterlambatan: 4,29 (tepat waktu), 3,28 (telat 1-3 hari), 2,12 (telat 4-7 hari), dan 1,69 (telat lebih dari 7 hari).
	•	Pesanan yang terlambat 1-3 hari saja sudah kehilangan sekitar 1 poin rating (4,29 menjadi 3,28), dan yang terlambat lebih dari 7 hari kehilangan sekitar 2,6 poin.
	•	Keterlambatan tidak merata antarwilayah: state seperti CE dan SE sekitar 2,6 kali lebih sering terlambat dibanding SP (15,3% vs 5,9%).

Dugaan penyebab (dugaan, belum diuji dengan data):
	1	Jarak dan logistik antarwilayah. Penjual dan pusat distribusi kemungkinan terpusat di SP, sehingga pengiriman ke state yang jauh (CE, SE, BA, dan wilayah timur laut lainnya) lebih lama dan lebih rentan terlambat.
	2	Estimasi pengiriman terlalu optimis. Janji tanggal tiba mungkin dibuat tanpa mempertimbangkan kondisi tiap wilayah, sehingga pesanan dihitung terlambat walaupun lama pengirimannya wajar.
	3	Keterlambatan di sisi penjual. Proses pengemasan dan serah terima ke kurir yang lambat bisa menghabiskan waktu sebelum barang berangkat.
	4	Kinerja kurir. Mitra logistik tertentu mungkin kurang andal di rute atau wilayah tertentu.
	5	Musim ramai. Lonjakan pesanan pada periode promo atau akhir tahun dapat membebani pengiriman (perlu dicek per bulan).
	6	Rating juga dipengaruhi hal lain. Rating rendah belum tentu disebabkan keterlambatan saja. Hubungan ini bersifat korelasi, bukan bukti sebab-akibat.

Rekomendasi:
	1	Sesuaikan estimasi tanggal tiba per wilayah agar lebih realistis, terutama untuk state dengan tingkat keterlambatan tinggi.
	2	Evaluasi dan pantau kinerja kurir per rute, lalu ganti atau tambah mitra logistik di wilayah bermasalah.
	3	Tetapkan batas waktu serah terima barang ke kurir bagi penjual, dan beri peringatan atau sanksi bagi yang sering terlambat.
	4	Pertimbangkan gudang atau pusat distribusi regional untuk wilayah dengan keterlambatan tinggi.
	5	Terapkan penanganan proaktif: beri notifikasi dan kompensasi (voucher atau diskon) kepada pelanggan yang pesanannya diperkirakan terlambat, sebelum mereka memberi ulasan.
	6	Tambahkan persen terlambat per state dan per kurir sebagai KPI bulanan, dan perbaiki dashboard agar semua state terlihat.
	7	
Dampak yang diharapkan: Sebagai ilustrasi, jika persen terlambat turun dari 8,11% menjadi 6%, sekitar 2.000 pesanan (kira-kira 2,1% dari 96.470) berpindah dari terlambat ke tepat waktu. Bila rating pesanan itu naik dari kisaran 2-3 menjadi sekitar 4,29, rata-rata rating keseluruhan naik kira-kira 0,05 sampai 0,06 poin, dari 4,155 menjadi sekitar 4,21. Ini perkiraan kasar karena komposisi kelompok telat tidak terlihat di dashboard dan asumsinya rating naik penuh ke level tepat waktu. Manfaat lainnya adalah kepuasan pelanggan yang lebih baik, yang dapat mendukung Temuan 1 karena pengalaman pembelian pertama yang baik meningkatkan peluang pelanggan kemb
Temuan 3: Revenue tumbuh pesat lalu mendatar, dan terkonsentrasi pada beberapa kategori
Temuan:
	•	Bulan tertinggi: Revenue tertinggi sekitar 985 ribu, tercapai pada November 2017 [konfirmasi dari SQL 1]. Mei 2018 hampir menyamai (sekitar 975 ribu).
	•	Tren: Revenue naik dari mendekati 0 di akhir 2016 menjadi sekitar 650 ribu pada Oktober 2017, lalu melonjak ke puncak November 2017. Sejak awal 2018 revenue mendatar di kisaran 830 ribu sampai 975 ribu dan turun di bulan-bulan terakhir (sekitar 840 ribu).
	•	Kategori teratas: health_beauty (sekitar 1,23 juta), watches_gifts (sekitar 1,16 juta), dan bed_bath_table (sekitar 1,02 juta). Tiga kategori ini menyumbang sekitar 3,4 juta, atau kira-kira 26% dari total revenue 13,2 juta. Sepuluh kategori teratas menyumbang sekitar 8,2 juta, atau kira-kira 62%.
Pendukung:
	•	Lonjakan November 2017 diikuti penurunan tajam di Desember 2017 (sekitar 725 ribu), sebuah pola khas lonjakan musiman.
	•	Setelah Januari 2018 (sekitar 920 ribu), revenue naik-turun di kisaran 830 ribu sampai 975 ribu tanpa pertumbuhan yang jelas, jadi pertumbuhan cepat 2017 tampaknya melambat. Angka pertumbuhan per bulan (growth %) [isi dari SQL 3].
	•	Kategori ranking 4-10 (sports_leisure, computers_accessories, furniture_decor, housewares, cool_stuff, auto, toys) berkisar 470 ribu sampai 955 ribu, jadi tidak ada satu kategori pun yang terlalu dominan. Yang terbesar hanya sekitar 9% dari total.
Dugaan penyebab (dugaan, belum diuji dengan data):
	1	Lonjakan November 2017. Kemungkinan dipicu promo Black Friday dan persiapan belanja akhir tahun.
	2	Pertumbuhan awal yang cepat. Basis awal sangat kecil, jadi pertumbuhan persentase terlihat besar, dan platform masih menambah penjual serta pelanggan.
	3	Pelambatan 2018. Dari Temuan 1, pertumbuhan bergantung pada pelanggan baru dan repeat rate hanya 3%, sehingga ketika akuisisi melambat, revenue ikut mendatar.
	4	Penurunan bulan terakhir. Bisa jadi data bulan terakhir belum lengkap karena pesanan yang belum berstatus delivered tidak terhitung (query memakai order_status = 'delivered').
	5	Dominasi kategori tertentu. health_beauty, watches_gifts, dan bed_bath_table kemungkinan punya banyak penjual, harga yang cocok untuk belanja online, atau cocok sebagai hadiah.
Rekomendasi:
	1	Rencanakan kampanye musiman sejak September-Oktober, dengan stok dan kapasitas pengiriman disiapkan, karena lonjakan akhir tahun terbukti besar.
	2	Pertahankan fokus pada tiga kategori teratas lewat promo bundling, tetapi kembangkan juga kategori menengah (sports_leisure, computers_accessories) agar tidak bergantung pada satu kelompok.
	3	Cek apakah penurunan bulan terakhir akibat data belum lengkap atau penurunan sungguhan, lalu tambahkan growth % bulanan di dashboard.
	4	Gabungkan dengan Temuan 1 dan 2: tumbuhkan revenue lewat retensi pelanggan dan pengiriman tepat waktu, bukan hanya akuisisi.
	5	Telusuri kategori dengan pertumbuhan tercepat dan nilai pesanan tertinggi [isi dari SQL 2: jumlah pesanan per kategori].
Dampak yang diharapkan: Sebagai ilustrasi, jika revenue bulanan 2018 yang mendatar di kisaran 900 ribu naik 10% lewat kampanye musiman dan retensi, tambahannya sekitar 90 ribu per bulan, atau sekitar 1 juta per tahun (kira-kira 8% dari total revenue saat ini). Ini perkiraan kasar dan bergantung pada kemampuan menaikkan permintaan tanpa menurunkan margin. Dengan portofolio kategori yang lebih merata, risiko akibat turunnya satu kategori juga berkurang.
