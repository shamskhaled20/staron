import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:staron/features/General_Ledger/Balance_Trial/data/api_balance.dart';
import 'bloc_state.dart';
class TrialBalanceCubit extends Cubit<TrialBalanceState> {
  final ApiService apiService = ApiService();

  TrialBalanceCubit() : super(TrialBalanceInitial());

  Future<void> fetchTrialBalance() async {
    try {
      emit(TrialBalanceLoading());
      final trialBalance = await apiService.fetchTrialBalance();
      emit(TrialBalanceLoaded(trialBalance));
    } catch (e) {
      emit(TrialBalanceError(e.toString()));
    }
  }
}
