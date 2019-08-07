import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_bloc_event/blocs/brand/brand_bloc.dart';
import 'package:module_bloc_event/blocs/brand/brand_state.dart';
import 'package:module_bloc_event/blocs/problem/problem_bloc.dart';
import 'package:module_bloc_event/blocs/problem/problem_state.dart';
import 'package:module_bloc_event/models/problem/problem_item.dart';
import 'package:module_bloc_event/screens/widgets/common_scaffold.dart';
import 'package:module_bloc_event/screens/widgets/custom_float_form.dart';

class ProblemTickPage extends StatefulWidget {
  @override
  _ProblemTickState createState() => _ProblemTickState();
}

class _ProblemTickState extends State<ProblemTickPage> {
  ProblemBloc problemBloc;
  BrandBloc brandBloc;

  initState() {
    super.initState();
    problemBloc = BlocProvider.of<ProblemBloc>(context);
    brandBloc = BlocProvider.of<BrandBloc>(context);

    problemBloc.getProblem();
    problemBloc.getProblemSelectedRs();
  }

  _scaffold() =>
      CommonScaffold(appTitle: 'Problem', bodyData: body(), showDrawer: false);

  body() => Column(children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
            child: Column(
              children: <Widget>[
                Text("No Matter Which Problem You Tick, We’ll Make It Click.",
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
                Container(margin: EdgeInsets.all(10)),
                Align(
                    child: BlocBuilder(
                        bloc: brandBloc,
                        builder: (context, BrandState state) {
                          return Text(
                              brandBloc.brandName + ' - ' + brandBloc.modelName,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black));
                        }),
                    alignment: Alignment.topCenter),
              ],
            )),
        Expanded(
            child: BlocBuilder(
                bloc: problemBloc,
                builder: (context, ProblemState state) {
                  return new ListView(
                      children: state.problems.map((ProblemItem problemItem) {
                    return Row(
                      children: <Widget>[
                        new Expanded(
                            child: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child: Text(problemItem.problemName,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: problemItem.isCheck
                                            ? Colors.black
                                            : problemItem.problemId == 1
                                                ? Colors.deepOrange
                                                : Colors.grey)))),
                        new Checkbox(
                            value: problemItem.isCheck,
                            onChanged: (bool value) {
                              setState(() {
                                if (problemItem.isReset == 1) {
                                  for (var problem in state.problems) {
                                    if (problem.isCheck)
                                      problem.isCheck = false;
                                  }
                                  problemItem.isCheck = value;
                                } else {
                                  for (var problem in state.problems) {
                                    if (problem.isReset == 1 &&
                                        !problem.isCheck)
                                      problemItem.isCheck = value;
                                  }
                                }
                                problemBloc.getProblemSelectedRs();
                              });
                            })
                      ],
                    );
                  }).toList());
                })),
        Container(
            padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 3),
            color: Colors.grey.withOpacity(0.1),
            child: BlocBuilder(
                bloc: problemBloc,
                builder: (context, ProblemState state) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                            'Total Rs. ' +
                                state.selectedSolveProblemRs.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Row(children: <Widget>[
                          new Expanded(child: _mobileTextField()),
                          _goSelectMobileIssues(state.problems),
                        ])
                      ]);
                }))
      ]);

  _mobileTextField() => TextField(
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.left,
      style: TextStyle(
          color: Colors.black54,
          fontFamily: 'quickFont',
          fontSize: 18,
          letterSpacing: 0.5),
      decoration: InputDecoration(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade200, width: 2)),
          errorStyle: TextStyle(color: Colors.black54),
          hintStyle: TextStyle(
            color: Colors.black54,
            fontFamily: 'quickFont',
            fontSize: 15,
          ),
          labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
          hintText: 'Mobile'));

  _goSelectMobileIssues(List<ProblemItem> problems) => Container(
      child: Align(
          alignment: Alignment.bottomCenter,
          child: CustomFloatForm(
              icon: Icons.navigate_next,
              isMini: false,
              qrCallback: () =>
                  Navigator.pushNamed(context, '/paymentoptionpage'))));

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _scaffold());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
