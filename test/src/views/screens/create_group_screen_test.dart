import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:walippe/src/providers/provider.dart';
import 'package:walippe/src/repositories/group_repository.dart';
import 'package:walippe/src/views/screens/create_group_screen.dart';
import 'package:walippe/src/views/form_validator.dart';

import 'create_group_screen_test.mocks.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

@GenerateMocks([GroupRepository, FormValidator])
void main() {
  late MockGroupRepository mockGroupRepository;
  late MockFormValidator mockFormValidator;

  setUp(() {
    mockGroupRepository = MockGroupRepository();
    mockFormValidator = MockFormValidator();
  });

  testWidgets('CreateGroupScreen should render and function correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          groupRepositoryProvider.overrideWithValue(mockGroupRepository),
          formValidatorProvider.overrideWithValue(mockFormValidator),
        ],
        child: MaterialApp(
          home: CreateGroupScreen(),
          // Mock the Navigator.push method
          navigatorObservers: [MockNavigatorObserver()],
        ),
      ),
    );

    // Check if CreateGroupScreen is rendered
    expect(find.byType(CreateGroupScreen), findsOneWidget);

    // Check if TextFormField exists
    expect(find.byType(TextFormField), findsOneWidget);

    // Check if ElevatedButton exists
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Mock the form validator to always return null (meaning the input is valid)
    when(mockFormValidator.validateGroupName(any)).thenReturn(null);

    // Mock the group repository to return a fake group id
    when(mockGroupRepository.addGroupByStringToDatabase(any))
        .thenAnswer((_) async => 1);

    // Fill in the TextFormField
    await tester.enterText(find.byType(TextFormField), 'Test Group');

    // Press the ElevatedButton
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that the group repository's addGroupByStringToDatabase method was called
    verify(mockGroupRepository.addGroupByStringToDatabase('Test Group'))
        .called(1);
  });
}
