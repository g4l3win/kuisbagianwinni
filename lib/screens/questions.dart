// questions.dart
class Questions {
  static List<Map<String, dynamic>> getQuestions(String subject) {
    if (subject == 'Flutter') {
      return [
        {
          'question': 'Apa yang dimaksud dengan widget di Flutter?',
          'options': [
            'A) Komponen yang digunakan untuk menyimpan data',
            'B) Komponen yang digunakan untuk membangun antarmuka pengguna',
            'C) Alat untuk menguji aplikasi',
            'D) Fitur untuk membuat animasi'
          ],
          'correctAnswer':
              'B) Komponen yang digunakan untuk membangun antarmuka pengguna',
        },
        {
          'question':
              'Manakah dari berikut ini yang merupakan manfaat dari menggunakan Flutter?',
          'options': [
            'A) Hanya untuk aplikasi Android',
            'B) Performa yang lambat dibandingkan framework lain',
            'C) Dapat digunakan untuk mengembangkan aplikasi di berbagai platform (Android, iOS, Web)',
            'D) Tidak mendukung pengembangan aplikasi desktop'
          ],
          'correctAnswer':
              'C) Dapat digunakan untuk mengembangkan aplikasi di berbagai platform (Android, iOS, Web)',
        },
        {
          'question':
              'Fitur apa yang memungkinkan pengembang untuk melihat perubahan kode secara langsung di Flutter?',
          'options': [
            'A) Hot Swap',
            'B) Hot Reload',
            'C) Live Reload',
            'D) Instant Run'
          ],
          'correctAnswer': 'B) Hot Reload',
        }
      ];
    } else if (subject == 'C++') {
      return [
        {
          'question':
              'Apa tipe data yang digunakan untuk menyimpan angka desimal dalam C++?',
          'options': ['A) int', 'B) char', 'C) float', 'D) bool'],
          'correctAnswer': 'C) float',
        },
        {
          'question':
              'Apa tujuan dari pernyataan #include <iostream> dalam C++?',
          'options': [
            'A) Menghentikan program',
            'B) Menggunakan fungsi input/output',
            'C) Menghasilkan kesalahan',
            'D) Mengalokasikan memori'
          ],
          'correctAnswer': 'B) Menggunakan fungsi input/output',
        },
        {
          'question':
              'Pernyataan mana yang benar mengenai penggunaan operator && di C++?',
          'options': [
            'A) Operator && digunakan untuk penugasan.',
            'B) Operator && digunakan untuk membandingkan dua nilai.',
            'C) Operator && digunakan untuk operasi logika "dan".',
            'D) Operator && tidak valid di C++.'
          ],
          'correctAnswer':
              'C) Operator && digunakan untuk operasi logika "dan".',
        }
      ];
    } else if (subject == 'HTML') {
      return [
        {
          'question': 'Apa tag HTML yang digunakan untuk membuat hyperlink?',
          'options': ['A. <link>', 'B. <a>', 'C. <href>', 'D. <url>'],
          'correctAnswer': 'B. <a>',
        },
        {
          'question':
              'Apa yang digunakan untuk menerapkan gaya CSS ke elemen HTML?',
          'options': ['A. <style>', 'B. <script>', 'C. <link>', 'D. <css>'],
          'correctAnswer': 'A. <style>',
        },
        {
          'question': 'Apa ekstensi file yang digunakan untuk file PHP?',
          'options': ['A. .html', 'B. .css', 'C. .php', 'D. .js'],
          'correctAnswer': 'C. .php',
        }
      ];
    } else if (subject == 'SQL') {
      return [
        {
          'question':
              'Apa perintah SQL yang digunakan untuk menambahkan data baru ke dalam tabel?',
          'options': ['A) ADD', 'B) INSERT', 'C) UPDATE', 'D) CREATE'],
          'correctAnswer': 'B) INSERT',
        },
        {
          'question':
              'Perintah SQL mana yang digunakan untuk memperbarui data yang sudah ada dalam tabel?',
          'options': ['A) MODIFY', 'B) CHANGE', 'C) UPDATE', 'D) ALTER'],
          'correctAnswer': 'C) UPDATE',
        },
        {
          'question': 'Apa fungsi dari perintah SQL SELECT COUNT(*)?',
          'options': [
            'A) Menghitung jumlah kolom',
            'B) Menghitung jumlah tabel',
            'C) Menghitung jumlah baris',
            'D) Menghitung jumlah karakter'
          ],
          'correctAnswer': 'C) Menghitung jumlah baris',
        }
      ];
    }
    return [];
  }
}

class BenarSalahQuestions {
  static List<Map<String, dynamic>> getBenarSalahQuestions(String subject) {
    if (subject == 'Flutter') {
      return [
        {
          'question':
              'Hot Reload di Flutter memungkinkan pengembang untuk melihat perubahan kode secara langsung tanpa harus menghentikan dan memulai kembali aplikasi.',
          'options': ['Benar', 'Salah'],
          'correctAnswer': 'Benar',
        },
        {
          'question':
              'Di Flutter, widget adalah elemen dasar yang digunakan untuk membangun antarmuka pengguna.',
          'options': ['Benar', 'Salah'],
          'correctAnswer': 'Benar',
        },
        {
          'question':
              'Flutter adalah framework yang hanya dapat digunakan untuk mengembangkan aplikasi Android.',
          'options': ['Benar', 'Salah'],
          'correctAnswer': 'Salah',
        }
      ];
    } else if (subject == 'C++') {
      return [
        {
          'question': 'Pernyataan: Di C++, array dimulai dari indeks 1.',
          'options': ['Benar', 'Salah'],
          'correctAnswer': 'Salah',
        },
        {
          'question':
              'Struktur kontrol if di C++ tidak memerlukan tanda kurung untuk kondisi yang dievaluasi.',
          'options': ['Benar', 'Salah'],
          'correctAnswer': 'Salah',
        },
        {
          'question':
              'Dalam C++, pointer digunakan untuk menyimpan alamat memori dari variabel.',
          'options': ['Benar', 'Salah'],
          'correctAnswer': 'Benar',
        }
      ];
    } else if (subject == 'HTML') {
      return [
        {
          'question':
              'HTML dapat digunakan untuk membuat struktur dasar sebuah halaman web.',
          'options': ['Benar', 'Salah'],
          'correctAnswer': 'Benar',
        },
        {
          'question':
              'CSS tidak dapat digunakan untuk mengubah warna teks pada elemen HTML.',
          'options': ['Benar', 'Salah'],
          'correctAnswer': 'Salah',
        },
        {
          'question':
              'PHP dapat digunakan untuk menyimpan data dalam basis data.',
          'options': ['Benar', 'Salah'],
          'correctAnswer': 'Benar',
        }
      ];
    } else if (subject == 'SQL') {
      return [
        {
          'question':
              'Perintah SQL SELECT * FROM table_name digunakan untuk mengambil semua kolom dari tabel tertentu.',
          'options': ['Benar', 'Salah'],
          'correctAnswer': 'Benar',
        },
        {
          'question':
              'Kunci primer (primary key) dalam sebuah tabel dapat memiliki nilai duplikat.',
          'options': ['Benar', 'Salah'],
          'correctAnswer': 'Salah',
        },
        {
          'question':
              'Fungsi COUNT() digunakan untuk menghitung jumlah baris dalam hasil query SQL.',
          'options': ['Benar', 'Salah'],
          'correctAnswer': 'Benar',
        }
      ];
    }
    return [];
  }
}
