import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const HomeView());

class HomeView extends StatefulWidget {
  const HomeView({Key? key});

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
  double lastOffset = 0;

  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    scrollController.addListener(
      () {
        print(scrollController.offset);
        if (scrollController.offset <= 0) {
          isHeaderClose = false;
        } else if (scrollController.offset >=
            scrollController.position.maxScrollExtent) {
          isHeaderClose = true;
        } else {
          isHeaderClose = scrollController.offset > lastOffset ? true : false;
        }

        setState(() {
          lastOffset = scrollController.offset;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _fabButton,
        body: SafeArea(
          child: DefaultTabController(
            length: defaultTabLenght,
            child: Column(children: <Widget>[
              _containerAppbar,
              _tabbarItems,
              _expandedListView
            ]),
          ),
        ));
  }

  Widget get _fabButton => FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.adb),
      );

  Widget get _containerAppbar => AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: isHeaderClose ? 0 : 50,
        child: _appBar,
      );

  Widget get _appBar => AppBar(
        elevation: 0,
        centerTitle: false,
        title: _appBarItems,
      );

  Widget get _appBarItems => Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        children: <Widget>[
          CircleAvatar(backgroundImage: NetworkImage(_photoPixabay)),
          const Text(
            "Home",
            style: titleTextStyle,
          ),
        ],
      );

  Widget get _tabbarItems => const TabBar(
        tabs: <Widget>[
          Tab(icon: Icon(Icons.dashboard)),
          Tab(icon: Icon(Icons.radio)),
          Tab(icon: Icon(Icons.abc_sharp)),
          Tab(icon: Icon(Icons.face)),
        ],
      );

  Widget get _expandedListView => Expanded(
        child: _listView,
      );

  Widget get _listView => ListView.builder(
        itemCount: 10,
        controller: scrollController,
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

const titleTextStyle = TextStyle(
  letterSpacing: 1,
  fontSize: 20,
  fontWeight: FontWeight.w800,
  color: Colors.black,
);
