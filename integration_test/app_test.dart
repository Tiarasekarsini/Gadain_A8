// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:gadain/controller/auth_Controller.dart';
// import 'package:gadain/main.dart';

// void main() {
//   testWidgets('Tap on Google Sign-In GestureDetector',
//       (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MyApp()); // Assuming MyApp is the entry point

//     // Create an instance of AuthController
//     final AuthController authController = AuthController();

//     // Find the Container
//     final Finder containerFinder = find.byType(Container);

//     // Find the GestureDetector within the Container
//     final Finder gestureDetectorFinder = find.descendant(
//       of: containerFinder,
//       matching: find.byType(GestureDetector),
//     );

//     // Tap on the GestureDetector
//     await tester.tap(gestureDetectorFinder);

//     // Wait for the animation to complete
//     await tester.pumpAndSettle();

//     // Ensure the widget rebuilds after the animation completes
//     await tester.pump();

//     // Check if the login function is called
//     expect(authController.login, true);
//   });
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:gadain/controller/auth_controller.dart'; // Make sure to import your AuthController
// import 'package:gadain/main.dart';
// import 'package:gadain/view/home_page.dart'; // Update with the correct path to your main.dart file

// void main() {
//   testWidgets('Login Page Integration Test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(
//         MyApp()); // Make sure to replace MyApp with the actual name of your app

//     // Verify that the login page is rendered
//     expect(find.text('Gadain'), findsOneWidget);
//     expect(find.byType(GestureDetector), findsOneWidget);

//     // Tap the GestureDetector to trigger login
//     await tester.tap(find.byType(GestureDetector));
//     await tester.pump();

//     // You may need to add some delay or waitFor to allow time for the authentication process to complete
//     // You can use `await tester.pumpAndSettle()` or `await Future.delayed(Duration(seconds: x))`

//     // Verify that the user is logged in
//     // Replace the condition below with the logic that asserts the user is logged in
//     expect(find.byType(HomePage), findsOneWidget);
//   });
// }

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gadain/main.dart' as app;
import 'package:gadain/main.dart';
import 'package:gadain/view/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:integration_test/integration_test.dart';
// import 'package:gadain/model/user.dart' as usermod;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Login Test', () {
    testWidgets('Verify Correct Username and Password to Login Screen',
        (tester) async {
      // Initialize the app
      app.main();

      // Wait for the initial frame to settle
      await tester.pumpAndSettle();

      // Pump the widget tree
      await tester.pumpWidget(MyApp());

      // Verify that the Google Sign-In button is present.
      expect(find.byType(GestureDetector), findsOneWidget);

      // Simulate a tap on the Google Sign-In button.
      await tester.tap(find.byType(GestureDetector));

      // Wait for changes (animations, async operations) to complete.
      final GoogleSignInAccount? gUser = await googleSignIn.signIn();

      // Find a list of elements based on their type (adjust to your actual widget type).
      final listItemsFinder = find.byType(ListTile);

      // Verify that the list of items is present.
      expect(listItemsFinder, findsWidgets);

      // Access the list items and perform specific actions or verifications.
      for (int index = 1; index < 5; index++) {
        // Tap on each list item (adjust to your actual widget structure).
        await tester.tap(find.byKey(Key('listItem_$index')));
        await tester.tap(find.byKey('list_item_$index' as Key));

        // Wait for changes (animations, async operations) to complete.
        await tester.pumpAndSettle();

        // Perform other verifications or actions based o
      }

      // expect(authController.createUserInFirestore(conte));
      // expect(find., findsAny);
      // await tester.pumpAndSettle();

      // expect()

      // await tester.enterText(
      //     find.byType(TextField), 'kelompok8keren@gmail.com');

      // await tester.tap(find.text('next'));
    });
  });
}
