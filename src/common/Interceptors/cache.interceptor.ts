import {
  CallHandler,
  ExecutionContext,
  Injectable,
  NestInterceptor,
} from '@nestjs/common';
import { Request } from 'express';
import { Observable, of, tap } from 'rxjs';

type CacheEntry = {
  value: unknown;
  expiresAt: number;
};

@Injectable()
export class CacheInterceptor implements NestInterceptor {
  private readonly cache = new Map<string, CacheEntry>();
  private readonly ttlInMs = 30_000;

  intercept(context: ExecutionContext, next: CallHandler): Observable<unknown> {
    const request = context.switchToHttp().getRequest<Request>();
    const method = request.method;
    const url = request.originalUrl ?? request.url;

    if (method !== 'GET') {
      return next.handle();
    }

    const cacheKey = `${method}:${url}`;
    const cachedResponse = this.cache.get(cacheKey);

    if (cachedResponse && cachedResponse.expiresAt > Date.now()) {
      return of(cachedResponse.value);
    }

    if (cachedResponse) {
      this.cache.delete(cacheKey);
    }

    return next.handle().pipe(
      tap((response) => {
        this.cache.set(cacheKey, {
          value: response,
          expiresAt: Date.now() + this.ttlInMs,
        });
      }),
    );
  }
}
