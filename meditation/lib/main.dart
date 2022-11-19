import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation/screens/details_screen.dart';
import 'package:meditation/widgets/widget.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meditation',
      theme: ThemeData(
       fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height* .45,
            decoration: BoxDecoration(color: Color(0xFFF5CEB8),
                image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage('assets/images/undraw_pilates_gpdb.png'))
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/menu.svg"),
                    ),
                  ),
                  Text('Hello!\nKweldop',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                  ),
                 Search(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount:2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      children: [
                        CategoryCard(title: 'Diet Recommendation', image: 'assets/icons/Hamburger.svg', press: (){}),
                        CategoryCard(title: 'Kegel Exercises', image: 'assets/icons/Excrecises.svg',press: (){}),
                        CategoryCard(title: 'Meditation', image: 'assets/icons/Meditation.svg',press: (){Navigator.push(context, MaterialPageRoute(builder: (context){return DetailScreen();}));}),
                        CategoryCard(title: 'Yoga', image: 'assets/icons/yoga.svg',press: (){})
                      ],
                    ),
                  ),
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





