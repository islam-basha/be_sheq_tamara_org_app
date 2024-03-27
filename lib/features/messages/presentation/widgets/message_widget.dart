import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({required this.name,required this.date,required this.message,super.key});
  final String name;
  final String date;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset('asset/images/profile_pic.jpg',width: 50,height: 50,),
              ),
              SizedBox(width: 5,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                  Text(date,style: TextStyle(color: Colors.grey),),
                ],
              )
            ],
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 340),
            child: Text(message,
              style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300),),
          ),
          SizedBox(height: 5,),
          Divider(color: Colors.grey.shade200,),
        ],
      ),
    );
  }
}
