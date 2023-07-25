import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walippe/src/models/group_data.dart';
import 'package:walippe/src/providers/provider.dart';
import 'package:walippe/src/views/screens/create_group_screen.dart';
import 'package:walippe/src/views/screens/group_list_screen.dart';

void main() {
  group('GroupListScreen Widget', () {
    testWidgets('displays the list of groups when data is provided',
        (WidgetTester tester) async {
      // Define the behavior of the groupListProvider when it is called
      final groupListProviderOverride =
          AutoDisposeFutureProvider<List<GroupData>>((ref) async {
        return [
          GroupData(
              id: 1,
              name: 'Group 1',
              createdAt: DateTime.now(),
              updatedAt: DateTime.now()),
          GroupData(
              id: 2,
              name: 'Group 2',
              createdAt: DateTime.now(),
              updatedAt: DateTime.now()),
        ];
      });

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            groupListProvider.overrideWithProvider(groupListProviderOverride)
          ],
          child: MaterialApp(home: GroupListScreen()),
        ),
      );

      // Wait for the widget to build
      await tester.pump();

      // Expect the list of groups to be displayed
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('navigates to the CreateGroupScreen when the FAB is pressed',
        (WidgetTester tester) async {
      // Define the behavior of the groupListProvider when it is called
      final groupListProviderOverride =
          AutoDisposeFutureProvider<List<GroupData>>((ref) async {
        return [
          GroupData(
              id: 1,
              name: 'Group 1',
              createdAt: DateTime.now(),
              updatedAt: DateTime.now()),
          GroupData(
              id: 2,
              name: 'Group 2',
              createdAt: DateTime.now(),
              updatedAt: DateTime.now()),
        ];
      });

      // Build the GroupListScreen widget in a test environment
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            groupListProvider.overrideWithProvider(groupListProviderOverride)
          ],
          child: MaterialApp(
            home: GroupListScreen(),
            routes: {
              '/create_group': (context) => CreateGroupScreen(),
            },
          ),
        ),
      );

      // Wait for the widget to build
      await tester.pump();

      // Tap the FloatingActionButton
      await tester.tap(find.byType(FloatingActionButton));

      // Wait for the navigation animation
      await tester.pumpAndSettle();

      // Expect the CreateGroupScreen to be displayed
      expect(find.byType(CreateGroupScreen), findsOneWidget);
    });
  });
}
