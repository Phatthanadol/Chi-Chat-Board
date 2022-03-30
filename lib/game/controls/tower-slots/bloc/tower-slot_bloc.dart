import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:td_games/game/game.dart';
import 'package:td_games/game/models/tower-model.dart';

part 'tower-slot_event.dart';
part 'tower-slot_state.dart';

class TowerSlotBloc extends Bloc<TowerSlotEvent, TowerSlotState> {
  TowerSlotBloc() : super(const TowerSlotState.initial()) {
    on<TowerPick>(_onTowerPick);
  }

  void _onTowerPick(
    TowerPick event,
    Emitter<TowerSlotState> emit,
  ) {
    emit(
      state.copyWith(
        towers: [
          ...state.towers,
          event.tower,
        ],
      ),
    );
  }
}
