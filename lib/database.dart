import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'database.g.dart';

// ---- TABLES ----

class Subjects extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get examDate => dateTime().nullable()();
}

class Topics extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get subjectId => integer().references(Subjects, #id)();
  TextColumn get name => text()();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
  DateTimeColumn get completedDate => dateTime().nullable()();
  IntColumn get reviewStage => integer().withDefault(const Constant(0))();
  DateTimeColumn get nextReviewDate => dateTime().nullable()();
  IntColumn get manualEstimateMinutes => integer().nullable()();
}

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  DateTimeColumn get deadline => dateTime().nullable()();
  IntColumn get priority => integer().withDefault(const Constant(0))();
  IntColumn get subjectId => integer().nullable().references(Subjects, #id)();
  TextColumn get status => text().withDefault(const Constant('open'))();
  IntColumn get estimatedDurationMinutes => integer().nullable()();
}

class StudySessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get subjectId => integer().nullable().references(Subjects, #id)();
  IntColumn get topicId => integer().nullable().references(Topics, #id)();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime().nullable()();
  IntColumn get durationMinutes => integer().withDefault(const Constant(0))();
}

class SettingsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get pomodoroLength => integer().withDefault(const Constant(25))();
  IntColumn get breakLength => integer().withDefault(const Constant(5))();
  TextColumn get reviewIntervals =>
      text().withDefault(const Constant('1,3,7'))();
}

// ---- DATABASE ----

@DriftDatabase(tables: [Subjects, Topics, Tasks, StudySessions, SettingsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

QueryExecutor _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'study_tracker.sqlite'));
    return NativeDatabase(file);
  });
}
