class JournalEntryModel {
  int? entryId;
  String date;
  int accountId;
  double debit;
  double credit;
  String description;

  JournalEntryModel({
    this.entryId,
    required this.date,
    required this.accountId,
    required this.debit,
    required this.credit,
    required this.description,
  });

  // Convert JournalEntry object to a Map
  Map<String, dynamic> toMap() {
    return {
      'entryId': entryId,
      'date': date,
      'accountId': accountId,
      'debit': debit,
      'credit': credit,
      'description': description,
    };
  }

  // Create a JournalEntry object from a Map
  factory JournalEntryModel.fromMap(Map<String, dynamic> map) {
    return JournalEntryModel(
      entryId: map['entryId'],
      date: map['date'],
      accountId: map['accountId'],
      debit: map['debit'],
      credit: map['credit'],
      description: map['description'],
    );
  }
}
