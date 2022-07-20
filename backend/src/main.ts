import helmet from '@fastify/helmet';
import { NestFactory } from '@nestjs/core';
import {
  FastifyAdapter,
  NestFastifyApplication,
} from '@nestjs/platform-fastify';

import { AppModule } from './app.module';

async function bootstrap() {
  console.log(process.env.REDIS_HOST);

  const app = await NestFactory.create<NestFastifyApplication>(
    AppModule,
    new FastifyAdapter(),
  );

  app.register(helmet);

  app.listen(process.env.PORT ?? 3000, '0.0.0.0', async () =>
    console.log(`Application is running on: ${await app.getUrl()}`),
  );
}
bootstrap();
