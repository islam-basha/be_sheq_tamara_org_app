import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrgData extends ChangeNotifier{
  String orgId='org103';

  void setOrg(String id){
    this.orgId=id;
  }
}

final orgIdNotifier= ChangeNotifierProvider<OrgData>((ref) => OrgData());