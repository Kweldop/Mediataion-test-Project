import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String title;
  final  void Function() press;

  const CategoryCard({required this.title,required this.image, required this.press});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [BoxShadow(offset: Offset(0,17),
              blurRadius: 17,
              spreadRadius: -23,
              color: kShadowColor,
            )]
        ),
        child: Material(
          color: Colors.transparent,
          child:InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  SvgPicture.asset('$image'),
                  Spacer(),
                  Text('$title',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  final String icon;
  final String text;
  final void Function() press;
  bool isActive = false;
  BottomBar({required this.icon,required this.text, required this.press,required this.isActive});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(icon, color: isActive ? kActiveIconColor: kTextColor,),
          Text(
            text,
            style: TextStyle(
              color: isActive? kActiveIconColor : kTextColor,
          ),
          ),

        ],
      ),
    );
  }
}

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 30),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Search',
          icon: SvgPicture.asset('assets/icons/search.svg'),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class SessionCard extends StatefulWidget {
  final String session;

  SessionCard({required this.session,});

  @override
  State<SessionCard> createState() => _SessionCardState();
}

class _SessionCardState extends State<SessionCard> {
  bool isDone=false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint){
      return Container(
        width: constraint.maxWidth/2 -10,
        padding: EdgeInsets.all(16),
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
          children: [
            Container(
              height: 42,
              width: 43,
              decoration: BoxDecoration(
                color: isDone ? kBlueColor: Colors.white ,
                shape: BoxShape.circle,
                border: Border.all(color: kBlueColor)
              ),
              child: IconButton(
                onPressed: (){
                  setState(() {
                    isDone= true;
                  });
                },
                icon: Icon(Icons.play_arrow,
                  color: isDone? Colors.white: kBlueColor,
                ),
              ),
            ),
            SizedBox(width: 10,),
            Text(widget.session,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      );
    }
    );
  }
}
