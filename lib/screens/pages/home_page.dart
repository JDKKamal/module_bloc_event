import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_bloc_event/blocs/brand/brand_bloc.dart';
import 'package:module_bloc_event/blocs/brand/brand_state.dart';
import 'package:module_bloc_event/models/brand/brand_item.dart';
import 'package:module_bloc_event/models/model/model_item.dart';
import 'package:module_bloc_event/screens/widgets/common_scaffold.dart';
import 'package:module_bloc_event/screens/widgets/custom_float_form.dart';
import 'package:module_bloc_event/screens/widgets/horizontal_line_progressbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> with TickerProviderStateMixin {
  BrandBloc brandBloc;

  initState() {
    super.initState();
    brandBloc = BlocProvider.of<BrandBloc>(context);

    if (brandBloc.currentState.loaded == false) {
      brandBloc.getBrand();
    }
  }

  body() => SafeArea(
          child: Column(
        children: <Widget>[
          BlocBuilder(
              bloc: brandBloc,
              builder: (context, BrandState state) {
                return Container(
                    child: Column(children: <Widget>[
                  // TODO LOADING
                  Container(
                    child: state.loading
                        ? HorizontalLineProgressBar()
                        : Container(),
                  ),

                  Container(
                      margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // TODO BRAND IMPLEMENT
                            InkWell(
                                child: Container(
                                    padding: EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: 10,
                                        bottom: 10),
                                    decoration: new BoxDecoration(
                                        border: new Border.all(
                                            color: Colors.black26)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('Select Brand',
                                            style: TextStyle(fontSize: 15)),
                                        Icon(Icons.arrow_drop_down,
                                            color: Colors.grey)
                                      ],
                                    )),
                                onTap: () {
                                  if (!state.loading)
                                    brandBottomSheet(
                                        state.brandResponse.brands);
                                }),
                            Text(state.brandName,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54)),

                            Container(margin: EdgeInsets.only(top: 20)),

                            // TODO MODEL IMPLEMENT
                            InkWell(
                                child: Container(
                                    padding: EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: 10,
                                        bottom: 10),
                                    decoration: new BoxDecoration(
                                        border: new Border.all(
                                            color: Colors.black26)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('Select Model',
                                            style: TextStyle(fontSize: 15)),
                                        Icon(Icons.arrow_drop_down,
                                            color: Colors.grey)
                                      ],
                                    )),
                                onTap: () {
                                  if (state.modelResponse.models.isNotEmpty)
                                    modelBottomSheet(
                                        state.modelResponse.models);
                                }),
                            Text(state.modelName,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54)),

                            _goSelectMobileIssues()
                          ]))
                ]));
              }),
        ],
      ));

  _goSelectMobileIssues() => Container(
      margin: EdgeInsets.all(20),
      child: Align(
          alignment: Alignment.bottomCenter,
          child: CustomFloatForm(
              icon: Icons.navigate_next,
              isMini: false,
              qrCallback: () =>
                Navigator.pushNamed(context, '/problemtickpage'))));

  brandBottomSheet(List<BrandItem> brands) => showModalBottomSheet(
      context: this.context,
      builder: (context) {
        return Container(
          color: Color(0xFF737373),
          child: Container(
            child: brandItemList(brands),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10),
              ),
            ),
          ),
        );
      });

  brandItemList(List<BrandItem> brands) => ListView.builder(
      itemCount: brands.length,
      itemBuilder: (context, position) {
        BrandItem brandItem = brands[position];
        return Material(
            child: InkWell(
                onTap: () {
                  brandBloc.brandInput(
                       brandItem.brandName.toLowerCase(),
                      brandItem.brandId);

                  brands.forEach((element) => element.isSelected = false);
                  brands[position].isSelected = true;

                  brandBloc.getModel();
                  Navigator.pop(this.context);
                },
                child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: new Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          new Container(
                            child: Icon(
                                brandItem.isSelected
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                color: brandItem.isSelected ? Colors.deepOrangeAccent : Colors.black45),
                          ),
                          new Container(
                            padding: new EdgeInsets.only(left: 10.0),
                            child: new Text(brandItem.brandName,
                                style: new TextStyle(
                                    fontSize: 14, color: Colors.black)),
                          )
                        ]))));
      });

  modelBottomSheet(List<ModelItem> models) => showModalBottomSheet(
      context: this.context,
      builder: (context) {
        return Container(
          color: Color(0xFF737373),
          child: Container(
            child: modelItemList(models),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10),
              ),
            ),
          ),
        );
      });

  modelItemList(List<ModelItem> models) => ListView.builder(
      itemCount: models.length,
      itemBuilder: (context, position) {
        ModelItem modelItem = models[position];
        return Material(
            child: InkWell(
                onTap: () {
                  brandBloc.modelInput(
                      modelItem.modelName.toLowerCase(),
                      modelItem.modelId);

                  models.forEach((element) => element.isSelected = false);
                  models[position].isSelected = true;
                  Navigator.pop(this.context);
                },
                child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: new Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          new Container(
                            child: Icon(
                                modelItem.isSelected
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                color: modelItem.isSelected ? Colors.deepOrangeAccent : Colors.black45),
                          ),
                          new Container(
                            margin: new EdgeInsets.only(left: 10.0),
                            child: new Text(modelItem.modelName,
                                style: new TextStyle(
                                    fontSize: 14, color: Colors.black)),
                          )
                        ]))));
      });

  _scaffold() =>
      CommonScaffold(appTitle: 'Flutter', bodyData: body(), showDrawer: true);

  @override
  Widget build(BuildContext context) {
    return _scaffold();
  }
}
