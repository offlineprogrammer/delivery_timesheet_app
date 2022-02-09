import 'dart:io';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:delivery_timesheet_app/models/Driver.dart';
import 'package:delivery_timesheet_app/services/analytics_service.dart';
import 'package:delivery_timesheet_app/services/auth_service.dart';
import 'package:delivery_timesheet_app/services/datastore_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class DriverController extends GetxController {
  static DriverController to = Get.find();
  DataStoreService _datastoreService = DataStoreService();
  AuthService _authService = AuthService();
  AnalyticsService _analyticsService = AnalyticsService();
  Rxn<Driver> currentDriver = Rxn<Driver>();
  RxBool isLoading = false.obs;
  RxString imageUrl = ''.obs;
  final TextEditingController displaynameController = TextEditingController();

  Driver? get user => currentDriver.value;

  @override
  void onInit() {
    getCurentDriver();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getCurentDriver() async {
    AuthUser authUser = await _authService.getCurrentUser();
    print('Get the user');
    currentDriver.value = await _datastoreService.getDriver(authUser.userId);
    print(currentDriver.value);
  }

  Future<void> updateDisplayName() async {
    currentDriver.value =
        currentDriver.value!.copyWith(driver_name: displaynameController.text);
    await _datastoreService.saveDriver(currentDriver.value!);
    displaynameController.clear();
    await _analyticsService.recordEvent('update_displayname');
  }

  Future<void> setUserImage() async {
    File _image;
    final picker = ImagePicker();

    try {
      /* isLoading.value = true;
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _image.existsSync();
        final userImageKey = currentDriver.value!.id + Uuid().v1() + '.png';
        Map<String, String> metadata = <String, String>{};
        metadata['name'] = currentDriver.value!.id;
        metadata['desc'] = 'A test file';
        S3UploadFileOptions options = S3UploadFileOptions(
            accessLevel: StorageAccessLevel.guest, metadata: metadata);
        UploadFileResult result = await Amplify.Storage.uploadFile(
            key: userImageKey, local: _image, options: options);
        GetUrlOptions _getUrlOptions = GetUrlOptions(expires: 60000);
        GetUrlResult resultUrl = await Amplify.Storage.getUrl(
            key: userImageKey, options: _getUrlOptions);
        currentDriver.value =
            currentDriver.value!.copyWith(avatarkey: userImageKey);
        imageUrl.value = resultUrl.url;
        await _datastoreService.saveUser(currentDriver.value!);
        await _analyticsService.recordEvent('update_useravatar');
      } else {
        return null;
      } */
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
