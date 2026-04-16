import {
  CallHandler,
  ExecutionContext,
  HttpStatus,
  Injectable,
  NestInterceptor,
} from '@nestjs/common';
import { Response } from 'express';
import { Observable, map } from 'rxjs';

type ApiResponse = {
  success: boolean;
  statusCode: number;
  timestamp: string;
  data: unknown;
};

@Injectable()
export class TransformInterceptor implements NestInterceptor {
  intercept(
    context: ExecutionContext,
    next: CallHandler<unknown>,
  ): Observable<ApiResponse> {
    const response = context.switchToHttp().getResponse<Response>();

    return next.handle().pipe(
      map((data: unknown) => ({
        success: true,
        statusCode: response.statusCode ?? HttpStatus.OK,
        timestamp: new Date().toISOString(),
        data,
      })),
    );
  }
}
