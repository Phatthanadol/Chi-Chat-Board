part of 'tower-slot_bloc.dart';

abstract class TowerSlotEvent extends Equatable {
  const TowerSlotEvent();
}

class TowerPick extends TowerSlotEvent {
  const TowerPick(this.tower);

  final Tower tower;

  @override
  List<Object?> get props => [tower];
}
