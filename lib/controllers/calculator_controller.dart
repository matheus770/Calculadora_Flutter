class CalculatorController {
  static const kZero = '0';
  static const kPoint = ',';
  static const kMemoryNull = [0.0, 0.0];
  static const kMemoryFirst = 0;
  static const kOperationNull = null;
  static const kOperations = ['%', '/', 'x', '+', '-', '='];

  List<double> _memories = [0.0, 0.0];
  int _index;
  String _operation;
  bool _usedOperation;
  String result;
  String resultX = '';
  String lresultX = '';

  CalculatorController() {
    _clear();
  }

  void _clear() {
    result = kZero;
    _memories.setAll(kMemoryFirst, kMemoryNull);
    _index = kMemoryFirst;
    _operation = kOperationNull;
    _usedOperation = false;
    resultX = '';
    lresultX = '';
  }

  void _deleteDigit() {
    if (result.length > 1) {
      result = result.substring(0, result.length - 1);
    } else {
      result = kZero;
    }
    if (resultX.length > 1){
      resultX = result.substring(0, resultX.length - 1);
    } else {
      resultX = '';
    }
  }

  void _addDigit(String digit) {
    if (_usedOperation) result = kZero;
    if (result.contains(kPoint) && digit == kPoint) digit = '';
    if (resultX.contains(kPoint) && digit == kPoint) digit = '';
    if (result == kZero && digit != kPoint) result = '';
    if (resultX == kZero && digit != kPoint) result = '';
    result += digit;
    resultX += digit;
    _memories[_index] = double.parse(result.replaceAll(kPoint, '.'));
    _usedOperation = false;
  }

  void _setOperation(String operation) {
    if (_usedOperation && operation == _operation) return;

    if (_index == kMemoryFirst) {
      _index = kMemoryFirst + 1;
    } else {
      _memories[kMemoryFirst] = calculate();
    }
    if(operation!='='&& lresultX!=resultX.substring(resultX.length-1))
    {
      resultX += operation;
    }
    lresultX = resultX.substring(resultX.length-1);

    if (operation != '=') _operation = operation;

    result = _memories[kMemoryFirst].toString();
    result = result.endsWith('.0') ? result.split('.')[0] : result;

    _usedOperation = true;
  }

  double calculate() {
    if (_operation == '%') return _memories[0] % _memories[1];
    if (_operation == '/') return _memories[0] / _memories[1];
    if (_operation == 'x') return _memories[0] * _memories[1];
    if (_operation == '+') return _memories[0] + _memories[1];
    if (_operation == '-') return _memories[0] - _memories[1];
    return 0.0;
  }

  void applyCommand(String command) {
    if (command == 'AC') {
      _clear();
    } else if (command == 'DEL') {
      _deleteDigit();
    } else if (kOperations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigit(command);
    }
  }
}
