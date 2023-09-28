import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'db_sql.dart';
class CustomerAccount {
  final int? customerId;
  final String accountNumber;
  final String accountName;
  final String contactName;
  final String email;
  final String phone;
  final String address;

  CustomerAccount({
    this.customerId,
    required this.accountNumber,
    required this.accountName,
    required this.contactName,
    required this.email,
    required this.phone,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'customerId': customerId,
      'accountNumber': accountNumber,
      'accountName': accountName,
      'contactName': contactName,
      'email': email,
      'phone': phone,
      'address': address,
    };
  }

  factory CustomerAccount.fromMap(Map<String, dynamic> map) {
    return CustomerAccount(
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

class CustomerAccountProvider {
  late Database db;

  Future open() async {
    db = await DatabaseHelper.instance.database;
  }

  Future<int> insert(CustomerAccount account) async {
    await open();
    return await db.insert('customer_account', account.toMap());
  }

  Future<List<CustomerAccount>> getAllAccounts() async {
    await open();
    final List<Map<String, dynamic>> maps = await db.query('customer_account');
    return List.generate(maps.length, (i) {
      return CustomerAccount.fromMap(maps[i]);
    });
  }

  Future<CustomerAccount?> getCustomerAccount(int customerId) async {
    await open();
    final List<Map<String, dynamic>> maps = await db.query(
      'customer_account',
      where: 'customerId = ?',
      whereArgs: [customerId],
    );

    if (maps.isNotEmpty) {
      return CustomerAccount.fromMap(maps.first);
    } else {
      return null; // Return null if the customer account is not found
    }
  }

  Future<bool> update(CustomerAccount account) async {
    await open();
    final rowsAffected = await db.update(
      'customer_account',
      account.toMap(),
      where: 'customerId = ?',
      whereArgs: [account.customerId],
    );

    return rowsAffected > 0; // Return true if any rows were affected (update successful)
  }


  Future<bool> delete(int customerId) async {
    await open();
    final rowsAffected = await db.delete(
      'customer_account',
      where: 'customerId = ?',
      whereArgs: [customerId],
    );

    return rowsAffected > 0; // Return true if any rows were affected (delete successful)
  }


  Future close() async => db.close();
}

  Future<Database> _initDatabase() async {
    final String path =
    join(await getDatabasesPath(), 'customer_accounts.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Create the Customer Account table
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
      },
    );
  }

