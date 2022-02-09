import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:delivery_timesheet_app/models/ModelProvider.dart';

import 'datastore_service.dart';

class AuthService {
  DataStoreService _dataStoreService = DataStoreService();

  Future<bool> isSignedIn() async {
    AuthSession authSessions = await Amplify.Auth.fetchAuthSession();

    if (authSessions.isSignedIn) {
      try {
        var res = await Amplify.Auth.fetchUserAttributes();
        final _authUserAttribute = res.firstWhere(
          (element) => element.userAttributeKey.toString() == 'email',
        );

        await saveUser(_authUserAttribute.value.toString());
      } on AuthException catch (e) {
        print(e.message);
      }

      //  await getCurrentUser();
      // currentUser.value = await _dataStoreService.getUser(authUser.userId);
    } else {}

    return authSessions.isSignedIn;
  }

  Future<AuthUser> getCurrentUser() async {
    AuthUser authUser = await Amplify.Auth.getCurrentUser();
    return authUser;
  }

  Future saveUser(String email) async {
    AuthUser authUser = await Amplify.Auth.getCurrentUser();
    Driver driver = new Driver();
    await _dataStoreService.saveDriver(driver);
  }
}
