import { Module } from '@nestjs/common';

import { GraphQlModule } from './config/graphql';
import { CacheModule } from './config/redis';
import { PersonModule } from './features/person/person.module';
import { PrismaService } from './features/prisma/prisma.service';

@Module({
  imports: [CacheModule, GraphQlModule, PersonModule],
  providers: [PrismaService],
})
export class AppModule {}
