import 'package:flutter/widgets.dart';
import 'package:hwablog/core/enum/viewstate.dart';
import 'package:hwablog/core/services/api.dart';
import 'package:hwablog/locator.dart';

//Consumer olarak ürettiğimiz sayfalarda değişiklikleri ilgili yerlere haber vermek
//için kullanılır
abstract class BaseModel extends ChangeNotifier {
  Api api = locator<Api>();

  void setContext(BuildContext context);
  //Default state ataması her sayfada gelen ve ilk iş yapılmayan anı bize söyler
  ViewState _state = ViewState.Idle;

//sayfalardaki state durumu kontrolü
  ViewState get state => _state;

  //setstate ile sayfadaki durumu değiştirip ona göre logic yazılabilir
  void setState(ViewState state) {
    _state = state;
    notifyListeners();
  }

//işi bildikten sonra memmoryden gerekli sınıfı siler
  @override
  void dispose() {
    super.dispose();
  }
}
