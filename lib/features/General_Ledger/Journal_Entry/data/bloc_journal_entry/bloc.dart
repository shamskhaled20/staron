import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:staron/database/db_journal_entry.dart';
import 'package:staron/features/General_Ledger/Journal_Entry/presentation/view_model/journal_entry_model.dart';
import '../apiservicejournalentry.dart';
import 'bloc_status.dart';

class JournalEntryCubit extends Cubit<JournalEntryState> {
  final ApiService apiService;

  JournalEntryCubit(this.apiService, ) : super(JournalEntryInitial());

  Future<void> createJournalEntry(Map<String, dynamic> data) async {
    try {
      final response = await apiService.createJournalEntry(data);
      if (response.statusCode == 200) {
        emit(JournalEntryCreated());
      } else {
        emit(JournalEntryError('Failed to create journal entry'));
      }
    } catch (e) {
  emit(JournalEntryError('Failed to create journal entry: $e'));
  }

}

  Future<void> fetchAllJournalEntries() async {
    try {
      final List<JournalEntryModel> entries = await apiService.fetchAllJournalEntries();
      emit(JournalEntryLoaded(entries.cast<JournalEntry>()));
    } catch (e) {
      emit(JournalEntryError('Failed to load journal entries'));
    }
  }
}