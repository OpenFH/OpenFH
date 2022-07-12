
/*
 * -------------------------------------------------------
 * THIS FILE WAS AUTOMATICALLY GENERATED (DO NOT MODIFY)
 * -------------------------------------------------------
 */

/* tslint:disable */
/* eslint-disable */
export class CreatePersonInput {
    email: string;
    firstName?: Nullable<string>;
    lastName?: Nullable<string>;
    phoneNumber?: Nullable<string>;
}

export class UpdatePersonInput {
    id: number;
    email: string;
    firstName?: Nullable<string>;
    lastName?: Nullable<string>;
    phoneNumber?: Nullable<string>;
}

export class Person {
    id: number;
    email: string;
    firstName?: Nullable<string>;
    lastName?: Nullable<string>;
    phoneNumber?: Nullable<string>;
}

export abstract class IQuery {
    abstract persons(): Nullable<Person>[] | Promise<Nullable<Person>[]>;

    abstract person(id: number): Nullable<Person> | Promise<Nullable<Person>>;
}

export abstract class IMutation {
    abstract createPerson(createPersonInput: CreatePersonInput): Person | Promise<Person>;

    abstract updatePerson(updatePersonInput: UpdatePersonInput): Person | Promise<Person>;

    abstract removePerson(id: number): Nullable<Person> | Promise<Nullable<Person>>;
}

type Nullable<T> = T | null;
