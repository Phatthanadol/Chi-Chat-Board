part of 'tower-slot_bloc.dart';

class TowerSlotState extends Equatable {
  const TowerSlotState({
    required this.towers,
  });

  const TowerSlotState.initial() : this(towers: const []);

  final List<Tower> towers;

  @override
  List<Object> get props => [towers];

  TowerSlotState copyWith({
    List<Tower>? towers,
  }) {
    return TowerSlotState(towers: towers ?? this.towers);
  }
}
