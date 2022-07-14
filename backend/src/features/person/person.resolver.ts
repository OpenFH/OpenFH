import { Resolver, Query, Mutation, Args, Int } from '@nestjs/graphql';
import { CreatePersonInput } from './dto/create-person.input';
import { UpdatePersonInput } from './dto/update-person.input';
import { Person } from './entities/person.entity';
import { PersonService } from './person.service';

@Resolver(() => Person)
export class PersonResolver {
  constructor(private readonly personService: PersonService) {}

  @Mutation(() => Person)
  createPerson(
    @Args('createPersonInput') createPersonInput: CreatePersonInput,
  ) {
    return this.personService.create(createPersonInput);
  }

  @Query(() => [Person], { name: 'person' })
  findAll() {
    return this.personService.findAll();
  }

  @Query(() => Person, { name: 'person' })
  findOne(@Args('id', { type: () => Int }) id: number) {
    return this.personService.findOne(id);
  }

  @Mutation(() => Person)
  updatePerson(
    @Args('updatePersonInput') updatePersonInput: UpdatePersonInput,
  ) {
    return this.personService.update(updatePersonInput.id, updatePersonInput);
  }

  @Mutation(() => Person)
  removePerson(@Args('id', { type: () => Int }) id: number) {
    return this.personService.remove(id);
  }
}
