import 'package:flutter/material.dart';
import 'package:hwablog/core/viewmodels/base_model.dart';
import 'package:hwablog/locator.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  //init builder model context and child delegate
  final Widget Function(BuildContext context, T model, Widget child) builder;
  //init onModelReaedy start on model life cycle
  final Function(T) onModelReady;

  /// contstructor need named params. must requriered [builder]
  ///
  /// Sample usage:
  ///
  ///
  ///     BaseView<SplashModel>(
  ///   onModelReady : (),
  ///    (context, model, child) => Scaffold(
  ///         body: SafeArea(
  ///           child: Column(
  ///             children: <Widget>[
  ///               Expanded(
  ///                 child: Center(
  ///                   child: CircleAvatar(
  ///                     radius: 50.0,
  ///                     backgroundImage:
  ///                         AssetImage("assets/images/hwa_logo.jpg"),
  ///                   ),
  ///                 ),
  ///               ),
  ///               model.state == ViewState.Busy
  ///                   ? CircularProgressIndicator()
  ///                   : Text("Success")
  ///             ],
  ///           ),
  ///         ),
  ///       ),
  /// );

  BaseView({@required this.builder, this.onModelReady});
  @override
  _BaseViewState createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  //getit kütüphanesi ile kullandığımız modelilimiz
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      //on model metodu var ise gelen modeli parse diyor
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //değişikleri alt childlara uyarıyor
    return ChangeNotifierProvider<T>(
      builder: (context) => model,
      //tüketici viewmodel ondan türeyen modeller ile sayfaya dokunulup işlem yapılabilir
      // getit DI sayesınde A-> B modeli data bind edilebilir değiştireiblir
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
