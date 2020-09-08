import 'package:built_value/built_value.dart';

part 'player_state.g.dart';

abstract class PlayerState implements Built<PlayerState, PlayerStateBuilder> {
  bool get isRunning;

  PlayerState._();

  factory PlayerState([void Function(PlayerStateBuilder) updates]) =
      _$PlayerState;

  static void _initializeBuilder(PlayerStateBuilder builder) =>
      builder..isRunning = false;
}
