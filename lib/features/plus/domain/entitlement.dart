enum VoxeloEntitlement { free, plus, business }

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

const voxeloPlusMonthly = BillingProduct(
  id: 'voxelo_plus_monthly',
  title: 'VOXELO Plus Aylık',
  description: 'Sınırsız konuşma, reklamsız',
);
const voxeloPlusYearly = BillingProduct(
  id: 'voxelo_plus_yearly',
  title: 'VOXELO Plus Yıllık',
  description: 'Sınırsız konuşma, reklamsız, 4 ay bedava',
);
const voxeloPlusFamily = BillingProduct(
  id: 'voxelo_plus_family',
  title: 'VOXELO Plus Aile',
  description: '4 profil, sınırsız konuşma',
);

const voxeloBusinessMonthly = BillingProduct(
  id: 'voxelo_business_monthly',
  title: 'VOXELO Business Aylık',
  description: 'Toplantı Çevirmeni: günde 8 saat, tüm Plus özellikleri',
);
const voxeloBusinessYearly = BillingProduct(
  id: 'voxelo_business_yearly',
  title: 'VOXELO Business Yıllık',
  description: 'Toplantı Çevirmeni: günde 8 saat, 4 ay bedava',
);
