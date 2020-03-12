import 'package:douban/moels/home_mode.dart';
import 'package:douban/pages/home/home_child/movie_list_item.dart';
import 'package:flutter/material.dart';
import '../../network/http_request.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    print('HomePage');
    return Scaffold(
      appBar: AppBar(
        title: Text('首页')
      ),
      body: HomeBody(),
    );
  }
}



class HomeBody extends StatefulWidget {
  HomeBody({Key key}) : super(key: key);
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<Subjects> _homeItems = [];

  @override
  void initState() {
    super.initState();

    HttpRequest.request('movie/top250?start=0&count=20').then((response){
      HomeModel result = HomeModel.fromJson(response.data);
      setState(() {
        _homeItems = result.subjects;
      });
    });

  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _homeItems.length,
      itemBuilder: (context,index){
        return MovieListItem(_homeItems[index]);
      },
    );
  }
}