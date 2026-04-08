import { Injectable } from '@nestjs/common';
import { products } from './products.data';

@Injectable()
export class ProductsService {
  private products = products;

  findAll() {
    return this.products;
  }

  findByCategory(category?: string) {
    return this.products.filter((product) => product.category === category);
  }

  findOne(id: number) {
    return this.products.find((product) => product.id === id);
  }

  findMaxPriceProducts(minPrice: number) {
    return this.products.filter((product) => product.price >= minPrice);
  }
}
