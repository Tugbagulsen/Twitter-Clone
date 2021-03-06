import 'package:flutter/material.dart';
import 'package:twitter/model/trend_topic.dart';

class SearchView extends StatefulWidget {
  const SearchView(this.scrollController);
  final ScrollController scrollController;
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  double _padding = 20;
  late TrendTopic _topic;

  @override
  void initState() {
    super.initState();

    _topic = TrendTopic(
        hashtag: "#Champions Legue",
        locatioon: "Trending in Turkey",
        tweet: "16.8k Tweets");
  }

  Future tempFuture() async {
    await Future.delayed(
      Duration(
        milliseconds: 500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: UniqueKey(),
      controller: widget.scrollController,
      children: <Widget>[
        _downIconWidget,
        _emptySpace,
        _trendTitleWidget,
        _listHashView,
      ],
    );
  }

  Widget get _emptySpace => SizedBox(
        height: 10,
      );
  Widget get _downIconWidget => Container(
        child: const Icon(
          Icons.arrow_downward,
          color: Colors.grey,
        ),
      );

  Widget get _trendTitleWidget => Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        margin: EdgeInsets.all(0),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: _padding),
          alignment: Alignment.centerLeft,
          child: Text(
            "Trends for you",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      );
  Widget get _divider => Divider(
        height: 0,
        color: Colors.grey,
      );
  Widget get _listHashView => ListView.separated(
        itemCount: 5,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => _divider,
        itemBuilder: (context, index) => cardListMethod(context),
      );

  Card cardListMethod(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        side: BorderSide(style: BorderStyle.none, color: Colors.transparent),
      ),
      child: listPadding(context),
    );
  }

  Padding listPadding(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _padding,
        vertical: 5,
      ),
      child: row(context),
    );
  }

  Row row(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: Wrap(
          direction: Axis.vertical,
          spacing: 5,
          children: <Widget>[
            Text(_topic.locatioon!, style: Theme.of(context).textTheme.caption),
            Text(_topic.hashtag!,
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(fontSize: 15)),
            Text(_topic.tweet!, style: Theme.of(context).textTheme.button),
          ],
        )),
        Icon(Icons.arrow_drop_down)
      ],
    );
  }
}
