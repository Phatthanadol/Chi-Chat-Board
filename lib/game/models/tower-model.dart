enum TowerSlot {
  firstslot,
  secondslot,
  thirdslot,
  forthslot,
  fifthslot,
}

enum Tower {
  teslacoil,
  rocket,
  turret,
}

extension TowerEquipped on Tower {
  List<TowerSlot> get slots {
    switch (this) {
      case Tower.teslacoil:
      case Tower.rocket:
      case Tower.turret:
        return const [
          TowerSlot.firstslot,
          TowerSlot.secondslot,
          TowerSlot.thirdslot,
          TowerSlot.forthslot,
          TowerSlot.fifthslot
        ];
    }
  }
}
