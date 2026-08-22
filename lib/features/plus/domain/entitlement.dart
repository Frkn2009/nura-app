enum NuraEntitlement {
  free,
  plus,
}

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

const nuraPlusMonthlyProduct = BillingProduct(
  id: 'nura_plus_monthly',
  title: 'NURA Plus Aylık',
  description:
      'Unlimited speaking, ad-free, full CEFR path (A1–B2) for one profile.',
);

const nuraPlusYearlyProduct = BillingProduct(
  id: 'nura_plus_yearly',
  title: 'NURA Plus Yıllık',
  description:
      'Best value yearly plan: unlimited speaking, ad-free, full CEFR path.',
);

const nuraPlusFamilyProduct = BillingProduct(
  id: 'nura_plus_family',
  title: 'NURA Plus Aile',
  description: 'All Plus benefits for up to four family profiles.',
);

const nuraPlusLifetimeProduct = BillingProduct(
  id: 'nura_plus_lifetime',
  title: 'NURA Plus Lifetime',
  description: 'Unlimited hearts and premium review options.',
);
