import { Test, TestingModule } from '@nestjs/testing';
import { ProductsService } from './products.service';
import { products } from './products.data';

describe('ProductsService', () => {
  let service: ProductsService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [ProductsService],
    }).compile();

    service = module.get<ProductsService>(ProductsService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });

  it('should return products filtered by category', () => {
    expect(service.findByCategory('Electronics')).toEqual([
      products.find((product) => product.category === 'Electronics'),
    ]);
  });

  it('should return the matching hardware product', () => {
    expect(service.findByCategory('Hardware')).toEqual([
      products.find((product) => product.category === 'Hardware'),
    ]);
  });
});
