class ACModel {
  int id;

  // Core Controls
  int temperature;
  String mode; // Cool, Eco, Turbo, Sleep
  String fanSpeed; // Low, Medium, High, Auto
  bool isPowerOn;

  // Energy Insights
  double liveEnergyUsage; // in watts
  String energyStatus; // Extreme, Good, Excellent
  double cost; // in $
  double nativeCost; // in local currency
  double co2Emission; // in kg
  String co2Status; // Extreme, Good, Excellent

  // Maintenance
  bool serviceAlert;

  // Personalization
  String nickname;
  List<Schedule> schedules;

  ACModel({
    required this.id,
    required this.temperature,
    required this.mode,
    required this.fanSpeed,
    required this.isPowerOn,
    required this.liveEnergyUsage,
    required this.energyStatus,
    required this.cost,
    required this.nativeCost,
    required this.co2Emission,
    required this.co2Status,
    required this.serviceAlert,
    required this.nickname,
    required this.schedules,
  });
}

class Schedule {
  final String day;
  final List<TimeSlot> slots;

  Schedule({required this.day, required this.slots});
}

class TimeSlot {
  final DateTime time;
  final int setTemp;

  TimeSlot({required this.time, required this.setTemp});
}