const { nanoid } = require('nanoid');

let books = [];

const addBook = (request, h) => {
  const { name, pageCount, readPage, author, publisher, year, reading } = request.payload;

  if (!name) {
    return h.response({ status: 'fail', message: 'Gagal menambahkan buku. Mohon isi nama buku' }).code(400);
  }

  if (readPage > pageCount) {
    return h.response({ status: 'fail', message: 'Gagal menambahkan buku. readPage tidak boleh lebih besar dari pageCount' }).code(400);
  }

  const id = nanoid(16);
  const finished = readPage === pageCount;

  const newBook = {
    id,
    name,
    pageCount,
    readPage,
    author,
    publisher,
    year,
    reading,
    finished,
    insertedAt: new Date().toISOString(),
    updatedAt: new Date().toISOString(),
  };

  books.push(newBook);

  return h.response({ status: 'success', message: 'Buku berhasil ditambahkan', data: { bookId: id } }).code(201);
};

const getAllBooks = (request, h) => {
  const { name, reading, finished } = request.query;
  let filteredBooks = books;

  if (name) {
    filteredBooks = filteredBooks.filter((book) => book.name.toLowerCase().includes(name.toLowerCase()));
  }

  if (reading !== undefined) {
    const isReading = reading === '1';
    filteredBooks = filteredBooks.filter((book) => book.reading === isReading);
  }

  if (finished !== undefined) {
    const isFinished = finished === '1';
    filteredBooks = filteredBooks.filter((book) => book.finished === isFinished);
  }

  const response = {
    status: 'success',
    data: {
      books: filteredBooks.map(({ id, name, publisher }) => ({ id, name, publisher })),
    },
  };

  return h.response(response);
};

const getBookById = (request, h) => {
  const { bookId } = request.params;
  const book = books.find((b) => b.id === bookId);

  if (!book) {
    return h.response({ status: 'fail', message: 'Buku tidak ditemukan' }).code(404);
  }

  return h.response({
    status: 'success',
    data: {
      book,
    },
  });
};

const updateBook = (request, h) => {
  const { bookId } = request.params;
  const { name, pageCount, readPage } = request.payload;

  if (!name) {
    return h.response({ status: 'fail', message: 'Gagal memperbarui buku. Mohon isi nama buku' }).code(400);
  }

  if (readPage > pageCount) {
    return h.response({ status: 'fail', message: 'Gagal memperbarui buku. readPage tidak boleh lebih besar dari pageCount' }).code(400);
  }

  const index = books.findIndex((book) => book.id === bookId);

  if (index === -1) {
    return h.response({ status: 'fail', message: 'Gagal memperbarui buku. Id tidak ditemukan' }).code(404);
  }

  const updatedBook = {
    ...books[index],
    name,
    pageCount,
    readPage,
    finished: readPage === pageCount,
    updatedAt: new Date().toISOString(),
  };

  books[index] = updatedBook;

  return h.response({ status: 'success', message: 'Buku berhasil diperbarui', data: { book: updatedBook } });
};

const deleteBook = (request, h) => {
  const { bookId } = request.params;
  const index = books.findIndex((book) => book.id === bookId);

  if (index === -1) {
    return h.response({ status: 'fail', message: 'Buku gagal dihapus. Id tidak ditemukan' }).code(404);
  }

  books.splice(index, 1);

  return h.response({ status: 'success', message: 'Buku berhasil dihapus' }).code(200);
};

module.exports = {
  addBook,
  getAllBooks,
  getBookById,
  updateBook,
  deleteBook,
};
