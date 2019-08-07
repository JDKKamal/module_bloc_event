import 'package:module_bloc_event/models/problem/problem_item.dart';

class ProblemState {
  final List<ProblemItem> problems;
  final double selectedSolveProblemRs;
  final List<String> problemsNameSelected;

  ProblemState({this.problems, this.selectedSolveProblemRs, this.problemsNameSelected});

  factory ProblemState.initial() {
    return ProblemState(
      problems: List<ProblemItem>(),
        selectedSolveProblemRs: 0.0,
        problemsNameSelected: List<String>()
    );
  }


  ProblemState copyWith(
      {List<ProblemItem> problems, double selectedSolveProblemRs, List<String> problemsNameSelected}) {
    return ProblemState(
        problems: problems ?? this.problems,
        selectedSolveProblemRs: selectedSolveProblemRs ?? this.selectedSolveProblemRs,
        problemsNameSelected : problemsNameSelected ?? this.problemsNameSelected);
  }
}
