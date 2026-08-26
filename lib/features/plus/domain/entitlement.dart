enum NuraEntitlement { free, plus, business }

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

const nuraBusinessMonthly = BillingProduct(
  id: 'nura_business_monthly',
  title: 'NURA Business Aylık',
  description: 'Toplantı Çevirmeni: günde 8 saat, tüm Plus özellikleri',
);
const nuraBusinessYearly = BillingProduct(
  id: 'nura_business_yearly',
  title: 'NURA Business Yıllık',
  description: 'Toplantı Çevirmeni: günde 8 saat, 4 ay bedava',
);
