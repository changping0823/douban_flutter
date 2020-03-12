import '../../widget/star_rating.dart';
import 'package:flutter/material.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('小组')
      ),
      body: Center(
        child: StarRating(rating: 9.2)
      ),
    );
  }
}