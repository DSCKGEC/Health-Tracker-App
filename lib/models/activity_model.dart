class Activity {
  int? id;
  int walking = 0;
  int sleeping = 0;
  int heartRate = 0;
  double waterConsumed = 0.0;

  // INITIALIZE ACTIVITY
  Activity(
      {this.id,
        this.walking = 0,
        this.sleeping = 0,
        this.heartRate = 0,
        this.waterConsumed = 0.0});

  // Get data in dict, json or map format
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'walking': walking,
      'sleeping': sleeping,
      'heartRate': heartRate,
      'waterConsumed': waterConsumed
    };
  }

  // convert the parameters from map data in to activity
  Activity.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    walking = map['walking'];
    sleeping = map['sleeping'];
    heartRate = map['heartRate'];
    waterConsumed = map['waterConsumed'];
  }

  // override the class string, so that when you want to print the class object
  // it display the data the class is holding
  @override
  String toString() {
    return 'Activity($id, $walking, $sleeping, $heartRate, $waterConsumed)';
  }
}
