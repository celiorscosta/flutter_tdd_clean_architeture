// import 'package:dartz/dartz.dart';
// import 'package:flutter_tdd_clean_architeture/core/util/input_converter.dart';
// import 'package:flutter_tdd_clean_architeture/features/number_trivia/domain/entities/number_trivia.dart';
// import 'package:flutter_tdd_clean_architeture/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
// import 'package:flutter_tdd_clean_architeture/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
// import 'package:flutter_tdd_clean_architeture/features/number_trivia/presentation/bloc/bloc/number_trivia_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:mockito/annotations.dart';

// @GenerateMocks([
//   GetConcreteNumberTrivia,
//   GetRandomNumberTrivia,
//   InputConverter,
// ], customMocks: [
//   MockSpec<GetConcreteNumberTrivia>(
//       as: #BaseMockGetConcreteNumberTrivia, returnNullOnMissingStub: true),
//   MockSpec<GetRandomNumberTrivia>(
//       as: #BaseMockGetRandomNumberTrivia, returnNullOnMissingStub: true),
//   MockSpec<InputConverter>(
//       as: #BaseMockInputConverter, returnNullOnMissingStub: true)
// ])
// import 'number_trivia_bloc_test.mocks.dart';

// void main() {
//   late NumberTriviaBloc bloc;
//   late MockGetConcreteNumberTrivia mockGetConcreteNumberTrivia;
//   late MockGetRandomNumberTrivia mockGetRandomNumberTrivia;
//   late MockInputConverter mockInputConverter;

//   setUp(() {
//     mockGetConcreteNumberTrivia = MockGetConcreteNumberTrivia();
//     mockGetRandomNumberTrivia = MockGetRandomNumberTrivia();
//     mockInputConverter = MockInputConverter();

//     bloc = NumberTriviaBloc(
//       concrete: mockGetConcreteNumberTrivia,
//       random: mockGetRandomNumberTrivia,
//       inputConverter: mockInputConverter,
//     );
//   });

//   test('initialState should be Empty', () {
//     // assert
//     expect(bloc.initialState, equals(Empty()));
//   });

//   group('GetTriviaForConcreteNumber', () {
//     const tNumberString = '1';
//     const tNumberParsed = 1;
//     const tNumberTrivia = NumberTrivia(number: 1, text: 'test trivia');

//     void setUpMockInputConverterSuccess() =>
//         when(mockInputConverter.stringToUnsignedInteger(any))
//             .thenReturn(const Right(tNumberParsed));

//     test(
//       'should call the InputConverter to validate and convert the string to an unsigned integer',
//       () async {
//         // arrange
//         setUpMockInputConverterSuccess();
//         // act
//         bloc.add(GetTriviaForConcreteNumber(tNumberString));
//         await untilCalled(mockInputConverter.stringToUnsignedInteger(any));
//         // assert
//         verify(mockInputConverter.stringToUnsignedInteger(tNumberString));
//       },
//     );

//     test(
//       'should emit [Error] when the input is invalid',
//       () async {
//         // arrange
//         when(mockInputConverter.stringToUnsignedInteger(any))
//             .thenReturn(Left(InvalidInputFailure()));
//         // assert later
//         final expected = [
//           // The initial state is always emitted first
//           Empty(),
//           Error(message: INVALID_INPUT_FAILURE_MESSAGE),
//         ];
//         expectLater(bloc.state, emitsInOrder(expected));
//         // act
//         bloc.dispatch(GetTriviaForConcreteNumber(tNumberString));
//       },
//     );

//     test(
//       'should get data from the concrete use case',
//       () async {
//         // arrange
//         when(mockInputConverter.stringToUnsignedInteger(any))
//             .thenReturn(Right(tNumberParsed));
//         when(mockGetConcreteNumberTrivia(any))
//             .thenAnswer((_) async => Right(tNumberTrivia));
//         // act
//         bloc.dispatch(GetTriviaForConcreteNumber(tNumberString));
//         await untilCalled(mockGetConcreteNumberTrivia(any));
//         // assert
//         verify(mockGetConcreteNumberTrivia(Params(number: tNumberParsed)));
//       },
//     );
//   });
// }
