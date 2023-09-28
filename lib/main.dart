import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:staron/core/utits/app_route.dart';

import 'database/db_journal_entry.dart';
import 'features/General_Ledger/Journal_Entry/data/apiservicejournalentry.dart';
import 'features/General_Ledger/Journal_Entry/data/bloc_journal_entry/bloc.dart';
import 'features/customer/Customer_Account_Management/data/bloc/bloc.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final ApiService apiService = ApiService(); // Create an instance of ApiService

  final DatabaseHelperJournal databaseHelper = DatabaseHelperJournal();
  await databaseHelper.init(); // Ensure the database is initialized

  runApp(
    MultiBlocProvider(
      providers: [
        // Provide the JournalEntryCubit with the ApiService and DatabaseHelper
        BlocProvider<JournalEntryCubit>(
          create: (context) => JournalEntryCubit(apiService,),
        ),
        BlocProvider<CustomerAccountCubit>(create:(context) =>CustomerAccountCubit() )
        // Add more BlocProviders for other Cubits if needed
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
    );
  }
}
