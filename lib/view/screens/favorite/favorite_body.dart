import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'dart:math';


class FavoriteBody extends StatefulWidget {
  const FavoriteBody({Key? key}) : super(key: key);

  @override
  State<FavoriteBody> createState() => _FavoriteBodyState();
}

class _FavoriteBodyState extends State<FavoriteBody> {
  double _page = 10;
  
  @override
  Widget build(BuildContext context) {
    PageController pageController;
    pageController = PageController(initialPage: 10);
    pageController.addListener(
      () {
        setState(
          () {
            _page = pageController.page!;
          },
        );
      },
    );
    return Center(
        child: Stack(
          children: [
            SizedBox(
              height: 70.h,
              width: 100.w * .95,
              child: LayoutBuilder(
                builder: (context, boxConstraints) {
                  List<Widget> cards = [];

                  for (int i = 0; i <= 11; i++) {
                    double currentPageValue = i - _page;
                    bool pageLocation = currentPageValue > 0;

                    double start = 20 +
                        max(
                            (boxConstraints.maxWidth - 100.w * .75) -
                                ((boxConstraints.maxWidth - 100.w * .75) / 2) *
                                    -currentPageValue *
                                    (pageLocation ? 9 : 1),
                            0.0);

                    var customizableCard = Positioned.directional(
                      top: 20 + 30 * max(-currentPageValue, 0.0),
                      bottom: 20 + 30 * max(-currentPageValue, 0.0),
                      start: start,
                      textDirection: TextDirection.ltr,
                      child: Container(
                          height: 100.w * .67,
                          width: 100.w * .67,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.15),
                                    blurRadius: 10)
                              ])),
                    );
                    cards.add(customizableCard);
                  }
                  return Stack(children: cards);
                },
              ),
            ),
            Positioned.fill(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: 11,
                controller: pageController,
                itemBuilder: (context, index) {
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      );
  }
}