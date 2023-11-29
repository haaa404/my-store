import 'package:flutter/material.dart';
import 'package:my_store/screens/favourites/widget/favourite_widget.dart';

import '../../utilis.dart';
import '../../widgets/small_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hala Saeed', style: appBarStyle,),
          centerTitle: true,
        ),
        body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [

              const SizedBox(height: 18,),

              getCard(),

              const SizedBox(height: 60,),

              getRow(Icons.settings_outlined, 'Kontoinstallningar'),

              getRow(Icons.drive_folder_upload, 'Mina betalmetoder'),

              getRow(Icons.support_outlined, 'Support'),

            ],
          ),
        ),
      ),
    );
  }

  Widget getCard(){
    return const SizedBox(
      height: 100,
      child: Card(
        color: Colors.black,
        child: Row(
          children: [

             SizedBox(width: 20,),

             CircleAvatar(
              backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014_1280.jpg'),
              backgroundColor: Colors.grey,
              radius: 32,
            ),

             SizedBox(width: 22,),

             Padding(
              padding:  EdgeInsets.only(top: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(text: 'Hala Saeed', weight: FontWeight.bold,size: 15, color: Colors.white,),

                   SizedBox(height: 6,),

                   SmallText(text: 'halasaeed@gmail.com', weight: FontWeight.w500, size: 11,  color: Colors.white),

                   SizedBox(height: 4,),

                  SmallText(text: '03123456789', weight: FontWeight.w500, size: 11,  color: Colors.white),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }// get card


 Widget getRow(icon, text){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Row(
        children: [
          Icon(icon),

          const SizedBox(width: 20,),

          SmallText(text: text, letterSpacing: 0, weight: FontWeight.bold),
        ],
      ),
    );
  }

}
