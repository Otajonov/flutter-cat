

String formatAbbrNum(String number) {

  int num = int.parse(number);

  if (num >= 1000000) {
    var result = (num / 1000000);
    if (result - result.floor() == 0) {
      return '${result.floor()}m';
    } else {
      return '${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}m';
    }
  } else if (num >= 1000) {
    var result = (num / 1000);
    if (result - result.floor() == 0) {
      return '${result.floor()}k';
    } else {
      return '${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}k';
    }
  } else {
    return num.toString();
  }
}
