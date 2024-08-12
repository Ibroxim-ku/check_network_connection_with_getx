import 'package:check_internet_connection/src/features/presentation/controllers/internet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final InternetController internetController = Get.put(InternetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => internetController.isConnectedToInternet.value
                    ? LottieBuilder.asset(
                        "assets/images/connect_internet.json",
                      )
                    : LottieBuilder.asset(
                        "assets/images/not_internet.json",
                      ),
              ),
              Obx(
                () => Text(
                  internetController.isConnectedToInternet.value
                      ? "You are connected to the internet."
                      : "You are not connected to the internet.",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
