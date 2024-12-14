abstract class ApiUrl
{
  static  String baseUrl='http://173.249.1.117:8095/van.dll';
}
abstract class MyApisUrls
{
  static String itemsMaster()
  {
    return '${ApiUrl.baseUrl}/getvanalldata?cono=290&strno=1&case=4 ';
  }

  static String quantity()
  {
    return '${ApiUrl.baseUrl}/getvanalldata?cono=290&strno=1&case=9';
  }
}
