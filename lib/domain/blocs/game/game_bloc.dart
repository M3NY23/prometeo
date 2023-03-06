import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prometeo/data/shared/status.dart';

part 'game_state.dart';
part 'game_event.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(const GameState(status: Status.initial, label: "")) {
    on<NewGameCreated>(_onNewGameCreated);
  }
  _onNewGameCreated(NewGameCreated event, Emitter emit) async {}
}
