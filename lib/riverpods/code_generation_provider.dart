import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// 1) 어떤 프로바이더를 사용할 지 결정할 고민 할 필요 없도록
// Provider, FutureProvider, StreamProvider
// StateNotifierProvider

final _testProvider = Provider<String>((ref) => 'hello Code Generation');

@riverpod
String gStateProvider(GStateProviderRef ref) {
  return 'hello Code Generation';
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(Duration(seconds: 3));

  return 10;
}

@Riverpod(
    //살려둬라
    keepAlive: true)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(Duration(seconds: 3));

  return 10;
}

final _testFamilyProvider =
    Provider.family<int, int>((ref, number1) => number1
        // * number2
    );

// 2) Parameter > Family 파라미터를 일반 함수처럼 사용할 수 있도록.
@riverpod
int gStateMultiply(GStateMultiplyRef ref,{
  required int number1,
  required int number2,
}){
  return number1 * number2;
}

// stateNotifierProvider
@riverpod
class GStateNotifier extends _$GStateNotifier{

  //무조건 override
  @override
  int build(){
    return 0;
  }

  increment(){
    state++;
  }
  decrement(){
    state--;
  }

}