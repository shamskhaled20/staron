class SupplierInvoiceModel {
  final String invoiceNumber;
  final String invoiceDate;
  final double totalAmount;
  final String dueDate;
  final String status;

  SupplierInvoiceModel({
    required this.invoiceNumber,
    required this.invoiceDate,
    required this.totalAmount,
    required this.dueDate,
    required this.status,
  });
}
