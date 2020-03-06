
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

Inside the `platform` folder create a file called `network_info.dart` with the following code:

```dart
abstract class NetworkInfo {
  Future<bool> get isConnected;
}
```
#### Remote Data Source

In this class the returned value will be a `NumberTriviaModel` value and errors will be treated as `Exceptions`.

Create the file `number_trivia_remote_data_source.dart` with the following code:

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

Whenever we don't have a number to show it will be a `ServerException`. We need a class to handle these exceptions.
In the **`/error`** folder, create the file `exception.dart` and add the following code:


```dart
class ServerException implements Exception {}

class CacheException implements Exception {}
```
This is the code for the `failure.dart` file that also has to be created inside the `error` folder.

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
If we run the test now it will give an error because have not yet written the implementation. 
Open the `number_trivia_repository_impl.dart` file and add the following code:

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

The `sixth` video starts by stating a new requirement: check if the user has an internet connection.

#### Device Is Online

```dart
group('getConcreteNumberTrivia', () {
  // DATA FOR THE MOCKS AND ASSERTIONS
  // We'll use these three variables throughout all the tests
  final tNumber = 1;
  final tNumberTriviaModel =
      NumberTriviaModel(number: tNumber, text: 'test trivia');
  final NumberTrivia tNumberTrivia = tNumberTriviaModel;

  test('should check if the device is online', () {
    //arrange
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    // act
    repository.getConcreteNumberTrivia(tNumber);
    // assert
    verify(mockNetworkInfo.isConnected);
  });
});
```
The test will `fail` because we have to add features.
Add the code to the `number_trivia_repository_impl_test.dart` file:

```dart
group('device is online', () {
  // This setUp applies only to the 'device is online' group
  setUp(() {
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
  });

  test(
    'should return remote data when the call to remote data source is successful',
    () async {
      // arrange
      when(mockRemoteDataSource.getConcreteNumberTrivia(tNumber))
          .thenAnswer((_) async => tNumberTriviaModel);
      // act
      final result = await repository.getConcreteNumberTrivia(tNumber);
      // assert
      verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
      expect(result, equals(Right(tNumberTrivia)));
    },
  );
});
```
Now we need to do some tests and add some features.

```dart
test(
  'should cache the data locally when the call to remote data source is successful',
  () async {
    // arrange
    when(mockRemoteDataSource.getConcreteNumberTrivia(tNumber))
        .thenAnswer((_) async => tNumberTriviaModel);
    // act
    await repository.getConcreteNumberTrivia(tNumber);
    // assert
    verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
    verify(mockLocalDataSource.cacheNumberTrivia(tNumberTrivia));
  },
);
```
we also need to add the code to the `number_trivia_repository_impl.dart` file.

```dart
@override
Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
  int number,
) async {
  networkInfo.isConnected;
  final remoteTrivia = await remoteDataSource.getConcreteNumberTrivia(number);
  localDataSource.cacheNumberTrivia(remoteTrivia);
  return Right(remoteTrivia);
}
```

Test to convert `failures` to `ServerFailure`. 

```dart
test(
  'should return server failure when the call to remote data source is unsuccessful',
  () async {
    // arrange
    when(mockRemoteDataSource.getConcreteNumberTrivia(tNumber))
        .thenThrow(ServerException());
    // act
    final result = await repository.getConcreteNumberTrivia(tNumber);
    // assert
    verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
    verifyZeroInteractions(mockLocalDataSource);
    expect(result, equals(Left(ServerFailure())));
  },
);
```

Implement it in the corresponding file.

```dart
@override
Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
  int number,
) async {
  networkInfo.isConnected;
  try {
    final remoteTrivia =
        await remoteDataSource.getConcreteNumberTrivia(number);
    localDataSource.cacheNumberTrivia(remoteTrivia);
    return Right(remoteTrivia);
  } on ServerException {
    return Left(ServerFailure());
  }
}
```

#### Device Is Offline

```dart
group('device is offline', () {
  setUp(() {
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
  });

  test(
    'should return last locally cached data when the cached data is present',
    () async {
      // arrange
      when(mockLocalDataSource.getLastNumberTrivia())
          .thenAnswer((_) async => tNumberTriviaModel);
      // act
      final result = await repository.getConcreteNumberTrivia(tNumber);
      // assert
      verifyZeroInteractions(mockRemoteDataSource);
      verify(mockLocalDataSource.getLastNumberTrivia());
      expect(result, equals(Right(tNumberTrivia)));
    },
  );
});
```

Test to show `CacheException` when there is nothing present inside the cache.

```dart
test(
  'should return CacheFailure when there is no cached data present',
  () async {
    // arrange
    when(mockLocalDataSource.getLastNumberTrivia())
        .thenThrow(CacheException());
    // act
    final result = await repository.getConcreteNumberTrivia(tNumber);
    // assert
    verifyZeroInteractions(mockRemoteDataSource);
    verify(mockLocalDataSource.getLastNumberTrivia());
    expect(result, equals(Left(CacheFailure())));
  },
);
```

```dart
@override
Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
  int number,
) async {
  if (await networkInfo.isConnected) {
    try {
      final remoteTrivia =
          await remoteDataSource.getConcreteNumberTrivia(number);
      localDataSource.cacheNumberTrivia(remoteTrivia);
      return Right(remoteTrivia);
    } on ServerException {
      return Left(ServerFailure());
    }
  } else {
    try {
      final localTrivia = await localDataSource.getLastNumberTrivia();
      return Right(localTrivia);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
```
Copy all tests done for `Concrete` and use them again for `Random`.

```dart
group('getRandomNumberTrivia', () {
  final tNumberTriviaModel =
      NumberTriviaModel(number: 123, text: 'test trivia');
  final NumberTrivia tNumberTrivia = tNumberTriviaModel;

  test('should check if the device is online', () {
    //arrange
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    // act
    repository.getRandomNumberTrivia();
    // assert
    verify(mockNetworkInfo.isConnected);
  });

  runTestsOnline(() {
    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getRandomNumberTrivia())
            .thenAnswer((_) async => tNumberTriviaModel);
        // act
        final result = await repository.getRandomNumberTrivia();
        // assert
        verify(mockRemoteDataSource.getRandomNumberTrivia());
        expect(result, equals(Right(tNumberTrivia)));
      },
    );

    test(
      'should cache the data locally when the call to remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getRandomNumberTrivia())
            .thenAnswer((_) async => tNumberTriviaModel);
        // act
        await repository.getRandomNumberTrivia();
        // assert
        verify(mockRemoteDataSource.getRandomNumberTrivia());
        verify(mockLocalDataSource.cacheNumberTrivia(tNumberTrivia));
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getRandomNumberTrivia())
            .thenThrow(ServerException());
        // act
        final result = await repository.getRandomNumberTrivia();
        // assert
        verify(mockRemoteDataSource.getRandomNumberTrivia());
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      },
    );
  });

  runTestsOffline(() {
    test(
      'should return last locally cached data when the cached data is present',
      () async {
        // arrange
        when(mockLocalDataSource.getLastNumberTrivia())
            .thenAnswer((_) async => tNumberTriviaModel);
        // act
        final result = await repository.getRandomNumberTrivia();
        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getLastNumberTrivia());
        expect(result, equals(Right(tNumberTrivia)));
      },
    );

    test(
      'should return CacheFailure when there is no cached data present',
      () async {
        // arrange
        when(mockLocalDataSource.getLastNumberTrivia())
            .thenThrow(CacheException());
        // act
        final result = await repository.getRandomNumberTrivia();
        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getLastNumberTrivia());
        expect(result, equals(Left(CacheFailure())));
      },
    );
  });
});
```
Do the same for the `corresponding` file.

```dart
@override
Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async {
  if (await networkInfo.isConnected) {
    try {
      final remoteTrivia = await remoteDataSource.getRandomNumberTrivia();
      localDataSource.cacheNumberTrivia(remoteTrivia);
      return Right(remoteTrivia);
    } on ServerException {
      return Left(ServerFailure());
    }
  } else {
    try {
      final localTrivia = await localDataSource.getLastNumberTrivia();
      return Right(localTrivia);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
```

The last version of the `NumberTriviaRepositoryImpl` file will contain the following code:

```dart
typedef Future<NumberTrivia> _ConcreteOrRandomChooser();

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
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
    int number,
  ) async {
    return await _getTrivia(() {
      return remoteDataSource.getConcreteNumberTrivia(number);
    });
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async {
    return await _getTrivia(() {
      return remoteDataSource.getRandomNumberTrivia();
    });
  }

  Future<Either<Failure, NumberTrivia>> _getTrivia(
    _ConcreteOrRandomChooser getConcreteOrRandom,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await getConcreteOrRandom();
        localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTrivia = await localDataSource.getLastNumberTrivia();
        return Right(localTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
```
#### 7. Network Info
> Video 7: https://www.youtube.com/watch?v=xWl7GzMDiwg&t=7s

In the `seventh` tutorial we start by adding a package to the `pubspec.yaml` file.

```dart
dependencies:
  
  data_connection_checker: ^0.3.4
```
Create the file `network_info_test.dart` in the same location but inside the test folder.

The `network_info_test.dart` file will have the following code:

```dart
import 'package:clean_architecture_tdd_prep/core/network/network_info.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  NetworkInfoImpl networkInfo;
  MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('isConnected', () {
    test(
      'should forward the call to DataConnectionChecker.hasConnection',
      () async {
        // arrange
        final tHasConnectionFuture = Future.value(true);

        when(mockDataConnectionChecker.hasConnection)
            .thenAnswer((_) => tHasConnectionFuture);
        // act
        // NOTICE: We're NOT awaiting the result
        final result = networkInfo.isConnected;
        // assert
        verify(mockDataConnectionChecker.hasConnection);
        // Utilizing Dart's default referential equality.
        // Only references to the same object are equal.
        expect(result, tHasConnectionFuture);
      },
    );
  });
}
```
Then it is necessary to implement it in the `network_info.dart` file.

```dart
import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
```
#### 8.  Local Data Source
> Video 8: https://www.youtube.com/watch?v=fCguzcvLka8

In the `eighth` tutorial the shared_preferences function is implemented.

It uses the `shared_preferences` function because we only need to save one given NumberTrivia.

Let's add the code to the `number_trivia_local_data_source_test.dart` file.

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:matcher/matcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  NumberTriviaLocalDataSourceImpl dataSource;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = NumberTriviaLocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences,
    );
  });
}
```
Now the file corresponding to the `number_trivia_local_data_source.dart`.

```dart
class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource {
  final SharedPreferences sharedPreferences;

  NumberTriviaLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
    // TODO: implement getLastNumberTrivia
    return null;
  }

  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache) {
    // TODO: implement cacheNumberTrivia
    return null;
  }
}
```
Create another file called `fixtures/trivia_cached.json` and paste the following code in it:

```dart
{
  "text": "Test Text",
  "number": 1
}
```
#### getLastNumberTrivia

Create the first test for the first feature that will show a number stored in the cache.
Open the `number_trivia_local_data_source_test.dart` file and add the following test:

```dart
group('getLastNumberTrivia', () {
  final tNumberTriviaModel =
      NumberTriviaModel.fromJson(json.decode(fixture('trivia_cached.json')));

  test(
    'should return NumberTrivia from SharedPreferences when there is one in the cache',
    () async {
      // arrange
      when(mockSharedPreferences.getString(any))
          .thenReturn(fixture('trivia_cached.json'));
      // act
      final result = await dataSource.getLastNumberTrivia();
      // assert
      verify(mockSharedPreferences.getString('CACHED_NUMBER_TRIVIA'));
      expect(result, equals(tNumberTriviaModel));
    },
  );
});
```
Then go to the corresponding file `number_trivia_local_data_source.dart`.

```dart
@override
Future<NumberTriviaModel> getLastNumberTrivia() {
  final jsonString = sharedPreferences.getString('CACHED_NUMBER_TRIVIA');
  // Future which is immediately completed
  return Future.value(NumberTriviaModel.fromJson(json.decode(jsonString)));
}
```
We move on to the second test that deals with when there is no number in the cache to show.

```dart
test('should throw a CacheException when there is not a cached value', () {
  // arrange
  when(mockSharedPreferences.getString(any)).thenReturn(null);
  // act
  // Not calling the method here, just storing it inside a call variable
  final call = dataSource.getLastNumberTrivia;
  // assert
  // Calling the method happens from a higher-order function passed.
  // This is needed to test if calling a method throws an exception.
  expect(() => call(), throwsA(TypeMatcher<CacheException>()));
});
```
This test will fail as the `dataSource.getLastNumberTrivia` method is not yet implemented. <br />
Let's implement the function in the `number_trivia_local_data_source.dart` file:

```dart
@override
Future<NumberTriviaModel> getLastNumberTrivia() {
  final jsonString = sharedPreferences.getString('CACHED_NUMBER_TRIVIA');
  if (jsonString != null) {
    return Future.value(NumberTriviaModel.fromJson(json.decode(jsonString)));
  } else {
    throw CacheException();
  }
}
```
We'll move on to the third test, which will check if any functions have been called.

```dart
group('cacheNumberTrivia', () {
  final tNumberTriviaModel =
      NumberTriviaModel(number: 1, text: 'test trivia');

  test('should call SharedPreferences to cache the data', () {
    // act
    dataSource.cacheNumberTrivia(tNumberTriviaModel);
    // assert
    final expectedJsonString = json.encode(tNumberTriviaModel.toJson());
    verify(mockSharedPreferences.setString(
      CACHED_NUMBER_TRIVIA,
      expectedJsonString,
    ));
  });
});
```
```dart
@override
Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache) {
  return sharedPreferences.setString(
    CACHED_NUMBER_TRIVIA,
    json.encode(triviaToCache.toJson()),
  );
}
```

#### 9.  Remote Data Source
> Video 9: https://www.youtube.com/watch?v=msGsYPtZnhU

Tutorial number `nine` will handle all communication with the numbers API.

Create a file called `number_trivia_remote_data_source_test.dart` in the `/test` folder and add the following test:




```dart
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:matcher/matcher.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  NumberTriviaRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = NumberTriviaRemoteDataSourceImpl(client: mockHttpClient);
  });
}
```

Implement `NumberTriviaRemoteDataSourceImpl` in the `number_trivia_remote_data_source.dart` file:

```dart
class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  final http.Client client;

  NumberTriviaRemoteDataSourceImpl({@required this.client});

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) {
    // TODO: implement getConcreteNumberTrivia
    return null;
  }

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() {
    // TODO: implement getRandomNumberTrivia
    return null;
  }
}
```

Now create a test for the `GET request on a URL with number` being the endpoint.

```dart
group('getConcreteNumberTrivia', () {
  final tNumber = 1;

  test(
    'should preform a GET request on a URL with number being the endpoint and with application/json header',
    () {
      //arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('trivia.json'), 200),
      );
      // act
      dataSource.getConcreteNumberTrivia(tNumber);
      // assert
      verify(mockHttpClient.get(
        'http://numbersapi.com/$tNumber',
        headers: {'Content-Type': 'application/json'},
      ));
    },
  );
}
```

As always, it is necessary to `implement` the file corresponding to the test file.

```dart
@override
Future<NumberTriviaModel> getConcreteNumberTrivia(int number) {
  client.get(
    'http://numbersapi.com/$number',
    headers: {'Content-Type': 'application/json'},
  );
}
```
The next `test` is for getting a number without errors.

```dart
final tNumberTriviaModel =
    NumberTriviaModel.fromJson(json.decode(fixture('trivia.json')));
...
test(
  'should return NumberTrivia when the response code is 200 (success)',
  () async {
    // arrange
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response(fixture('trivia.json'), 200),
    );
    // act
    final result = await dataSource.getConcreteNumberTrivia(tNumber);
    // assert
    expect(result, equals(tNumberTriviaModel));
  },
);
```
Then create the `implementation`.

```dart
@override
Future<NumberTriviaModel> getConcreteNumberTrivia(int number) async {
  final response = await client.get(
    'http://numbersapi.com/$number',
    headers: {'Content-Type': 'application/json'},
  );

  return NumberTriviaModel.fromJson(json.decode(response.body));
}
```

Now we need to run a `test` for when there is some kind of error.

```dart
test(
  'should throw a ServerException when the response code is 404 or other',
  () async {
    // arrange
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response('Something went wrong', 404),
    );
    // act
    final call = dataSource.getConcreteNumberTrivia;
    // assert
    expect(() => call(tNumber), throwsA(TypeMatcher<ServerException>()));
  },
);
```

Implement the code to make the test pass in the corresponding file using an `if`:

```dart
@override
Future<NumberTriviaModel> getConcreteNumberTrivia(int number) async {
  final response = await client.get(
    'http://numbersapi.com/$number',
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    return NumberTriviaModel.fromJson(json.decode(response.body));
  } else {
    throw ServerException();
  }
}
```

Now let's create two methods, one for `success` and one for `error`.

```dart
 void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response(fixture('trivia.json'), 200),
    );
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response('Something went wrong', 404),
    );
  }
}
```

We'll have to do the same tests but this time for a `random number`.

```dart
group('getRandomNumberTrivia', () {
  final tNumberTriviaModel =
      NumberTriviaModel.fromJson(json.decode(fixture('trivia.json')));

  test(
    'should preform a GET request on a URL with *random* endpoint with application/json header',
    () {
      //arrange
      setUpMockHttpClientSuccess200();
      // act
      dataSource.getRandomNumberTrivia();
      // assert
      verify(mockHttpClient.get(
        'http://numbersapi.com/random',
        headers: {'Content-Type': 'application/json'},
      ));
    },
  );

  test(
    'should return NumberTrivia when the response code is 200 (success)',
    () async {
      // arrange
      setUpMockHttpClientSuccess200();
      // act
      final result = await dataSource.getRandomNumberTrivia();
      // assert
      expect(result, equals(tNumberTriviaModel));
    },
  );

  test(
    'should throw a ServerException when the response code is 404 or other',
    () async {
      // arrange
      setUpMockHttpClientFailure404();
      // act
      final call = dataSource.getRandomNumberTrivia;
      // assert
      expect(() => call(), throwsA(TypeMatcher<ServerException>()));
    },
  );
});
```

Now we implement the random function in the `number_trivia_remote_data_source.dart` file.


```dart
@override
Future<NumberTriviaModel> getRandomNumberTrivia() async {
  final response = await client.get(
    'http://numbersapi.com/random',
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    return NumberTriviaModel.fromJson(json.decode(response.body));
  } else {
    throw ServerException();
  }
}
```

Now the tests will `pass` on both sides.

![Tests_passing](https://user-images.githubusercontent.com/27420533/75614498-3b061180-5b31-11ea-8eb6-3751c68efd7c.png)


#### 10.  Bloc Scaffolding & Input Conversion
> Video 10: https://www.youtube.com/watch?v=Ulk9qUErIa4

In tutorial `number 10` begins by explaining how the `Bloc` works.
In general, Bloc is a reactive pattern that makes the data flow only to one side.

#### Creating Bloc Files

First of all we have to `install` the extension of the Bloc.

![Bloc_Enable](https://user-images.githubusercontent.com/27420533/75963778-ffb36c00-5ebd-11ea-9504-20c4baa1330f.png)

Then we have to right click on the mouse and go to `bloc:new bloc`.

We put the file name as `number_trivia` and press yes to use the `Equatable` package.

Then the extension will generate three files, **block, event and state**.

#### Events

The `number_trivia_event.dart` file will handle all events that happen within the application, in this case we only have two events that are when one of the buttons is pressed.

We need to add the following code to the `number_trivia_event.dart` file.

```dart
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NumberTriviaEvent extends Equatable {
  NumberTriviaEvent([List props = const <dynamic>[]]) : super(props);
}

class GetTriviaForConcreteNumber extends NumberTriviaEvent {
  final String numberString;

  GetTriviaForConcreteNumber(this.numberString) : super([numberString]);
}

class GetTriviaForRandomNumber extends NumberTriviaEvent {}
```

#### Input Converter

Create a new folder inside the core folder with the `util` name.
Inside the `util` folder we have to create a file called `input_converter.dart`.

This will be the code.

```dart
import 'package:dartz/dartz.dart';

import '../error/failure.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    // TODO: Implement
  }
}

class InvalidInputFailure extends Failure {}
```
Now inside the `test folder` we have to create the same file inside the util folder.
The file name will be `input_converter_test.dart`.
With the code.

```dart
import 'package:clean_architecture_tdd_prep/core/util/input_converter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group('stringToUnsignedInt', () {
    test(
      'should return an integer when the string represents an unsigned integer',
      () async {
        // arrange
        final str = '123';
        // act
        final result = inputConverter.stringToUnsignedInteger(str);
        // assert
        expect(result, Right(123));
      },
    );
  });
}
```
We have to write the minimum code for the test to pass then in the `input_converter.dart` file we write the code.


```dart
Either<Failure, int> stringToUnsignedInteger(String str) {
  return Right(int.parse(str));
}
```

We go to the `second` test, in the `test file` we add the following code.

```dart
test(
  'should return a failure when the string is not an integer',
  () async {
    // arrange
    final str = 'abc';
    // act
    final result = inputConverter.stringToUnsignedInteger(str);
    // assert
    expect(result, Left(InvalidInputFailure()));
  },
);
```
Then we have to add it to the `input_converter.dart` file.

```dart
Either<Failure, int> stringToUnsignedInteger(String str) {
  try {
    return Right(int.parse(str));
  } on FormatException {
    return Left(InvalidInputFailure());
  }
}
```

Now we move on to the `third` test.


```dart
test(
  'should return a failure when the string is a negative integer',
  () async {
    // arrange
    final str = '-123';
    // act
    final result = inputConverter.stringToUnsignedInteger(str);
    // assert
    expect(result, Left(InvalidInputFailure()));
  },
);
```

We return to the `input_converter.dart` file.

```dart
Either<Failure, int> stringToUnsignedInteger(String str) {
  try {
    final integer = int.parse(str);
    if (integer < 0) throw FormatException();
    return Right(integer);
  } on FormatException {
    return Left(InvalidInputFailure());
  }
}
```

#### States 

The function of the state is to show the state of the application. In the case of this application we will have four states **Empty, Loading, Loaded and Error**.

Inside the `number_trivia_state.dart` file we will write the following code.

```dart
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/number_trivia.dart';

@immutable
abstract class NumberTriviaState extends Equatable {
  NumberTriviaState([List props = const <dynamic>[]]) : super(props);
}

class Empty extends NumberTriviaState {}

class Loading extends NumberTriviaState {}

class Loaded extends NumberTriviaState {
  final NumberTrivia trivia;

  Loaded({@required this.trivia}) : super([trivia]);
}

class Error extends NumberTriviaState {
  final String message;

  Error({@required this.message}) : super([message]);
}
```

Here is the complete code of the `input_converter_test.dart` file.


```dart
import 'package:clean_architeture_tdd/core/util/input_converter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group('stringToUnsignedInt', () {
    test(
      'should return an integer when the string represents an unsigned integer',
      () async {
        // arrange
        final str = '123';
        // act
        final result = inputConverter.stringToUnsignedInteger(str);
        // assert
        expect(result, Right(123));
      },
    );

    test(
      'should return a Failure when the string is not an integer',
      () async {
        // arrange
        final str = 'abc';
        // act
        final result = inputConverter.stringToUnsignedInteger(str);
        // assert
        expect(result, Left(InvalidInputFailure()));
      },
    );

    test(
      'should return a Failure when the string is a negative integer',
      () async {
        // arrange
        final str = '-123';
        // act
        final result = inputConverter.stringToUnsignedInteger(str);
        // assert
        expect(result, Left(InvalidInputFailure()));
      },
    );
  });
}
```

All **three tests will pass**.

![tests_passing_input_converter](https://user-images.githubusercontent.com/27420533/75976854-1b753d00-5ed3-11ea-9330-b3460c33ac7b.png)



#### 11.  Bloc Implementation 1/2
> Video 11: https://www.youtube.com/watch?v=a8f_qpVHa3w

In tutorial number `eleven` we start by setting up the file `number_trivia_bloc.dart`.

```dart
class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;

  NumberTriviaBloc({
    // Changed the name of the constructor parameter (cannot use 'this.')
    @required GetConcreteNumberTrivia concrete,
    @required GetRandomNumberTrivia random,
    @required this.inputConverter,
    // Asserts are how you can make sure that a passed in argument is not null.
    // We omit this elsewhere for the sake of brevity.
  })  : assert(concrete != null),
        assert(random != null),
        assert(inputConverter != null),
        getConcreteNumberTrivia = concrete,
        getRandomNumberTrivia = random;

  @override
  NumberTriviaState get initialState => Empty();

  @override
  Stream<NumberTriviaState> mapEventToState(
    NumberTriviaEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
```

As usual we create a `number_trivia_bloc_test.dart` file inside the Bloc folder that is inside the `test` folder.

```dart
class MockGetConcreteNumberTrivia extends Mock
    implements GetConcreteNumberTrivia {}

class MockGetRandomNumberTrivia extends Mock implements GetRandomNumberTrivia {}

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  NumberTriviaBloc bloc;
  MockGetConcreteNumberTrivia mockGetConcreteNumberTrivia;
  MockGetRandomNumberTrivia mockGetRandomNumberTrivia;
  MockInputConverter mockInputConverter;

  setUp(() {
    mockGetConcreteNumberTrivia = MockGetConcreteNumberTrivia();
    mockGetRandomNumberTrivia = MockGetRandomNumberTrivia();
    mockInputConverter = MockInputConverter();

    bloc = NumberTriviaBloc(
      concrete: mockGetConcreteNumberTrivia,
      random: mockGetRandomNumberTrivia,
      inputConverter: mockInputConverter,
    );
  });
}
```

Let's move on to the `first` test.

```dart
test('initialState should be Empty', () {
  // assert
  expect(bloc.initialState, equals(Empty()));
});
```
Next we go to `number_trivia_bloc.dart` and implement the test there.

```dart
@override
NumberTriviaState get initialState => Empty();
```

The next test will be for `GetTriviaForConcreteNumber`.

```dart
group('GetTriviaForConcreteNumber', () {
  // The event takes in a String
  final tNumberString = '1';
  // This is the successful output of the InputConverter
  final tNumberParsed = int.parse(tNumberString);
  // NumberTrivia instance is needed too, of course
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test trivia');
}
```
The next test will be to see if `input_converter` is being called.

```dart
test(
  'should call the InputConverter to validate and convert the string to an unsigned integer',
  () async {
    // arrange
    when(mockInputConverter.stringToUnsignedInteger(any))
        .thenReturn(Right(tNumberParsed));
    // act
    bloc.dispatch(GetTriviaForConcreteNumber(tNumberString));
    await untilCalled(mockInputConverter.stringToUnsignedInteger(any));
    // assert
    verify(mockInputConverter.stringToUnsignedInteger(tNumberString));
  },
);
```
If we run the tests now we will fail and then we will have to implement in the `number_trivia_bloc.dart` file.

```dart
@override
Stream<NumberTriviaState> mapEventToState(
  NumberTriviaEvent event,
) async* {
  // Immediately branching the logic with type checking, in order
  // for the event to be smart casted
  if (event is GetTriviaForConcreteNumber) {
    inputConverter.stringToUnsignedInteger(event.numberString);
  }
}
```

we now have to add to the file `number_trivia_bloc.dart` a class for any errors that might happen.

```dart
const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';
```
We create the first `test` for errors.

```dart
test(
  'should emit [Error] when the input is invalid',
  () async {
    // arrange
    when(mockInputConverter.stringToUnsignedInteger(any))
        .thenReturn(Left(InvalidInputFailure()));
    // assert later
    final expected = [
      // The initial state is always emitted first
      Empty(),
      Error(message: INVALID_INPUT_FAILURE_MESSAGE),
    ];
    expectLater(bloc.state, emitsInOrder(expected));
    // act
    bloc.dispatch(GetTriviaForConcreteNumber(tNumberString));
  },
);
```
Implement in the corresponding file , the file `number_trivia_bloc.dart`.

```dart
@override
Stream<NumberTriviaState> mapEventToState(
  NumberTriviaEvent event,
) async* {
  if (event is GetTriviaForConcreteNumber) {
    final inputEither =
        inputConverter.stringToUnsignedInteger(event.numberString);

    yield* inputEither.fold(
      (failure) async* {
        yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
      },
      // Although the "success case" doesn't interest us with the current test,
      // we still have to handle it somehow. 
      (integer) => throw UnimplementedError(),
    );
  }
}
```
The `complete code for the test file`.


```dart
mport 'package:clean_architeture_tdd/core/usecases/usecase.dart';
import 'package:clean_architeture_tdd/core/util/input_converter.dart';
import 'package:clean_architeture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architeture_tdd/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:clean_architeture_tdd/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:clean_architeture_tdd/features/number_trivia/presentation/bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGetConcreteNumberTrivia extends Mock
    implements GetConcreteNumberTrivia {}

class MockGetRandomNumberTrivia extends Mock implements GetRandomNumberTrivia {}

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  NumberTriviaBloc bloc;
  MockGetConcreteNumberTrivia mockGetConcreteNumberTrivia;
  MockGetRandomNumberTrivia mockGetRandomNumberTrivia;
  MockInputConverter mockInputConverter;

  setUp(() {
    mockGetConcreteNumberTrivia = MockGetConcreteNumberTrivia();
    mockGetRandomNumberTrivia = MockGetRandomNumberTrivia();
    mockInputConverter = MockInputConverter();

    bloc = NumberTriviaBloc(
      concrete: mockGetConcreteNumberTrivia,
      random: mockGetRandomNumberTrivia,
      inputConverter: mockInputConverter,
    );
  });

  test('initialState should be Empty', () {
    // assert
    expect(bloc.initialState, equals(Empty()));
  });

  group('GetTriviaForConcreteNumber', () {
    final tNumberString = '1';
    final tNumberParsed = 1;
    final tNumberTrivia = NumberTrivia(number: 1, text: 'test trivia');

    void setUpMockInputConverterSuccess() =>
        when(mockInputConverter.stringToUnsignedInteger(any))
            .thenReturn(Right(tNumberParsed));

    test(
      'should call the InputConverter to validate and convert the string to an unsigned integer',
      () async {
        // arrange
        setUpMockInputConverterSuccess();
        // act
        bloc.add(GetTriviaForConcreteNumber(tNumberString));
        await untilCalled(mockInputConverter.stringToUnsignedInteger(any));
        // assert
        verify(mockInputConverter.stringToUnsignedInteger(tNumberString));
      },
    );

    test(
      'should emit [Error] when the input is invalid',
      () async {
        // arrange
        when(mockInputConverter.stringToUnsignedInteger(any))
            .thenReturn(Left(InvalidInputFailure()));
        // assert later
        final expected = [
          Empty(),
          Error(message: INVALID_INPUT_FAILURE_MESSAGE),
        ];
        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(GetTriviaForConcreteNumber(tNumberString));
      },
    );

    test(
      'should get data from the concrete use case',
      () async {
        // arrange
        setUpMockInputConverterSuccess();
        when(mockGetConcreteNumberTrivia(any))
            .thenAnswer((_) async => Right(tNumberTrivia));
        // act
        bloc.add(GetTriviaForConcreteNumber(tNumberString));
        await untilCalled(mockGetConcreteNumberTrivia(any));
        // assert
        verify(mockGetConcreteNumberTrivia(Params(number: tNumberParsed)));
      },
    );

    test(
      'should emit [Loading, Loaded] when data is gotten successfully',
      () async {
        // arrange
        setUpMockInputConverterSuccess();
        when(mockGetConcreteNumberTrivia(any))
            .thenAnswer((_) async => Right(tNumberTrivia));
        // assert later
        final expected = [
          Empty(),
          Loading(),
          Loaded(trivia: tNumberTrivia),
        ];
        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(GetTriviaForConcreteNumber(tNumberString));
      },
    );

    test(
      'should emit [Loading, Error] when getting data fails',
      () async {
        // arrange
        setUpMockInputConverterSuccess();
        when(mockGetConcreteNumberTrivia(any))
            .thenAnswer((_) async => Left(ServerFailure()));
        // assert later
        final expected = [
          Empty(),
          Loading(),
          Error(message: SERVER_FAILURE_MESSAGE),
        ];
        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(GetTriviaForConcreteNumber(tNumberString));
      },
    );

    test(
      'should emit [Loading, Error] with a proper message for the error when getting data fails',
      () async {
        // arrange
        setUpMockInputConverterSuccess();
        when(mockGetConcreteNumberTrivia(any))
            .thenAnswer((_) async => Left(CacheFailure()));
        // assert later
        final expected = [
          Empty(),
          Loading(),
          Error(message: CACHE_FAILURE_MESSAGE),
        ];
        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(GetTriviaForConcreteNumber(tNumberString));
      },
    );
  });

  group('GetTriviaForRandomNumber', () {
    final tNumberTrivia = NumberTrivia(number: 1, text: 'test trivia');

    test(
      'should get data from the random use case',
      () async {
        // arrange
        when(mockGetRandomNumberTrivia(any))
            .thenAnswer((_) async => Right(tNumberTrivia));
        // act
        bloc.add(GetTriviaForRandomNumber());
        await untilCalled(mockGetRandomNumberTrivia(any));
        // assert
        verify(mockGetRandomNumberTrivia(NoParams()));
      },
    );

    test(
      'should emit [Loading, Loaded] when data is gotten successfully',
      () async {
        // arrange
        when(mockGetRandomNumberTrivia(any))
            .thenAnswer((_) async => Right(tNumberTrivia));
        // assert later
        final expected = [
          Empty(),
          Loading(),
          Loaded(trivia: tNumberTrivia),
        ];
        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(GetTriviaForRandomNumber());
      },
    );

    test(
      'should emit [Loading, Error] when getting data fails',
      () async {
        // arrange
        when(mockGetRandomNumberTrivia(any))
            .thenAnswer((_) async => Left(ServerFailure()));
        // assert later
        final expected = [
          Empty(),
          Loading(),
          Error(message: SERVER_FAILURE_MESSAGE),
        ];
        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(GetTriviaForRandomNumber());
      },
    );

    test(
      'should emit [Loading, Error] with a proper message for the error when getting data fails',
      () async {
        // arrange
        when(mockGetRandomNumberTrivia(any))
            .thenAnswer((_) async => Left(CacheFailure()));
        // assert later
        final expected = [
          Empty(),
          Loading(),
          Error(message: CACHE_FAILURE_MESSAGE),
        ];
        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(GetTriviaForRandomNumber());
      },
    );
  });
}
```
The tests will all **pass** now.

![Tests_Passing_number_trivia_bloc](https://user-images.githubusercontent.com/27420533/75988166-11f6cf80-5ee9-11ea-83ad-fd39796e9772.png)

#### 12.  Bloc Implementation 2/2 
> Video 12: https://www.youtube.com/watch?v=YSNeS5S5Nqw

In the `twelfth` tutorial we will finish the tests done in the previous tutorial.
We start by going to `number_trivia_bloc_test.dart` and add a new test.

```dart
test(
  'should get data from the concrete use case',
  () async {
    // arrange
    when(mockInputConverter.stringToUnsignedInteger(any))
        .thenReturn(Right(tNumberParsed));
    when(mockGetConcreteNumberTrivia(any))
        .thenAnswer((_) async => Right(tNumberTrivia));
    // act
    bloc.dispatch(GetTriviaForConcreteNumber(tNumberString));
    await untilCalled(mockGetConcreteNumberTrivia(any));
    // assert
    verify(mockGetConcreteNumberTrivia(Params(number: tNumberParsed)));
  },
);
```

Then we add in the file `number_trivia_bloc.dart`.

```dart
@override
Stream<NumberTriviaState> mapEventToState(
  NumberTriviaEvent event,
) async* {
  if (event is GetTriviaForConcreteNumber) {
    final inputEither =
        inputConverter.stringToUnsignedInteger(event.numberString);

    yield* inputEither.fold(
      (failure) async* {
        yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
      },
      (integer) {
        getConcreteNumberTrivia(Params(number: integer));
      },
    );
  }
}
```
We need to add a `MockInputConverterSuccess` to the test file.


```dart
group('GetTriviaForConcreteNumber', () {
  ...

  void setUpMockInputConverterSuccess() =>
      when(mockInputConverter.stringToUnsignedInteger(any))
          .thenReturn(Right(tNumberParsed));
  // Use in tests below
  ...
}
```
We will have `three` tests that will show the application status.
So let's take the first test.

```dart
test(
  'should emit [Loading, Loaded] when data is gotten successfully',
  () async {
    // arrange
    setUpMockInputConverterSuccess();
    when(mockGetConcreteNumberTrivia(any))
        .thenAnswer((_) async => Right(tNumberTrivia));
    // assert later
    final expected = [
      Empty(),
      Loading(),
      Loaded(trivia: tNumberTrivia),
    ];
    expectLater(bloc.state, emitsInOrder(expected));
    // act
    bloc.dispatch(GetTriviaForConcreteNumber(tNumberString));
  },
);
```

We add it back to the `number_trivia_bloc.dart` file.

```dart
@override
Stream<NumberTriviaState> mapEventToState(
  NumberTriviaEvent event,
) async* {
  if (event is GetTriviaForConcreteNumber) {
    final inputEither =
        inputConverter.stringToUnsignedInteger(event.numberString);

    yield* inputEither.fold(
      (failure) async* {
        yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
      },
      (integer) async* {
        yield Loading();
        final failureOrTrivia = await getConcreteNumberTrivia(
          Params(number: integer),
        );
        yield failureOrTrivia.fold(
          (failure) => throw UnimplementedError(),
          (trivia) => Loaded(trivia: trivia),
        );
      },
    );
  }
}
```
We now proceed to the `second` test.

```dart
test(
  'should emit [Loading, Error] when getting data fails',
  () async {
    // arrange
    setUpMockInputConverterSuccess();
    when(mockGetConcreteNumberTrivia(any))
        .thenAnswer((_) async => Left(ServerFailure()));
    // assert later
    final expected = [
      Empty(),
      Loading(),
      Error(message: SERVER_FAILURE_MESSAGE),
    ];
    expectLater(bloc.state, emitsInOrder(expected));
    // act
    bloc.dispatch(GetTriviaForConcreteNumber(tNumberString));
  },
);
```
This test will show if any mistakes were made. Then it is necessary to implement it in the corresponding file.

```dart
(integer) async* {
  yield Loading();
  final failureOrTrivia = await getConcreteNumberTrivia(
    Params(number: integer),
  );
  yield failureOrTrivia.fold(
    (failure) => Error(message: SERVER_FAILURE_MESSAGE),
    (trivia) => Loaded(trivia: trivia),
  );
},
```
Now the `third` test.

```dart
test(
  'should emit [Loading, Error] with a proper message for the error when getting data fails',
  () async {
    // arrange
    setUpMockInputConverterSuccess();
    when(mockGetConcreteNumberTrivia(any))
        .thenAnswer((_) async => Left(CacheFailure()));
    // assert later
    final expected = [
      Empty(),
      Loading(),
      Error(message: CACHE_FAILURE_MESSAGE),
    ];
    expectLater(bloc.state, emitsInOrder(expected));
    // act
    bloc.dispatch(GetTriviaForConcreteNumber(tNumberString));
  },
);
```
Inside the file `number_trivia_bloc.dart` we have to add the `mapEventToState` method.

```dart
@override
Stream<NumberTriviaState> mapEventToState(
  NumberTriviaEvent event,
) async* {
  if (event is GetTriviaForConcreteNumber) {
    final inputEither =
        inputConverter.stringToUnsignedInteger(event.numberString);

    yield* inputEither.fold(
      (failure) async* {
        yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
      },
      (integer) async* {
        yield Loading();
        final failureOrTrivia = await getConcreteNumberTrivia(
          Params(number: integer),
        );
        yield failureOrTrivia.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (trivia) => Loaded(trivia: trivia),
        );
      },
    );
  }
}

String _mapFailureToMessage(Failure failure) {
  // Instead of a regular 'if (failure is ServerFailure)...'
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHE_FAILURE_MESSAGE;
    default:
      return 'Unexpected Error';
  }
}
```

Complete code for the test file.


```dart
group('GetTriviaForRandomNumber', () {
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test trivia');

  test(
    'should get data from the random use case',
    () async {
      // arrange
      when(mockGetRandomNumberTrivia(any))
          .thenAnswer((_) async => Right(tNumberTrivia));
      // act
      bloc.dispatch(GetTriviaForRandomNumber());
      await untilCalled(mockGetRandomNumberTrivia(any));
      // assert
      verify(mockGetRandomNumberTrivia(NoParams()));
    },
  );

  test(
    'should emit [Loading, Loaded] when data is gotten successfully',
    () async {
      // arrange
      when(mockGetRandomNumberTrivia(any))
          .thenAnswer((_) async => Right(tNumberTrivia));
      // assert later
      final expected = [
        Empty(),
        Loading(),
        Loaded(trivia: tNumberTrivia),
      ];
      expectLater(bloc.state, emitsInOrder(expected));
      // act
      bloc.dispatch(GetTriviaForRandomNumber());
    },
  );

  test(
    'should emit [Loading, Error] when getting data fails',
    () async {
      // arrange
      when(mockGetRandomNumberTrivia(any))
          .thenAnswer((_) async => Left(ServerFailure()));
      // assert later
      final expected = [
        Empty(),
        Loading(),
        Error(message: SERVER_FAILURE_MESSAGE),
      ];
      expectLater(bloc.state, emitsInOrder(expected));
      // act
      bloc.dispatch(GetTriviaForRandomNumber());
    },
  );

  test(
    'should emit [Loading, Error] with a proper message for the error when getting data fails',
    () async {
      // arrange
      when(mockGetRandomNumberTrivia(any))
          .thenAnswer((_) async => Left(CacheFailure()));
      // assert later
      final expected = [
        Empty(),
        Loading(),
        Error(message: CACHE_FAILURE_MESSAGE),
      ];
      expectLater(bloc.state, emitsInOrder(expected));
      // act
      bloc.dispatch(GetTriviaForRandomNumber());
    },
  );
});
```

In our `number_trivia_bloc.dart` file we have to call `GetRandomNumberTrivia` and pass `NoParams( )`.

```dart
@override
Stream<NumberTriviaState> mapEventToState(
  NumberTriviaEvent event,
) async* {
  if (event is GetTriviaForConcreteNumber) {
    ...
  } else if (event is GetTriviaForRandomNumber) {
    yield Loading();
    final failureOrTrivia = await getRandomNumberTrivia(
      NoParams(),
    );
    yield failureOrTrivia.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (trivia) => Loaded(trivia: trivia),
    );
  }
}
```

The `tests` will all pass.

!Tests_passing_Random_number_trivia_bloc](https://user-images.githubusercontent.com/27420533/76038500-9e34e100-5f41-11ea-9494-28df5a74af01.png)

#### 13.  Dependency Injection
> Video 13: https://www.youtube.com/watch?v=gfLb4rqzio4


In tutorial number `thirteen` we start by creating a file that will be used to configure the dependencies.
This file must be created inside the `lib` folder with the name `injector_container.dart`.

This is the file structure.


```dart
final sl = GetIt.instance;

void init() {
  //! Features - Number Trivia

  //! Core

  //! External

}
```

First thing to do inside the file is register a factory.

```dart
//! Features - Number Trivia
//Bloc
sl.registerFactory(
  () => NumberTriviaBloc(
    concrete: sl(),
    random: sl(),
    inputConverter: sl(),
  ),
);
```

Then we use the `registerLazySingleton` function to create the Bloc dependencies.

```dart
//! Features - Number Trivia
...
// Use cases
sl.registerLazySingleton(() => GetConcreteNumberTrivia(sl()));
sl.registerLazySingleton(() => GetRandomNumberTrivia(sl()));

//! Core
sl.registerLazySingleton(() => InputConverter());
```

Next we must instantiate the `implementation` of a repository.


```dart
//! Features - Number Trivia
...
// Repository
sl.registerLazySingleton<NumberTriviaRepository>(
  () => NumberTriviaRepositoryImpl(
    remoteDataSource: sl(),
    localDataSource: sl(),
    networkInfo: sl(),
  ),
);
```

Then it is necessary to specify a type of parameter.


```dart
//! Features - Number Trivia
...
// Data sources
sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
  () => NumberTriviaRemoteDataSourceImpl(client: sl()),
);

sl.registerLazySingleton<NumberTriviaLocalDataSource>(
  () => NumberTriviaLocalDataSourceImpl(sharedPreferences: sl()),
);

//! Core
...
sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
```

Change the `init` method.

```dart
Future<void> init() async {
  ...
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
```

Inside our `main.dart` file we have to call the `injection_container.dart` function.

```dart
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(MyApp());
}
```

This is the full code of the `injection_container.dart` file.

```dart
import 'package:clean_architeture_tdd/features/number_trivia/domain/number_trivia_repository.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'core/util/input_converter.dart';
import 'features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'features/number_trivia/presentation/bloc/number_trivia_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory(
    () => NumberTriviaBloc(
      concrete: sl(),
      inputConverter: sl(),
      random: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetConcreteNumberTrivia(sl()));
  sl.registerLazySingleton(() => GetRandomNumberTrivia(sl()));

  // Repository
  sl.registerLazySingleton<NumberTriviaRepository>(
    () => NumberTriviaRepositoryImpl(
      localDataSource: sl(),
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
    () => NumberTriviaRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<NumberTriviaLocalDataSource>(
    () => NumberTriviaLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
```

#### 14.  User Interface
> Video 14: https://www.youtube.com/watch?v=G-R-1rzR3zw&t=604s

In tutorial number `fourteen` we start by creating a file inside the pages folder with the name `number_trivia_page.dart`.
With the following code.

```dart
class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Trivia'),
      ),
    );
  }
}
```

Now inside the `main.dart` we add this code.

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Trivia',
      theme: ThemeData(
        primaryColor: Colors.green.shade800,
        accentColor: Colors.green.shade600,
      ),
      home: NumberTriviaPage(),
    );
  }
}
```

Inside the `number_trivia_page.dart` file we have to add the `NumberTriviaBloc`.

```dart
import '../../../../injection_container.dart';
import '../bloc/bloc.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Trivia'),
      ),
      body: BlocProvider(
        builder: (_) => sl<NumberTriviaBloc>(),
        child: Container(),
      ),
    );
  }
}
```
Next we start by dealing with the visual part of the application. Inside the file `number_trivia_page.dart`.

```dart
class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Trivia'),
      ),
      body: buildBody(context),
    );
  }

  BlocProvider<NumberTriviaBloc> buildBody(BuildContext context) {
    return BlocProvider(
      builder: (_) => sl<NumberTriviaBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              // Top half
              Container(
                // Third of the size of the screen
                height: MediaQuery.of(context).size.height / 3,
                // Message Text widgets / CircularLoadingIndicator
                child: Placeholder(),
              ),
              SizedBox(height: 20),
              // Bottom half
              Column(
                children: <Widget>[
                  // TextField
                  Placeholder(fallbackHeight: 40),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Expanded(
                        // Search concrete button
                        child: Placeholder(fallbackHeight: 30),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        // Random button
                        child: Placeholder(fallbackHeight: 30),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
```

We continue in the visual part of the application.


```dart
// Top half
BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
  builder: (context, state) {
    if (state is Empty) {
      return Container(
        // Third of the size of the screen
        height: MediaQuery.of(context).size.height / 3,
        child: Center(
          child: Text('Start searching!'),
        ),
      );
    }
    // We're going to also check for the other states
  },
),

```

Below we added a little styling and a class to show messages depending on the application status.

```dart
BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
  builder: (context, state) {
    if (state is Empty) {
      return MessageDisplay(
        message: 'Start searching!',
      );
    }
  },
),

...

class MessageDisplay extends StatelessWidget {
  final String message;

  const MessageDisplay({
    Key key,
    @required this.message,
  })  : assert(message != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Third of the size of the screen
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            message,
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
```
Now we expand the Bloc Builder.

```dart
BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
  builder: (context, state) {
    if (state is Empty) {
      return MessageDisplay(
        message: 'Start searching!',
      );
    } else if (state is Error) {
      return MessageDisplay(
        message: state.message,
      );
    }
  },
),
```

It is necessary to extract the `container` for a `LoadingWidget`.

```dart
BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
  builder: (context, state) {
    if (state is Empty) {
      return MessageDisplay(
        message: 'Start searching!',
      );
    } else if (state is Loading) {
      return LoadingWidget();
    } else if (state is Error) {
      return MessageDisplay(
        message: state.message,
      );
    }
  },
),

...

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
```


We added a display to show the numbers.


```dart
BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
  builder: (context, state) {
    if (state is Empty) {
      return MessageDisplay(
        message: 'Start searching!',
      );
    } else if (state is Loading) {
      return LoadingWidget();
    } else if (state is Loaded) {
      return TriviaDisplay(
        numberTrivia: state.trivia,
      );
    } else if (state is Error) {
      return MessageDisplay(
        message: state.message,
      );
    }
  },
),

...

class TriviaDisplay extends StatelessWidget {
  final NumberTrivia numberTrivia;

  const TriviaDisplay({
    Key key,
    this.numberTrivia,
  })  : assert(numberTrivia != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: <Widget>[
          // Fixed size, doesn't scroll
          Text(
            numberTrivia.number.toString(),
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Expanded makes it fill in all the remaining space
          Expanded(
            child: Center(
              // Only the trivia "message" part will be scrollable
              child: SingleChildScrollView(
                child: Text(
                  numberTrivia.text,
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
```

#### Minor Refactoring

At this moment all our widgets are next to the file `number_trivia_page.dart` so we need to move them into the `Widgets` folder.

Inside the `Widgets.dart` file you need to export the files we add now.

```dart
export 'loading_widget.dart';
export 'message_display.dart';
export 'trivia_display.dart';
```

Then inside `number_trivia_page.dart` just import the `widgets.dart` file.

```dart
import '../widgets/widgets.dart';
```
In the `number_trivia_page.dart` file it is necessary to create a stateful widget.

```dart
class TriviaControls extends StatefulWidget {
  const TriviaControls({
    Key key,
  }) : super(key: key);

  @override
  _TriviaControlsState createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<TriviaControls> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Placeholders here...
      ],
    );
  }
}
```
Then we create the function for when is pressed a button.

```dart
class _TriviaControlsState extends State<TriviaControls> {
  final controller = TextEditingController();
  String inputStr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a number',
          ),
          onChanged: (value) {
            inputStr = value;
          },
          onSubmitted: (_) {
            dispatchConcrete();
          },
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                child: Text('Search'),
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: dispatchConcrete,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: RaisedButton(
                child: Text('Get random trivia'),
                onPressed: dispatchRandom,
              ),
            ),
          ],
        )
      ],
    );
  }

  void dispatchConcrete() {
    // Clearing the TextField to prepare it for the next inputted number
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context)
        .dispatch(GetTriviaForConcreteNumber(inputStr));
  }

  void dispatchRandom() {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context)
        .dispatch(GetTriviaForRandomNumber());
  }
}
```

Finally we added a `SingleChildScrollView` inside the body so that the application can become Scrollable and non-static.

```dart
class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Trivia'),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }
}
```

The complete code for the file `number_trivia_page.dart`.


```dart
import 'package:clean_architeture_tdd/features/number_trivia/presentation/bloc/bloc.dart';
import 'package:clean_architeture_tdd/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:clean_architeture_tdd/features/number_trivia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Trivia'),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<NumberTriviaBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NumberTriviaBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              // Top half
              BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return MessageDisplay(
                      message: 'Start searching!',
                    );
                  } else if (state is Loading) {
                    return LoadingWidget();
                  } else if (state is Loaded) {
                    return TriviaDisplay(numberTrivia: state.trivia);
                  } else if (state is Error) {
                    return MessageDisplay(
                      message: state.message,
                    );
                  }
                },
              ),
              SizedBox(height: 20),
              // Bottom half
              TriviaControls()
            ],
          ),
        ),
      ),
    );
  }
}
```
