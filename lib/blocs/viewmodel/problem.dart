import 'package:flutter/material.dart';
import 'package:module_bloc_event/models/drawer.dart';
import 'package:module_bloc_event/models/problem/problem_item.dart';

class ProblemViewModel {
  getProblemList() => <ProblemItem>[
        ProblemItem(
            problemId: 1,
            problemName: "Don't Know",
            problemSolveRs: 1,
            isReset: 1),
        ProblemItem(
            problemId: 2,
            problemName: "Battery Problem",
            problemSolveRs: 2,
            isReset: 0),
        ProblemItem(
            problemId: 3,
            problemName: "Front Camera not working",
            problemSolveRs: 3,
            isReset: 0),
        ProblemItem(
            problemId: 4,
            problemName: "Touch LCD Broken",
            problemSolveRs: 4,
            isReset: 0),
        ProblemItem(
            problemId: 5,
            problemName: "Back Cover",
            problemSolveRs: 5,
            isReset: 0),
        ProblemItem(
            problemId: 6,
            problemName: "Camera not working",
            problemSolveRs: 6,
            isReset: 0),
        ProblemItem(
            problemId: 7,
            problemName: "Speaker not working",
            problemSolveRs: 7,
            isReset: 0),
        ProblemItem(
            problemId: 8,
            problemName: "Software Issue",
            problemSolveRs: 8,
            isReset: 0),
      ];
}
