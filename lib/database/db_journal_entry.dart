import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelperJournal {
  static final DatabaseHelperJournal _instance = DatabaseHelperJournal._internal();
  factory DatabaseHelperJournal() => _instance;
  DatabaseHelperJournal._internal();

  late Database _database;
  bool _isDatabaseOpen = false;

  // Initialize the database
  Future<void> init() async {
    if (_isDatabaseOpen) return;

    _database = await openDatabase(
      join(await getDatabasesPath(), 'account_database.db'),
      onCreate: (db, version) {
        // Create the "Journal Entry" table
        return db.execute('''
      CREATE TABLE journal_entries(
        entryId INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT,
        accountId INTEGER,
        debit REAL,
        credit REAL,
        description TEXT,
        FOREIGN KEY (accountId) REFERENCES accounts(accountId)
      )
    ''');
      },
      version: 1,
    );

    _isDatabaseOpen = true;
  }

  // Modify the insertJournalEntry method to ensure the database is opened
  Future<int> insertJournalEntry(JournalEntry entry) async {
    await init(); // Initialize the database
    return await _database.insert(
      'journal_entries',
      entry.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all journal entries from the database
  Future<List<JournalEntry>> getAllJournalEntries() async {
    await init();  // Open the database
    final List<Map<String, dynamic>> maps = await _database.query('journal_entries');
    return List.generate(maps.length, (i) {
      return JournalEntry.fromMap(maps[i]);
    });
  }

  // Get a specific journal entry by entryId
  Future<JournalEntry?> getJournalEntry(int entryId) async {
    await init(); // Open the database
    final List<Map<String, dynamic>> maps = await _database.query(
      'journal_entries',
      where: 'entryId = ?',
      whereArgs: [entryId],
    );

    if (maps.isNotEmpty) {
      return JournalEntry.fromMap(maps.first);
    } else {
      return null; // Return null if the entry is not found
    }
  }

  // Update a journal entry in the database
  Future<bool> updateJournalEntry(int entryId, JournalEntry updatedEntry) async {
    await init();  // Open the database
    final rowsAffected = await _database.update(
      'journal_entries',
      updatedEntry.toMap(),
      where: 'entryId = ?',
      whereArgs: [entryId],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return rowsAffected > 0; // Return true if any rows were affected (update successful)
  }

  // Delete a journal entry from the database
  Future<bool> deleteJournalEntry(int entryId) async {
    await init();  // Open the database
    final rowsAffected = await _database.delete(
      'journal_entries',
      where: 'entryId = ?',
      whereArgs: [entryId],
    );

    return rowsAffected > 0; // Return true if any rows were affected (delete successful)
  }
  // Close the database when it's no longer needed
  Future<void> close() async {
    if (_isDatabaseOpen) {
      await _database.close();
      _isDatabaseOpen = false;
    }
  }
}

class JournalEntry {
  int? entryId;
  String date;
  int accountId;
  double debit;
  double credit;
  String description;

  JournalEntry({
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
  factory JournalEntry.fromMap(Map<String, dynamic> map) {
    return JournalEntry(
      entryId: map['entryId'],
      date: map['date'],
      accountId: map['accountId'],
      debit: map['debit'],
      credit: map['credit'],
      description: map['description'],
    );
  }
}
