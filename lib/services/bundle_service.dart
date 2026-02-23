import 'package:flutter_task_areeba/models/bundle_plan.dart';

class BundleService {
  List<BundleData> getBundles() {
    return const [
      BundleData(data: '3 GB', validity: '30 Days', price: 'USD 2.99'),
      BundleData(data: '5 GB', validity: '7 days', price: 'USD 3.50'),
      BundleData(data: '5 GB', validity: '15 days', price: 'USD 3.99'),
      BundleData(data: '5 GB', validity: '30 days', price: 'USD 4.25'),
      BundleData(data: '10 GB', validity: '10 days', price: 'USD 4.99'),
      BundleData(data: '10 GB', validity: '15 days', price: 'USD 5.75'),
      BundleData(data: '20 GB', validity: '30 days', price: 'USD 7.48'),
      BundleData(
          data: 'Unlimited',
          validity: '10 days',
          price: 'USD 5.50',
          isUnlimited: true),
    ];
  }

  List<RegionalPlan> getRegionalPlans() {
    return const [
      RegionalPlan(
          name: 'EuroConnect',
          data: '1 GB',
          validity: '7 Days',
          supportedCountries: 32,
          price: 'USD 2.51'),
      RegionalPlan(
          name: 'Global Unlimited',
          data: 'Unlimited',
          validity: '1 Day',
          supportedCountries: 34,
          price: 'USD 2.99'),
      RegionalPlan(
          name: 'EuroLink',
          data: '1 GB',
          validity: '7 Days',
          supportedCountries: 34,
          price: 'USD 2.52'),
      RegionalPlan(
          name: 'worldisyours',
          data: '1 GB',
          validity: '1 Day',
          supportedCountries: 34,
          price: 'USD 2.52'),
    ];
  }
}
