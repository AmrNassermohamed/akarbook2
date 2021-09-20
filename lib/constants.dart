import 'package:money2/money2.dart';

String baseUrl="https://akarbook.com/portal/rest_api/";
String urlType="property_type.php";
String desc="DESC";
String asc="ASC";
final euro = Currency.create('JD', 3,
     invertSeparators: true, pattern: '###,###.##');