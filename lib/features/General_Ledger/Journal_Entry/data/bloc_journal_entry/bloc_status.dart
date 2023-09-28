// Define states
import '../../../../../database/db_journal_entry.dart';

abstract class JournalEntryState {}

class JournalEntryInitial extends JournalEntryState {}

class JournalEntryLoaded extends JournalEntryState {
  final List<JournalEntry> entries;

  JournalEntryLoaded(this.entries);
}

class JournalEntryError extends JournalEntryState {
  final String error;

  JournalEntryError(this.error);
}

// Define events
abstract class JournalEntryEvent {}

class LoadJournalEntries extends JournalEntryEvent {}
class JournalEntryCreated extends JournalEntryState {}
class AddJournalEntry extends JournalEntryEvent {
  final JournalEntry entry;

  AddJournalEntry(this.entry);
}

class UpdateJournalEntry extends JournalEntryEvent {
  final JournalEntry entry;

  UpdateJournalEntry(this.entry);
}

class DeleteJournalEntry extends JournalEntryEvent {
  final int entryId;

  DeleteJournalEntry(this.entryId);
}
