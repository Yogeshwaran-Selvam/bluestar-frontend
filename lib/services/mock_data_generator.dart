import 'dart:math';
import '../models/ac_model.dart';

class MockDataGenerator {
  static final _random = Random();

  static final List<String> modes = ['Cool', 'Eco', 'Turbo', 'Sleep'];
  static final List<String> fanSpeeds = ['Low', 'Medium', 'High', 'Auto'];
  static final List<String> statuses = ['Extreme', 'Good', 'Excellent'];
  static final List<String> nicknames = ['Living Room', 'Bedroom', 'Kitchen', 'Office', 'Hallway'];

  static ACModel generateACData() {
    return ACModel(
      id: _random.nextInt(1000),
      temperature: 16 + _random.nextInt(13), // 16–28 °C
      mode: modes[_random.nextInt(modes.length)],
      fanSpeed: fanSpeeds[_random.nextInt(fanSpeeds.length)],
      isPowerOn: _random.nextBool(),
      liveEnergyUsage: 500 + _random.nextDouble() * 1500, // 500–2000 W
      energyStatus: statuses[_random.nextInt(statuses.length)],
      cost: _random.nextDouble() * 5,
      nativeCost: _random.nextDouble() * 400,
      co2Emission: _random.nextDouble() * 3,
      co2Status: statuses[_random.nextInt(statuses.length)],
      serviceAlert: _random.nextBool(),
      nickname: nicknames[_random.nextInt(nicknames.length)],
      schedules: [],
    );
  }
}