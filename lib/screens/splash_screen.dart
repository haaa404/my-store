import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_store/routes.dart';
import 'package:my_store/widgets/large_text.dart';
import 'package:my_store/widgets/small_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.homeScreen, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(
                'https://img.freepik.com/free-vector/online-shopping-concept-illustration_114360-1084.jpg'),
          )),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               const LargeText(text: 'My Store', size: 40,),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .8,
                child: const Column(
                  children: [

                    SmallText(text: 'Valkommen', weight: FontWeight.w900, size: 15,),

                    SizedBox(height: 15),

                    SmallText(
                        text:
                        'Hos ass kan du baka tid has nastan alla Sveriges salonger och motagningar. Baka frisor, massage, skonhetsbehandingar, friskvard och mycket mer.',

                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
