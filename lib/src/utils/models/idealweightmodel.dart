class IdealWeight {
  final double hamvi;
  final double Devine;
  final double Miller;
  final double Robinson;

  const IdealWeight({
    required this.hamvi,
    required this.Devine,
    required this.Robinson,
    required this.Miller,
  });

  factory IdealWeight.fromJson(Map<String, dynamic> json) {
  return IdealWeight(
  hamvi: json['data']['Hamvi'],
  Devine: json['data']['Devine'],
  Robinson: json['data']['Robison'],
  Miller: json['data']['Miller'],
  );
  }

}