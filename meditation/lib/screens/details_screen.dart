import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation/constants.dart';

import '../widgets/widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
    body: Stack(
      children: [
        Container(
          height: size.height * .45,
          decoration: BoxDecoration(color: kBlueColor),
            child: Image(
              image: AssetImage('assets/images/meditation_bg.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height*0.05),
                Text('Meditation',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
                ),
                SizedBox(height: 10,),
                Text('3-10 Min Course',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                    width: size.width * .6,
                    child: Text('Live happier and healthier by learning the fundamentals of meditation and mindfulness')),
                SizedBox(
                    width: size.width * 0.5,
                    child: Search()),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    SessionCard(session: 'Session 1',),
                    SessionCard(session: 'Session 2',),
                    SessionCard(session: 'Session 3',),
                    SessionCard(session: 'Session 4',),
                    SessionCard(session: 'Session 5',),
                    SessionCard(session: 'Session 6',),
                  ],
                ),
                SizedBox(height: 20),
                Text('Meditation',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [BoxShadow(
                      offset: Offset(0,17),
                      blurRadius: 23,
                      spreadRadius: -13,
                      color: kShadowColor,
                    ),],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset('assets/icons/Meditation_women_small.svg'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Basics 2',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text('Start your deepen you practice',
                          style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset('assets/icons/Lock.svg')
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomBar(icon: 'assets/icons/calendar.svg', text: 'Today', press: () {  }, isActive: false,),
            BottomBar(icon: 'assets/icons/gym.svg', text: 'All Exercises', press: () {  }, isActive: true,),
            BottomBar(icon: 'assets/icons/Settings.svg', text: 'Settings', press: () {  }, isActive: false,),
          ],
        ),
      ),
    );
  }
}
