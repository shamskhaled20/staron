import 'package:equatable/equatable.dart';
abstract class TrialBalanceState extends Equatable {
  const TrialBalanceState();

  @override
  List<Object?> get props => [];
}

class TrialBalanceInitial extends TrialBalanceState {}

class TrialBalanceLoading extends TrialBalanceState {}

class TrialBalanceLoaded extends TrialBalanceState {
  final Map<String, double> trialBalance;

  TrialBalanceLoaded(this.trialBalance);

  @override
  List<Object?> get props => [trialBalance];
}

class TrialBalanceError extends TrialBalanceState {
  final String error;

  TrialBalanceError(this.error);

  @override
  List<Object?> get props => [error];
}
