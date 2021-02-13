import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pandemic/constants.dart';
import 'package:pandemic/widgets/line_chart.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.03),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: Wrap(runSpacing: 20, children: <Widget>[
          infoCard(
            title: "Confirmed Cases",
            iconColor: Color(0xFFFF8C00),
            effectedNum: 1062,
          ),
          infoCard(
            title: "Confirmed Cases",
            iconColor: Color(0xFFFF8C00),
            effectedNum: 1062,
          ),
        ]),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(.03),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
      ],
    );
  }
}

class infoCard extends StatelessWidget {
  final String title;
  final int effectedNum;
  final Color iconColor;

  const infoCard({
    Key key,
    this.title,
    this.effectedNum,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth / 2 - 10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: iconColor.withOpacity(0.12),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/running.svg",
                        height: 12,
                        width: 12,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: kTextColor),
                          children: [
                            TextSpan(
                                text: "$effectedNum \n",
                                style: Theme.of(context)
                                    .textTheme
                                    .title
                                    .copyWith(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "People",
                                style: TextStyle(
                                  fontSize: 12,
                                  height: 2,
                                ))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: LineReportChart(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
