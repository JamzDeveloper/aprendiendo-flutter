import 'package:flutter/material.dart';
import 'dart:io';
class BuildSliverHead extends StatelessWidget {
  const BuildSliverHead({
    Key? key,
    required this.file,
    required this.expandedHeight,
    required this.roundedContainerHeight,
  }) : super(key: key);

  final File file;
  final double expandedHeight;
  final double roundedContainerHeight;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        delegate: DetailSliverDelegate(
            file: file,
            expandedHeight: expandedHeight,
            roundedContainerHeight: roundedContainerHeight));
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  DetailSliverDelegate(
      {required this.file,
        required this.expandedHeight,
        required this.roundedContainerHeight});

  final double expandedHeight;
  final File file;
  final double roundedContainerHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Image.file(
          file,
          width: MediaQuery.of(context).size.width,
          height: expandedHeight,
          fit: BoxFit.cover,
        ),
        Positioned(
            top: expandedHeight - roundedContainerHeight - shrinkOffset,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: roundedContainerHeight,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40))),
            ))
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
