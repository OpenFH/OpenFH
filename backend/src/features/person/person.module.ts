import { Module } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { PersonResolver } from './person.resolver';
import { PersonService } from './person.service';

@Module({
  providers: [PersonResolver, PersonService, PrismaService],
})
export class PersonModule {}
