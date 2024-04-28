import 'dart:async';

class AsyncMutex {
  Completer<void>? _completer;

  Future<void> lock() async {
    while (_completer != null) {
      await _completer?.future;
    }

    _completer = Completer<void>();
  }

  void unlock() {
    assert(_completer != null);
    final completer = _completer;
    _completer = null;
    completer?.complete();
  }
}
