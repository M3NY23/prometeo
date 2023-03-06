part of 'game_bloc.dart';

class GameState extends Equatable {
  final Status status;
  final String label;

  const GameState({required this.status, required this.label});

  @override
  List<Object?> get props => [status, label];

  GameState copyWith({Status? status, String? label}) {
    return GameState(status: status ?? this.status, label: label ?? this.label);
  }
}
