enum VoxelithEntitlement { free, plus, business }

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

const voxelithPlusMonthly = BillingProduct(
  id: 'voxelo_plus_monthly',
  title: 'VOXELITH Plus Aylık',
  description: 'Sınırsız konuşma, reklamsız',
);
const voxelithPlusYearly = BillingProduct(
  id: 'voxelo_plus_yearly',
  title: 'VOXELITH Plus Yıllık',
  description: 'Sınırsız konuşma, reklamsız, 4 ay bedava',
);
const voxelithPlusFamily = BillingProduct(
  id: 'voxelo_plus_family',
  title: 'VOXELITH Plus Aile',
  description: '4 profil, sınırsız konuşma',
);

const voxelithBusinessMonthly = BillingProduct(
  id: 'voxelo_business_monthly',
  title: 'VOXELITH Business Aylık',
  description: 'Tüm Plus özellikleri, ~3 kat daha yüksek AI/ses hakkı, öncelikli destek',
);
const voxelithBusinessYearly = BillingProduct(
  id: 'voxelo_business_yearly',
  title: 'VOXELITH Business Yıllık',
  description: 'Tüm Plus özellikleri, ~3 kat daha yüksek AI/ses hakkı, öncelikli destek, 4 ay bedava',
);
