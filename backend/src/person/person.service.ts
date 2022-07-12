import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreatePersonInput, UpdatePersonInput } from 'src/types/graphql';

@Injectable()
export class PersonService {
  constructor(private prisma: PrismaService) {}
  create({ email, firstName, lastName, phoneNumber }: CreatePersonInput) {
    return this.prisma.person.create({
      data: { email, firstName, lastName, phoneNumber },
    });
  }

  findAll() {
    return `This action returns all person`;
  }

  findOne(id: number) {
    return `This action returns a #${id} person`;
  }

  update(id: number, updatePersonInput: UpdatePersonInput) {
    return `This action updates a #${id} person`;
  }

  remove(id: number) {
    return `This action removes a #${id} person`;
  }
}
