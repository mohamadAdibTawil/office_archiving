import 'package:flutter/foundation.dart';

import '../../models/section.dart';

abstract class SectionState {
  const SectionState();
}

class SectionInitial extends SectionState {
  const SectionInitial();
}

class SectionLoading extends SectionState {
  const SectionLoading();
}

class SectionLoaded extends SectionState {
  final List<Section> sections;

  const SectionLoaded(this.sections);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SectionLoaded && listEquals(other.sections, sections);
  }

  @override
  int get hashCode => sections.hashCode;
}

class SectionError extends SectionState {
  final String message;

  const SectionError(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SectionError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
