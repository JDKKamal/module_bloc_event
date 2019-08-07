import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:module_bloc_event/blocs/drawer/drawer_event.dart';
import 'package:module_bloc_event/blocs/drawer/drawer_state.dart';
import 'package:module_bloc_event/blocs/viewmodel/drawer_menu.dart';
import 'package:module_bloc_event/blocs/viewmodel/problem.dart';
import 'package:module_bloc_event/models/problem/problem_item.dart';

import 'problem_event.dart';
import 'problem_state.dart';

class ProblemBloc extends Bloc<ProblemEvent, ProblemState> {
  final problemViewModel = ProblemViewModel();

  void getProblem() {
    dispatch(GetProblem());
  }

  void getProblemSelectedRs() {
    dispatch(GetProblemSelectedRs());
  }

  void getGetProblemsSelectedName() {
    dispatch(GetProblemsSelectedName());
  }

  @override
  ProblemState get initialState => ProblemState.initial();

  @override
  Stream<ProblemState> mapEventToState(ProblemEvent event) async* {
    if (event is GetProblem) {
      yield currentState.copyWith(
          selectedSolveProblemRs: 0.0,
          problems: problemViewModel.getProblemList());
    }

    if (event is GetProblemSelectedRs) {
      double total = 0.0;
      List<ProblemItem> problems = currentState.problems;
     
      problems.forEach((ProblemItem problem) {
        if (problem.isCheck) {
          total += problem.problemSolveRs;
        }
      });
      yield currentState.copyWith(selectedSolveProblemRs: total);
    }

    if (event is GetProblemsSelectedName) {
      List<String> problemsName = new List<String>();
      List<ProblemItem> problems = currentState.problems;

      problems.forEach((ProblemItem problem) {
        if (problem.isCheck) {
          problemsName.add(problem.problemName);
        }
      });
      yield currentState.copyWith(problemsNameSelected: problemsName);
    }
  }
}
