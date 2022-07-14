import { Module } from '@nestjs/common';
import { GraphQLModule } from '@nestjs/graphql';
import { ApolloDriver, ApolloDriverConfig } from '@nestjs/apollo';
import { join } from 'path';
import { PersonModule } from './features/person/person.module';
import { PrismaService } from './features/prisma/prisma.service';

@Module({
  imports: [
    GraphQLModule.forRoot<ApolloDriverConfig>({
      driver: ApolloDriver,
      autoSchemaFile: join(process.cwd(), 'src/types/schema.gql'),
      sortSchema: true,
    }),
    PersonModule,
  ],
  providers: [PrismaService],
})
export class AppModule {}
