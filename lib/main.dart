
import 'package:douban/pages/group/group.dart';
import 'package:douban/pages/home/home.dart';
import 'package:douban/pages/mall/mall.dart';
import 'package:douban/pages/profile/profile.dart';
import 'package:douban/pages/subject/subject.dart';
import 'package:flutter/material.dart';
import 'widget/tabbar_item.dart';


void main() => runApp(MyApp());



class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent

      ),
      home: MyStackPage(),

    );
  }

} 



class MyStackPage extends StatefulWidget {
  MyStackPage({Key key}) : super(key: key);

  @override
  _MyStackPageState createState() => _MyStackPageState();
}

class _MyStackPageState extends State<MyStackPage> {

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: this._currentIndex,
        children: <Widget>[
          HomePage(),
          SubjectPage(),
          GroupPage(),
          MallPage(),
          ProfilePage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        selectedFontSize: 12,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        items: [
          TabbarItem('home', '首页'),
          TabbarItem('subject', '书影音'),
          TabbarItem('group', '小组'),
          TabbarItem('mall', '市集'),
          TabbarItem('profile', '我的'),

        ],
        onTap: (index){
          setState(() {
          this._currentIndex = index;
          });
        },
      ),
    );
  }
}



