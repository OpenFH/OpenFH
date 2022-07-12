import { Resolver, Query, Mutation, Args } from '@nestjs/graphql';
import { CreatePersonInput, UpdatePersonInput } from 'src/types/graphql';
import { PersonService } from './person.service';

@Resolver('Person')
export class PersonResolver {
  constructor(private readonly personService: PersonService) {}

  @Mutation('createPerson')
  create(@Args('createPersonInput') createPersonInput: CreatePersonInput) {
    return this.personService.create(createPersonInput);
  }

  @Query('persons')
  findAll() {
    return this.personService.findAll();
  }

  @Query('person')
  findOne(@Args('id') id: number) {
    return this.personService.findOne(id);
  }

  @Mutation('updatePerson')
  update(@Args('updatePersonInput') updatePersonInput: UpdatePersonInput) {
    return this.personService.update(updatePersonInput.id, updatePersonInput);
  }

  @Mutation('removePerson')
  remove(@Args('id') id: number) {
    return this.personService.remove(id);
  }
}
