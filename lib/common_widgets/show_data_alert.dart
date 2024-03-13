import 'package:flutter/material.dart';

import '../../Constants/Color_Constants.dart';

class ShowDataAlert extends StatefulWidget {
  const ShowDataAlert({super.key});

  @override
  State<ShowDataAlert> createState() => _ShowDataAlertState();
}

class _ShowDataAlertState extends State<ShowDataAlert> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  void showDataAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(

          elevation: 0,
          backgroundColor: const Color(0xfffdfdfe),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10.0,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(
            top: 5.0,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "asset/images/logo.png", width: 46, height: 64,),
              const Text(
                " قصّتي مع السّرطان",
                style: TextStyle(fontSize: 20.0),
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: mainGreen,

                  ),
                  width: 29, height: 29,
                  child: const Icon(Icons.close, color: Colors.white,)),


            ],
          ),
          content: SizedBox(
            width: 500,
            height: 600,
            child: Column(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(33.0),

                            child: Image.asset(
                              "asset/images/story1.jpg", width: 230,
                              height: 230,)),
                        const SizedBox(
                          width: 400,
                          height: 300,
                          child: Text(
                            " لما بدت رحلتي..  أني الأخ الاكبر بين إخوتي الثّلاثة ، توفى والدي واحني في اعمار الابتدائي والروضة.. ربّتنا والدتي الّي ما فيش وظيفة ممكن تشتغلها وما اشتغلتهاش؛ كان ثاني ابتلاء لينا بعد وفاة والدي مرض اخي الصّغير بمرض عصبي مُزمن يستلزم علاج مكلف شهرياً وإيواء متكرر على المستشفيات الأمر الّي زاد انهك والدتي..واني في الثانوي كنت نحاول نشتغل أي شي بسيط مع دراستي باش نساعد أُمّي.  كملت الشهادة الثانوية سجلت في معهد وبديت نخدم في قهوة باش نحاول نجمع مصروفي .. وما كنتش بديت دراستي لما صار الّي صار...  بديت نحس في آلام في رجلي من جيهة الفخذ حاولت نتجاهلها وناخذ المسكنات العادية بس الموضوع بدي يزيد .. والالم كان كل مرة يزيد يتمكن مني وكان في ليالي تفوت عليا منقدرش نرقد منه .. وبديت معاش قادر نشتغل .. ما شكيتش لحد في الأول أمي مشغولة بخدمتها وبخوي المريض وما بيتش نزيدها همّ على همها .. بعدين خلاص كان لازم نمشي لدكتور الوضع اصبح لا يُطاق …",
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.right,

                          ),
                        ),
                        const SizedBox(
                          width: 400,
                          height: 300,
                          child: Text(
                            " لما بدت رحلتي..  أني الأخ الاكبر بين إخوتي الثّلاثة ، توفى والدي واحني في اعمار الابتدائي والروضة.. ربّتنا والدتي الّي ما فيش وظيفة ممكن تشتغلها وما اشتغلتهاش؛ كان ثاني ابتلاء لينا بعد وفاة والدي مرض اخي الصّغير بمرض عصبي مُزمن يستلزم علاج مكلف شهرياً وإيواء متكرر على المستشفيات الأمر الّي زاد انهك والدتي..واني في الثانوي كنت نحاول نشتغل أي شي بسيط مع دراستي باش نساعد أُمّي.  كملت الشهادة الثانوية سجلت في معهد وبديت نخدم في قهوة باش نحاول نجمع مصروفي .. وما كنتش بديت دراستي لما صار الّي صار...  بديت نحس في آلام في رجلي من جيهة الفخذ حاولت نتجاهلها وناخذ المسكنات العادية بس الموضوع بدي يزيد .. والالم كان كل مرة يزيد يتمكن مني وكان في ليالي تفوت عليا منقدرش نرقد منه .. وبديت معاش قادر نشتغل .. ما شكيتش لحد في الأول أمي مشغولة بخدمتها وبخوي المريض وما بيتش نزيدها همّ على همها .. بعدين خلاص كان لازم نمشي لدكتور الوضع اصبح لا يُطاق …",
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.right,

                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        );
      },
    );
  }
}