class Bmi {
  final double bmi;
  final String bmi_range;
  final String bmiresult;

  const Bmi({
    required this.bmi,
    required this.bmi_range,
    required this.bmiresult,
});
  factory Bmi.fromJson(Map<String, dynamic> json) {
    return Bmi(
      bmi: json['data']['bmi'] ?? 0.0,
      bmiresult: json['data']['health'] ?? '',
      bmi_range: json['data']['healthy_bmi_range'] ?? '',
    );
  }
}