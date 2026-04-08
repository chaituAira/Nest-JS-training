import { Controller, Get, Param, Query } from '@nestjs/common';
import { ProductsService } from './products.service';

@Controller('store')
export class ProductsController {
  constructor(private readonly productsService: ProductsService) {}

  @Get('products')
  findAll() {
    return this.productsService.findAll();
  }

  @Get('products/category')
  findByCategory(@Query('category') category?: string) {
    return this.productsService.findByCategory(category);
  }

  @Get('products/:id')
  findOne(@Param('id') id: number) {
    return this.productsService.findOne(id);
  }

  @Get('products/expensive/:minPrice')
  findMaxPriceProducts(@Param('minPrice') minPrice: number) {
    return this.productsService.findMaxPriceProducts(minPrice);
  }
}
