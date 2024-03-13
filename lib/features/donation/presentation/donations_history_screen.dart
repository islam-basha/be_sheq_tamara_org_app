import 'package:be_sheq_tamara_org_app/common_widgets/app_bar.dart';
import 'package:be_sheq_tamara_org_app/features/donation/presentation/widgets/donations_widget.dart';
import 'package:be_sheq_tamara_org_app/features/donation/presentation/widgets/participation_widget.dart';
import 'package:flutter/material.dart';
import '../../../Constants/Color_Constants.dart';

bool donationsOrCampaigns=true;
class DonationsHistory extends StatefulWidget {
  const DonationsHistory({super.key});

  @override
  State<DonationsHistory> createState() => _DonationsHistoryState();
}

class _DonationsHistoryState extends State<DonationsHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        donationsOrCampaigns=true;
                      });
                    },
                    child: Container(
                      width: 160,
                      height: 60,
                      padding: const EdgeInsets.all(2.5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1,color: mainGreen)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('إجمالي التبرعات :', style: TextStyle(fontSize: 14),),
                            Text('300 تبرع', style: TextStyle(fontSize: 14),),
                          ],
                        ),
                          Image.asset('asset/icons/list.png',width: 40,),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        donationsOrCampaigns=false;
                      });
                    },
                    child: Container(
                      width: 160,
                      height: 60,
                      padding: const EdgeInsets.all(2.5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1,color: mainGreen)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('إجمالي الحملات :', style: TextStyle(fontSize: 14),),
                              Text('120 حملة', style: TextStyle(fontSize: 14),),
                            ],
                          ),
                          Image.asset('asset/icons/advertising.png',width: 40,),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),

              if(donationsOrCampaigns)
              Wrap(
                children: List.generate(4, (index) =>
                    Donations(donId: '124514fgf45', donName: 'عبدالرؤوف مصطفى مصطفى', donType: 'ملابس', donQty: '4 صناديق', donDate: '24/12/2012')
                ),
              )
              else
              Wrap(
              children: List.generate(6, (index) =>
                  Participations(parId: '124514fgf45', parName: 'عبدالرؤوف مصطفى مصطفى', campName: 'ملابس', campDate: '24/12/2012')
              ),
            ),

            ],
          ),
        ),
      ),
    );
  }
}
