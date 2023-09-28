class PaymentTermModel {
  final String termName;
  final int dueDays;
  final double discountPercentage;

  PaymentTermModel({
    required this.termName,
    required this.dueDays,
    required this.discountPercentage,
  });
}