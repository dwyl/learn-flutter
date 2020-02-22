
## Notes for Flutter TDD Clean Architecture Course Videos

In this course we create a Number Trivia App following test driven development (TDD). It shows us how we can use TDD in _any_ App we want to build.

#### 1. Explanation & Project Structure
> Video playlist: https://www.youtube.com/watch?v=KjE2IDphA_U&list=PLB6lc7nQ1n4iYGE_khpXRdJkJEp9WOech

In the `first tutorial` an explanation is given of the importance of having all functions tested in our application.  
It also explains the **clean architecture**.

All the features of the application will be divided into three folders, **domain**, **data** and **presentation**.
It is also explained how each of these folders works and what they will contain.

<br />

#### 2. Entities & Use Cases 
> Video 2: https://www.youtube.com/watch?v=lPkWX8xFthE&list=PLB6lc7nQ1n4iYGE_khpXRdJkJEp9WOech&index=2

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
  
#### The `either` Type
  
The **`either`** type means the function can represent two types. 
In this case it can be _either_ an **error** or a **number**.
In which **Left** are the **errors** and **Right** the **numbers**.

```dart
Future<Either<Failure, NumberTrivia>>
```
 

Create a new file for the **failures**:



> `Failures.dart`

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


Now create the _first_ test.

Create a new file in the`/test` folder called `get_concrete_number_trivia_test.dart`.


![get_concrete_number_trivia_test](https://user-images.githubusercontent.com/27420533/74527183-f5382f00-4f1c-11ea-9f4f-05d501a20bab.png)


The code for the **first** test is:


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

This code calls the repository passing the `date` to the `Use Case`.
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

The code will make the first `test` pass so there will be no more errors.

![First_Test_Pass](https://user-images.githubusercontent.com/27420533/74528160-6d9fef80-4f1f-11ea-9198-64d1aaefb3c4.png)


#### 3. Domain Layer Refactoring
> Video 3: https://www.youtube.com/watch?v=Mmq72a0h4jk

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

The test will fail so we must update the code in `get_random_number.dart` to the following:


```dart
class GetRandomNumberTrivia extends UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
}
```

And now the **second** test will pass.

![Second_test_pass](https://user-images.githubusercontent.com/27420533/74590474-aa92e180-5006-11ea-8a88-ef8a9a6311e7.png)

#### 4. Data Layer Overview & Models
> Video 4: https://www.youtube.com/watch?v=keaTZ9M_U1A&t=1516s

The `fourth` tutorial starts by giving a brief explanation of how **models** work.

Models are like entities but with more features. In the case of this application our model will have a function to convert `JSON` data to a Dart Map.

Create a file in the **models** folder named `number_trivia_model.dart`.
Create the corresponding test file in the **test** folder with the name `number_trivia_model_test.dart`.
Here you can see the naming convention follows a predictable pattern which makes locating files in a project very fast.

Add the following code to the `number_trivia_model_test.dart` file:

```dart
import 'package:clean_architecture_tdd_prep/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_architecture_tdd_prep/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test Text');

  test(
    'should be a subclass of NumberTrivia entity',
    () async {
      // assert
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );
}
```
The test will ***not pass***. 
This is _expected_ because we have not yet implemented the `NumberTriviaModel` class.
Open the `number_trivia_model.dart` file and add the following code:

```dart
import 'package:meta/meta.dart';

import '../../domain/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia {
  NumberTriviaModel({
    @required String text,
    @required int number,
  }) : super(
          text: text,
          number: number,
        );
}
```
Once you have added this code to the `number_trivia_model.dart` file, re-run the tests: `flutter test`

Given that our Model will transform `JSON` data, we need some some test data.
Test data is commonly referred to as [**fixtures**](https://en.wikipedia.org/wiki/Test_fixture#Software).
In the test folder, create a new folder called **`fixtures`** that will contain two files 
one called `trivia.json` and the other `trivia_double.json`.

![fixtures](https://user-images.githubusercontent.com/27420533/75034654-94bd6a80-54a5-11ea-96a2-7c7bd2942f8a.png)

This will be the code for `trivia.json`.

```dart
{
  "text": "Test Text",
  "number": 1,
  "found": true,
  "type": "trivia"
}
```
And for `trivia_double.json` the only difference is that the **"number"** value is a [double](https://dart.dev/articles/archive/numeric-computation) `1.0` instead of an integer `1`:

```dart
{
  "text": "Test Text",
  "number": 1.0,
  "found": true,
  "type": "trivia"
}
```
Next we need to create a file that will turn the `JSON` answers into `integer` or `double`.
Create a file called `fixture_reader.dart` and add the following code:


```dart
import 'dart:io';

String fixture(String name) => File('test/fixtures/$name').readAsStringSync();
```
Then we start the `fromJson` method, these methods always carry a `Map<String, dynamic>` argument.
That it will be like this:

```dart
group('fromJson', () {
    test(
      'should return a valid model when the JSON number is an integer',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('trivia.json'));
        // act
        final result = NumberTriviaModel.fromJson(jsonMap);
        // assert
        expect(result, tNumberTriviaModel);
```
The test will now fail and then we should implement the same method in the `number_trivia_model.dart` file.

```dart
class NumberTriviaModel extends NumberTrivia {
  ...
  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) {
    return NumberTriviaModel(
      text: json['text'],
      number: json['number'],
    );
  }
}
```
Now we move on to the `second` conversion method.

```dart 
group('toJson', () {
  test(
    'should return a JSON map containing the proper data',
    () async {
      // act
      final result = tNumberTriviaModel.toJson();
      // assert
      final expectedJsonMap = {
        "text": "Test Text",
        "number": 1,
      };
      expect(result, expectedJsonMap);
    },
  );
});
```
Implement the method in the file `number_trivia_model.dart`.

```dart
class NumberTriviaModel extends NumberTrivia {
  ...
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'number': number,
    };
  }
}
```
Now all the tests **pass**.

#### 5. Contracts of Data Sources
> Video 5: https://www.youtube.com/watch?v=m_lkZo6CYcs&t=1s

In the `fifth` tutorial an explanation is given about the importance of `contracts`.
The contracts will allow the files to communicate directly with the **repository**.

Inside the `repositories` folder create `number_trivia_repository_impl.dart`.
This is the code for the file.

```dart
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/number_trivia.dart';
import '../../domain/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number) {
    // TODO: implement getConcreteNumberTrivia
    return null;
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    // TODO: implement getRandomNumberTrivia
    return null;
  }
}
```

Inside the `platform` folder create a file called `network_info.dart`with the following code.

```dart
abstract class NetworkInfo {
  Future<bool> get isConnected;
}
```
#### Remote Data Source

In this class the value returned will be different from the others and will return only a `NumberTriviaModel` value and the errors will be treated as `Exceptions`.

Then we create the file `number_trivia_remote_data_source.dart`,with the following code.

```dart
import '../models/number_trivia_model.dart';

abstract class NumberTriviaRemoteDataSource {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<NumberTriviaModel> getRandomNumberTrivia();
}

```
#### Exceptions And Failures

Whenever we don't have a number to show it will be a `ServerException`, then we should create it to be used.
Inside the error folder create the file `exception.dart`.

Code for `Exception.dart`.

```dart
class ServerException implements Exception {}

class CacheException implements Exception {}
```
This is the code for the `failure.dart` file that also has to be created.

```dart
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]) : super(properties);
}

// General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
```
Now we need to create a file for the `NumberTriviaRepositoryImpl` tests.
This file will be named `number_trivia_repository_impl_test.dart`.
Then we prepare the file for the test.

```dart
class MockRemoteDataSource extends Mock
    implements NumberTriviaRemoteDataSource {}

class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  NumberTriviaRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = NumberTriviaRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });
}
```
If we run the program now it will give error because we have to pass all parameters also to the file `number_trivia_repository_impl.dart`.

```dart
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/number_trivia.dart';
import '../../domain/repositories/number_trivia_repository.dart';
import '../datasources/number_trivia_local_data_source.dart';
import '../datasources/number_trivia_remote_data_source.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number) {
    // TODO: implement getConcreteNumberTrivia
    return null;
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    // TODO: implement getRandomNumberTrivia
    return null;
  }
}
```
#### 6. Repository Implementation
> Video 6: https://www.youtube.com/watch?v=bfEKPKKy9dA
