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
  List daily = ["월", "화", "수", "목", "금", "토", "일"];
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
                      boldfont("광주광역시 북구 두암동", 70, Colors.white),
                      // boldfont("${LocationController.to.address.value}", 70,
                      //     Colors.white),
                      Padding(padding: EdgeInsets.only(top: 20.h)),
                      Image.asset(
                        './assets/Home/cloud.png',
                        width: 300.h,
                        height: 300.w,
                      ),
                      Padding(padding: EdgeInsets.only(top: 20.h)),
                      //  SizedBox(height: 500.h),
                      rigthfont(
                          controller.currentprecipitationstatus.value == ""
                              ? "(${controller.currentSkystatus.value})"
                              : "(${controller.currentSkystatus.value} / ${controller.currentprecipitationstatus.value})",
                          55,
                          Colors.white),
                      Padding(padding: EdgeInsets.only(top: 20.h)),
                      boldfont("${controller.currentWeather[0]["temp"]}℃", 80,
                          Colors.white),
                      Padding(padding: EdgeInsets.only(top: 25.h)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(height: 55.h),
                          rigthfont(
                              "최고기온 ${controller.weeklyWeather[0]["temp"]["max"].ceil()} ℃",
                              55,
                              Colors.white),
                          rigthfont(
                              "최저기온 ${controller.weeklyWeather[0]["temp"]["min"].ceil()} ℃",
                              55,
                              Colors.white),
                          SizedBox(height: 55.h),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 25.h)),
                      Container(
                        height: 220.h,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38,
                                offset: Offset(2.0, 3.0), //(x,y)
                                blurRadius: 10.0,
                              ),
                            ],
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(
                                20) // use instead of BorderRadius.all(Radius.circular(20))
                            ),
                        margin: EdgeInsets.only(
                          left: 50.w,
                          right: 50.w,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(
                                  20) // use instead of BorderRadius.all(Radius.circular(20))
                              ),
                          margin: EdgeInsets.only(
                            left: 60.w,
                            right: 60.w,
                          ),
                          height: 220.h,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 47,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                      left: 8.h, right: 80.h, top: 15.h),
                                  child: Row(
                                    children: [
                                      (() {
                                        if (controller.dailyWeather[index]["dt"]
                                                        ["day"] -
                                                    DateTime.now().day ==
                                                1 &&
                                            controller.dailyWeather[index]["dt"]
                                                    ["hour"] ==
                                                1) {
                                          return Container(
                                              margin:
                                                  EdgeInsets.only(right: 80.w),
                                              child: Image.asset(
                                                './assets/Home/tomorrow.png',
                                                width: 120.h,
                                              ));
                                        } else if (controller
                                                            .dailyWeather[index]
                                                        ["dt"]["day"] -
                                                    DateTime.now().day ==
                                                2 &&
                                            controller.dailyWeather[index]["dt"]
                                                    ["hour"] ==
                                                1) {
                                          return Container(
                                              margin:
                                                  EdgeInsets.only(right: 80.w),
                                              child: Image.asset(
                                                './assets/Home/aftertomorrow.png',
                                                width: 120.h,
                                              ));
                                        } else {
                                          return boldfont("", 1, Colors.white);
                                        }
                                      }()),
                                      Column(
                                        children: [
                                          boldfont(
                                              controller.dailyWeather[index]
                                                          ["dt"]["hour"] ==
                                                      0
                                                  ? "12시"
                                                  : "${controller.dailyWeather[index]["dt"]["hour"]}시",
                                              30,
                                              Colors.black),
                                          Image.network(
                                            'http://openweathermap.org/img/wn/' +
                                                "${controller.weeklyWeather[index]["weather"][0]["icon"]}" +
                                                '@2x.png',
                                            width: 110.h,
                                          ),
                                          boldfont(
                                              "${controller.dailyWeather[index]["temp"].ceil()}℃",
                                              33,
                                              Colors.black),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 50.h)),
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38,
                                offset: Offset(2.0, 3.0), //(x,y)
                                blurRadius: 10.0,
                              ),
                            ],
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(
                                25) // use instead of BorderRadius.all(Radius.circular(20))
                            ),
                        margin: EdgeInsets.only(left: 40.h, right: 40.h),
                        height: 980.h,
                        child: ListView.builder(
                            //    padding: EdgeInsets.all(50.h),
                            itemCount: 8,
                            itemBuilder: (BuildContext context, int index) {
                              if (index == 0) {
                                return Container(
                                  height: 110.h,
                                  child: Row(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(left: 60.h)),
                                      boldfont("일별예보", 45, Colors.black),
                                      Padding(
                                          padding:
                                              EdgeInsets.only(left: 180.h)),
                                      boldfont("날씨", 45, Colors.black),
                                      Padding(
                                          padding:
                                              EdgeInsets.only(left: 150.h)),
                                      boldfont("최고", 45, Colors.black),
                                      Padding(
                                          padding: EdgeInsets.only(left: 10.h)),
                                      boldfont("/", 50, Colors.black),
                                      Padding(
                                          padding: EdgeInsets.only(left: 10.h)),
                                      boldfont("최저", 45, Colors.black),
                                    ],
                                  ),
                                );
                              }
                              return Container(
                                height: 120.h,
                                child: Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(left: 80.h)),
                                    rigthfont("${daily[index - 1]}", 50,
                                        Colors.black),
                                    Padding(
                                        padding: EdgeInsets.only(left: 270.h)),
                                    Image.network(
                                      'http://openweathermap.org/img/wn/' +
                                          "${controller.weeklyWeather[index - 1]["weather"][0]["icon"]}" +
                                          '@2x.png',
                                      width: 110.h,
                                    ),
                                    // Image.asset(
                                    //   './assets/Home/rain.png',
                                    //   width: 100.h,
                                    // ),
                                    Padding(
                                        padding: EdgeInsets.only(left: 150.h)),
                                    rigthfont(
                                        "${controller.weeklyWeather[index - 1]["temp"]["max"].ceil()}℃",
                                        50,
                                        Colors.black),
                                    Padding(
                                        padding: EdgeInsets.only(left: 25.h)),
                                    rigthfont(
                                        "${controller.weeklyWeather[0]["temp"]["min"].ceil()}℃",
                                        50,
                                        Colors.black),
                                  ],
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ))));
  }
}
