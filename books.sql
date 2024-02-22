CREATE TABLE books (
  id VARCHAR(36) PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  author VARCHAR(100) NOT NULL,
  year INT NOT NULL,
  summary TEXT NOT NULL,
  publisher VARCHAR(100) NOT NULL,
  pageCount INT NOT NULL,
  readPage INT NOT NULL,
  finished BOOLEAN NOT NULL,
  reading BOOLEAN NOT NULL,
  insertedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO books (id, title, author, year, summary, publisher, pageCount, readPage, finished, reading)
VALUES 
  ('1', 'Laskar Pelangi', 'Andrea Hirata', 2005, 'Laskar Pelangi adalah novel yang menceritakan tentang kisah perjuangan sekelompok anak muda dari Belitung untuk mendapatkan pendidikan yang lebih baik.', 'Bentang Pustaka', 529, 500, true, true),
  ('2', 'Bumi Manusia', 'Pramoedya Ananta Toer', 1980, 'Bumi Manusia adalah novel pertama dari tetralogi Buru yang dikenal sebagai Tetralogi Pulau Buru.', 'Hasta Mitra', 580, 580, true, false),
  ('3', 'Tenggelamnya Kapal Van Der Wijck', 'H. Hamka', 1938, 'Tenggelamnya Kapal van der Wijck adalah sebuah novel legendaris Indonesia karya Haji Abdul Malik Karim Amrullah yang lebih dikenal dengan nama HAMKA.', 'Balai Pustaka', 343, 200, false, true),
  ('4', 'Ayat-Ayat Cinta', 'Habiburrahman El Shirazy', 2004, 'Ayat-Ayat Cinta adalah sebuah novel karangan Habiburrahman El Shirazy yang diterbitkan oleh Republika Penerbit.', 'Republika Penerbit', 468, 468, true, false),
  ('5', 'Ronggeng Dukuh Paruk', 'Ahmad Tohari', 1982, 'Ronggeng Dukuh Paruk adalah novel karya Ahmad Tohari yang diterbitkan oleh Lentera Dipantara.', 'Lentera Dipantara', 368, 368, true, false),
  ('6', 'Perahu Kertas', 'Dee Lestari', 2009, 'Perahu Kertas adalah sebuah film Indonesia yang dirilis pada tanggal 16 Agustus 2012. Film ini diangkat dari novel berjudul sama karya Dewi Lestari yang terbit pada tahun 2009.', 'Trinity Optima Production', 463, 350, false, true),
  ('7', 'Gadis Pantai', 'Pramoedya Ananta Toer', 1962, 'Gadis Pantai adalah sebuah kumpulan cerpen karya Pramoedya Ananta Toer yang pertama kali diterbitkan tahun 1962 oleh Lentera Dipantara.', 'Lentera Dipantara', 197, 197, true, false),
  ('8', 'Sang Pemimpi', 'Andrea Hirata', 2006, 'Sang Pemimpi adalah novel karya Andrea Hirata dan merupakan kelanjutan dari novel Laskar Pelangi.', 'Bentang Pustaka', 432, 432, true, false),
  ('9', 'Dilan: Dia adalah Dilanku Tahun 1990', 'Pidi Baiq', 2014, 'Dilan: Dia adalah Dilanku Tahun 1990 adalah sebuah film Indonesia tahun 2018 yang diangkat dari novel Dilan: Dia adalah Dilanku Tahun 1990 yang ditulis oleh Pidi Baiq.', 'Gagas Media', 368, 365, false, true),
  ('10', 'Rantau 1 Muara', 'Tere Liye', 2011, 'Rantau 1 Muara adalah novel karya Tere Liye yang pertama kali diterbitkan oleh Republika.', 'Republika Penerbit', 438, 438, true, false);
