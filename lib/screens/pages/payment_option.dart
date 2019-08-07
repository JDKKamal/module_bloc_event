import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_bloc_event/blocs/brand/brand_bloc.dart';
import 'package:module_bloc_event/blocs/brand/brand_state.dart';
import 'package:module_bloc_event/blocs/problem/problem_bloc.dart';
import 'package:module_bloc_event/blocs/problem/problem_state.dart';
import 'package:module_bloc_event/models/payment/paymentoption.dart';
import 'package:module_bloc_event/models/problem/problem_item.dart';
import 'package:module_bloc_event/screens/widgets/common_scaffold.dart';
import 'package:module_bloc_event/screens/widgets/custom_float_form.dart';

class PaymentOptionPage extends StatefulWidget {
  @override
  _PaymentOptionState createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOptionPage> {
  ProblemBloc problemBloc;
  BrandBloc brandBloc;
  PaymentOptionResponse paymentOptionGroupValue;
  List<PaymentOptionResponse> paymentOptions;
  initState() {
    super.initState();
    problemBloc = BlocProvider.of<ProblemBloc>(context);
    brandBloc = BlocProvider.of<BrandBloc>(context);

    problemBloc.getProblemSelectedRs();
    problemBloc.getGetProblemsSelectedName();

    paymentOptions = PaymentOptionResponse.paymentOptions();
  }

  _scaffold() => CommonScaffold(
      appTitle: 'Payment Option', bodyData: body(), showDrawer: false);

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
                                      "Free* pick-up and drop service 6-months mobex warranty on repair",
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
              Icon(Icons.payment, color: Colors.deepOrangeAccent),
              Text('  Payment Option',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent))
            ])),
        Expanded(
          child: paymentOptionItemList(paymentOptions),
        ),
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
          hintText: 'Pin Code'));

  _goSelectMobileIssues(List<ProblemItem> problems) => Container(
      child: Align(
          alignment: Alignment.bottomCenter,
          child: CustomFloatForm(
              icon: Icons.navigate_next,
              isMini: false,
              qrCallback: () {
                Navigator.pushNamed(
                    context, '/paymentoptioncashaddresspage');
              })));

  paymentOptionItemList(List<PaymentOptionResponse> paymentOptions) =>
      ListView.builder(
          itemCount: paymentOptions.length,
          itemBuilder: (context, position) {
            PaymentOptionResponse paymentOption = paymentOptions[position];
            return Material(
                child: InkWell(
                    onTap: () {
                      setState(() {
                        paymentOptions
                            .forEach((element) => element.isSelected = false);
                        paymentOptions[position].isSelected = true;
                      });
                    },
                    child: Container(
                        margin: const EdgeInsets.all(10.0),
                        child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Container(
                                child: Icon(
                                    paymentOption.isSelected
                                        ? Icons.radio_button_checked
                                        : Icons.radio_button_unchecked,
                                    color: paymentOption.isSelected
                                        ? Colors.deepOrangeAccent
                                        : Colors.black45),
                              ),
                              new Container(
                                padding: new EdgeInsets.only(left: 10.0),
                                child: new Text(paymentOption.paymentName,
                                    style: new TextStyle(
                                        fontSize: 14,
                                        color: paymentOption.isSelected
                                            ? Colors.black
                                            : Colors.grey)),
                              )
                            ]))));
          });

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
