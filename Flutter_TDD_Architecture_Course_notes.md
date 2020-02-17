
## Notes for Flutter TDD Clean Architecture Course Videos

This course aims to create a Number Trivia App, and will show us how we can implement test driven development to all the applications we want to do.

#### 1. Explanation & Project Structure
> Video:https://www.youtube.com/watch?v=KjE2IDphA_U&list=PLB6lc7nQ1n4iYGE_khpXRdJkJEp9WOech

In the `first tutorial` an explanation is given of the importance of having all functions tested in our application.  
It also explains the **clean architecture**.

All the features of the application will be divided into three folders, **domain**, **data** and **presentation**.
It is also explained how each of these folders works and what they will contain.

<br />

#### 2. Entities & Use Cases 
> Video:https://www.youtube.com/watch?v=lPkWX8xFthE&list=PLB6lc7nQ1n4iYGE_khpXRdJkJEp9WOech&index=2

In the `second tutorial` we start by adding the packages of the dependencies to the `pubspec.yaml` file, that will be needed to build the application.

```dart
dependencies:
  flutter:
    sdk: flutter

  get_it: ^2.0.1
  
  # Bloc for state management
  flutter_bloc: ^0.21.0
  
  # Value equality
  equatable: ^0.4.0
  
  # Functional programming thingies
  dartz: ^0.8.6
  
  # Remote API
  connectivity: ^0.4.3+7
  
  http: ^0.12.0+2
  # Local cache
  shared_preferences: ^0.5.3+4

  cupertino_icons: ^0.1.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  mockito: ^4.1.0
  ```
  
  It is explained how the **entity** will work in this application.
  **Entity** is related to the type of data we are going to use,
is an object about which information must be kept. In this case the information we need to keep is the NumberTrivia.  
 
The following explains what `Use Cases` will be used for.
Use cases will store all kinds of application **logic**.
In this case Use cases will simply collect data from a repository,`GetConcreteNumberTrivia` and `GetRandomNumberTrivia`.
  
  #### The either Type
  
  The **either** type is shown and explained with the function of being able to represent two types at the same time in this case serves for the errors and for the numbers that we will show.
In which **L** are the **errors** and **R** the **numbers**.

```dart
Future<Either<Failure, NumberTrivia>>```
 

Then it is defined the **failures** that will have an own file.



> Failures.dart

```dart
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  Failure([List properties = const<dynamic>[]]): super (properties);
}

```

Next, define content for the `number_trivia_repository.dart` file.


```dart
import 'package:clean_architeture_tdd/core/error/failures.dart';
import 'package:clean_architeture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';

abstract class NumberTriviaRepository{
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}

```

Add the file `get_concrete_number_trivia.dart` to the `usecases` folder.

![get_concrete_number_trivia_file](https://user-images.githubusercontent.com/27420533/74527004-92469800-4f1c-11ea-8f14-d02355c219fe.png)


Then the **first** test will be created.

Inside the `test` folder and create another file with the name `get_concrete_number_trivia_test.dart`.


![get_concrete_number_trivia_test](https://user-images.githubusercontent.com/27420533/74527183-f5382f00-4f1c-11ea-9f4f-05d501a20bab.png)


This will be the code for the **first** test.


```dart
import 'package:clean_architecture_tdd_prep/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tdd_prep/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architecture_tdd_prep/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test(
    'should get trivia for the number from the repository',
    () async {
      // "On the fly" implementation of the Repository using the Mockito package.
      // When getConcreteNumberTrivia is called with any argument, always answer with
      // the Right "side" of Either containing a test NumberTrivia object.
      when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
          .thenAnswer((_) async => Right(tNumberTrivia));
      // The "act" phase of the test. Call the not-yet-existent method.
      final result = await usecase.execute(number: tNumber);
      // UseCase should simply return whatever was returned from the Repository
      expect(result, Right(tNumberTrivia));
      // Verify that the method has been called on the Repository
      verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}

```

All this code will be used for the repository to be `called` and the `date` passed to the `Use Case`.
The code will give errors because the file `get_concrete_number.dart` has not been created yet. 
Then and the next step is to create that file with the following code.

```dart
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failure.dart';
import '../entities/number_trivia.dart';
import '../repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  Future<Either<Failure, NumberTrivia>> execute({
    @required int number,
  }) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}
```

The code that appears will serve to pass everything in the `test` file so there will be no more errors.
And so the **first** test will pass!

![First_Test_Pass](https://user-images.githubusercontent.com/27420533/74528160-6d9fef80-4f1f-11ea-9198-64d1aaefb3c4.png)


#### 3. Domain Layer Refactoring
> Video:https://www.youtube.com/watch?v=Mmq72a0h4jk

In the `third` tutorial we are explained how **callable** classes work.
First we should replace the `execute` with `call`.

```dart
Future<Either<Failure, NumberTrivia>> call
````

Then we add a class to receive **random** numbers.

![Random_number](https://user-images.githubusercontent.com/27420533/74589630-be3a4a00-4ffe-11ea-9212-292f0fc73567.png)

Add two `Params` to `Usecase Class`.

```dart
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
```
Then add these two parameters to the **get_concrete** classes.

```dart
final result = await usecase(Params(number: tNumber));
```

This will be the code for the `get_random_number_trivia_test.dart` class.

```dart
import 'package:clean_architecture_tdd_prep/core/usecase/usecase.dart';
import 'package:clean_architecture_tdd_prep/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tdd_prep/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architecture_tdd_prep/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetRandomNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  });

  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test(
    'should get trivia from the repository',
    () async {
      
      when(mockNumberTriviaRepository.getRandomNumberTrivia())
          .thenAnswer((_) async => Right(tNumberTrivia));
      
      final result = await usecase(NoParams());
     
      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getRandomNumberTrivia());
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
```

The test will then fail and the `get_random_number.dart` class code must be changed to the following.


```dart
class GetRandomNumberTrivia extends UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
}
```dart

And now the **second** test will pass.

![Second_test_pass](https://user-images.githubusercontent.com/27420533/74590474-aa92e180-5006-11ea-8a88-ef8a9a6311e7.png)
