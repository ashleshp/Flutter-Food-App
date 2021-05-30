import 'package:flutter/material.dart';

class StickyTabBar extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  final Color color;
  StickyTabBar({
    Color color = Colors.transparent,
    @required this.tabBar,
  }) : this.color = color;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: color,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(28),topRight: Radius.circular(28))
      ),
      child: tabBar,

    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}