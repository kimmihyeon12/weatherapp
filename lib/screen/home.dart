import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/location.controller.dart';
import 'package:weather_app/controller/time.controller.dart';
import 'package:weather_app/controller/weather.controller.dart';
import 'package:weather_app/widget/font/font.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends GetView<WeatherController> {
  List daily = [
    "월",
    "화",
    "수",
    "목",
    "금",
    "토",
    "일",
  ];
  String backgroundImage;
  @override
  Widget build(BuildContext context) {
    if (controller.currentWeather[0]["weather"][0]["icon"] == "01d" ||
        controller.currentWeather[0]["weather"][0]["icon"] == "02d") {
      backgroundImage = "./assets/Home/background/sun.png";
    } else if (controller.currentWeather[0]["weather"][0]["icon"] == "03d" ||
        controller.currentWeather[0]["weather"][0]["icon"] == "04d") {
      backgroundImage = "./assets/Home/background/cloud.png";
    } else if (controller.currentWeather[0]["weather"][0]["icon"] == "09d" ||
        controller.currentWeather[0]["weather"][0]["icon"] == "10d") {
      backgroundImage = "./assets/Home/background/rain.png";
    } else if (controller.currentWeather[0]["weather"][0]["icon"] == "11d") {
      backgroundImage = "./assets/Home/background/snow.png";
    } else {
      backgroundImage = "./assets/Home/background/sun.png";
    }

    ScreenUtil.init(context, width: 1080, height: 1920);
    return Scaffold(
        body: Obx(() => Container(
              height: 1920.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(backgroundImage),
                  fit: BoxFit.fill,
                ),
              ),
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.only(top: 100.h)),
                          rigthfont("현 위치", 55, Colors.white),
                          Padding(padding: EdgeInsets.only(top: 20.h)),
                          // boldfont("광주광역시 북구 두암동", 70, Colors.white),
                          boldfont("${LocationController.to.address.value}", 70,
                              Colors.white),

                          Image.asset(
                            './assets/Home/icons/${controller.currentWeather[0]["weather"][0]["icon"]}.png',
                            fit: BoxFit.fill,
                            width: 300.h,
                          ),
                          rigthfont(
                              '(${controller.currentWeather[0]["weather"][0]["description"]})',
                              55,
                              Colors.white),
                          Padding(padding: EdgeInsets.only(top: 20.h)),
                          boldfont(
                              "${controller.currentWeather[0]["temp"].ceil()}℃",
                              80,
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
                          Padding(padding: EdgeInsets.only(top: 40.h)),
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
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                          left: 8.h, right: 80.h, top: 15.h),
                                      child: Row(
                                        children: [
                                          (() {
                                            if (controller.dailyWeather[index]
                                                            ["dt"]["day"] -
                                                        DateTime.now().day ==
                                                    1 &&
                                                controller.dailyWeather[index]
                                                        ["dt"]["hour"] ==
                                                    1) {
                                              return Container(
                                                  margin: EdgeInsets.only(
                                                      right: 80.w),
                                                  child: Image.asset(
                                                    './assets/Home/tomorrow.png',
                                                    width: 120.h,
                                                  ));
                                            } else if (controller.dailyWeather[
                                                                index]["dt"]
                                                            ["day"] -
                                                        DateTime.now().day ==
                                                    2 &&
                                                controller.dailyWeather[index]
                                                        ["dt"]["hour"] ==
                                                    1) {
                                              return Container(
                                                  margin: EdgeInsets.only(
                                                      right: 80.w),
                                                  child: Image.asset(
                                                    './assets/Home/aftertomorrow.png',
                                                    width: 120.h,
                                                  ));
                                            } else {
                                              return boldfont(
                                                  "", 1, Colors.white);
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
                                              Image.asset(
                                                './assets/Home/icons/${controller.dailyWeather[index]["weather"][0]["icon"]}.png',
                                                width: 100.h,
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
                            height: 1030.h,
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 8,
                                itemBuilder: (BuildContext context, int index) {
                                  if (index == 0) {
                                    return Container(
                                      height: 80.h,
                                      child: Row(
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 60.w)),
                                          boldfont("일별예보", 45, Colors.black),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 180.w)),
                                          boldfont("날씨", 45, Colors.black),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 190.w)),
                                          boldfont("최고", 45, Colors.black),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.w)),
                                          boldfont("/", 50, Colors.black),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.w)),
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
                                            padding:
                                                EdgeInsets.only(left: 80.h)),
                                        (() {
                                          int count = (index - 1) +
                                              TimeController.to.weekday.toInt();

                                          if (count > 7) {
                                            count = (index - 1) -
                                                (7 -
                                                    TimeController.to.weekday
                                                        .toInt());
                                          } else {
                                            count = (index - 1) +
                                                TimeController.to.weekday
                                                    .toInt();
                                          }

                                          return rigthfont(
                                              "${daily[count - 1]}",
                                              50,
                                              Colors.black);
                                        }()),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 270.w)),
                                        Image.asset(
                                          './assets/Home/icons/${controller.weeklyWeather[index - 1]["weather"][0]["icon"]}.png',
                                          width: 100.h,
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 150.w)),
                                        rigthfont(
                                            "${controller.weeklyWeather[index - 1]["temp"]["max"].ceil()}℃",
                                            50,
                                            Colors.black),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 25.w)),
                                        rigthfont(
                                            "${controller.weeklyWeather[index - 1]["temp"]["min"].ceil()}℃",
                                            50,
                                            Colors.black),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          Padding(padding: EdgeInsets.only(top: 50.w)),
                          /*      Container(
                            height: 220.h,
                          
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
                                  borderRadius: BorderRadius.circular(20)),
                              margin: EdgeInsets.only(
                                left: 60.w,
                                right: 60.w,
                              ),
                              height: 220.h,
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 8.h, right: 80.h, top: 15.h),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        rigthfont(
                                            '${controller.currentWeather[0]["humidity"]}%',
                                            42,
                                            Colors.black),
                                        rigthfont(
                                            '${controller.currentWeather[0]["windspeed"]}m/s',
                                            42,
                                            Colors.black),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),*/
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
