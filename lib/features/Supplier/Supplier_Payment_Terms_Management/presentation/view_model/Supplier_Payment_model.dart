class SupplierPaymentTermModel {
  final String termName;
  final int dueDays;
  final double discountPercentage;

  SupplierPaymentTermModel({
    required this.termName,
    required this.dueDays,
    required this.discountPercentage,
  });
}
