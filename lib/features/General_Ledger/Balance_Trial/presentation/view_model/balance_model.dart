class TrialBalance {
  final String accountName;
  final double debit;
  final double credit;

  TrialBalance({
    required this.accountName,
    required this.debit,
    required this.credit,
  });

  factory TrialBalance.fromJson(Map<String, dynamic> json) {
    return TrialBalance(
      accountName: json['accountName'],
      debit: json['debit'].toDouble(),
      credit: json['credit'].toDouble(),
    );
  }
}
