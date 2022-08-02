class Activity {
  int? id;
  int walking = 0;
  int sleeping = 0;
  int heartRate = 0;
  double waterConsumed = 0.0;

  Activity(
      {this.id,
        this.walking = 0,
        this.sleeping = 0,
        this.heartRate = 0,
        this.waterConsumed = 0.0});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'walking': walking,
      'sleeping': sleeping,
      'heartRate': heartRate,
      'waterConsumed': waterConsumed
    };
  }

  Activity.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    walking = map['walking'];
    sleeping = map['sleeping'];
    heartRate = map['heartRate'];
    waterConsumed = map['waterConsumed'];
  }

  @override
  String toString() {
    return 'Activity($id, $walking, $sleeping, $heartRate, $waterConsumed)';
  }
}
