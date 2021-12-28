import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  ItemList({Key? key, this.uniqueid}) : super(key: key);
  final String? uniqueid;
  var listitems = [
    'item1',
    'item2',
    'item3',
    'item4',
    'item5',
    'item6',
    'item7',
    'item8',
    'item9',
    'item10',
    'item11',
    'item12'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: CustomScrollView(
        // controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        key: PageStorageKey<String>(uniqueid!),
        slivers: [
          SliverOverlapInjector(
            // This is the flip side of the SliverOverlapAbsorber above.
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(0),
            sliver: SliverList(
                delegate:
                    SliverChildBuilderDelegate((BuildContext context, index) {
              return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListTile(
                    title: Text(listitems[index].toString()),
                    tileColor: Colors.white,
                  ));
            }, childCount: listitems.length)),
          ),
          // to display any more items below listview use SliverToBoxAdapter
          // SliverToBoxAdapter(
          //   child:
          // )
        ],
      ),
    );
  }
}
