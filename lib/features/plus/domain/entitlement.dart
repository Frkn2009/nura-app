/// Plus yetkisi — client-side `isPlus` bayrağı yerine servis tarafından
/// doğrulanır (sözleşme: istemci, aboneliği kendi kendine veremez).
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

const nuraPlusLifetimeProduct = BillingProduct(
  id: 'nura_plus_lifetime',
  title: 'NURA Plus Lifetime',
  description: 'Unlimited speaking and premium review options.',
);
