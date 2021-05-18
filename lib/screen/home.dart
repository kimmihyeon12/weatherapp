import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/location.controller.dart';
import 'package:weather_app/controller/weather.controller.dart';
import 'package:weather_app/widget/font/font.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends GetView<WeatherController> {
  // int hour = Get.arguments.toInt();
  // String image;
  // void getImage() {
  //   if (5 >= hour && hour <= 12) {
  //     print(hour);
  //     print(1);
  //     image = "./assets/Home/morning.png";
  //   } else if (hour > 12 && hour <= 6) {
  //     print(hour);
  //     print(2);
  //     image = "./assets/Home/afternoon.png";
  //   } else {
  //     print(hour);
  //     print(3);
  //     image = "./assets/Home/afternoon.png";
  //   }
  // }

  @override
  Widget build(BuildContext context) {
//    getImage();

    ScreenUtil.init(context, width: 1080, height: 1920);
    return Scaffold(
        body: Obx(() => SafeArea(
                child: Container(
              height: 1920.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("./assets/Home/afternoon.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: SingleChildScrollView(
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
                      ),
                      Padding(padding: EdgeInsets.only(top: 25.h)),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(
                                20) // use instead of BorderRadius.all(Radius.circular(20))
                            ),
                        margin: EdgeInsets.only(left: 20, right: 20),
                        height: 200.h,
                        child: Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 60.h)),
                            boldfont("오늘 시간대별 날씨", 50, Colors.black),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 50.h)),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(
                                25) // use instead of BorderRadius.all(Radius.circular(20))
                            ),
                        margin: EdgeInsets.only(left: 20, right: 20),
                        height: 880.h,
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 40.h)),
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.only(left: 60.h)),
                                boldfont("일별예보", 50, Colors.black),
                                Padding(padding: EdgeInsets.only(left: 180.h)),
                                boldfont("날씨", 50, Colors.black),
                                Padding(padding: EdgeInsets.only(left: 170.h)),
                                boldfont("최고", 50, Colors.black),
                                Padding(padding: EdgeInsets.only(left: 25.h)),
                                boldfont("최저", 50, Colors.black),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 20.h)),
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.only(left: 50.h)),
                                rigthfont("월", 50, Colors.black),
                                Padding(padding: EdgeInsets.only(left: 301.h)),
                                Image.asset(
                                  './assets/Home/clouds.png',
                                  width: 80.h,
                                  height: 80.w,
                                ),
                                Padding(padding: EdgeInsets.only(left: 150.h)),
                                rigthfont(
                                    "${controller.weeklyWeather[0]["temp"]["max"].ceil()}℃",
                                    50,
                                    Colors.black),
                                Padding(padding: EdgeInsets.only(left: 25.h)),
                                rigthfont(
                                    "${controller.weeklyWeather[0]["temp"]["min"].ceil()}℃",
                                    50,
                                    Colors.black),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 20.h)),
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.only(left: 50.h)),
                                rigthfont("화", 50, Colors.black),
                                Padding(padding: EdgeInsets.only(left: 301.h)),
                                Image.asset(
                                  './assets/Home/clouds.png',
                                  width: 100.h,
                                ),
                                Padding(padding: EdgeInsets.only(left: 150.h)),
                                rigthfont(
                                    "${controller.weeklyWeather[1]["temp"]["max"].ceil()}℃",
                                    50,
                                    Colors.black),
                                Padding(padding: EdgeInsets.only(left: 25.h)),
                                rigthfont(
                                    "${controller.weeklyWeather[1]["temp"]["min"].ceil()}℃",
                                    50,
                                    Colors.black),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 20.h)),
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.only(left: 50.h)),
                                rigthfont("수", 50, Colors.black),
                                Padding(padding: EdgeInsets.only(left: 301.h)),
                                Image.asset(
                                  './assets/Home/clouds.png',
                                  width: 100.h,
                                ),
                                Padding(padding: EdgeInsets.only(left: 150.h)),
                                rigthfont(
                                    "${controller.weeklyWeather[2]["temp"]["max"].ceil()}℃",
                                    50,
                                    Colors.black),
                                Padding(padding: EdgeInsets.only(left: 25.h)),
                                rigthfont(
                                    "${controller.weeklyWeather[2]["temp"]["min"].ceil()}℃",
                                    50,
                                    Colors.black),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 20.h)),
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.only(left: 50.h)),
                                rigthfont("목", 50, Colors.black),
                                Padding(padding: EdgeInsets.only(left: 301.h)),
                                Image.asset(
                                  './assets/Home/clouds.png',
                                  width: 100.h,
                                ),
                                Padding(padding: EdgeInsets.only(left: 150.h)),
                                rigthfont(
                                    "${controller.weeklyWeather[3]["temp"]["max"].ceil()}℃",
                                    50,
                                    Colors.black),
                                Padding(padding: EdgeInsets.only(left: 25.h)),
                                rigthfont(
                                    "${controller.weeklyWeather[3]["temp"]["min"].ceil()}℃",
                                    50,
                                    Colors.black),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 20.h)),
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.only(left: 50.h)),
                                rigthfont("금", 50, Colors.black),
                                Padding(padding: EdgeInsets.only(left: 301.h)),
                                Image.asset(
                                  './assets/Home/clouds.png',
                                  width: 100.h,
                                ),
                                Padding(padding: EdgeInsets.only(left: 150.h)),
                                rigthfont(
                                    "${controller.weeklyWeather[4]["temp"]["max"].ceil()}℃",
                                    50,
                                    Colors.black),
                                Padding(padding: EdgeInsets.only(left: 25.h)),
                                rigthfont(
                                    "${controller.weeklyWeather[4]["temp"]["min"].ceil()}℃",
                                    50,
                                    Colors.black),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 20.h)),
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.only(left: 50.h)),
                                rigthfont("토", 50, Colors.black),
                                Padding(padding: EdgeInsets.only(left: 301.h)),
                                Image.asset(
                                  './assets/Home/clouds.png',
                                  width: 100.h,
                                ),
                                Padding(padding: EdgeInsets.only(left: 150.h)),
                                rigthfont(
                                    "${controller.weeklyWeather[5]["temp"]["max"].ceil()}℃",
                                    50,
                                    Colors.black),
                                Padding(padding: EdgeInsets.only(left: 25.h)),
                                rigthfont(
                                    "${controller.weeklyWeather[5]["temp"]["min"].ceil()}℃",
                                    50,
                                    Colors.black),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 20.h)),
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.only(left: 50.h)),
                                rigthfont("일", 50, Colors.black),
                                Padding(padding: EdgeInsets.only(left: 301.h)),
                                Image.asset(
                                  './assets/Home/clouds.png',
                                  width: 100.h,
                                ),
                                Padding(padding: EdgeInsets.only(left: 150.h)),
                                rigthfont(
                                    "${controller.weeklyWeather[6]["temp"]["max"].ceil()}℃",
                                    50,
                                    Colors.black),
                                Padding(padding: EdgeInsets.only(left: 25.h)),
                                rigthfont(
                                    "${controller.weeklyWeather[6]["temp"]["min"].ceil()}℃",
                                    50,
                                    Colors.black),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ))));
  }
}
