import { InputType, Field } from '@nestjs/graphql';

@InputType()
export class CreatePersonInput {
  @Field()
  firstName: string;

  @Field()
  lastName: string;

  @Field()
  phoneNumber: string;
}
