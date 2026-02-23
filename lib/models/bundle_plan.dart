class BundleData {
  final String data;
  final String validity;
  final String price;
  final bool isUnlimited;

  const BundleData({
    required this.data,
    required this.validity,
    required this.price,
    this.isUnlimited = false,
  });
}

class RegionalPlan {
  final String name;
  final String data;
  final String validity;
  final int supportedCountries;
  final String price;

  const RegionalPlan({
    required this.name,
    required this.data,
    required this.validity,
    required this.supportedCountries,
    required this.price,
  });
}
