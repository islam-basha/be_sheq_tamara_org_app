import 'dart:io';

import 'package:be_sheq_tamara_org_app/common_widgets/default_button.dart';
import 'package:be_sheq_tamara_org_app/features/addition/data/add_campaign_repository.dart';
import 'package:be_sheq_tamara_org_app/features/addition/data/add_post_repository.dart';
import 'package:be_sheq_tamara_org_app/features/addition/domain/add_campaign_model.dart';
import 'package:be_sheq_tamara_org_app/features/addition/domain/add_post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:uuid/uuid.dart';
import '../../../Constants/Color_Constants.dart';
import '../../../app/org_data.dart';
import '../../../common_widgets/app_bar.dart';
import 'dart:ui' as ui;

class AddPage extends ConsumerStatefulWidget {
  const AddPage({super.key});

  @override
  ConsumerState<AddPage> createState() => _AddPageState();
}

class _AddPageState extends ConsumerState<AddPage> {
  int selectedContainerIndex = 0;
  Color text1Color = Colors.white;
  Color text2Color = Colors.grey;
  Color text3Color = Colors.grey;
  //
  //
  // void updateContainerText(
  //     String nteam1,
  //     String nteam2,
  //     String ntime,
  //     String nTeamImage1,
  //     String nTeamImage2,
  //     Color newColor1,
  //     Color newColor2,
  //     Color newColor3) {
  //   setState(() {
  //     text1Color = newColor1;
  //     text2Color = newColor2;
  //     text3Color = newColor3;
  //   });
  // }

  TextEditingController campNameController=TextEditingController();
  TextEditingController campGoalController=TextEditingController();
  TextEditingController campDateController=TextEditingController();
  TextEditingController campPlaceController=TextEditingController();
  TextEditingController postTitleController=TextEditingController();
  TextEditingController postDescController=TextEditingController();
  TextEditingController rqQtyController=TextEditingController();
  TextEditingController rqDescController=TextEditingController();
  TextEditingController rqDateController=TextEditingController();

  File? _image;
  File? _imagePost;
  File? _imageRequest;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }
  Future<void> _pickImagePost() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imagePost = File(pickedImage.path);
      });
    }
  }
  Future<void> _pickImageRequest() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageRequest = File(pickedImage.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final orgIdProvider= ref.read(orgIdNotifier.notifier);
    ref.watch<OrgData>(orgIdNotifier);

    return Scaffold(
      appBar: const MyAppBar(),
      body: Directionality(
        textDirection: ui.TextDirection.rtl,
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
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    width: 363.4,
                    height: 43,
                    decoration: const BoxDecoration(
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
                                  ? const TextStyle(
                                      color: white, fontWeight: FontWeight.w700)
                                  : const TextStyle(color: Colors.grey),
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
                                  ? const TextStyle(
                                      color: white, fontWeight: FontWeight.w700)
                                  : const TextStyle(color: Colors.grey),
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
                        decoration: BoxDecoration(
                            border: Border.all(
                          width: 1,
                          color: mainGreen,
                        ),
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10,),
                                const Text('اسم الحملة', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                                const SizedBox(height: 5,),
                                Container(
                                  width: double.infinity,
                                  height: 30,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(right: 10, top: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: mainBeige, width: 1,)),
                                  child: Center(
                                    child: TextField(
                                      controller: campNameController,
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
                                const SizedBox(height: 20,),
                                const Text('الهدف من الحملة', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                                const SizedBox(height: 5,),
                                Container(
                                  width: double.infinity,
                                  height: 30,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(right: 10, top: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: mainBeige, width: 1,)),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: TextField(
                                      controller: campGoalController,
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
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const SizedBox(height: 100,),
                                      Column(
                                        children: [
                                          const Text('موعد الحملة ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                                          const SizedBox(height: 5,),
                                          Container(
                                            width: 100,
                                            height: 40,
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.only(right: 10, top: 10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(color: mainBeige, width: 1,)),
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: TextField(
                                                controller: campDateController,
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
                                                controller: campPlaceController,
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
                                const SizedBox(height: 10,),
                                const Text(
                                  'صورة عن الحملة',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                                const SizedBox(height: 10,),
                                GestureDetector(
                                  onTap: _pickImage,
                                  child: Container(
                                    width: double.infinity,
                                    height: 30,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(right: 5, top: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: mainBeige,
                                        width: 1,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: _image != null
                                          ? Image.file(
                                        _image!,
                                        width: 30,
                                        height: 30,
                                        fit: BoxFit.cover,
                                      )
                                          : const Icon(Icons.create_new_folder_rounded, color: mainBeige, size: 20,),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Center(
                                    child: defaultButton(
                                      radius: 10,
                                      text: "تأكيد",
                                      width: 120,
                                      height: 40,
                                      function: () async {
                                        if(campNameController.text.isEmpty || campPlaceController.text.isEmpty ||
                                        campDateController.text.isEmpty || campGoalController.text.isEmpty || _image==null){
                                          MotionToast.warning(
                                            title:  const Text("تنبيه"),
                                            description:  const Align(
                                                alignment: Alignment.centerRight,
                                                child: Text("'يرجى تعبئة كافة الحقول لإضافة هذه الحملة",textDirection: ui.TextDirection.rtl,)),
                                            layoutOrientation: ToastOrientation.rtl,
                                            iconSize: 50,
                                          ).show(context);
                                        }else{
                                          var uuid=Uuid();
                                          var newCamp=
                                          AddCampaignModel(
                                            id: uuid.v1(),
                                            campTitle: campNameController.text,
                                            campDec: campGoalController.text,
                                            location: campPlaceController.text,
                                            startDate: campDateController.text,
                                            campImage: _image,
                                            orgId: orgIdProvider.orgId,);

                                          try{
                                            await AddCampRepository().addCamp(newCamp);
                                            campGoalController.clear();
                                            campDateController.clear();
                                            campPlaceController.clear();
                                            campNameController.clear();
                                            MotionToast.success(
                                              description:  const Text("تمت عملية الإضافة بنجاح",textDirection: ui.TextDirection.rtl,),
                                              layoutOrientation: ToastOrientation.rtl,
                                              iconSize: 50,
                                            ).show(context);
                                          }catch(e){
                                            print("Failed to add camp: $e");
                                          }
                                        }
                                      },
                                    ))
                              ],
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                selectedContainerIndex == 0
                    ? Container(
                        width: 322,
                        decoration: BoxDecoration(
                            border: Border.all(
                          width: 1,
                          color: mainGreen,
                        ),
                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                      controller: rqQtyController,
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
                                  ' وصف بسيط عن الحالة',
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
                                      controller: rqDescController,
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
                                      controller: rqDateController,
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
                                GestureDetector(
                                  onTap: _pickImageRequest,
                                  child: Container(
                                    width: double.infinity,
                                    height: 30,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(right: 5, top: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: mainBeige,
                                        width: 1,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: _imageRequest != null
                                          ? Image.file(
                                        _imageRequest!,
                                        width: 30,
                                        height: 30,
                                        fit: BoxFit.cover,
                                      )
                                          : const Icon(Icons.create_new_folder_rounded, color: mainBeige, size: 20,),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: defaultButton(
                                        radius: 10,
                                        function: () async{
                                          if(rqQtyController.text.isEmpty || rqDateController.text.isEmpty
                                          || rqDescController.text.isEmpty || _imageRequest==null){
                                            MotionToast.warning(
                                              title:  const Text("تنبيه"),
                                              description:  const Align(
                                                  alignment: Alignment.centerRight,
                                                  child: Text("'يرجى تعبئة كافة الحقول لإضافة هذا الطلب",textDirection: ui.TextDirection.rtl,)),
                                              layoutOrientation: ToastOrientation.rtl,
                                              iconSize: 50,
                                            ).show(context);
                                          }else{
                                            var uuid=const Uuid();
                                            var newRequest=AddPostModel(
                                                postTitle: 'طلب تبرع', postText: rqDescController.text+'/n الكمية المطلوبة ${rqQtyController.text}',
                                                date: rqDateController.text,orgId: orgIdProvider.orgId,
                                              image: _imageRequest, id:uuid.v1(),state: false);
                                            try{
                                              await AddPostRepository().addPost(newRequest);
                                              rqDateController.clear();
                                              rqDescController.clear();
                                              rqQtyController.clear();
                                              MotionToast.success(
                                                description:  const Text("تمت عملية الإضافة بنجاح",textDirection: ui.TextDirection.rtl,),
                                                layoutOrientation: ToastOrientation.rtl,
                                                iconSize: 50,
                                              ).show(context);
                                            }catch(e){
                                              print(e);
                                            }
                                          }
                                        },
                                        text: "تأكيد",
                                        width: 120,
                                        height: 40))
                              ],
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                selectedContainerIndex == 2
                    ? Container(
                        width: 322,
                        decoration: BoxDecoration(
                            border: Border.all(
                          width: 1,
                          color: mainGreen,
                        ),
                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))),
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10,),
                                const Text('عنوان المنشور ',
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
                                      controller: postTitleController,
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
                                      controller: postDescController,
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
                                GestureDetector(
                                  onTap: _pickImagePost,
                                  child: Container(
                                    width: double.infinity,
                                    height: 30,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(right: 5, top: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: mainBeige,
                                        width: 1,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: _imagePost != null
                                          ? Image.file(
                                        _imagePost!,
                                        width: 30,
                                        height: 30,
                                        fit: BoxFit.cover,
                                      )
                                          : const Icon(Icons.create_new_folder_rounded, color: mainBeige, size: 20,),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Center(
                                    child: defaultButton(
                                        radius: 10,
                                        function: () async{
                                          if(postTitleController.text.isEmpty || postDescController.text.isEmpty || _imagePost==null){
                                            MotionToast.warning(
                                              title:  const Text("تنبيه"),
                                              description:  const Align(
                                                  alignment: Alignment.centerRight,
                                                  child: Text("'يرجى تعبئة كافة الحقول لإضافة هذا المنشورً",textDirection: ui.TextDirection.rtl,)),
                                              layoutOrientation: ToastOrientation.rtl,
                                              iconSize: 50,
                                            ).show(context);
                                          }else{
                                            var uuid=Uuid();
                                            var newPost=AddPostModel(
                                                postTitle: postTitleController.text,
                                                postText: postDescController.text,
                                                date: DateFormat.yMMMEd().format(DateTime.now()),
                                                orgId: orgIdProvider.orgId,
                                                image: _imagePost,
                                                id:uuid.v1(), state: false);

                                            try{
                                              await AddPostRepository().addPost(newPost);
                                              postTitleController.clear();
                                              postDescController.clear();
                                              MotionToast.success(
                                                description:  const Text("تمت عملية الإضافة بنجاح",textDirection: ui.TextDirection.rtl,),
                                                layoutOrientation: ToastOrientation.rtl,
                                                iconSize: 50,
                                              ).show(context);
                                            }catch(e){
                                              print("Failed to add post: $e");
                                            }
                                          }

                                        },
                                        text: "تأكيد",
                                        width: 120,
                                        height: 40)
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : const SizedBox()
              ]),
        ),
      ),
    );
  }
}
