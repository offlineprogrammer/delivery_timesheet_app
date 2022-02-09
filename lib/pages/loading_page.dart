import 'package:delivery_timesheet_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.find();
    return Scaffold(
      appBar: AppBar(title: const Text('TimeSheet Tracker')),
      body: Container(
        // color: Color(0xff90CCE6),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: const Color(0xffE1E5E4),
                // height: 200,
                child: Image.asset(
                  'images/aws.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xffE1E5E4),
    );
  }
}
