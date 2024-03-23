import 'package:be_sheq_tamara_org_app/common_widgets/default_button.dart';
import 'package:be_sheq_tamara_org_app/features/addition/presentation/widget/DonateCategories.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../../Constants/Color_Constants.dart';
import '../../../common_widgets/app_bar.dart';
import '../../../common_widgets/clip_profile_image.dart';

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
        value: "USA",
        child: Text(
          "ملابس",
          style: TextStyle(fontSize: 12),
        )),
    const DropdownMenuItem(
        value: "Canada",
        child: Text(
          "طعام",
          style: TextStyle(fontSize: 12),
        )),
    const DropdownMenuItem(
        value: "Brazil",
        child: Text(
          "أدوية",
          style: TextStyle(fontSize: 12),
        )),
    const DropdownMenuItem(
        value: "England",
        child: Text(
          "ملابس",
          style: TextStyle(fontSize: 12),
        )),
  ];
  return menuItems;
}

class AddPage extends StatefulWidget {
  AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  int selectedContainerIndex = 0;

  Color text1Color = Colors.white;

  Color text2Color = Colors.grey;

  Color text3Color = Colors.grey;
  String selectedValue = "USA";
  bool value = false;

  void updateContainerText(
      String nteam1,
      String nteam2,
      String ntime,
      String nTeamImage1,
      String nTeamImage2,
      Color newColor1,
      Color newColor2,
      Color newColor3) {
    setState(() {
      text1Color = newColor1;
      text2Color = newColor2;
      text3Color = newColor3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(),
      appBar: MyAppBar(),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                    child: Image.asset(
                  "asset/images/donating2.png",
                  width: 105,
                  height: 99,
                )),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    width: 363.4,
                    height: 43,
                    decoration: BoxDecoration(
                      color: mainGreen,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          topLeft: Radius.circular(16),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                selectedContainerIndex = 0;
                              });
                            },
                            child: Text(
                              'طلب تبرع',
                              style: selectedContainerIndex == 0
                                  ? TextStyle(
                                      color: white, fontWeight: FontWeight.w700)
                                  : TextStyle(color: Colors.grey),
                            )),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                selectedContainerIndex = 1;
                              });
                            },
                            child: Text(
                              'إضافة حملة ',
                              style: selectedContainerIndex == 1
                                  ? TextStyle(
                                      color: white, fontWeight: FontWeight.w700)
                                  : TextStyle(color: Colors.grey),
                            )),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              selectedContainerIndex = 2;
                            });
                          },
                          child: Text(
                            'إضافة منشور',
                            style: selectedContainerIndex == 2
                                ? TextStyle(
                                    color: white, fontWeight: FontWeight.w700)
                                : TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                selectedContainerIndex == 1
                    ? Container(
                        width: 322,
                        height: 506,
                        decoration: BoxDecoration(
                            border: Border.all(
                          width: 1,
                          color: mainGreen,
                        )),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'اسم الحملة',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 30,
                                  alignment: Alignment.center,
                                  padding:
                                      const EdgeInsets.only(right: 10, top: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: mainBeige,
                                        width: 1,
                                      )),
                                  child: Center(
                                    child: TextField(
                                      cursorColor: Colors.transparent,
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.name,
                                      onTapOutside: (event) => FocusManager
                                          .instance.primaryFocus
                                          ?.unfocus(),
                                      decoration: const InputDecoration(
                                        constraints:
                                            BoxConstraints(maxHeight: 30),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'الهدف من الحملة',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 30,
                                  alignment: Alignment.center,
                                  padding:
                                      const EdgeInsets.only(right: 10, top: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: mainBeige,
                                        width: 1,
                                      )),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: TextField(
                                      cursorColor: Colors.transparent,
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.name,
                                      onTapOutside: (event) => FocusManager
                                          .instance.primaryFocus
                                          ?.unfocus(),
                                      decoration: const InputDecoration(
                                        constraints:
                                            BoxConstraints(maxHeight: 30),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const SizedBox(
                                        height: 100,
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            'موعد الحملة ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            width: 100,
                                            height: 40,
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.only(
                                                right: 10, top: 10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: mainBeige,
                                                  width: 1,
                                                )),
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: TextField(
                                                cursorColor: Colors.transparent,
                                                textAlign: TextAlign.start,
                                                keyboardType:
                                                    TextInputType.datetime,
                                                onTapOutside: (event) =>
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus(),
                                                decoration:
                                                    const InputDecoration(
                                                  constraints: BoxConstraints(
                                                      maxHeight: 30),
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            'مكان الحملة',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            width: 100,
                                            height: 40,
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.only(
                                                right: 10, top: 10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: mainBeige,
                                                  width: 1,
                                                )),
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: TextField(
                                                cursorColor: Colors.transparent,
                                                textAlign: TextAlign.start,
                                                keyboardType:
                                                    TextInputType.text,
                                                onTapOutside: (event) =>
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus(),
                                                decoration:
                                                    const InputDecoration(
                                                  constraints: BoxConstraints(
                                                      maxHeight: 30),
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'صورة عن الحملة',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ImageField(),
                                const SizedBox(
                                  height: 50,
                                ),
                                Center(
                                    child: defaultButton(
                                        radius: 10,
                                        function: () {},
                                        text: "تأكيد",
                                        width: 120,
                                        height: 40))
                              ],
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
                selectedContainerIndex == 0
                    ? Container(
                        width: 322,
                        height: 506,
                        decoration: BoxDecoration(
                            border: Border.all(
                          width: 1,
                          color: mainGreen,
                        )),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  'بماذا تودّ أن تتبرّع؟',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 350,
                                  height: 30,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: mainBeige,
                                        width: 1,
                                      )),
                                  child: DropdownButtonFormField(
                                    value: selectedValue,
                                    items: dropdownItems,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedValue = newValue!;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        contentPadding: EdgeInsets.all(5)),
                                    iconEnabledColor: mainBeige,
                                    padding: const EdgeInsets.all(0.5),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'مالكمية المطلوبة؟',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 30,
                                  alignment: Alignment.center,
                                  padding:
                                      const EdgeInsets.only(right: 10, top: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: mainBeige,
                                        width: 1,
                                      )),
                                  child: Center(
                                    child: TextField(
                                      cursorColor: Colors.transparent,
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.name,
                                      onTapOutside: (event) => FocusManager
                                          .instance.primaryFocus
                                          ?.unfocus(),
                                      decoration: const InputDecoration(
                                          constraints:
                                              BoxConstraints(maxHeight: 30),
                                          border: InputBorder.none,
                                          hintText: "5 قطع ملابس أو 150 دينار",
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  ' وصف بسيط عن الحاله',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 100,
                                  alignment: Alignment.center,
                                  padding:
                                      const EdgeInsets.only(right: 10, top: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: mainBeige,
                                        width: 1,
                                      )),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: TextField(
                                      cursorColor: Colors.transparent,
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.name,
                                      onTapOutside: (event) => FocusManager
                                          .instance.primaryFocus
                                          ?.unfocus(),
                                      decoration: const InputDecoration(
                                          constraints:
                                              BoxConstraints(maxHeight: 30),
                                          border: InputBorder.none,
                                          hintText:
                                              "مريض سرطان الدم وحالته حرجة ",
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 13,
                                          )),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'الموعد المطلوب',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 30,
                                  alignment: Alignment.center,
                                  padding:
                                      const EdgeInsets.only(right: 10, top: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: mainBeige,
                                        width: 1,
                                      )),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: TextField(
                                      cursorColor: Colors.transparent,
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.datetime,
                                      onTapOutside: (event) => FocusManager
                                          .instance.primaryFocus
                                          ?.unfocus(),
                                      decoration: const InputDecoration(
                                          constraints:
                                              BoxConstraints(maxHeight: 30),
                                          border: InputBorder.none,
                                          hintText: "12-12-2020",
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 13,
                                          )),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Center(
                                    child: defaultButton(
                                        radius: 10,
                                        function: () {},
                                        text: "تأكيد",
                                        width: 120,
                                        height: 40))
                              ],
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
                selectedContainerIndex == 2
                    ? Container(
                        width: 322,
                        height: 506,
                        decoration: BoxDecoration(
                            border: Border.all(
                          width: 1,
                          color: mainGreen,
                        )),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'عنون المنشور ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 30,
                                  alignment: Alignment.center,
                                  padding:
                                      const EdgeInsets.only(right: 10, top: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: mainBeige,
                                        width: 1,
                                      )),
                                  child: Center(
                                    child: TextField(
                                      cursorColor: Colors.transparent,
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.name,
                                      onTapOutside: (event) => FocusManager
                                          .instance.primaryFocus
                                          ?.unfocus(),
                                      decoration: const InputDecoration(
                                        constraints:
                                            BoxConstraints(maxHeight: 30),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const Text(
                                  ' وصف عن المنشور',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 100,
                                  alignment: Alignment.center,
                                  padding:
                                      const EdgeInsets.only(right: 10, top: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: mainBeige,
                                        width: 1,
                                      )),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: TextField(
                                      cursorColor: Colors.transparent,
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.name,
                                      onTapOutside: (event) => FocusManager
                                          .instance.primaryFocus
                                          ?.unfocus(),
                                      decoration: const InputDecoration(
                                        constraints:
                                            BoxConstraints(maxHeight: 30),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'صورة عن المنشور',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ImageField(),
                                const SizedBox(
                                  height: 100,
                                ),
                                Center(
                                    child: defaultButton(
                                        radius: 10,
                                        function: () {},
                                        text: "تأكيد",
                                        width: 120,
                                        height: 40))
                              ],
                            ),
                          ),
                        ),
                      )
                    : SizedBox()
                // Container(
                //   width: 322,
                //   height: 506,
                //   decoration: BoxDecoration(
                //       border: Border.all(
                //         width: 1,
                //         color: mainGreen,
                //       )            ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(20.0),
                //     child: SingleChildScrollView(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //
                //           const SizedBox(height: 10,),
                //           const Text('اسم الحملة',
                //             style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                //           const SizedBox(height: 5,),
                //           Container(
                //             width: double.infinity,
                //             height:30,
                //             alignment: Alignment.center,
                //             padding: const EdgeInsets.only(right: 10,top: 10),
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(10),
                //                 border: Border.all(color: mainBeige,width: 1,)
                //             ),
                //             child: Center(
                //               child: TextField(
                //                 cursorColor: Colors.transparent,
                //                 textAlign: TextAlign.start,
                //                 keyboardType: TextInputType.name,
                //                 onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                //                 decoration: const InputDecoration(
                //                     constraints: BoxConstraints(maxHeight: 30),
                //                     border: InputBorder.none,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           const SizedBox(height: 20,),
                //           const Text('الهدف من الحملة',
                //             style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                //           const SizedBox(height: 5,),
                //           Container(
                //             width: double.infinity,
                //             height:30,
                //             alignment: Alignment.center,
                //             padding: const EdgeInsets.only(right: 10,top: 10),
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(10),
                //                 border: Border.all(color: mainBeige,width: 1,)
                //             ),
                //             child: Align(
                //               alignment: Alignment.topRight,
                //               child: TextField(
                //                 cursorColor: Colors.transparent,
                //                 textAlign: TextAlign.start,
                //                 keyboardType: TextInputType.name,
                //                 onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                //                 decoration: const InputDecoration(
                //                     constraints: BoxConstraints(maxHeight: 30),
                //                     border: InputBorder.none,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.only(left: 8.0),
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //               children: [
                //                 const SizedBox(height: 100,),
                //                 Column(
                //                   children: [
                //                     const Text('موعد الحملة ',
                //                       style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                //                     const SizedBox(height: 5,),
                //                     Container(
                //                       width: 100,
                //                       height:40,
                //                       alignment: Alignment.center,
                //                       padding: const EdgeInsets.only(right: 10,top: 10),
                //                       decoration: BoxDecoration(
                //                           borderRadius: BorderRadius.circular(10),
                //                           border: Border.all(color: mainBeige,width: 1,)
                //                       ),
                //                       child: Align(
                //                         alignment: Alignment.topRight,
                //                         child: TextField(
                //                           cursorColor: Colors.transparent,
                //                           textAlign: TextAlign.start,
                //                           keyboardType: TextInputType.datetime,
                //                           onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                //                           decoration: const InputDecoration(
                //                               constraints: BoxConstraints(maxHeight: 30),
                //                               border: InputBorder.none,
                //                           ),
                //                         ),
                //                       ),
                //
                //
                //                     ),
                //                   ],
                //                 ),
                //                 Column(
                //
                //                   children: [
                //                     const Text('مكان الحملة',
                //                       style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                //                     const SizedBox(height: 5,),
                //                     Container(
                //                       width: 100,
                //                       height:40,
                //                       alignment: Alignment.center,
                //                       padding: const EdgeInsets.only(right: 10,top: 10),
                //                       decoration: BoxDecoration(
                //                           borderRadius: BorderRadius.circular(10),
                //                           border: Border.all(color: mainBeige,width: 1,)
                //                       ),
                //                       child: Align(
                //                         alignment: Alignment.topRight,
                //                         child: TextField(
                //                           cursorColor: Colors.transparent,
                //                           textAlign: TextAlign.start,
                //                           keyboardType: TextInputType.text,
                //                           onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                //                           decoration: const InputDecoration(
                //                             constraints: BoxConstraints(maxHeight: 30),
                //                             border: InputBorder.none,
                //                           ),
                //                         ),
                //                       ),
                //
                //
                //                     ),
                //                   ],
                //                 ),
                //               ],
                //             ),
                //           ),
                //           const SizedBox(height: 10,),
                //
                //           const Text('صورة عن الحملة',
                //             style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                //           const SizedBox(height: 10,),
                //           Container(
                //             width: double.infinity,
                //             height:30,
                //             alignment: Alignment.center,
                //             padding: const EdgeInsets.only(right: 10,top: 10),
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(10),
                //                 border: Border.all(color: mainBeige,width: 1,)
                //             ),
                //             child: Align(
                //               alignment: Alignment.topRight,
                //               child: TextField(
                //                 cursorColor: Colors.transparent,
                //                 textAlign: TextAlign.start,
                //                 keyboardType: TextInputType.name,
                //                 onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                //                 decoration: const InputDecoration(
                //                   constraints: BoxConstraints(maxHeight: 30),
                //                   border: InputBorder.none,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           const SizedBox(height: 50,),
                //          Center(child: defaultButton(radius: 10, function: (){}, text: "تأكيد",width: 120,height: 40))
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // Container(
                //   width: 322,
                //   height: 506,
                //   decoration: BoxDecoration(
                //       border: Border.all(
                //         width: 1,
                //         color: mainGreen,
                //       )            ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(20.0),
                //     child: SingleChildScrollView(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           const SizedBox(height: 10,),
                //           const Text('عنون المنشور ',
                //             style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                //           const SizedBox(height: 5,),
                //           Container(
                //             width: double.infinity,
                //             height:30,
                //             alignment: Alignment.center,
                //             padding: const EdgeInsets.only(right: 10,top: 10),
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(10),
                //                 border: Border.all(color: mainBeige,width: 1,)
                //             ),
                //             child: Center(
                //               child: TextField(
                //                 cursorColor: Colors.transparent,
                //                 textAlign: TextAlign.start,
                //                 keyboardType: TextInputType.name,
                //                 onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                //                 decoration: const InputDecoration(
                //                     constraints: BoxConstraints(maxHeight: 30),
                //                     border: InputBorder.none,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           const SizedBox(height: 30,),
                //           const Text(' وصف عن المنشور',
                //             style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                //           const SizedBox(height: 5,),
                //           Container(
                //             width: double.infinity,
                //             height:100,
                //             alignment: Alignment.center,
                //             padding: const EdgeInsets.only(right: 10,top: 10),
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(10),
                //                 border: Border.all(color: mainBeige,width: 1,)
                //             ),
                //             child: Align(
                //               alignment: Alignment.topRight,
                //               child: TextField(
                //                 cursorColor: Colors.transparent,
                //                 textAlign: TextAlign.start,
                //                 keyboardType: TextInputType.name,
                //                 onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                //                 decoration: const InputDecoration(
                //                     constraints: BoxConstraints(maxHeight: 30),
                //                     border: InputBorder.none,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           const SizedBox(height: 200,),
                //
                //           Center(child: defaultButton(radius: 10, function: (){}, text: "تأكيد",width: 120,height: 40))
                //
                //         ],
                //       ),
                //     ),
                //   ),
                // ),

                // Container(
                //   width: 322,
                //   height: 506,
                //   decoration: BoxDecoration(
                //       border: Border.all(
                //         width: 1,
                //         color: mainGreen,
                //       )            ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(20.0),
                //     child: SingleChildScrollView(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           const SizedBox(height: 8,),
                //
                //           const Text('بماذا تودّ أن تتبرّع؟',
                //             style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                //           const SizedBox(height: 5,),
                //           Container(
                //             width: 350,
                //             height:30,
                //             alignment: Alignment.center,
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(10),
                //                 border: Border.all(color: mainBeige,width: 1,)
                //             ),
                //             child:DropdownButtonFormField(
                //               value: selectedValue,
                //               items: dropdownItems,
                //               onChanged: (String? newValue){
                //                 setState(() {
                //                   selectedValue = newValue!;
                //                 });
                //               },
                //               decoration: const InputDecoration(
                //                   enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                //                   border: OutlineInputBorder(borderSide: BorderSide.none),
                //                   contentPadding: EdgeInsets.all(5)
                //               ),
                //               iconEnabledColor: mainBeige,
                //               padding: const EdgeInsets.all(0.5),
                //             ) ,
                //           ),
                //           const SizedBox(height: 10,),
                //           const Text('مالكمية المطلوبة؟',
                //             style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                //           const SizedBox(height: 5,),
                //           Container(
                //             width: double.infinity,
                //             height:30,
                //             alignment: Alignment.center,
                //             padding: const EdgeInsets.only(right: 10,top: 10),
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(10),
                //                 border: Border.all(color: mainBeige,width: 1,)
                //             ),
                //             child: Center(
                //               child: TextField(
                //                 cursorColor: Colors.transparent,
                //                 textAlign: TextAlign.start,
                //                 keyboardType: TextInputType.name,
                //                 onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                //                 decoration: const InputDecoration(
                //                     constraints: BoxConstraints(maxHeight: 30),
                //                     border: InputBorder.none,
                //                     hintText: "5 قطع ملابس أو 150 دينار",
                //                     hintStyle: TextStyle(color: Colors.grey,fontSize: 13)
                //                 ),
                //               ),
                //             ),
                //           ),
                //           const SizedBox(height: 10,),
                //           const Text(' وصف بسيط عن الحاله',
                //             style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                //           const SizedBox(height: 5,),
                //           Container(
                //             width: double.infinity,
                //             height:100,
                //             alignment: Alignment.center,
                //             padding: const EdgeInsets.only(right: 10,top: 10),
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(10),
                //                 border: Border.all(color: mainBeige,width: 1,)
                //             ),
                //             child: Align(
                //               alignment: Alignment.topRight,
                //               child: TextField(
                //                 cursorColor: Colors.transparent,
                //                 textAlign: TextAlign.start,
                //                 keyboardType: TextInputType.name,
                //                 onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                //                 decoration: const InputDecoration(
                //                     constraints: BoxConstraints(maxHeight: 30),
                //                     border: InputBorder.none,
                //                     hintText: "مريض سرطان الدم وحالته حرجة ",
                //                     hintStyle: TextStyle(color: Colors.grey,fontSize: 13,)
                //                 ),
                //               ),
                //             ),
                //           ),
                //           const SizedBox(height: 10,),
                //           const Text('الموعد المطلوب',
                //             style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                //           const SizedBox(height: 5,),
                //           Container(
                //             width: double.infinity,
                //             height:30,
                //             alignment: Alignment.center,
                //             padding: const EdgeInsets.only(right: 10,top: 10),
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(10),
                //                 border: Border.all(color: mainBeige,width: 1,)
                //             ),
                //             child: Align(
                //               alignment: Alignment.topRight,
                //               child: TextField(
                //                 cursorColor: Colors.transparent,
                //                 textAlign: TextAlign.start,
                //                 keyboardType: TextInputType.datetime,
                //                 onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                //                 decoration: const InputDecoration(
                //                     constraints: BoxConstraints(maxHeight: 30),
                //                     border: InputBorder.none,
                //                     hintText: "12-12-2020",
                //                     hintStyle: TextStyle(color: Colors.grey,fontSize: 13,)
                //                 ),
                //               ),
                //             ),
                //
                //
                //           ),
                //           const SizedBox(height: 50,),
                //          Center(child: defaultButton(radius: 10, function: (){}, text: "تأكيد",width: 120,height: 40))
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ]),
        ),
      ),
    );
  }
}

class DonationRequest extends StatefulWidget {
  const DonationRequest({super.key});

  @override
  State<DonationRequest> createState() => _DonationRequestState();
}

class _DonationRequestState extends State<DonationRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Container(
            width: 311,
            height: 506,
            decoration: BoxDecoration(
                border: Border.all(
              width: 3,
              color: mainGreen,
            )),
            child: Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
