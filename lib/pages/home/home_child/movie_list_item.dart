
import 'package:flutter/material.dart';
import '../../../widget/star_rating.dart';
import '../../../widget/dashed_line.dart';
import '../../../services/screen_adapter.dart';
import '../../../moels/home_mode.dart';

class MovieListItem extends StatefulWidget {
  final Subjects item;
  MovieListItem(this.item, {Key key}) : super(key: key);

  @override
  _MovieListItemState createState() => _MovieListItemState();
}

class _MovieListItemState extends State<MovieListItem> {
  Subjects _item;
  @override
  @override
  void initState() {
    super.initState();
    _item = widget.item;
  }

  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black26, width: 10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getRankWidget(),
          SizedBox(height: 20),
          _getMovieContentWidget(),
          SizedBox(height: 20),
          _getOriginWidget()
        ],
      ),
    );
  }

  /// 1.获取排名
  Widget _getRankWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color.fromARGB(255, 238, 205, 144)),
      child: Text('No.${_item.rank}',
          style:
              TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 95, 36))),
    );
  }

  /// 2.影片内容
  Widget _getMovieContentWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _getWishWidget(),
        _getDetailDescWidget(),
        _getDashedWidget(),
        _getMovieImageWidget(),
      ],
    );
  }

  /// 2.1 影片图片
  Widget _getMovieImageWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/home/wish.png',
              width: ScreenAdapter.width(60)),
          Text('想看')
        ],
      ),
    );
  }

  ///2.2影片描述
  Widget _getDetailDescWidget() {
    return Expanded(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenAdapter.width(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getMovieNameWidget(),
          SizedBox(height: ScreenAdapter.height(20)),
          _getMovieRatingWidget(),
          SizedBox(height: ScreenAdapter.height(20)),
          _getMovieIntroduceWidget(),
        ],
      ),
    ));
  }

  /// 2.2.1 获取电影名称
  Widget _getMovieNameWidget() {
    return Stack(
      children: <Widget>[
        Icon(Icons.play_circle_outline, color: Colors.red, size: 24),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '      ' + _item.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          TextSpan(
              text: '(${_item.year})',
              style: TextStyle(fontSize: 18, color: Colors.black54)),
        ]))
      ],
    );
  }

  /// 2.2.2 获取电影评分
  Widget _getMovieRatingWidget() {
    return Row(
      children: <Widget>[
        StarRating(rating: _item.rating.average,size: 15),
        Text('${_item.rating.average}')
      ],
    );
  }

  /// 2.2.3 获取电影简介
  Widget _getMovieIntroduceWidget() {
    String genres = _item.genres.join(' ');
    String directors = '';
    for (Directors item in _item.directors) {
      directors += item.name;
    }

    String casts = '';
    for (Casts item in _item.casts) {
      casts += item.name;
    }
    return Text('$genres / $directors / $casts',
        maxLines: 2,
        style: TextStyle(fontSize: 14),
        overflow: TextOverflow.ellipsis);
  }

  /// 2.3 分割线
  Widget _getDashedWidget() {
    return Container(
      height: ScreenAdapter.height(200),
      width: ScreenAdapter.width(2),
      child: DashedLine(
        color: Colors.black87,
        axis: Axis.vertical,
        count: 15,
        dashedHeight: 4,
      ),
    );
  }

  /// 2.4 想看
  Widget _getWishWidget() {
    return ClipRRect(
      child: Image.network(_item.images.small, width: ScreenAdapter.width(160)),
      borderRadius: BorderRadius.circular(ScreenAdapter.width(10)),
    );
  }

  /// 3.影片描述
  Widget _getOriginWidget() {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Color(0xfff2f2f2)),
      child: Text(_item.originalTitle,
          style: TextStyle(fontSize: 18, color: Colors.black54)),
    );
  }
}
