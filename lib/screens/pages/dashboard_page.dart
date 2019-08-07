import 'package:flutter/material.dart';
import 'package:module_bloc_event/helpers/vars.dart';
import 'package:module_bloc_event/models/seephone/seephone.dart';
import 'package:module_bloc_event/screens/widgets/common_scaffold.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoardPage> with TickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  List<SeePhone> seePhoneList = seePhoneData();

  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    animation.addStatusListener((status) {});
    controller.forward();
  }

  _scaffold() =>
      CommonScaffold(appTitle: 'Flutter', bodyData: body(), showDrawer: true);

  body() => ListView.builder(
      itemCount: seePhoneList.length,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, position) {
        SeePhone seePhone = seePhoneList[position];

        return new SizeTransition(
            sizeFactor: animation,
            child: Center(
              child: Card(
                elevation: 0.5,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(colors: [
                      Colors.grey.withOpacity(0),
                      Colors.white.withOpacity(0.9)
                    ]),
                  ),
                  width: 160,
                  height: 160,
                  child: Center(
                      child: Text(seePhone.name,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: quickFont))),
                ),
              ),
            ));
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _scaffold());
  }
}

List<SeePhone> seePhoneData() {
  List<SeePhone> seePhone = new List<SeePhone>();
  seePhone.add(new SeePhone(id: 1, name: 'Phone Images'));
  seePhone.add(new SeePhone(id: 2, name: 'Active Warranty'));
  seePhone.add(new SeePhone(id: 3, name: 'Mobex'));

  return seePhone;
}
