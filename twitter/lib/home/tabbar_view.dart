import 'package:flutter/material.dart';
import 'package:twitter/home/search_view.dart';

import 'Home_View.dart';

class TwitterTabbarView extends StatefulWidget {
  TwitterTabbarView({Key? key}) : super(key: key);

  @override
  State<TwitterTabbarView> createState() => _TwitterTabbarViewState();
}

class _TwitterTabbarViewState extends State<TwitterTabbarView> {
  final String _photoPixabay =
      "https://media.istockphoto.com/photos/silhouettes-of-russian-fighter-aircrafts-su27-in-the-sky-picture-id496885750?s=612x612";

  bool isHeaderClose = true;
  late ScrollController scrollController;
  double lastOffset = 0;
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

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: _bottomAppBar,
        body: Column(children: <Widget>[_containerAppbar, _tabbarViews]),
      ),
    );
  }

  Widget get _tabbarViews => Expanded(
        child: TabBarView(
          children: <Widget>[
            HomeView(scrollController),
            SearchView(scrollController),
            Text("asdf"),
            Text("asdf"),
          ],
        ),
      );
  Widget get _bottomAppBar => BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: _tabbarItems,
      );

  Widget get _containerAppbar => AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: isHeaderClose ? 0 : MediaQuery.of(context).size.height * .12,
        child: _appBar,
      );

  Widget get _appBar => AppBar(
        elevation: 0,
        centerTitle: false,
        title: _appBarItems,
      );

  Widget get _appBarItems => Row(
        children: <Widget>[
          CircleAvatar(backgroundImage: NetworkImage(_photoPixabay)),
          _emptyWidht,
          Expanded(child: _centerAppBarWidget),
          _emptyWidht,
          Icon(
            Icons.access_alarms,
            color: Colors.blue,
          )
        ],
      );
  Widget get _emptyWidht => SizedBox(
        width: 20,
      );
  Widget get _searchTextField => TextField(
      maxLines: 1,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        hintText: "Search Twitter",
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey,
        ),
        filled: true,
        focusedBorder: outlineInputBorder,
        border: outlineInputBorder,
      ));
  OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(25));
  Widget get _centerAppBarWidget => currentIndex == 1
      ? _searchTextField
      : Text("Home", style: titleTextStyle);
  Widget get _tabbarItems => const TabBar(
        isScrollable: false,
        tabs: <Widget>[
          Tab(icon: Icon(Icons.home)),
          Tab(icon: Icon(Icons.search)),
          Tab(icon: Icon(Icons.satellite)),
          Tab(icon: Icon(Icons.verified_user)),
        ],
      );
}

const titleTextStyle = TextStyle(
  letterSpacing: 1,
  fontSize: 20,
  fontWeight: FontWeight.w800,
  color: Colors.black,
);
