import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';

import { GraphQlModule } from './config/graphql';
import { CacheModule } from './config/redis';
import { PersonModule } from './features/person/person.module';
import { PrismaService } from './features/prisma/prisma.service';

@Module({
  imports: [CacheModule, GraphQlModule, PersonModule, ConfigModule],
  providers: [PrismaService],
})
export class AppModule {}
