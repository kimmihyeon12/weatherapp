import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/location.controller.dart';
import 'package:weather_app/controller/weather.controller.dart';
import 'package:weather_app/widget/font/font.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends GetView<WeatherController> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 1080, height: 1920);
    return Scaffold(
        body: Obx(() => SafeArea(
                child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("./assets/Home/night.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 60.h)),
                    rigthfont("현 위치", 55, Colors.white),
                    Padding(padding: EdgeInsets.only(top: 20.h)),
                    boldfont("${LocationController.to.address.value}", 70,
                        Colors.white),
                    SizedBox(height: 500.h),
                    rigthfont(
                        controller.currentprecipitationstatus.value == ""
                            ? "(${controller.currentSkystatus.value})"
                            : "(${controller.currentSkystatus.value} / ${controller.currentprecipitationstatus.value})",
                        55,
                        Colors.white),
                    Padding(padding: EdgeInsets.only(top: 20.h)),
                    boldfont(
                        "${controller.currentTemp.value}℃", 80, Colors.white),
                    Padding(padding: EdgeInsets.only(top: 25.h)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(height: 55.h),
                        rigthfont("최고기온 10℃", 55, Colors.white),
                        rigthfont("최고기온 10℃", 55, Colors.white),
                        SizedBox(height: 55.h),
                      ],
                    )
                  ],
                ),
              ),
            ))));
  }
}
