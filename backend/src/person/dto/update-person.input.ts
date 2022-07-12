import { CreatePersonInput } from './create-person.input';
import { PartialType } from '@nestjs/mapped-types';

export class UpdatePersonInput extends PartialType(CreatePersonInput) {
  id: number;
}
