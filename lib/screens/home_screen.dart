import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controller/global_controller.dart';

import '../widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          (() => globalController.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  scrollDirection: Axis.vertical,
                  children: const [
                    HeaderWidget(),
                  ],
                )),
        ),
      ),
    );
  }
}
