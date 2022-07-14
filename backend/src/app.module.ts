import { join } from 'path';
import { ApolloDriver, ApolloDriverConfig } from '@nestjs/apollo';
import { Module, CacheModule } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { GraphQLModule } from '@nestjs/graphql';
import * as Redis from 'cache-manager-redis-store';
import { PersonModule } from './features/person/person.module';
import { PrismaService } from './features/prisma/prisma.service';

@Module({
  imports: [
    GraphQLModule.forRoot<ApolloDriverConfig>({
      driver: ApolloDriver,
      autoSchemaFile: join(process.cwd(), 'src/types/schema.gql'),
      sortSchema: true,
    }),
    CacheModule.registerAsync({
      imports: [ConfigModule],
      inject: [ConfigService],
      useFactory: async (configService: ConfigService) => ({
        store: Redis,
        host: configService.get('REDIS_HOST'),
        port: configService.get('REDIS_PORT'),
        ttl: configService.get('REDIS_TTL'),
        auth_pass: configService.get('REDIS_PW'),
      }),
    }),
    PersonModule,
  ],
  providers: [PrismaService],
})
export class AppModule {}
