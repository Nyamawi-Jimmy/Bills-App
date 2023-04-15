import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Widgets/app_button.dart';
import '../Widgets/button.dart';
import '../app_colors/colors.dart';
import 'my_home_page.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 80, right: 20, left: 20),
        height: h,
        width: w,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/paymentbackground.png"))),
        child: Column(
          children: [
            Container(
              height: h * 0.14,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage("assets/images/success.png"))),
            ),
            Text(
              "Success!",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor),
            ),
            Text(
              "Payment Completed for 2 bills",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.idColor),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 160,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2)),
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (_, index) {
                      return Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 15, left: 20, bottom: 10),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Icon(Icons.done),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "KenGen Power",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "ID:67442",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Text(""),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Ksh.3000",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 2,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Text(
                  "Total Amount",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: AppColors.idColor),
                ),
                Text(
                  "Ksh.6000",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: AppColors.mainColor),
                )
              ],
            ),
            SizedBox(
              height: 90,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  icon: Icons.share,
                  onTap: () {},
                  text: "Share",
                  iconColor: AppColors.mainColor,
                  textColor: AppColors.mainColor,
                ),
                SizedBox(
                  width: 80,
                ),
                AppButton(
                  icon: Icons.print,
                  onTap: () {},
                  text: "Print",
                  iconColor: AppColors.mainColor,
                  textColor: AppColors.mainColor,
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Button(
              text: 'Done',
              textColor: AppColors.mainColor,
              background: Colors.white,
              onTap: () {
                Get.to(() => MyHomePage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
