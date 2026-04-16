import {
  Controller,
  Get,
  Param,
  ParseIntPipe,
  UseInterceptors,
} from '@nestjs/common';
import { ApiOperation, ApiTags } from '@nestjs/swagger';

import { BooksService } from './books.service';
import { TransformInterceptor } from '../common/Interceptors/transform.interceptor';
import { CacheInterceptor } from '../common/Interceptors/cache.interceptor';
import { ErrorMappingInterceptor } from '../common/Interceptors/error-mapping.interceptor';

@ApiTags('books')
@Controller('books')
@UseInterceptors(TransformInterceptor)
export class BooksController {
  constructor(private readonly booksService: BooksService) {}

  @UseInterceptors(CacheInterceptor)
  @ApiOperation({
    summary: 'Get all books',
    description: 'All books displayed',
  })
  @Get()
  findAll() {
    return this.booksService.findAll();
  }

  @ApiOperation({
    summary: 'Get a book by ID',
    description: 'Retrieve a book by its ID',
  })
  @Get(':id')
  @UseInterceptors(ErrorMappingInterceptor)
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.booksService.findOne(id);
  }
}
