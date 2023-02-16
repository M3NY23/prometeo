part of 'process_bloc.dart';

abstract class ProcessEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FileSavePressed extends ProcessEvent {}

class BuildProjectPressed extends ProcessEvent {}

class RunProjectPressed extends ProcessEvent {}
