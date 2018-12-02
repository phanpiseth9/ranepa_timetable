/* Copyright 2018 Rejish Radhakrishnan

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License. */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ranepa_timetable/timetable_lesson.dart';
import 'package:ranepa_timetable/timetable_teacher.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timeline_model.g.dart';

@JsonSerializable(nullable: false)
class TimelineModel {
  final LessonModel lesson;
  final int room;

  final DateTime date;

  final String group;
  final TeacherModel teacher;

  @JsonKey(fromJson: _timeOfDayFromIntList, toJson: _timeOfDayToIntList)
  final TimeOfDay start, finish;

  static TimeOfDay _timeOfDayFromIntList(List<int> intList) =>
      TimeOfDay(hour: intList[0], minute: intList[1]);

  static List<int> _timeOfDayToIntList(TimeOfDay timeOfDay) =>
      [timeOfDay.hour, timeOfDay.minute];

  const TimelineModel({
    @required this.date,
    @required this.start,
    @required this.finish,
    @required this.room,
    @required this.group,
    @required this.lesson,
    @required this.teacher,
  });

  factory TimelineModel.fromJson(Map<String, dynamic> json) =>
      _$TimelineModelFromJson(json);

  Map<String, dynamic> toJson() => _$TimelineModelToJson(this);
}