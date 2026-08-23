enum NuraEntitlement { free, plus }

class BillingProduct {
  const BillingProduct({
    required this.id,
    required this.title,
    required this.description,
  });
  final String id;
  final String title;
  final String description;
}

const nuraPlusMonthly = BillingProduct(
  id: 'nura_plus_monthly',
  title: 'NURA Plus Aylık',
  description: 'Sınırsız konuşma, reklamsız',
);
const nuraPlusYearly = BillingProduct(
  id: 'nura_plus_yearly',
  title: 'NURA Plus Yıllık',
  description: 'Sınırsız konuşma, reklamsız, 4 ay bedava',
);
const nuraPlusFamily = BillingProduct(
  id: 'nura_plus_family',
  title: 'NURA Plus Aile',
  description: '4 profil, sınırsız konuşma',
);
