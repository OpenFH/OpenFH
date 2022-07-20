import { ObjectType, Field, Int } from '@nestjs/graphql';

@ObjectType()
export class Person {
  @Field(() => Int)
  id: number;

  @Field()
  firstName: string;

  @Field()
  lastName: string;

  @Field()
  phoneNumber: string;
}
