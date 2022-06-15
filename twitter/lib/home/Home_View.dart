import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'tabbar_view.dart';

class HomeView extends StatefulWidget {
  HomeView(this.controller);

  final ScrollController controller;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String _photoPixabay =
      "https://media.istockphoto.com/photos/silhouettes-of-russian-fighter-aircrafts-su27-in-the-sky-picture-id496885750?s=612x612";
  int defaultTabLenght = 4;
  final String _randomImage = "https://picsum.photos/200/300";
  final String _dummyText =
      "asdfghjklş asdghkl sdfghjkl dfghjklş fghjklş rtyuıopğ edfghjk rtyuıo fghjklş rtyuıop";
  bool isHeaderClose = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: _fabButton, body: _listView);
  }

  Widget get _fabButton => FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.adb),
      );

  Widget get _listView => ListView.builder(
        itemCount: 10,
        controller: widget.controller,
        itemBuilder: (context, index) {
          return _listViewCard;
        },
      );

  Widget get _listViewCard => Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              _randomImage,
            ),
          ),
          title: Wrap(
              direction: Axis.horizontal,
              runSpacing: 5,
              children: <Widget>[
                _listeCardTitle("Hello"),
                Text(_dummyText),
                _placeHolderfield,
                _footerButtonList
              ]),
        ),
      );

  Widget _listeCardTitle(String text) => Text(
        text,
        style: titleTextStyle,
      );

  Widget get _placeHolderfield => Container(
        height: 100,
        child: const Placeholder(),
      );

  Widget get _footerButtonList => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _iconLabelbutton,
          _iconLabelbutton,
          _iconLabelbutton,
          _iconLabelbutton,
        ],
      );

  Widget _iconLabel(String text) => Wrap(
        spacing: 5,
        children: <Widget>[
          const Icon(
            Icons.comment,
            color: CupertinoColors.inactiveGray,
          ),
          Text(text)
        ],
      );

  Widget get _iconLabelbutton => InkWell(
        child: _iconLabel("1"),
        onTap: () {},
      );
}
