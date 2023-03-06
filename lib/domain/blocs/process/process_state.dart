part of 'process_bloc.dart';

class ProcessState extends Equatable {
  final Status status;
  final String label;
  final String? iconKey;
  final bool useProgressIndicator;
  const ProcessState({
    required this.status,
    required this.label,
    this.iconKey,
    this.useProgressIndicator = false,
  });

  @override
  List<Object?> get props => [status, label, useProgressIndicator, iconKey];

  ProcessState copyWith({Status? status, String? label}) {
    return ProcessState(
        status: status ?? this.status, label: label ?? this.label);
  }
}
