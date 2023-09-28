import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelperBalanceTrial {
  static final DatabaseHelperBalanceTrial _instance = DatabaseHelperBalanceTrial._internal();
  factory DatabaseHelperBalanceTrial() => _instance;
  DatabaseHelperBalanceTrial._internal();

  late Database _database;

  Future<void> open() async {
    if (_database != null) return;
    _database = await openDatabase(
      join(await getDatabasesPath(), 'double_entry_balance.db'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE accounts (
            accountId INTEGER PRIMARY KEY AUTOINCREMENT,
            accountName TEXT NOT NULL,
            balance REAL NOT NULL DEFAULT 0
          )
        ''');
        await db.execute('''
          CREATE TABLE journal_entries (
            entryId INTEGER PRIMARY KEY AUTOINCREMENT,
            accountId INTEGER NOT NULL,
            debit REAL NOT NULL DEFAULT 0,
            credit REAL NOT NULL DEFAULT 0,
            FOREIGN KEY (accountId) REFERENCES accounts (accountId)
          )
        ''');
      },
      version: 1,
    );
  }

  Future<void> insertJournalEntry(int accountId, double debit, double credit) async {
    await open();

    await _database.insert(
      'journal_entries',
      {
        'accountId': accountId,
        'debit': debit,
        'credit': credit,
      },
    );
  }

  Future<void> updateAccountBalance(int accountId, double balanceChange) async {
    await open();

    await _database.rawUpdate(
      'UPDATE accounts SET balance = balance + ? WHERE accountId = ?',
      [balanceChange, accountId],
    );
  }

  Future<Map<String, double>> calculateTrialBalance() async {
    await open();

    final List<Map<String, dynamic>> accounts = await _database.query('accounts');
    final trialBalance = <String, double>{};

    for (final account in accounts) {
      final accountId = account['accountId'];
      final accountName = account['accountName'];
      final balance = account['balance'] as double;

      final List<Map<String, dynamic>> debits = await _database.query(
        'journal_entries',
        where: 'accountId = ? AND debit > 0',
        whereArgs: [accountId],
      );
      final totalDebits = debits.isNotEmpty ? debits.map((e) => e['debit'] as double).reduce((a, b) => a + b) : 0;

      final List<Map<String, dynamic>> credits = await _database.query(
        'journal_entries',
        where: 'accountId = ? AND credit > 0',
        whereArgs: [accountId],
      );
      final totalCredits = credits.isNotEmpty ? credits.map((e) => e['credit'] as double).reduce((a, b) => a + b) : 0;

      final accountBalance = balance + totalDebits - totalCredits;
      trialBalance[accountName] = accountBalance;
    }

    return trialBalance;
  }
}
