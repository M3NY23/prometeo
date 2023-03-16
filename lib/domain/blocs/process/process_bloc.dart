import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prometeo/data/providers/app_settings_provider.dart';
import 'package:prometeo/data/providers/current_game_provider.dart';
import 'package:prometeo/data/providers/local_database.dart';
import 'package:prometeo/data/repositories/game_repository.dart';
import 'package:prometeo/data/repositories/settings_repository.dart';
import 'package:prometeo/data/shared/status.dart';
import 'package:prometeo/domain/runner/game_runner.dart';
import 'package:prometeo/gui/util/icon_kyes.dart';

part 'process_event.dart';
part 'process_state.dart';

class ProcessBloc extends Bloc<ProcessEvent, ProcessState> {
  GameRepository gameRepository = GameRepository();
  SettingsRepository settingsRepository = SettingsRepository();
  ProcessBloc() : super(const ProcessState(status: Status.initial, label: "")) {
    on<InitialEvent>(_onInitial);
    on<FileSavePressed>(_onFileSavePressed);
    on<BuildProjectPressed>(_onBuildProjectPressed);
    on<RunProjectPressed>(_onRunProjectPressed);
  }

  _onInitial(InitialEvent event, Emitter emit) async {
    try {
      debugPrint("initial event");
      emit.call(const ProcessState(
          status: Status.loading,
          label: "creating project",
          iconKey: IconKeys.building,
          useProgressIndicator: true));
      await LocalDatabase.init();
      bool success = await CurrentGameProvider.init() ?? false;
      success &= await AppSettingsProvider.init() ?? false;
      if (success) {
        emit.call(const ProcessState(
            status: Status.success,
            label: "Project started",
            iconKey: IconKeys.success));
      } else {
        throw Exception();
      }
    } catch (ex) {
      debugPrint("$ex");
      emit.call(const ProcessState(
          status: Status.failure,
          label: "Initialization failed",
          iconKey: IconKeys.failure));
    }
  }

  _onBuildProjectPressed(BuildProjectPressed event, Emitter emit) async {
    try {
      emit.call(const ProcessState(
          status: Status.building,
          label: "Building project",
          iconKey: IconKeys.building,
          useProgressIndicator: true));
      await Future.delayed(const Duration(milliseconds: 1500));
      emit.call(const ProcessState(
          status: Status.success,
          label: "Project built",
          iconKey: IconKeys.success));
      await Future.delayed(const Duration(milliseconds: 500));
      emit.call(state.copyWith(label: ""));
    } catch (ex) {
      emit.call(const ProcessState(
          status: Status.failure,
          label: "Build failed",
          iconKey: IconKeys.failure));
    }
  }

  _onFileSavePressed(FileSavePressed event, Emitter emit) async {
    try {
      emit.call(const ProcessState(
          status: Status.saving,
          label: "Saving File",
          useProgressIndicator: true));
      await Future.delayed(const Duration(milliseconds: 500));
      emit.call(const ProcessState(
          status: Status.success,
          label: "File saved",
          iconKey: IconKeys.success));
      await Future.delayed(const Duration(milliseconds: 500));
      emit.call(state.copyWith(label: ""));
    } catch (ex) {
      emit.call(const ProcessState(
          status: Status.failure,
          label: "File save failed",
          iconKey: IconKeys.failure));
    }
  }

  FutureOr<void> _onRunProjectPressed(
      RunProjectPressed event, Emitter<ProcessState> emit) async {
    try {
      emit.call(const ProcessState(
          status: Status.loading,
          label: "Running",
          iconKey: IconKeys.running,
          useProgressIndicator: true));
      GameRunner runner =
          GameRunner(tempPath: settingsRepository.getTempPath());
      await runner.createTempProject();
      await runner.runGame();
      await Future.delayed(const Duration(milliseconds: 2500));
      emit.call(const ProcessState(status: Status.success, label: ""));
    } catch (ex) {
      debugPrint("$ex");
      emit.call(const ProcessState(
          status: Status.failure,
          label: "Run project failed",
          iconKey: IconKeys.failure));
    }
  }
}
