//import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:delivery_timesheet_app/models/ModelProvider.dart';
import 'package:delivery_timesheet_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

import 'amplifyconfiguration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    try {
      AmplifyDataStore datastorePlugin =
          AmplifyDataStore(modelProvider: ModelProvider.instance);

      Amplify.addPlugins([
        AmplifyAuthCognito(),
        datastorePlugin,
        AmplifyAPI(),
      ]);

      await Amplify.configure(amplifyconfig);
    } on Exception catch (e) {
      print('Could not configure Amplify: $e');
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),

        // `builder` must be specified with `Authenticator.builder()`.
        builder: Authenticator.builder(),

        // You can use any combination of `routes`, `home`,
        // `onGenerateRoute`, etc. as long as `builder` is
        // configured as shown above.
        home: const HomePage(),
      ),
    );
  }
}
