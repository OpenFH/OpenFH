import { NestFactory } from '@nestjs/core';
import {
  FastifyAdapter,
  NestFastifyApplication,
} from '@nestjs/platform-fastify';

import helmet from 'helmet';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create<NestFastifyApplication>(
    AppModule,
    new FastifyAdapter(),
  );

  app.use(helmet());

  app.listen(process.env.PORT ?? 3000, '0.0.0.0', async () =>
    console.log(`Application is running on: ${await app.getUrl()}`),
  );
}
bootstrap();
