import 'package:delivery_timesheet_app/controllers/driver_controller.dart';
import 'package:delivery_timesheet_app/widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends GetWidget<DriverController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffE1E5E4),
        appBar: AppBar(
          title: const Text(
            'Expenses',
          ),
          centerTitle: true,
        ),
        drawer: const HomeDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => (controller.imageUrl.value != null &&
                          controller.imageUrl.value.isEmpty == false)
                      ? Container(
                          height: 150,
                          child: controller.isLoading.value == true
                              ? const Center(child: CircularProgressIndicator())
                              : Image.network(controller.imageUrl.value))
                      : Container(
                          color: const Color(0xffE1E5E4),
                          height: 150,
                          child: Image.asset(
                            'images/profile_image.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => controller.setUserImage(),
                      icon: const Icon(Icons.camera_alt),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Obx(
                  () => (controller.currentDriver.value != null &&
                          controller
                                  .currentDriver.value!.driver_name?.isEmpty ==
                              false)
                      ? Text(
                          controller.currentDriver.value!.driver_name!,
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          '(Display Name)',
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.center,
                        ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => (controller.currentDriver.value != null &&
                          controller
                                  .currentDriver.value!.driver_name?.isEmpty ==
                              false)
                      ? Text(
                          controller.currentDriver.value!.driver_name!,
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          '(User Name)',
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.center,
                        ),
                ),
                const SizedBox(height: 20),
                const Divider(color: Colors.black),
                const SizedBox(height: 20),
                Text(
                  'Update Your Details',
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: controller.displaynameController,
                  autocorrect: false,
                  textInputAction: TextInputAction.done,
                  // autofocus: true,
                  onEditingComplete: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    controller.updateDisplayName();
                  },
                  decoration: const InputDecoration(
                    labelText: 'Display Name',
                    prefixIcon: Icon(Icons.badge),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: controller.updateDisplayName,
                    child: const Text(
                      'Save',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
