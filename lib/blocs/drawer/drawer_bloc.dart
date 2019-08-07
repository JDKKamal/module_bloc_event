import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:module_bloc_event/blocs/drawer/drawer_event.dart';
import 'package:module_bloc_event/blocs/drawer/drawer_state.dart';
import 'package:module_bloc_event/blocs/viewmodel/drawer_menu.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  void getDrawerMenu() {
    dispatch(GetDrawerMenu());
  }

  @override
  DrawerState get initialState => DrawerState.initial();

  @override
  Stream<DrawerState> mapEventToState(DrawerEvent event) async* {
    if (event is GetDrawerMenu) {
      final drawerMenuViewModel = DrawerMenuViewModel();
      yield currentState.copyWith(drawers: drawerMenuViewModel.getDrawerMenu());
    }
  }
}
