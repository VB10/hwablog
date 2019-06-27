class ApiHelper {
  static const API_KEY = "AIzaSyBLzjmsffN54_Tbp8WzUKFF2GEvI4ug_YY";
  static const DATABASE_URL = "https://hwaproject-3da21.firebaseio.com/";
  static const int DATABASE_LIMIT_COUNT = 3;
  static const String AUTH_END_POINT =
      'https://www.googleapis.com/identitytoolkit/v3/relyingparty';
  static const String AUTH_REFRESH_POINT =
      "https://securetoken.googleapis.com/v1";
  static String tempAuth =
      "eyJhbGciOiJSUzI1NiIsImtpZCI6IjVjZWVhNDg5Y2QyZmQ2NDEzMTIwNDIzMjRjOTFjMTcyMGM2NmE1N2IiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vaHdhcHJvamVjdC0zZGEyMSIsImF1ZCI6Imh3YXByb2plY3QtM2RhMjEiLCJhdXRoX3RpbWUiOjE1NTk2MDMzNzAsInVzZXJfaWQiOiJXbEtvV21oZUdxWnhoRU1iRjZkbnUzb0pJZjIzIiwic3ViIjoiV2xLb1dtaGVHcVp4aEVNYkY2ZG51M29KSWYyMyIsImlhdCI6MTU1OTYwMzM3MCwiZXhwIjoxNTU5NjA2OTcwLCJlbWFpbCI6InZlbGlAdmVsaS5jb20iLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZW1haWwiOlsidmVsaUB2ZWxpLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.HU0qAzDizgDbma1wk5ZcthpQuotoM8BkHKkMVLZPlr-6EZDeTWTxHoJ6j5cSVwuitTkXaIVUkzJDOgOMlf5Gf5ecDOHnqgYdIbZxKpHtzcyeUtDY7dh3fxokxNDEQvuPTk1tlBfU9UPMLMHTaKykSXYIa8OyZfObqdBXEgD_53oqnW4Jp9TD6YAnk9abVIB9204kSzHezSM6QpPaVeaIjgeICrehZy_7h3V7iWBFAcwjagt17PE5acYg8EGbrL1tA-62HOx4I-ow_SjOT5gZMRiezwU6oMGxiowq1qQiATwlgCYEM85udEA1f_E1_JhRJsS5-f6oO-rrDak-wB_erw";
  static String database_mix_endpoint({
    String child,
    String orderBy,
    String startAt = "",
    DatabaseLimit orderType,
    int limitCount = DATABASE_LIMIT_COUNT,
    String auth,
  }) {
    var customUrl = DATABASE_URL;
    customUrl += "$child.json";
    customUrl += "?orderBy=\"\$$orderBy\"";
    switch (orderType) {
      case DatabaseLimit.limitToLast:
        customUrl += "&limitToLast=$limitCount";
        break;
      case DatabaseLimit.limitToFirst:
        customUrl += "&limitToFirst=$limitCount";
        break;
    }
    customUrl += "&startAt=\"$startAt\"";
    customUrl += "&auth=$auth";
    return customUrl;
  }

  static String auth_mix_endpoint(
    String child, {
    String orderBy,
    String startAt = "",
    DatabaseLimit orderType,
    int limitCount = DATABASE_LIMIT_COUNT,
    String auth,
  }) {
    var customUrl = DATABASE_URL;
    customUrl += "$child.json";
    customUrl += "?orderBy=\"\$$orderBy\"";
    switch (orderType) {
      case DatabaseLimit.limitToLast:
        customUrl += "&limitToLast=$limitCount";
        break;
      case DatabaseLimit.limitToFirst:
        customUrl += "&limitToFirst=$limitCount";
        break;
    }
    customUrl += "&startAt=\"$startAt\"";
    customUrl += "&auth=$tempAuth";
    return customUrl;
  }
}

enum DatabaseLimit { limitToFirst, limitToLast }
