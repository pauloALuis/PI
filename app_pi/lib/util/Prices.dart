import 'package:app_pi/util/Useful.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart'; // for other locales
import 'package:date_format/date_format.dart';
class Price{



  static String getCustomerType(int num ){
    if (num == 1) return "normal";
    if (num == 2) return "student";

    return "worker";
  }

  static double getPriceUser(customerType) {
    if ((customerType is String) && ( (customerType.contains("normal")) || (customerType.contains("1") )) ) return 5.00;//"normal";
    if ((customerType is String) && ( (customerType.contains("student")) || (customerType.contains("2")) ) ) return 2.30;//"student";
    if ((customerType is String) && ( (customerType.contains("worker")) || (customerType.contains("3")) ) ) return 3.80;//"worker";

    if (customerType == 1) return 5.00;//"normal";
    if (customerType == 2) return 2.30;//"student";
    if (customerType == 3) return 3.80;//"worker";
    return 5.00;

  }

  static double payValue(customerType, var daytime)
  {
    final now = new DateTime.now();
    String formatter = DateFormat('d-MM-yyyy H:m').format(now);// 28/03/2020
   // double cal = getPriceUser(customerType);
    print("data: -> ${formatter}");
    print("data: -> ${Useful. convertStringDateTime(formatter)}");
    print("data: -> ");
    var um = Useful. convertStringDateTime(formatter);

    var temp = DateTime.now().toUtc();
    var d1 = DateTime.utc(temp.year,temp.month,temp.day, temp.hour, temp.minute);
    var d2 = DateTime.utc(um.year,um.month,um.day,um.hour, um.minute);
    print("d1 - ${d1} d2 -> ${d2}");
    var list = [
      Useful. convertStringDateTime(formatter),
      DateTime.now(),
    ];

    list.sort((a, b) => a.compareTo(b));
    print(list);
    //final DateTime nowl = DateTime.now();
    //final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return 2.5;
  }
}
