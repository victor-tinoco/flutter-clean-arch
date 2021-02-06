import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:squadmobile_base_project/app/config/constants/strings.dart';
import 'package:squadmobile_base_project/app/config/dependences_injector/dependences_injector.dart';
import 'package:squadmobile_base_project/app/domain/entities/user.dart';
import 'package:squadmobile_base_project/app/presentation/pages/home/home_controller.dart';
import 'package:squadmobile_base_project/app/presentation/pages/home/home_page.dart';
import 'package:squadmobile_base_project/app/presentation/widgets/custom_button.dart';
import 'package:squadmobile_base_project/core/entities/user.dart';
import 'package:squadmobile_base_project/core/usecases/list_users_usecase.dart';

class MockListUsersUseCase extends Mock implements ListUsersUseCase {}

void main() {
  final mockListUsersUseCase = MockListUsersUseCase();

  DependencesInjector.registerFactory(
    () => HomeController(mockListUsersUseCase),
  );

  group('given that we fetch users list', () {
    testWidgets('and thrown an error then show error state', (tester) async {
      when(mockListUsersUseCase.execute()).thenAnswer(
        (realInvocation) => Future.error(Exception()),
      );

      await tester.pumpWidget(MaterialApp(home: HomePage()));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.text(Strings.SEARCH_ERROR), findsOneWidget);
      final buttonFinder = find.byWidgetPredicate((widget) {
        return _customButtonMatcher(widget, Strings.TRY_AGAIN);
      });
      expect(buttonFinder, findsOneWidget);
    });

    testWidgets('and return an empty list then show empty state',
        (tester) async {
      when(mockListUsersUseCase.execute()).thenAnswer(
        (realInvocation) => Future.value(<User>[]),
      );

      await tester.pumpWidget(MaterialApp(home: HomePage()));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.text('Vazio'), findsOneWidget);
    });

    testWidgets('and return a filled list then show that list', (tester) async {
      List<User> usersList = [
        UserEntity(name: 'Tonico'),
      ];
      when(mockListUsersUseCase.execute()).thenAnswer(
        (realInvocation) => Future.value(usersList),
      );

      await tester.pumpWidget(MaterialApp(home: HomePage()));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
      expect(
        find.widgetWithText(ListTile, usersList.first.name),
        findsOneWidget,
      );
    });
  });
}

bool _customButtonMatcher(Widget widget, String text) {
  if (widget is CustomButton) {
    return widget.text == text;
  }
  return false;
}
