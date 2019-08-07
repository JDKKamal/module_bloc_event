import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_bloc_event/blocs/brand/brand_bloc.dart';
import 'package:module_bloc_event/blocs/brand/brand_state.dart';
import 'package:module_bloc_event/blocs/problem/problem_bloc.dart';
import 'package:module_bloc_event/blocs/problem/problem_state.dart';
import 'package:module_bloc_event/models/problem/problem_item.dart';
import 'package:module_bloc_event/screens/widgets/common_scaffold.dart';
import 'package:module_bloc_event/screens/widgets/custom_float_form.dart';

class PaymentOptionCashAddressPage extends StatefulWidget {
  @override
  _PaymentOptionCashAddressState createState() =>
      _PaymentOptionCashAddressState();
}

class _PaymentOptionCashAddressState
    extends State<PaymentOptionCashAddressPage> {
  ProblemBloc problemBloc;
  BrandBloc brandBloc;
  initState() {
    super.initState();
    problemBloc = BlocProvider.of<ProblemBloc>(context);
    brandBloc = BlocProvider.of<BrandBloc>(context);

    problemBloc.getProblemSelectedRs();
    problemBloc.getGetProblemsSelectedName();
  }

  _scaffold() =>
      CommonScaffold(appTitle: 'Address', bodyData: body(), showDrawer: false);

  body() =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Container(
            child: BlocBuilder(
                bloc: problemBloc,
                builder: (context, ProblemState state) {
                  return Container(
                      margin: EdgeInsets.only(
                          top: 5, left: 10, right: 10, bottom: 0),
                      child: BlocBuilder(
                          bloc: brandBloc,
                          builder: (context, BrandState state) {
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                      "Now that’s our favourite pickup line: \nWhere do you want us to pick your phone?",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.grey)),
                                  Container(margin: EdgeInsets.all(10)),
                                  Text(
                                      'Mobile: ' +
                                          state.brandName +
                                          ' - ' +
                                          state.modelName,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  Container(margin: EdgeInsets.only(top: 5)),
                                ]);
                          }));
                })),
        Container(
            margin: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 1),
            child: BlocBuilder(
                bloc: problemBloc,
                builder: (context, ProblemState state) {
                  return Text('For: ' + state.problemsNameSelected.join(', '),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black));
                })),
        Container(
            margin: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 1),
            child: Row(children: <Widget>[
              Icon(Icons.person_outline, color: Colors.deepOrangeAccent),
              Text('  Personal Detail',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent))
            ])),
        Expanded(
          child: Container(
              margin: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 5),
              child: ListView(
                  children: <Widget>[
                    _nameTextField(),
                    _addressTextField(),
                    _stateTextField(),
                    _flatHouseNoTextField(),
                    _cityTextField(),
                    ])),
        ),
        Container(
            padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 3),
            color: Colors.grey.withOpacity(0.1),
            child: BlocBuilder(
                bloc: problemBloc,
                builder: (context, ProblemState state) {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                            'Total Rs. ' +
                                state.selectedSolveProblemRs.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        _goSelectMobileIssues(state.problems),
                      ]);
                }))
      ]);

  _nameTextField() => TextField(
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
          hintText: 'Name'));

  _addressTextField() => TextField(
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
          hintText: 'Address'));

  _stateTextField() => TextField(
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
          hintText: 'State'));

  _flatHouseNoTextField() => TextField(
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
          hintText: 'Flat No. / House No.'));

  _cityTextField() => TextField(
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
          hintText: 'City'));

  _goSelectMobileIssues(List<ProblemItem> problems) => Container(
      child: Align(
          alignment: Alignment.bottomCenter,
          child: CustomFloatForm(
              icon: Icons.navigate_next, isMini: true, qrCallback: () {})));

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
