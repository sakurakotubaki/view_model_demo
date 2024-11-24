import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:view_model_demo/model/loading.dart';
part 'loading_view_model.g.dart';

@Riverpod(keepAlive: true)
class LoadingViewModel extends _$LoadingViewModel {
  @override
  LoadingState build() {
    return const LoadingState();
  }

  Future<void> simulateApiCall() async {
    // ローディング状態を更新
    state = state.copyWith(isLoading: true);
    
    // API呼び出しをシミュレート
    await Future.delayed(const Duration(seconds: 3));
    
    // ローディング状態を更新
    state = state.copyWith(isLoading: false);
  }
}