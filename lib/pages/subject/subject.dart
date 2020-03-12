import '../../widget/dashed_line.dart';
import 'package:flutter/material.dart';

class SubjectPage extends StatelessWidget {
  const SubjectPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('SubjectPage');
    return Scaffold(
      appBar: AppBar(
        title: Text('书影音')
      ),
      body: Center(
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            color: Colors.black12,
            child: DashedLine(
              color: Colors.red,
              axis: Axis.vertical,
              count: 12,
              dashedWidth: 2,
              dashedHeight: 10,
            ),
          ),
        )
      ),
    );
  }
}