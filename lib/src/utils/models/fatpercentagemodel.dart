class FatPercentage {
  final double BodyFat1;
  final String BodyFatCategory;
  final double BodyFatMass;
  final double LeanBodyMass;
  final double Fat;

  const FatPercentage({
    required this.BodyFat1,
    required this.BodyFatCategory,
    required this.BodyFatMass,
    required this.Fat,
    required this.LeanBodyMass,
});
  factory FatPercentage.fromJson(Map<String, dynamic> json) {
    return FatPercentage(
        BodyFat1: json['data']['Body Fat (U.S. Navy Method)'],
        BodyFatCategory: json['data']['Body Fat Category'] ?? '',
        BodyFatMass: json['data']['Body Fat Mass']??'',
        Fat: json['data']['Body Fat (BMI method)']??'',
        LeanBodyMass: json['data']['Lean Body Mass']??'',
    );
  }
}