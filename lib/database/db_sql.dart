import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    return openDatabase(
      join(path, 'ydatabase.db'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE account (
            accountId INTEGER PRIMARY KEY AUTOINCREMENT,
            accountNumber TEXT,
            accountName TEXT,
            accountType TEXT,
            normalSide TEXT,
            balance REAL
          )
        ''');

        await db.execute('''
          CREATE TABLE journal_entry (
            entryId INTEGER PRIMARY KEY AUTOINCREMENT,
            date TEXT,
            accountId INTEGER,
            debit REAL,
            credit REAL,
            description TEXT,
            FOREIGN KEY (accountId) REFERENCES account (accountId)
          )
        ''');

        await db.execute('''
          CREATE TABLE customer_account (
            customerId INTEGER PRIMARY KEY AUTOINCREMENT,
            accountNumber TEXT,
            accountName TEXT,
            contactName TEXT,
            email TEXT,
            phone TEXT,
            address TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE customer_payment_term (
            termId INTEGER PRIMARY KEY AUTOINCREMENT,
            termName TEXT,
            dueDays INTEGER,
            discountPercentage REAL
          )
        ''');

        await db.execute('''
          CREATE TABLE customer_invoice (
            invoiceId INTEGER PRIMARY KEY AUTOINCREMENT,
            customerId INTEGER,
            invoiceNumber TEXT,
            invoiceDate TEXT,
            totalAmount REAL,
            status TEXT,
            dueDate TEXT,
            FOREIGN KEY (customerId) REFERENCES customer_account (customerId)
          )
        ''');
      },
      version: 1,
    );
  }
}
