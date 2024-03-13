import 'package:be_sheq_tamara_org_app/Constants/Color_Constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      title: Image.asset('asset/images/logo.png', width: 87.5),
      centerTitle: true,
      actions: [
        IconButton(onPressed: (){
          context.pushNamed('notifications');},
            icon: const Icon(Icons.notifications,color: secondaryBeige,size: 26,)),
        IconButton(onPressed: (){
          context.pushNamed('messages');},
            icon: Image.asset("asset/icons/messageIcon.png",
                width: 22, height: 22)),
      ],
    );
  }
}
