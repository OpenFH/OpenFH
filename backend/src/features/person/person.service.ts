import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreatePersonInput } from './dto/create-person.input';
import { UpdatePersonInput } from './dto/update-person.input';

@Injectable()
export class PersonService {
  constructor(private prisma: PrismaService) {}
  async create(createPersonInput: CreatePersonInput) {
    return await this.prisma.person.create({ data: { ...createPersonInput } });
  }

  findAll() {
    return this.prisma.person.findMany();
  }

  findOne(id: number) {
    return this.prisma.person.findUnique({ where: { id } });
  }

  update(id: number, updatePersonInput: UpdatePersonInput) {
    return this.prisma.person.update({
      where: { id },
      data: { ...updatePersonInput },
    });
  }

  remove(id: number) {
    return this.prisma.person.delete({ where: { id } });
  }
}
