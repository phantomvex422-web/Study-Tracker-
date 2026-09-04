// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SubjectsTable extends Subjects with TableInfo<$SubjectsTable, Subject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _examDateMeta = const VerificationMeta(
    'examDate',
  );
  @override
  late final GeneratedColumn<DateTime> examDate = GeneratedColumn<DateTime>(
    'exam_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, examDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subjects';
  @override
  VerificationContext validateIntegrity(
    Insertable<Subject> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('exam_date')) {
      context.handle(
        _examDateMeta,
        examDate.isAcceptableOrUnknown(data['exam_date']!, _examDateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Subject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subject(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      examDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}exam_date'],
      ),
    );
  }

  @override
  $SubjectsTable createAlias(String alias) {
    return $SubjectsTable(attachedDatabase, alias);
  }
}

class Subject extends DataClass implements Insertable<Subject> {
  final int id;
  final String name;
  final DateTime? examDate;
  const Subject({required this.id, required this.name, this.examDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || examDate != null) {
      map['exam_date'] = Variable<DateTime>(examDate);
    }
    return map;
  }

  SubjectsCompanion toCompanion(bool nullToAbsent) {
    return SubjectsCompanion(
      id: Value(id),
      name: Value(name),
      examDate: examDate == null && nullToAbsent
          ? const Value.absent()
          : Value(examDate),
    );
  }

  factory Subject.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subject(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      examDate: serializer.fromJson<DateTime?>(json['examDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'examDate': serializer.toJson<DateTime?>(examDate),
    };
  }

  Subject copyWith({
    int? id,
    String? name,
    Value<DateTime?> examDate = const Value.absent(),
  }) => Subject(
    id: id ?? this.id,
    name: name ?? this.name,
    examDate: examDate.present ? examDate.value : this.examDate,
  );
  Subject copyWithCompanion(SubjectsCompanion data) {
    return Subject(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      examDate: data.examDate.present ? data.examDate.value : this.examDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Subject(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('examDate: $examDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, examDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subject &&
          other.id == this.id &&
          other.name == this.name &&
          other.examDate == this.examDate);
}

class SubjectsCompanion extends UpdateCompanion<Subject> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime?> examDate;
  const SubjectsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.examDate = const Value.absent(),
  });
  SubjectsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.examDate = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Subject> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? examDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (examDate != null) 'exam_date': examDate,
    });
  }

  SubjectsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<DateTime?>? examDate,
  }) {
    return SubjectsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      examDate: examDate ?? this.examDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (examDate.present) {
      map['exam_date'] = Variable<DateTime>(examDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('examDate: $examDate')
          ..write(')'))
        .toString();
  }
}

class $TopicsTable extends Topics with TableInfo<$TopicsTable, Topic> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TopicsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _subjectIdMeta = const VerificationMeta(
    'subjectId',
  );
  @override
  late final GeneratedColumn<int> subjectId = GeneratedColumn<int>(
    'subject_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES subjects (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedMeta = const VerificationMeta(
    'completed',
  );
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
    'completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _completedDateMeta = const VerificationMeta(
    'completedDate',
  );
  @override
  late final GeneratedColumn<DateTime> completedDate =
      GeneratedColumn<DateTime>(
        'completed_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _reviewStageMeta = const VerificationMeta(
    'reviewStage',
  );
  @override
  late final GeneratedColumn<int> reviewStage = GeneratedColumn<int>(
    'review_stage',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _nextReviewDateMeta = const VerificationMeta(
    'nextReviewDate',
  );
  @override
  late final GeneratedColumn<DateTime> nextReviewDate =
      GeneratedColumn<DateTime>(
        'next_review_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _manualEstimateMinutesMeta =
      const VerificationMeta('manualEstimateMinutes');
  @override
  late final GeneratedColumn<int> manualEstimateMinutes = GeneratedColumn<int>(
    'manual_estimate_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    subjectId,
    name,
    completed,
    completedDate,
    reviewStage,
    nextReviewDate,
    manualEstimateMinutes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'topics';
  @override
  VerificationContext validateIntegrity(
    Insertable<Topic> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('subject_id')) {
      context.handle(
        _subjectIdMeta,
        subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_subjectIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(
        _completedMeta,
        completed.isAcceptableOrUnknown(data['completed']!, _completedMeta),
      );
    }
    if (data.containsKey('completed_date')) {
      context.handle(
        _completedDateMeta,
        completedDate.isAcceptableOrUnknown(
          data['completed_date']!,
          _completedDateMeta,
        ),
      );
    }
    if (data.containsKey('review_stage')) {
      context.handle(
        _reviewStageMeta,
        reviewStage.isAcceptableOrUnknown(
          data['review_stage']!,
          _reviewStageMeta,
        ),
      );
    }
    if (data.containsKey('next_review_date')) {
      context.handle(
        _nextReviewDateMeta,
        nextReviewDate.isAcceptableOrUnknown(
          data['next_review_date']!,
          _nextReviewDateMeta,
        ),
      );
    }
    if (data.containsKey('manual_estimate_minutes')) {
      context.handle(
        _manualEstimateMinutesMeta,
        manualEstimateMinutes.isAcceptableOrUnknown(
          data['manual_estimate_minutes']!,
          _manualEstimateMinutesMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Topic map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Topic(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      subjectId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subject_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      completed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}completed'],
      )!,
      completedDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_date'],
      ),
      reviewStage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}review_stage'],
      )!,
      nextReviewDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_review_date'],
      ),
      manualEstimateMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}manual_estimate_minutes'],
      ),
    );
  }

  @override
  $TopicsTable createAlias(String alias) {
    return $TopicsTable(attachedDatabase, alias);
  }
}

class Topic extends DataClass implements Insertable<Topic> {
  final int id;
  final int subjectId;
  final String name;
  final bool completed;
  final DateTime? completedDate;
  final int reviewStage;
  final DateTime? nextReviewDate;
  final int? manualEstimateMinutes;
  const Topic({
    required this.id,
    required this.subjectId,
    required this.name,
    required this.completed,
    this.completedDate,
    required this.reviewStage,
    this.nextReviewDate,
    this.manualEstimateMinutes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['subject_id'] = Variable<int>(subjectId);
    map['name'] = Variable<String>(name);
    map['completed'] = Variable<bool>(completed);
    if (!nullToAbsent || completedDate != null) {
      map['completed_date'] = Variable<DateTime>(completedDate);
    }
    map['review_stage'] = Variable<int>(reviewStage);
    if (!nullToAbsent || nextReviewDate != null) {
      map['next_review_date'] = Variable<DateTime>(nextReviewDate);
    }
    if (!nullToAbsent || manualEstimateMinutes != null) {
      map['manual_estimate_minutes'] = Variable<int>(manualEstimateMinutes);
    }
    return map;
  }

  TopicsCompanion toCompanion(bool nullToAbsent) {
    return TopicsCompanion(
      id: Value(id),
      subjectId: Value(subjectId),
      name: Value(name),
      completed: Value(completed),
      completedDate: completedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(completedDate),
      reviewStage: Value(reviewStage),
      nextReviewDate: nextReviewDate == null && nullToAbsent
          ? const Value.absent()
          : Value(nextReviewDate),
      manualEstimateMinutes: manualEstimateMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(manualEstimateMinutes),
    );
  }

  factory Topic.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Topic(
      id: serializer.fromJson<int>(json['id']),
      subjectId: serializer.fromJson<int>(json['subjectId']),
      name: serializer.fromJson<String>(json['name']),
      completed: serializer.fromJson<bool>(json['completed']),
      completedDate: serializer.fromJson<DateTime?>(json['completedDate']),
      reviewStage: serializer.fromJson<int>(json['reviewStage']),
      nextReviewDate: serializer.fromJson<DateTime?>(json['nextReviewDate']),
      manualEstimateMinutes: serializer.fromJson<int?>(
        json['manualEstimateMinutes'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'subjectId': serializer.toJson<int>(subjectId),
      'name': serializer.toJson<String>(name),
      'completed': serializer.toJson<bool>(completed),
      'completedDate': serializer.toJson<DateTime?>(completedDate),
      'reviewStage': serializer.toJson<int>(reviewStage),
      'nextReviewDate': serializer.toJson<DateTime?>(nextReviewDate),
      'manualEstimateMinutes': serializer.toJson<int?>(manualEstimateMinutes),
    };
  }

  Topic copyWith({
    int? id,
    int? subjectId,
    String? name,
    bool? completed,
    Value<DateTime?> completedDate = const Value.absent(),
    int? reviewStage,
    Value<DateTime?> nextReviewDate = const Value.absent(),
    Value<int?> manualEstimateMinutes = const Value.absent(),
  }) => Topic(
    id: id ?? this.id,
    subjectId: subjectId ?? this.subjectId,
    name: name ?? this.name,
    completed: completed ?? this.completed,
    completedDate: completedDate.present
        ? completedDate.value
        : this.completedDate,
    reviewStage: reviewStage ?? this.reviewStage,
    nextReviewDate: nextReviewDate.present
        ? nextReviewDate.value
        : this.nextReviewDate,
    manualEstimateMinutes: manualEstimateMinutes.present
        ? manualEstimateMinutes.value
        : this.manualEstimateMinutes,
  );
  Topic copyWithCompanion(TopicsCompanion data) {
    return Topic(
      id: data.id.present ? data.id.value : this.id,
      subjectId: data.subjectId.present ? data.subjectId.value : this.subjectId,
      name: data.name.present ? data.name.value : this.name,
      completed: data.completed.present ? data.completed.value : this.completed,
      completedDate: data.completedDate.present
          ? data.completedDate.value
          : this.completedDate,
      reviewStage: data.reviewStage.present
          ? data.reviewStage.value
          : this.reviewStage,
      nextReviewDate: data.nextReviewDate.present
          ? data.nextReviewDate.value
          : this.nextReviewDate,
      manualEstimateMinutes: data.manualEstimateMinutes.present
          ? data.manualEstimateMinutes.value
          : this.manualEstimateMinutes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Topic(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('name: $name, ')
          ..write('completed: $completed, ')
          ..write('completedDate: $completedDate, ')
          ..write('reviewStage: $reviewStage, ')
          ..write('nextReviewDate: $nextReviewDate, ')
          ..write('manualEstimateMinutes: $manualEstimateMinutes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    subjectId,
    name,
    completed,
    completedDate,
    reviewStage,
    nextReviewDate,
    manualEstimateMinutes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Topic &&
          other.id == this.id &&
          other.subjectId == this.subjectId &&
          other.name == this.name &&
          other.completed == this.completed &&
          other.completedDate == this.completedDate &&
          other.reviewStage == this.reviewStage &&
          other.nextReviewDate == this.nextReviewDate &&
          other.manualEstimateMinutes == this.manualEstimateMinutes);
}

class TopicsCompanion extends UpdateCompanion<Topic> {
  final Value<int> id;
  final Value<int> subjectId;
  final Value<String> name;
  final Value<bool> completed;
  final Value<DateTime?> completedDate;
  final Value<int> reviewStage;
  final Value<DateTime?> nextReviewDate;
  final Value<int?> manualEstimateMinutes;
  const TopicsCompanion({
    this.id = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.name = const Value.absent(),
    this.completed = const Value.absent(),
    this.completedDate = const Value.absent(),
    this.reviewStage = const Value.absent(),
    this.nextReviewDate = const Value.absent(),
    this.manualEstimateMinutes = const Value.absent(),
  });
  TopicsCompanion.insert({
    this.id = const Value.absent(),
    required int subjectId,
    required String name,
    this.completed = const Value.absent(),
    this.completedDate = const Value.absent(),
    this.reviewStage = const Value.absent(),
    this.nextReviewDate = const Value.absent(),
    this.manualEstimateMinutes = const Value.absent(),
  }) : subjectId = Value(subjectId),
       name = Value(name);
  static Insertable<Topic> custom({
    Expression<int>? id,
    Expression<int>? subjectId,
    Expression<String>? name,
    Expression<bool>? completed,
    Expression<DateTime>? completedDate,
    Expression<int>? reviewStage,
    Expression<DateTime>? nextReviewDate,
    Expression<int>? manualEstimateMinutes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subjectId != null) 'subject_id': subjectId,
      if (name != null) 'name': name,
      if (completed != null) 'completed': completed,
      if (completedDate != null) 'completed_date': completedDate,
      if (reviewStage != null) 'review_stage': reviewStage,
      if (nextReviewDate != null) 'next_review_date': nextReviewDate,
      if (manualEstimateMinutes != null)
        'manual_estimate_minutes': manualEstimateMinutes,
    });
  }

  TopicsCompanion copyWith({
    Value<int>? id,
    Value<int>? subjectId,
    Value<String>? name,
    Value<bool>? completed,
    Value<DateTime?>? completedDate,
    Value<int>? reviewStage,
    Value<DateTime?>? nextReviewDate,
    Value<int?>? manualEstimateMinutes,
  }) {
    return TopicsCompanion(
      id: id ?? this.id,
      subjectId: subjectId ?? this.subjectId,
      name: name ?? this.name,
      completed: completed ?? this.completed,
      completedDate: completedDate ?? this.completedDate,
      reviewStage: reviewStage ?? this.reviewStage,
      nextReviewDate: nextReviewDate ?? this.nextReviewDate,
      manualEstimateMinutes:
          manualEstimateMinutes ?? this.manualEstimateMinutes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<int>(subjectId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (completedDate.present) {
      map['completed_date'] = Variable<DateTime>(completedDate.value);
    }
    if (reviewStage.present) {
      map['review_stage'] = Variable<int>(reviewStage.value);
    }
    if (nextReviewDate.present) {
      map['next_review_date'] = Variable<DateTime>(nextReviewDate.value);
    }
    if (manualEstimateMinutes.present) {
      map['manual_estimate_minutes'] = Variable<int>(
        manualEstimateMinutes.value,
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TopicsCompanion(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('name: $name, ')
          ..write('completed: $completed, ')
          ..write('completedDate: $completedDate, ')
          ..write('reviewStage: $reviewStage, ')
          ..write('nextReviewDate: $nextReviewDate, ')
          ..write('manualEstimateMinutes: $manualEstimateMinutes')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deadlineMeta = const VerificationMeta(
    'deadline',
  );
  @override
  late final GeneratedColumn<DateTime> deadline = GeneratedColumn<DateTime>(
    'deadline',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _subjectIdMeta = const VerificationMeta(
    'subjectId',
  );
  @override
  late final GeneratedColumn<int> subjectId = GeneratedColumn<int>(
    'subject_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES subjects (id)',
    ),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('open'),
  );
  static const VerificationMeta _estimatedDurationMinutesMeta =
      const VerificationMeta('estimatedDurationMinutes');
  @override
  late final GeneratedColumn<int> estimatedDurationMinutes =
      GeneratedColumn<int>(
        'estimated_duration_minutes',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    deadline,
    priority,
    subjectId,
    status,
    estimatedDurationMinutes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Task> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('deadline')) {
      context.handle(
        _deadlineMeta,
        deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta),
      );
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    }
    if (data.containsKey('subject_id')) {
      context.handle(
        _subjectIdMeta,
        subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('estimated_duration_minutes')) {
      context.handle(
        _estimatedDurationMinutesMeta,
        estimatedDurationMinutes.isAcceptableOrUnknown(
          data['estimated_duration_minutes']!,
          _estimatedDurationMinutesMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      deadline: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deadline'],
      ),
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}priority'],
      )!,
      subjectId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subject_id'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      estimatedDurationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}estimated_duration_minutes'],
      ),
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String title;
  final DateTime? deadline;
  final int priority;
  final int? subjectId;
  final String status;
  final int? estimatedDurationMinutes;
  const Task({
    required this.id,
    required this.title,
    this.deadline,
    required this.priority,
    this.subjectId,
    required this.status,
    this.estimatedDurationMinutes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || deadline != null) {
      map['deadline'] = Variable<DateTime>(deadline);
    }
    map['priority'] = Variable<int>(priority);
    if (!nullToAbsent || subjectId != null) {
      map['subject_id'] = Variable<int>(subjectId);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || estimatedDurationMinutes != null) {
      map['estimated_duration_minutes'] = Variable<int>(
        estimatedDurationMinutes,
      );
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      title: Value(title),
      deadline: deadline == null && nullToAbsent
          ? const Value.absent()
          : Value(deadline),
      priority: Value(priority),
      subjectId: subjectId == null && nullToAbsent
          ? const Value.absent()
          : Value(subjectId),
      status: Value(status),
      estimatedDurationMinutes: estimatedDurationMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(estimatedDurationMinutes),
    );
  }

  factory Task.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      deadline: serializer.fromJson<DateTime?>(json['deadline']),
      priority: serializer.fromJson<int>(json['priority']),
      subjectId: serializer.fromJson<int?>(json['subjectId']),
      status: serializer.fromJson<String>(json['status']),
      estimatedDurationMinutes: serializer.fromJson<int?>(
        json['estimatedDurationMinutes'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'deadline': serializer.toJson<DateTime?>(deadline),
      'priority': serializer.toJson<int>(priority),
      'subjectId': serializer.toJson<int?>(subjectId),
      'status': serializer.toJson<String>(status),
      'estimatedDurationMinutes': serializer.toJson<int?>(
        estimatedDurationMinutes,
      ),
    };
  }

  Task copyWith({
    int? id,
    String? title,
    Value<DateTime?> deadline = const Value.absent(),
    int? priority,
    Value<int?> subjectId = const Value.absent(),
    String? status,
    Value<int?> estimatedDurationMinutes = const Value.absent(),
  }) => Task(
    id: id ?? this.id,
    title: title ?? this.title,
    deadline: deadline.present ? deadline.value : this.deadline,
    priority: priority ?? this.priority,
    subjectId: subjectId.present ? subjectId.value : this.subjectId,
    status: status ?? this.status,
    estimatedDurationMinutes: estimatedDurationMinutes.present
        ? estimatedDurationMinutes.value
        : this.estimatedDurationMinutes,
  );
  Task copyWithCompanion(TasksCompanion data) {
    return Task(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      deadline: data.deadline.present ? data.deadline.value : this.deadline,
      priority: data.priority.present ? data.priority.value : this.priority,
      subjectId: data.subjectId.present ? data.subjectId.value : this.subjectId,
      status: data.status.present ? data.status.value : this.status,
      estimatedDurationMinutes: data.estimatedDurationMinutes.present
          ? data.estimatedDurationMinutes.value
          : this.estimatedDurationMinutes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('deadline: $deadline, ')
          ..write('priority: $priority, ')
          ..write('subjectId: $subjectId, ')
          ..write('status: $status, ')
          ..write('estimatedDurationMinutes: $estimatedDurationMinutes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    deadline,
    priority,
    subjectId,
    status,
    estimatedDurationMinutes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.title == this.title &&
          other.deadline == this.deadline &&
          other.priority == this.priority &&
          other.subjectId == this.subjectId &&
          other.status == this.status &&
          other.estimatedDurationMinutes == this.estimatedDurationMinutes);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> title;
  final Value<DateTime?> deadline;
  final Value<int> priority;
  final Value<int?> subjectId;
  final Value<String> status;
  final Value<int?> estimatedDurationMinutes;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.deadline = const Value.absent(),
    this.priority = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.status = const Value.absent(),
    this.estimatedDurationMinutes = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.deadline = const Value.absent(),
    this.priority = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.status = const Value.absent(),
    this.estimatedDurationMinutes = const Value.absent(),
  }) : title = Value(title);
  static Insertable<Task> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<DateTime>? deadline,
    Expression<int>? priority,
    Expression<int>? subjectId,
    Expression<String>? status,
    Expression<int>? estimatedDurationMinutes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (deadline != null) 'deadline': deadline,
      if (priority != null) 'priority': priority,
      if (subjectId != null) 'subject_id': subjectId,
      if (status != null) 'status': status,
      if (estimatedDurationMinutes != null)
        'estimated_duration_minutes': estimatedDurationMinutes,
    });
  }

  TasksCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<DateTime?>? deadline,
    Value<int>? priority,
    Value<int?>? subjectId,
    Value<String>? status,
    Value<int?>? estimatedDurationMinutes,
  }) {
    return TasksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      deadline: deadline ?? this.deadline,
      priority: priority ?? this.priority,
      subjectId: subjectId ?? this.subjectId,
      status: status ?? this.status,
      estimatedDurationMinutes:
          estimatedDurationMinutes ?? this.estimatedDurationMinutes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime>(deadline.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<int>(subjectId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (estimatedDurationMinutes.present) {
      map['estimated_duration_minutes'] = Variable<int>(
        estimatedDurationMinutes.value,
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('deadline: $deadline, ')
          ..write('priority: $priority, ')
          ..write('subjectId: $subjectId, ')
          ..write('status: $status, ')
          ..write('estimatedDurationMinutes: $estimatedDurationMinutes')
          ..write(')'))
        .toString();
  }
}

class $StudySessionsTable extends StudySessions
    with TableInfo<$StudySessionsTable, StudySession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudySessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _subjectIdMeta = const VerificationMeta(
    'subjectId',
  );
  @override
  late final GeneratedColumn<int> subjectId = GeneratedColumn<int>(
    'subject_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES subjects (id)',
    ),
  );
  static const VerificationMeta _topicIdMeta = const VerificationMeta(
    'topicId',
  );
  @override
  late final GeneratedColumn<int> topicId = GeneratedColumn<int>(
    'topic_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES topics (id)',
    ),
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
    'end_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationMinutesMeta = const VerificationMeta(
    'durationMinutes',
  );
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
    'duration_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    subjectId,
    topicId,
    startTime,
    endTime,
    durationMinutes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'study_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<StudySession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('subject_id')) {
      context.handle(
        _subjectIdMeta,
        subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta),
      );
    }
    if (data.containsKey('topic_id')) {
      context.handle(
        _topicIdMeta,
        topicId.isAcceptableOrUnknown(data['topic_id']!, _topicIdMeta),
      );
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
        _durationMinutesMeta,
        durationMinutes.isAcceptableOrUnknown(
          data['duration_minutes']!,
          _durationMinutesMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudySession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudySession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      subjectId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subject_id'],
      ),
      topicId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}topic_id'],
      ),
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_time'],
      )!,
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_time'],
      ),
      durationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_minutes'],
      )!,
    );
  }

  @override
  $StudySessionsTable createAlias(String alias) {
    return $StudySessionsTable(attachedDatabase, alias);
  }
}

class StudySession extends DataClass implements Insertable<StudySession> {
  final int id;
  final int? subjectId;
  final int? topicId;
  final DateTime startTime;
  final DateTime? endTime;
  final int durationMinutes;
  const StudySession({
    required this.id,
    this.subjectId,
    this.topicId,
    required this.startTime,
    this.endTime,
    required this.durationMinutes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || subjectId != null) {
      map['subject_id'] = Variable<int>(subjectId);
    }
    if (!nullToAbsent || topicId != null) {
      map['topic_id'] = Variable<int>(topicId);
    }
    map['start_time'] = Variable<DateTime>(startTime);
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<DateTime>(endTime);
    }
    map['duration_minutes'] = Variable<int>(durationMinutes);
    return map;
  }

  StudySessionsCompanion toCompanion(bool nullToAbsent) {
    return StudySessionsCompanion(
      id: Value(id),
      subjectId: subjectId == null && nullToAbsent
          ? const Value.absent()
          : Value(subjectId),
      topicId: topicId == null && nullToAbsent
          ? const Value.absent()
          : Value(topicId),
      startTime: Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      durationMinutes: Value(durationMinutes),
    );
  }

  factory StudySession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudySession(
      id: serializer.fromJson<int>(json['id']),
      subjectId: serializer.fromJson<int?>(json['subjectId']),
      topicId: serializer.fromJson<int?>(json['topicId']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime?>(json['endTime']),
      durationMinutes: serializer.fromJson<int>(json['durationMinutes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'subjectId': serializer.toJson<int?>(subjectId),
      'topicId': serializer.toJson<int?>(topicId),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime?>(endTime),
      'durationMinutes': serializer.toJson<int>(durationMinutes),
    };
  }

  StudySession copyWith({
    int? id,
    Value<int?> subjectId = const Value.absent(),
    Value<int?> topicId = const Value.absent(),
    DateTime? startTime,
    Value<DateTime?> endTime = const Value.absent(),
    int? durationMinutes,
  }) => StudySession(
    id: id ?? this.id,
    subjectId: subjectId.present ? subjectId.value : this.subjectId,
    topicId: topicId.present ? topicId.value : this.topicId,
    startTime: startTime ?? this.startTime,
    endTime: endTime.present ? endTime.value : this.endTime,
    durationMinutes: durationMinutes ?? this.durationMinutes,
  );
  StudySession copyWithCompanion(StudySessionsCompanion data) {
    return StudySession(
      id: data.id.present ? data.id.value : this.id,
      subjectId: data.subjectId.present ? data.subjectId.value : this.subjectId,
      topicId: data.topicId.present ? data.topicId.value : this.topicId,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudySession(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('topicId: $topicId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('durationMinutes: $durationMinutes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, subjectId, topicId, startTime, endTime, durationMinutes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudySession &&
          other.id == this.id &&
          other.subjectId == this.subjectId &&
          other.topicId == this.topicId &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.durationMinutes == this.durationMinutes);
}

class StudySessionsCompanion extends UpdateCompanion<StudySession> {
  final Value<int> id;
  final Value<int?> subjectId;
  final Value<int?> topicId;
  final Value<DateTime> startTime;
  final Value<DateTime?> endTime;
  final Value<int> durationMinutes;
  const StudySessionsCompanion({
    this.id = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.topicId = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.durationMinutes = const Value.absent(),
  });
  StudySessionsCompanion.insert({
    this.id = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.topicId = const Value.absent(),
    required DateTime startTime,
    this.endTime = const Value.absent(),
    this.durationMinutes = const Value.absent(),
  }) : startTime = Value(startTime);
  static Insertable<StudySession> custom({
    Expression<int>? id,
    Expression<int>? subjectId,
    Expression<int>? topicId,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<int>? durationMinutes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subjectId != null) 'subject_id': subjectId,
      if (topicId != null) 'topic_id': topicId,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
    });
  }

  StudySessionsCompanion copyWith({
    Value<int>? id,
    Value<int?>? subjectId,
    Value<int?>? topicId,
    Value<DateTime>? startTime,
    Value<DateTime?>? endTime,
    Value<int>? durationMinutes,
  }) {
    return StudySessionsCompanion(
      id: id ?? this.id,
      subjectId: subjectId ?? this.subjectId,
      topicId: topicId ?? this.topicId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      durationMinutes: durationMinutes ?? this.durationMinutes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<int>(subjectId.value);
    }
    if (topicId.present) {
      map['topic_id'] = Variable<int>(topicId.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudySessionsCompanion(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('topicId: $topicId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('durationMinutes: $durationMinutes')
          ..write(')'))
        .toString();
  }
}

class $SettingsTableTable extends SettingsTable
    with TableInfo<$SettingsTableTable, SettingsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _pomodoroLengthMeta = const VerificationMeta(
    'pomodoroLength',
  );
  @override
  late final GeneratedColumn<int> pomodoroLength = GeneratedColumn<int>(
    'pomodoro_length',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(25),
  );
  static const VerificationMeta _breakLengthMeta = const VerificationMeta(
    'breakLength',
  );
  @override
  late final GeneratedColumn<int> breakLength = GeneratedColumn<int>(
    'break_length',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(5),
  );
  static const VerificationMeta _reviewIntervalsMeta = const VerificationMeta(
    'reviewIntervals',
  );
  @override
  late final GeneratedColumn<String> reviewIntervals = GeneratedColumn<String>(
    'review_intervals',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('1,3,7'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pomodoroLength,
    breakLength,
    reviewIntervals,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SettingsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pomodoro_length')) {
      context.handle(
        _pomodoroLengthMeta,
        pomodoroLength.isAcceptableOrUnknown(
          data['pomodoro_length']!,
          _pomodoroLengthMeta,
        ),
      );
    }
    if (data.containsKey('break_length')) {
      context.handle(
        _breakLengthMeta,
        breakLength.isAcceptableOrUnknown(
          data['break_length']!,
          _breakLengthMeta,
        ),
      );
    }
    if (data.containsKey('review_intervals')) {
      context.handle(
        _reviewIntervalsMeta,
        reviewIntervals.isAcceptableOrUnknown(
          data['review_intervals']!,
          _reviewIntervalsMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SettingsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      pomodoroLength: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pomodoro_length'],
      )!,
      breakLength: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}break_length'],
      )!,
      reviewIntervals: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}review_intervals'],
      )!,
    );
  }

  @override
  $SettingsTableTable createAlias(String alias) {
    return $SettingsTableTable(attachedDatabase, alias);
  }
}

class SettingsTableData extends DataClass
    implements Insertable<SettingsTableData> {
  final int id;
  final int pomodoroLength;
  final int breakLength;
  final String reviewIntervals;
  const SettingsTableData({
    required this.id,
    required this.pomodoroLength,
    required this.breakLength,
    required this.reviewIntervals,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pomodoro_length'] = Variable<int>(pomodoroLength);
    map['break_length'] = Variable<int>(breakLength);
    map['review_intervals'] = Variable<String>(reviewIntervals);
    return map;
  }

  SettingsTableCompanion toCompanion(bool nullToAbsent) {
    return SettingsTableCompanion(
      id: Value(id),
      pomodoroLength: Value(pomodoroLength),
      breakLength: Value(breakLength),
      reviewIntervals: Value(reviewIntervals),
    );
  }

  factory SettingsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingsTableData(
      id: serializer.fromJson<int>(json['id']),
      pomodoroLength: serializer.fromJson<int>(json['pomodoroLength']),
      breakLength: serializer.fromJson<int>(json['breakLength']),
      reviewIntervals: serializer.fromJson<String>(json['reviewIntervals']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pomodoroLength': serializer.toJson<int>(pomodoroLength),
      'breakLength': serializer.toJson<int>(breakLength),
      'reviewIntervals': serializer.toJson<String>(reviewIntervals),
    };
  }

  SettingsTableData copyWith({
    int? id,
    int? pomodoroLength,
    int? breakLength,
    String? reviewIntervals,
  }) => SettingsTableData(
    id: id ?? this.id,
    pomodoroLength: pomodoroLength ?? this.pomodoroLength,
    breakLength: breakLength ?? this.breakLength,
    reviewIntervals: reviewIntervals ?? this.reviewIntervals,
  );
  SettingsTableData copyWithCompanion(SettingsTableCompanion data) {
    return SettingsTableData(
      id: data.id.present ? data.id.value : this.id,
      pomodoroLength: data.pomodoroLength.present
          ? data.pomodoroLength.value
          : this.pomodoroLength,
      breakLength: data.breakLength.present
          ? data.breakLength.value
          : this.breakLength,
      reviewIntervals: data.reviewIntervals.present
          ? data.reviewIntervals.value
          : this.reviewIntervals,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingsTableData(')
          ..write('id: $id, ')
          ..write('pomodoroLength: $pomodoroLength, ')
          ..write('breakLength: $breakLength, ')
          ..write('reviewIntervals: $reviewIntervals')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, pomodoroLength, breakLength, reviewIntervals);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingsTableData &&
          other.id == this.id &&
          other.pomodoroLength == this.pomodoroLength &&
          other.breakLength == this.breakLength &&
          other.reviewIntervals == this.reviewIntervals);
}

class SettingsTableCompanion extends UpdateCompanion<SettingsTableData> {
  final Value<int> id;
  final Value<int> pomodoroLength;
  final Value<int> breakLength;
  final Value<String> reviewIntervals;
  const SettingsTableCompanion({
    this.id = const Value.absent(),
    this.pomodoroLength = const Value.absent(),
    this.breakLength = const Value.absent(),
    this.reviewIntervals = const Value.absent(),
  });
  SettingsTableCompanion.insert({
    this.id = const Value.absent(),
    this.pomodoroLength = const Value.absent(),
    this.breakLength = const Value.absent(),
    this.reviewIntervals = const Value.absent(),
  });
  static Insertable<SettingsTableData> custom({
    Expression<int>? id,
    Expression<int>? pomodoroLength,
    Expression<int>? breakLength,
    Expression<String>? reviewIntervals,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pomodoroLength != null) 'pomodoro_length': pomodoroLength,
      if (breakLength != null) 'break_length': breakLength,
      if (reviewIntervals != null) 'review_intervals': reviewIntervals,
    });
  }

  SettingsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? pomodoroLength,
    Value<int>? breakLength,
    Value<String>? reviewIntervals,
  }) {
    return SettingsTableCompanion(
      id: id ?? this.id,
      pomodoroLength: pomodoroLength ?? this.pomodoroLength,
      breakLength: breakLength ?? this.breakLength,
      reviewIntervals: reviewIntervals ?? this.reviewIntervals,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pomodoroLength.present) {
      map['pomodoro_length'] = Variable<int>(pomodoroLength.value);
    }
    if (breakLength.present) {
      map['break_length'] = Variable<int>(breakLength.value);
    }
    if (reviewIntervals.present) {
      map['review_intervals'] = Variable<String>(reviewIntervals.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('pomodoroLength: $pomodoroLength, ')
          ..write('breakLength: $breakLength, ')
          ..write('reviewIntervals: $reviewIntervals')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SubjectsTable subjects = $SubjectsTable(this);
  late final $TopicsTable topics = $TopicsTable(this);
  late final $TasksTable tasks = $TasksTable(this);
  late final $StudySessionsTable studySessions = $StudySessionsTable(this);
  late final $SettingsTableTable settingsTable = $SettingsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    subjects,
    topics,
    tasks,
    studySessions,
    settingsTable,
  ];
}

typedef $$SubjectsTableCreateCompanionBuilder =
    SubjectsCompanion Function({
      Value<int> id,
      required String name,
      Value<DateTime?> examDate,
    });
typedef $$SubjectsTableUpdateCompanionBuilder =
    SubjectsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<DateTime?> examDate,
    });

final class $$SubjectsTableReferences
    extends BaseReferences<_$AppDatabase, $SubjectsTable, Subject> {
  $$SubjectsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TopicsTable, List<Topic>> _topicsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.topics,
    aliasName: 'subjects__id__topics__subject_id',
  );

  $$TopicsTableProcessedTableManager get topicsRefs {
    final manager = $$TopicsTableTableManager(
      $_db,
      $_db.topics,
    ).filter((f) => f.subjectId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_topicsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TasksTable, List<Task>> _tasksRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.tasks,
    aliasName: 'subjects__id__tasks__subject_id',
  );

  $$TasksTableProcessedTableManager get tasksRefs {
    final manager = $$TasksTableTableManager(
      $_db,
      $_db.tasks,
    ).filter((f) => f.subjectId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_tasksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$StudySessionsTable, List<StudySession>>
  _studySessionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.studySessions,
    aliasName: 'subjects__id__study_sessions__subject_id',
  );

  $$StudySessionsTableProcessedTableManager get studySessionsRefs {
    final manager = $$StudySessionsTableTableManager(
      $_db,
      $_db.studySessions,
    ).filter((f) => f.subjectId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_studySessionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SubjectsTableFilterComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get examDate => $composableBuilder(
    column: $table.examDate,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> topicsRefs(
    Expression<bool> Function($$TopicsTableFilterComposer f) f,
  ) {
    final $$TopicsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.subjectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableFilterComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> tasksRefs(
    Expression<bool> Function($$TasksTableFilterComposer f) f,
  ) {
    final $$TasksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.subjectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableFilterComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> studySessionsRefs(
    Expression<bool> Function($$StudySessionsTableFilterComposer f) f,
  ) {
    final $$StudySessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.studySessions,
      getReferencedColumn: (t) => t.subjectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudySessionsTableFilterComposer(
            $db: $db,
            $table: $db.studySessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SubjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get examDate => $composableBuilder(
    column: $table.examDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SubjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get examDate =>
      $composableBuilder(column: $table.examDate, builder: (column) => column);

  Expression<T> topicsRefs<T extends Object>(
    Expression<T> Function($$TopicsTableAnnotationComposer a) f,
  ) {
    final $$TopicsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.subjectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableAnnotationComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> tasksRefs<T extends Object>(
    Expression<T> Function($$TasksTableAnnotationComposer a) f,
  ) {
    final $$TasksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.subjectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableAnnotationComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> studySessionsRefs<T extends Object>(
    Expression<T> Function($$StudySessionsTableAnnotationComposer a) f,
  ) {
    final $$StudySessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.studySessions,
      getReferencedColumn: (t) => t.subjectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudySessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.studySessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SubjectsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SubjectsTable,
          Subject,
          $$SubjectsTableFilterComposer,
          $$SubjectsTableOrderingComposer,
          $$SubjectsTableAnnotationComposer,
          $$SubjectsTableCreateCompanionBuilder,
          $$SubjectsTableUpdateCompanionBuilder,
          (Subject, $$SubjectsTableReferences),
          Subject,
          PrefetchHooks Function({
            bool topicsRefs,
            bool tasksRefs,
            bool studySessionsRefs,
          })
        > {
  $$SubjectsTableTableManager(_$AppDatabase db, $SubjectsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime?> examDate = const Value.absent(),
              }) => SubjectsCompanion(id: id, name: name, examDate: examDate),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<DateTime?> examDate = const Value.absent(),
              }) => SubjectsCompanion.insert(
                id: id,
                name: name,
                examDate: examDate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SubjectsTable, Subject>(table),
                  $$SubjectsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                topicsRefs = false,
                tasksRefs = false,
                studySessionsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (topicsRefs) db.topics,
                    if (tasksRefs) db.tasks,
                    if (studySessionsRefs) db.studySessions,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (topicsRefs)
                        await $_getPrefetchedData<
                          Subject,
                          $SubjectsTable,
                          Topic
                        >(
                          currentTable: table,
                          referencedTable: $$SubjectsTableReferences
                              ._topicsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SubjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).topicsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.subjectId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (tasksRefs)
                        await $_getPrefetchedData<
                          Subject,
                          $SubjectsTable,
                          Task
                        >(
                          currentTable: table,
                          referencedTable: $$SubjectsTableReferences
                              ._tasksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SubjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).tasksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.subjectId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (studySessionsRefs)
                        await $_getPrefetchedData<
                          Subject,
                          $SubjectsTable,
                          StudySession
                        >(
                          currentTable: table,
                          referencedTable: $$SubjectsTableReferences
                              ._studySessionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SubjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).studySessionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.subjectId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SubjectsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SubjectsTable,
      Subject,
      $$SubjectsTableFilterComposer,
      $$SubjectsTableOrderingComposer,
      $$SubjectsTableAnnotationComposer,
      $$SubjectsTableCreateCompanionBuilder,
      $$SubjectsTableUpdateCompanionBuilder,
      (Subject, $$SubjectsTableReferences),
      Subject,
      PrefetchHooks Function({
        bool topicsRefs,
        bool tasksRefs,
        bool studySessionsRefs,
      })
    >;
typedef $$TopicsTableCreateCompanionBuilder =
    TopicsCompanion Function({
      Value<int> id,
      required int subjectId,
      required String name,
      Value<bool> completed,
      Value<DateTime?> completedDate,
      Value<int> reviewStage,
      Value<DateTime?> nextReviewDate,
      Value<int?> manualEstimateMinutes,
    });
typedef $$TopicsTableUpdateCompanionBuilder =
    TopicsCompanion Function({
      Value<int> id,
      Value<int> subjectId,
      Value<String> name,
      Value<bool> completed,
      Value<DateTime?> completedDate,
      Value<int> reviewStage,
      Value<DateTime?> nextReviewDate,
      Value<int?> manualEstimateMinutes,
    });

final class $$TopicsTableReferences
    extends BaseReferences<_$AppDatabase, $TopicsTable, Topic> {
  $$TopicsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SubjectsTable _subjectIdTable(_$AppDatabase db) =>
      db.subjects.createAlias('topics__subject_id__subjects__id');

  $$SubjectsTableProcessedTableManager get subjectId {
    final $_column = $_itemColumn<int>('subject_id')!;

    final manager = $$SubjectsTableTableManager(
      $_db,
      $_db.subjects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_subjectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$StudySessionsTable, List<StudySession>>
  _studySessionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.studySessions,
    aliasName: 'topics__id__study_sessions__topic_id',
  );

  $$StudySessionsTableProcessedTableManager get studySessionsRefs {
    final manager = $$StudySessionsTableTableManager(
      $_db,
      $_db.studySessions,
    ).filter((f) => f.topicId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_studySessionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TopicsTableFilterComposer
    extends Composer<_$AppDatabase, $TopicsTable> {
  $$TopicsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedDate => $composableBuilder(
    column: $table.completedDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reviewStage => $composableBuilder(
    column: $table.reviewStage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextReviewDate => $composableBuilder(
    column: $table.nextReviewDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get manualEstimateMinutes => $composableBuilder(
    column: $table.manualEstimateMinutes,
    builder: (column) => ColumnFilters(column),
  );

  $$SubjectsTableFilterComposer get subjectId {
    final $$SubjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectId,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableFilterComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> studySessionsRefs(
    Expression<bool> Function($$StudySessionsTableFilterComposer f) f,
  ) {
    final $$StudySessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.studySessions,
      getReferencedColumn: (t) => t.topicId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudySessionsTableFilterComposer(
            $db: $db,
            $table: $db.studySessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TopicsTableOrderingComposer
    extends Composer<_$AppDatabase, $TopicsTable> {
  $$TopicsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedDate => $composableBuilder(
    column: $table.completedDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reviewStage => $composableBuilder(
    column: $table.reviewStage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextReviewDate => $composableBuilder(
    column: $table.nextReviewDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get manualEstimateMinutes => $composableBuilder(
    column: $table.manualEstimateMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  $$SubjectsTableOrderingComposer get subjectId {
    final $$SubjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectId,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableOrderingComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TopicsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TopicsTable> {
  $$TopicsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);

  GeneratedColumn<DateTime> get completedDate => $composableBuilder(
    column: $table.completedDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get reviewStage => $composableBuilder(
    column: $table.reviewStage,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get nextReviewDate => $composableBuilder(
    column: $table.nextReviewDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get manualEstimateMinutes => $composableBuilder(
    column: $table.manualEstimateMinutes,
    builder: (column) => column,
  );

  $$SubjectsTableAnnotationComposer get subjectId {
    final $$SubjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectId,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> studySessionsRefs<T extends Object>(
    Expression<T> Function($$StudySessionsTableAnnotationComposer a) f,
  ) {
    final $$StudySessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.studySessions,
      getReferencedColumn: (t) => t.topicId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudySessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.studySessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TopicsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TopicsTable,
          Topic,
          $$TopicsTableFilterComposer,
          $$TopicsTableOrderingComposer,
          $$TopicsTableAnnotationComposer,
          $$TopicsTableCreateCompanionBuilder,
          $$TopicsTableUpdateCompanionBuilder,
          (Topic, $$TopicsTableReferences),
          Topic,
          PrefetchHooks Function({bool subjectId, bool studySessionsRefs})
        > {
  $$TopicsTableTableManager(_$AppDatabase db, $TopicsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TopicsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TopicsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TopicsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> subjectId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> completed = const Value.absent(),
                Value<DateTime?> completedDate = const Value.absent(),
                Value<int> reviewStage = const Value.absent(),
                Value<DateTime?> nextReviewDate = const Value.absent(),
                Value<int?> manualEstimateMinutes = const Value.absent(),
              }) => TopicsCompanion(
                id: id,
                subjectId: subjectId,
                name: name,
                completed: completed,
                completedDate: completedDate,
                reviewStage: reviewStage,
                nextReviewDate: nextReviewDate,
                manualEstimateMinutes: manualEstimateMinutes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int subjectId,
                required String name,
                Value<bool> completed = const Value.absent(),
                Value<DateTime?> completedDate = const Value.absent(),
                Value<int> reviewStage = const Value.absent(),
                Value<DateTime?> nextReviewDate = const Value.absent(),
                Value<int?> manualEstimateMinutes = const Value.absent(),
              }) => TopicsCompanion.insert(
                id: id,
                subjectId: subjectId,
                name: name,
                completed: completed,
                completedDate: completedDate,
                reviewStage: reviewStage,
                nextReviewDate: nextReviewDate,
                manualEstimateMinutes: manualEstimateMinutes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TopicsTable, Topic>(table),
                  $$TopicsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({subjectId = false, studySessionsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (studySessionsRefs) db.studySessions,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (subjectId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.subjectId,
                                    referencedTable: $$TopicsTableReferences
                                        ._subjectIdTable(db),
                                    referencedColumn: $$TopicsTableReferences
                                        ._subjectIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (studySessionsRefs)
                        await $_getPrefetchedData<
                          Topic,
                          $TopicsTable,
                          StudySession
                        >(
                          currentTable: table,
                          referencedTable: $$TopicsTableReferences
                              ._studySessionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TopicsTableReferences(
                                db,
                                table,
                                p0,
                              ).studySessionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.topicId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TopicsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TopicsTable,
      Topic,
      $$TopicsTableFilterComposer,
      $$TopicsTableOrderingComposer,
      $$TopicsTableAnnotationComposer,
      $$TopicsTableCreateCompanionBuilder,
      $$TopicsTableUpdateCompanionBuilder,
      (Topic, $$TopicsTableReferences),
      Topic,
      PrefetchHooks Function({bool subjectId, bool studySessionsRefs})
    >;
typedef $$TasksTableCreateCompanionBuilder =
    TasksCompanion Function({
      Value<int> id,
      required String title,
      Value<DateTime?> deadline,
      Value<int> priority,
      Value<int?> subjectId,
      Value<String> status,
      Value<int?> estimatedDurationMinutes,
    });
typedef $$TasksTableUpdateCompanionBuilder =
    TasksCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<DateTime?> deadline,
      Value<int> priority,
      Value<int?> subjectId,
      Value<String> status,
      Value<int?> estimatedDurationMinutes,
    });

final class $$TasksTableReferences
    extends BaseReferences<_$AppDatabase, $TasksTable, Task> {
  $$TasksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SubjectsTable _subjectIdTable(_$AppDatabase db) =>
      db.subjects.createAlias('tasks__subject_id__subjects__id');

  $$SubjectsTableProcessedTableManager? get subjectId {
    final $_column = $_itemColumn<int>('subject_id');
    if ($_column == null) return null;
    final manager = $$SubjectsTableTableManager(
      $_db,
      $_db.subjects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_subjectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TasksTableFilterComposer extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deadline => $composableBuilder(
    column: $table.deadline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get estimatedDurationMinutes => $composableBuilder(
    column: $table.estimatedDurationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  $$SubjectsTableFilterComposer get subjectId {
    final $$SubjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectId,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableFilterComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTableOrderingComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deadline => $composableBuilder(
    column: $table.deadline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get estimatedDurationMinutes => $composableBuilder(
    column: $table.estimatedDurationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  $$SubjectsTableOrderingComposer get subjectId {
    final $$SubjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectId,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableOrderingComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get deadline =>
      $composableBuilder(column: $table.deadline, builder: (column) => column);

  GeneratedColumn<int> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get estimatedDurationMinutes => $composableBuilder(
    column: $table.estimatedDurationMinutes,
    builder: (column) => column,
  );

  $$SubjectsTableAnnotationComposer get subjectId {
    final $$SubjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectId,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TasksTable,
          Task,
          $$TasksTableFilterComposer,
          $$TasksTableOrderingComposer,
          $$TasksTableAnnotationComposer,
          $$TasksTableCreateCompanionBuilder,
          $$TasksTableUpdateCompanionBuilder,
          (Task, $$TasksTableReferences),
          Task,
          PrefetchHooks Function({bool subjectId})
        > {
  $$TasksTableTableManager(_$AppDatabase db, $TasksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<DateTime?> deadline = const Value.absent(),
                Value<int> priority = const Value.absent(),
                Value<int?> subjectId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int?> estimatedDurationMinutes = const Value.absent(),
              }) => TasksCompanion(
                id: id,
                title: title,
                deadline: deadline,
                priority: priority,
                subjectId: subjectId,
                status: status,
                estimatedDurationMinutes: estimatedDurationMinutes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<DateTime?> deadline = const Value.absent(),
                Value<int> priority = const Value.absent(),
                Value<int?> subjectId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int?> estimatedDurationMinutes = const Value.absent(),
              }) => TasksCompanion.insert(
                id: id,
                title: title,
                deadline: deadline,
                priority: priority,
                subjectId: subjectId,
                status: status,
                estimatedDurationMinutes: estimatedDurationMinutes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TasksTable, Task>(table),
                  $$TasksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({subjectId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (subjectId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.subjectId,
                                referencedTable: $$TasksTableReferences
                                    ._subjectIdTable(db),
                                referencedColumn: $$TasksTableReferences
                                    ._subjectIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TasksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TasksTable,
      Task,
      $$TasksTableFilterComposer,
      $$TasksTableOrderingComposer,
      $$TasksTableAnnotationComposer,
      $$TasksTableCreateCompanionBuilder,
      $$TasksTableUpdateCompanionBuilder,
      (Task, $$TasksTableReferences),
      Task,
      PrefetchHooks Function({bool subjectId})
    >;
typedef $$StudySessionsTableCreateCompanionBuilder =
    StudySessionsCompanion Function({
      Value<int> id,
      Value<int?> subjectId,
      Value<int?> topicId,
      required DateTime startTime,
      Value<DateTime?> endTime,
      Value<int> durationMinutes,
    });
typedef $$StudySessionsTableUpdateCompanionBuilder =
    StudySessionsCompanion Function({
      Value<int> id,
      Value<int?> subjectId,
      Value<int?> topicId,
      Value<DateTime> startTime,
      Value<DateTime?> endTime,
      Value<int> durationMinutes,
    });

final class $$StudySessionsTableReferences
    extends BaseReferences<_$AppDatabase, $StudySessionsTable, StudySession> {
  $$StudySessionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SubjectsTable _subjectIdTable(_$AppDatabase db) =>
      db.subjects.createAlias('study_sessions__subject_id__subjects__id');

  $$SubjectsTableProcessedTableManager? get subjectId {
    final $_column = $_itemColumn<int>('subject_id');
    if ($_column == null) return null;
    final manager = $$SubjectsTableTableManager(
      $_db,
      $_db.subjects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_subjectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TopicsTable _topicIdTable(_$AppDatabase db) =>
      db.topics.createAlias('study_sessions__topic_id__topics__id');

  $$TopicsTableProcessedTableManager? get topicId {
    final $_column = $_itemColumn<int>('topic_id');
    if ($_column == null) return null;
    final manager = $$TopicsTableTableManager(
      $_db,
      $_db.topics,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_topicIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$StudySessionsTableFilterComposer
    extends Composer<_$AppDatabase, $StudySessionsTable> {
  $$StudySessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  $$SubjectsTableFilterComposer get subjectId {
    final $$SubjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectId,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableFilterComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TopicsTableFilterComposer get topicId {
    final $$TopicsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableFilterComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StudySessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $StudySessionsTable> {
  $$StudySessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  $$SubjectsTableOrderingComposer get subjectId {
    final $$SubjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectId,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableOrderingComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TopicsTableOrderingComposer get topicId {
    final $$TopicsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableOrderingComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StudySessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudySessionsTable> {
  $$StudySessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => column,
  );

  $$SubjectsTableAnnotationComposer get subjectId {
    final $$SubjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectId,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TopicsTableAnnotationComposer get topicId {
    final $$TopicsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableAnnotationComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StudySessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StudySessionsTable,
          StudySession,
          $$StudySessionsTableFilterComposer,
          $$StudySessionsTableOrderingComposer,
          $$StudySessionsTableAnnotationComposer,
          $$StudySessionsTableCreateCompanionBuilder,
          $$StudySessionsTableUpdateCompanionBuilder,
          (StudySession, $$StudySessionsTableReferences),
          StudySession,
          PrefetchHooks Function({bool subjectId, bool topicId})
        > {
  $$StudySessionsTableTableManager(_$AppDatabase db, $StudySessionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudySessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudySessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudySessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> subjectId = const Value.absent(),
                Value<int?> topicId = const Value.absent(),
                Value<DateTime> startTime = const Value.absent(),
                Value<DateTime?> endTime = const Value.absent(),
                Value<int> durationMinutes = const Value.absent(),
              }) => StudySessionsCompanion(
                id: id,
                subjectId: subjectId,
                topicId: topicId,
                startTime: startTime,
                endTime: endTime,
                durationMinutes: durationMinutes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> subjectId = const Value.absent(),
                Value<int?> topicId = const Value.absent(),
                required DateTime startTime,
                Value<DateTime?> endTime = const Value.absent(),
                Value<int> durationMinutes = const Value.absent(),
              }) => StudySessionsCompanion.insert(
                id: id,
                subjectId: subjectId,
                topicId: topicId,
                startTime: startTime,
                endTime: endTime,
                durationMinutes: durationMinutes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$StudySessionsTable, StudySession>(table),
                  $$StudySessionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({subjectId = false, topicId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (subjectId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.subjectId,
                                referencedTable: $$StudySessionsTableReferences
                                    ._subjectIdTable(db),
                                referencedColumn: $$StudySessionsTableReferences
                                    ._subjectIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (topicId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.topicId,
                                referencedTable: $$StudySessionsTableReferences
                                    ._topicIdTable(db),
                                referencedColumn: $$StudySessionsTableReferences
                                    ._topicIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$StudySessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StudySessionsTable,
      StudySession,
      $$StudySessionsTableFilterComposer,
      $$StudySessionsTableOrderingComposer,
      $$StudySessionsTableAnnotationComposer,
      $$StudySessionsTableCreateCompanionBuilder,
      $$StudySessionsTableUpdateCompanionBuilder,
      (StudySession, $$StudySessionsTableReferences),
      StudySession,
      PrefetchHooks Function({bool subjectId, bool topicId})
    >;
typedef $$SettingsTableTableCreateCompanionBuilder =
    SettingsTableCompanion Function({
      Value<int> id,
      Value<int> pomodoroLength,
      Value<int> breakLength,
      Value<String> reviewIntervals,
    });
typedef $$SettingsTableTableUpdateCompanionBuilder =
    SettingsTableCompanion Function({
      Value<int> id,
      Value<int> pomodoroLength,
      Value<int> breakLength,
      Value<String> reviewIntervals,
    });

class $$SettingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTableTable> {
  $$SettingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pomodoroLength => $composableBuilder(
    column: $table.pomodoroLength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get breakLength => $composableBuilder(
    column: $table.breakLength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reviewIntervals => $composableBuilder(
    column: $table.reviewIntervals,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTableTable> {
  $$SettingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pomodoroLength => $composableBuilder(
    column: $table.pomodoroLength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get breakLength => $composableBuilder(
    column: $table.breakLength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reviewIntervals => $composableBuilder(
    column: $table.reviewIntervals,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTableTable> {
  $$SettingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get pomodoroLength => $composableBuilder(
    column: $table.pomodoroLength,
    builder: (column) => column,
  );

  GeneratedColumn<int> get breakLength => $composableBuilder(
    column: $table.breakLength,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reviewIntervals => $composableBuilder(
    column: $table.reviewIntervals,
    builder: (column) => column,
  );
}

class $$SettingsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTableTable,
          SettingsTableData,
          $$SettingsTableTableFilterComposer,
          $$SettingsTableTableOrderingComposer,
          $$SettingsTableTableAnnotationComposer,
          $$SettingsTableTableCreateCompanionBuilder,
          $$SettingsTableTableUpdateCompanionBuilder,
          (
            SettingsTableData,
            BaseReferences<
              _$AppDatabase,
              $SettingsTableTable,
              SettingsTableData
            >,
          ),
          SettingsTableData,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableTableManager(_$AppDatabase db, $SettingsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> pomodoroLength = const Value.absent(),
                Value<int> breakLength = const Value.absent(),
                Value<String> reviewIntervals = const Value.absent(),
              }) => SettingsTableCompanion(
                id: id,
                pomodoroLength: pomodoroLength,
                breakLength: breakLength,
                reviewIntervals: reviewIntervals,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> pomodoroLength = const Value.absent(),
                Value<int> breakLength = const Value.absent(),
                Value<String> reviewIntervals = const Value.absent(),
              }) => SettingsTableCompanion.insert(
                id: id,
                pomodoroLength: pomodoroLength,
                breakLength: breakLength,
                reviewIntervals: reviewIntervals,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SettingsTableTable, SettingsTableData>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $SettingsTableTable,
                    SettingsTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTableTable,
      SettingsTableData,
      $$SettingsTableTableFilterComposer,
      $$SettingsTableTableOrderingComposer,
      $$SettingsTableTableAnnotationComposer,
      $$SettingsTableTableCreateCompanionBuilder,
      $$SettingsTableTableUpdateCompanionBuilder,
      (
        SettingsTableData,
        BaseReferences<_$AppDatabase, $SettingsTableTable, SettingsTableData>,
      ),
      SettingsTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SubjectsTableTableManager get subjects =>
      $$SubjectsTableTableManager(_db, _db.subjects);
  $$TopicsTableTableManager get topics =>
      $$TopicsTableTableManager(_db, _db.topics);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db, _db.tasks);
  $$StudySessionsTableTableManager get studySessions =>
      $$StudySessionsTableTableManager(_db, _db.studySessions);
  $$SettingsTableTableTableManager get settingsTable =>
      $$SettingsTableTableTableManager(_db, _db.settingsTable);
}
