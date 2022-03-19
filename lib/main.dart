// Flutter code sample for material.BottomNavigationBar.1

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:co_you/routes.dart' show routes;
import 'package:co_you/mainModel.dart' show ApplicationModel;

void main() {
  final app = ApplicationModel();
  app.loadData();

  runApp(
    ScopedModel<ApplicationModel>(
      model: app,
      child: MyApp(),
    ),
  );
}

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Cool flutter app';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        initialRoute: 'View',
        routes: routes,
        theme: ThemeData(
            // colorScheme.primary: Color.fromARGB(255, 98, 235, 139),
            // colorScheme:
            //     ColorScheme.fromSeed(seedColor: Color.fromRGBO(53, 138, 77, 1))),
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.green[800],
                brightness: Brightness.light,
                primary: Color.fromARGB(255, 91, 145, 94),
                secondary: Colors.green[600],
                background: Colors.grey[200],
                tertiary: Color.fromARGB(255, 230, 172, 0))));
  }
}
