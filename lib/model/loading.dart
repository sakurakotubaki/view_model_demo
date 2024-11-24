import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'loading.freezed.dart';
part 'loading.g.dart';

// loadingのState class
@freezed
class LoadingState with _$LoadingState {
  const factory LoadingState({
    @Default(false) bool isLoading,
  }) = _LoadingState;

  factory LoadingState.fromJson(Map<String, Object?> json)
      => _$LoadingStateFromJson(json);
}