import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TamaraNavBar extends StatelessWidget {
  const TamaraNavBar(this.navigationShell,{super.key});
  final StatefulNavigationShell navigationShell;

  void _onTap(index){
    navigationShell.goBranch
      (
      index,initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("asset/icons/user.png",width: 24,height: 24,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon:Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffDDA15E),
                ),
                alignment: Alignment.center,
                child: Image.asset("asset/icons/plus.png",width:30,height:30)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("asset/icons/history.png",width: 24,height: 24,),
            label: '',
          ),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
