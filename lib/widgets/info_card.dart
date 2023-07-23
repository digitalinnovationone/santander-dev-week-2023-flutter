import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:santander_app/models/user_model/news.dart';

import '../shared/app_colors.dart';
import '../shared/app_images.dart';
import '../shared/app_settings.dart';

class InfoCardsWidget extends StatefulWidget {
  final List<News> news;
  const InfoCardsWidget({super.key, required this.news});

  @override
  State<InfoCardsWidget> createState() => _InfoCardsWidgetState();
}

class _InfoCardsWidgetState extends State<InfoCardsWidget> {
  PageController pageController = PageController();
  int cardPosition = 0;
  var icons = <Widget>[];

  @override
  void initState() {
    super.initState();
    buildIcons();
  }

  buildIcons() {
    icons.clear();
    for (var i = 0; i < widget.news.length; i++) {
      icons.add(Container(
        margin: const EdgeInsets.all(4),
        child: SvgPicture.asset(
          cardPosition == i ? AppImages.circleOn : AppImages.circleOff,
          height: 14,
        ),
      ));
    }
  }

  Widget getFeatureCard(String image, String description) {
    return Card(
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        width: AppSettings.screenWidth - 24,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 36,
            ),
            SvgPicture.network(
              image,
              colorFilter: ColorFilter.mode(AppColors.red, BlendMode.srcIn),
              width: 48,
              height: 48,
            ),
            const SizedBox(
              width: 36,
            ),
            Expanded(
              child: Text(
                description,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grayDark),
              ),
            ),
            const SizedBox(
              width: 36,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: AppSettings.screenWidth,
          child: PageView(
            onPageChanged: (index) {
              setState(() {
                cardPosition = index;
                buildIcons();
              });
            },
            controller: pageController,
            scrollDirection: Axis.horizontal,
            children: widget.news
                .map((e) => getFeatureCard(e.icon!, e.description!))
                .toList(),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: icons)
      ],
    );
  }
}
