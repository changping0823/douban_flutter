import 'dart:math';

import 'package:flutter/material.dart';

class MallPage extends StatelessWidget {
  const MallPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('MallPage');
    return Scaffold(
//      appBar: AppBar(
//        title: Text('市集')
//      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('市集'),
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Colors.red,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network('https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg',fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return InkWell(
                      child: Container(
                        color: Color.fromARGB(255, Random().nextInt(255),
                            Random().nextInt(255), Random().nextInt(255)),
                      ),
                      onTap: () {
                        print('点击了第$index个SliverGrid');
                      });
                }, childCount: 30),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8)),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ListTile(
                  leading: Icon(Icons.people),
                  title: Text('联系人$index'),
                  onTap: () {
                    print('点击了第$index个SliverList');
                  });
            }, childCount: 100),
          ),
        ],
      ),
    );
  }
}
