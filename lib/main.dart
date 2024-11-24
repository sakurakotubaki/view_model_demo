import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:view_model_demo/loading_view_model.dart';
import 'package:view_model_demo/widget/loading_dialog_mixin.dart';

void main() {
  runApp(
    // Adding ProviderScope enables Riverpod for the entire project
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LoadingDemo());
  }
}

class LoadingDemo extends ConsumerWidget with LoadingDialogMixin {
  const LoadingDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadingState = ref.watch(loadingViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ローディングデモ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: loadingState.isLoading
                  ? null
                  : () => _handleProcessStart(context, ref),
              child: const Text('処理開始'),
            ),
            const SizedBox(height: 20),
            Text(loadingState.isLoading ? '処理中...' : '待機中'),
          ],
        ),
      ),
    );
  }

  Future<void> _handleProcessStart(BuildContext context, WidgetRef ref) async {
    // ダイアログを表示
    showLoadingDialog(context);

    // ViewModelの処理を実行
    await ref.read(loadingViewModelProvider.notifier).simulateApiCall();

    // ダイアログを閉じる
    if (!context.mounted) return;
    hideLoadingDialog(context);

    // 完了メッセージを表示
    if (!context.mounted) return;
    showCompleteSnackBar(context);
  }
}