class CustomerAccountModel {
  final int? customerId;
  final String accountNumber;
  final String accountName;
  final String contactName;
  final String email;
  final String phone;
  final String address;

  CustomerAccountModel({
    this.customerId,
    required this.accountNumber,
    required this.accountName,
    required this.contactName,
    required this.email,
    required this.phone,
    required this.address,
  });

  factory CustomerAccountModel.fromMap(Map<String, dynamic> map) {
    return CustomerAccountModel(
      customerId: map['customerId'],
      accountNumber: map['accountNumber'],
      accountName: map['accountName'],
      contactName: map['contactName'],
      email: map['email'],
      phone: map['phone'],
      address: map['address'],
    );
  }
}
