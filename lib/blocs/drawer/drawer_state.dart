import 'package:module_bloc_event/models/drawer.dart';

class DrawerState {
  final List<DrawerMenuResponse> drawers;

  DrawerState({
    this.drawers,
  });

  factory DrawerState.initial() {
    return DrawerState(
      drawers: List<DrawerMenuResponse>(),
    );
  }

  DrawerState copyWith({
    List<DrawerMenuResponse> drawers
  }) {
    return DrawerState(
      drawers: drawers ?? this.drawers,
    );
  }
}
