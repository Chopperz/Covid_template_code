import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_for_test/Model/modelApi.dart';
import 'package:flutter_for_test/search.dart';
import 'package:flutter_svg/svg.dart';

class HomeViewWidget {
  final BuildContext context;

  HomeViewWidget(this.context);

  AppBar appBarHome(VoidCallback openDrawer) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () => openDrawer(),
        icon: SvgPicture.asset('assets/icons/menu.svg'),
      ),
      actions: [
        IconButton(
          onPressed: () => showSearch(context: context, delegate: SearchPage()),
          icon: SvgPicture.asset('assets/icons/search.svg'),
        )
      ],
    );
  }

  Drawer drawerHome() {
    return Drawer(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.green.shade700,
              ),
            ],
          ),
          Positioned(
            top: 175,
            right: 10,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardCountCovid(CovidModelData covid) {
    TextStyle textStyle = TextStyle(color: Colors.grey.shade700, fontSize: 15);
    TextStyle _dataTextStyle = TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
    Icon iconRun = Icon(Icons.run_circle_outlined, color: Colors.white);
    List<Widget> card() => List.generate(
          4,
          (index) => Card(
            elevation: 4,
            color: Colors.grey.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.2,
              height: 120,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index == 0)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: iconRun,
                              ),
                              const SizedBox(width: 5),
                              Text('Confirmed Cases', style: textStyle),
                            ],
                          ),
                        if (index == 1)
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: iconRun,
                                ),
                                const SizedBox(width: 5),
                                Text('Total Death', style: textStyle),
                              ]),
                        if (index == 2)
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: iconRun,
                                ),
                                const SizedBox(width: 5),
                                Text('Tontal Recovered', style: textStyle),
                              ]),
                        if (index == 3)
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: iconRun,
                                ),
                                const SizedBox(width: 5),
                                Text('New Cases', style: textStyle),
                              ]),
                        const SizedBox(height: 10),
                        if (index == 0)
                          Text(covid.newConfirmed.toString(),
                              style: _dataTextStyle),
                        if (index == 1)
                          Text(covid.deaths.toString(), style: _dataTextStyle),
                        if (index == 2)
                          Text(covid.newRecovered.toString(),
                              style: _dataTextStyle),
                        if (index == 3)
                          Text(covid.newDeaths.toString(),
                              style: _dataTextStyle),
                        Text('people',
                            style: textStyle.copyWith(
                                fontSize: 12, color: Colors.grey.shade500)),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Transform.translate(
                      offset: Offset(10, 30),
                      child: Container(
                        child: Transform.rotate(
                          angle: math.pi / 1.2,
                          child: AspectRatio(
                            aspectRatio: .8,
                            child: Image.asset(
                              "assets/icons/wave_icon.png",
                              fit: BoxFit.fitWidth,
                              color: Colors.green[700],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ).toList();

    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 5,
        runSpacing: 5,
        children: card(),
      ),
    );
  }

  Widget preventions() {
    TextStyle _textStyle2 = TextStyle(
        color: Colors.green[400], fontWeight: FontWeight.normal, fontSize: 15);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Preventions',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),
          ), // ? ลูกคนแรก
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                      "assets/icons/hand_wash.svg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('Wash Hands', style: _textStyle2)
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                      "assets/icons/use_mask.svg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('Use Masks', style: _textStyle2)
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                      "assets/icons/Clean_Disinfect.svg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('Clean Disinfect', style: _textStyle2)
                ],
              ),
            ],
          ), // * ลูกคนที่สอง
        ],
      ),
    );
  }

  Widget cardMedicalHelp() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
      child: Stack(
        children: [
          Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: Container(
              constraints:
                  BoxConstraints(maxWidth: double.infinity, maxHeight: 150),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.green.shade300,
                    Colors.green.shade400,
                    Colors.green.shade500,
                    Colors.green.shade600,
                  ],
                ),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: SvgPicture.asset(
              "assets/icons/virus.svg",
              // height: 170,
            ),
          ),
          Positioned(
            top: -10,
            left: 20,
            child: SvgPicture.asset(
              "assets/icons/nurse.svg",
              height: 170,
            ),
          ),
          Positioned(
            top: 30,
            right: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dial 999 for\nMedical Help!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    wordSpacing: 1,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'If any symptoms appear',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    wordSpacing: 1,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
