class BundleData {
  final String id;
  final String data;
  final String validity;
  final String price;
  final bool isUnlimited;

  const BundleData({
    required this.id,
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

  BundleData toBundleData() => BundleData(
      id: 'regional_$name', data: name, validity: validity, price: price);
}
