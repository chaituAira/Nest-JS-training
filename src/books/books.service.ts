import { Injectable } from '@nestjs/common';
import { books } from './books.data';

@Injectable()
export class BooksService {
  private books = books;

  findAll() {
    return this.books;
  }

  findOne(id: number) {
    const book = this.books.find((book) => book.id === id);
    if (!book) {
      throw new Error('Book not found');
    }
    return book;
  }
}
