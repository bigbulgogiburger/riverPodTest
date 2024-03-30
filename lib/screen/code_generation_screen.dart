import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodtest/layout/default_layout.dart';
import 'package:riverpodtest/riverpods/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProviderProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(
      number1: 10,
      number2: 29,
    ));
    print('build');
    return DefaultLayout(
      title: 'CodeGenerationScreen',
      body: Column(
        children: [
          Text('State1 : $state1'),
          state2.when(
            data: (data) {
              return Center(
                child: Text(
                  'State2 : ${data.toString()}',
                  textAlign: TextAlign.center,
                ),
              );
            },
            error: (err, stack) => Text(
              err.toString(),
            ),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          ),
          state3.when(
            data: (data) {
              return Center(
                child: Text(
                  'State3 : ${data.toString()}',
                  textAlign: TextAlign.center,
                ),
              );
            },
            error: (err, stack) => Text(
              err.toString(),
            ),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          ),
          Text('State4 : $state4'),
          Consumer(
            builder: (context, ref, child) {
              final state5 = ref.watch(gStateNotifierProvider);

              return Row(
                children: [
                  Text('State5: $state5'),
                  // child 1번만 빌드됨
                  if(child != null) child,
                ],
              );
            },
            child: Text('hello'),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).increment();
                },
                child: Text('increment'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).decrement();
                },
                child: Text('decrement'),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              ref.invalidate(gStateNotifierProvider);
            },
            child: Text('Invalidate'),
          ),
        ],
      ),
    );
  }
}

class _StateFiveWidget extends ConsumerWidget {
  const _StateFiveWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state5 = ref.watch(gStateNotifierProvider);

    return Text('State5 : $state5');
    ;
  }
}
