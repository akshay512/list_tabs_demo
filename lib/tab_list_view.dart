import 'package:flutter/material.dart';
import 'package:tabbed_listview_demo/items_list.dart';

class TabbedListView extends StatefulWidget {
  const TabbedListView({Key? key}) : super(key: key);

  @override
  _TabbedListViewState createState() => _TabbedListViewState();
}

class _TabbedListViewState extends State<TabbedListView> {
  var tabs = ['tab1', 'tab2', 'tab3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: DefaultTabController(
          length: tabs.length,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool isInnerBoxScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    centerTitle: true,
                    backgroundColor: Theme.of(context).appBarTheme.color,
                    automaticallyImplyLeading: false,
                    title: Text(
                      "Appbar title",
                      style: Theme.of(context).appBarTheme.titleTextStyle,
                    ),
                    floating: true,
                    pinned: true,
                    snap: false,
                    bottom: TabBar(
                      isScrollable: (tabs.length > 3) ? true : false,
                      tabs: [
                        ...tabs.map((e) => Tab(
                              text: e,
                            ))
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                ...tabs.map((element) => ItemList(
                      uniqueid: element,
                    ))
              ],
            ),
          )),
    );
  }
}
