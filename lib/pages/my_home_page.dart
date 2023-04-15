import 'package:elerarning/pages/payment_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controllers/data_controller.dart';
import '../Widgets/app_button.dart';
import '../Widgets/button.dart';
import '../Widgets/text_field.dart';
import '../app_colors/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DataController _controller=Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Container(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            Obx((){
              if(_controller.isLoading==false){
                    return Center(
                      child: Container(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          color: AppColors.mainColor,
                        ),
                      ),
                    );
              }else{
                    return _listBills();
              }
            }),
            _payButton(),
            const Positioned(
              left: 0,top: 100,
                child: Text(
                  "My Bills",style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF293952)
                ),
                )),
            const Positioned(
                left: 40,top: 60,
                child: Text(
                  "My Bills",style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
                )),

          ],
        ),
      ),
    );
  }
  _headSection() {
    return Container(
      height: 310,
      child: Stack(
        children: [
          _mainBackground(),
          _curveImageContainer(),
          _buttonContainer(),

        ],
      ),
    );
  }

  _mainBackground() {
    return Positioned(
        child: Container(
      height: 300,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/background.png"))),
    ));
  }

  _curveImageContainer() {
    return Positioned(
        left: 0,
        right: -2,
        bottom: 10,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/curve.png"))),
        ));
  }

  _buttonContainer() {
    return Positioned(
        right: 50,
        bottom: 10,
        child: GestureDetector(
          onTap: (){
            showModalBottomSheet<dynamic>(
              isScrollControlled: true,
                backgroundColor: Colors.transparent,
                barrierColor: Colors.transparent,
                context: context, builder: (BuildContext bc){
              return Container(
                height: 575,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                        child: Container(
                          color:Color(0xFFeef1f4).withOpacity(0.7),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height-300,

                        )
                    ),
                    Positioned(
                      top:0,
                      right: 45,
                        bottom: 310,
                        child: Container(
                          margin: EdgeInsets.only(top: 5,),
                          width: 60,
                          height: 253,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.mainColor
                          ),
                          child: Container(
                            padding: EdgeInsets.only(bottom: 30,),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppButton(icon: Icons.cancel,
                                  backgroundColor: Colors.white,
                                  onTap:(){Navigator.pop(context);},
                                ),
                                AppButton(icon: Icons.add,
                                  text: "Add Bills",
                                  backgroundColor: Colors.white,
                                  onTap:(){},
                                ),
                                AppButton(icon: Icons.history,
                                  text: "History",
                                  backgroundColor: Colors.white,
                                  onTap:(){},
                                )
                              ],
                            ),
                          ),
                        )),

                  ],
                ),
              );
            });
          },
          child: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      color: Color(0xFF11324d).withOpacity(0.1),
                      offset: Offset(0, 1))
                ],
                image: DecorationImage(
                    image: AssetImage("assets/images/lines.png"))),
          ),
        ));
  }

  _listBills() {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: Positioned(
        top: 320,
        bottom: 0,
        left: 0,
        right: 0,
        child: ListView.builder(
          itemCount: _controller.list.length,
          itemBuilder: (_, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 20,right: 20),
              height: 130,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Container(
                margin: EdgeInsets.only(
                  left: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 2, color: Colors.redAccent),
                                  image: DecorationImage(
                                      image: AssetImage(
                                        //"assets/images/brand1.png"
                                        _controller.list[index].brand_logo,
                                       // "http://127.0.0.1:8000/uploads/images/house.png"
                                  ))),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _controller.list[index].brand_name,
                                  style: const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  _controller.list[index].brand_id.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextSize(
                          text: _controller.list[index].due_info,
                          color: Colors.green,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: (){
                                if(_controller.list[index].status==0){
                                  _controller.list[index].status=1;
                                }else if(_controller.list[index].status==1){
                                  _controller.list[index].status=0;
                                }
                                _controller.list.refresh();
                                print(_controller.newList.length);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: _controller.list[index].status==0?AppColors.selectBackground:AppColors.green,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Select",
                                      style: TextStyle(
                                        color: _controller.list[index].status==0?AppColors.selectColor:Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  )),
                            ),
                            Expanded(child: Container()),
                            Text(
                              _controller.list[index].due,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Due in 3 days",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.grey),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                        Container(
                          height: 35,
                          width: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                            color: AppColors.mainColor,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _payButton(){
    return Positioned(
      bottom: 10,
        child: Button(
            text: 'Pay Bills',
            textColor: Colors.white,
            onTap: (){Get.to(()=>PaymentPage());},
    ),
    );
  }

}
