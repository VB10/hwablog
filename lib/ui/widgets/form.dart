import 'package:flutter/material.dart';
import 'package:hwablog/core/model/feed/shop_model.dart';

class ShopForm extends StatefulWidget {
  final Function(ShoppingModel model, bool isValid) onPressed;

  ShopForm({
    Key key,
    this.onPressed,
  }) : super(key: key);

  @override
  _ShopFormState createState() => _ShopFormState();
}

class _ShopFormState extends State<ShopForm> {
  final TextEditingController title = TextEditingController();

  final TextEditingController price = TextEditingController();

  final TextEditingController url = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>(debugLabel: "form");
  String _validator(String val) =>
      val.isNotEmpty ? null : "This field cannot be blank";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: title,
              decoration: InputDecoration(
                  hintText: "Shop Item Title", prefixIcon: Icon(Icons.shop)),
              validator: _validator,
            ),
            TextFormField(
              controller: price,
              validator: _validator,
              decoration: InputDecoration(
                  hintText: "Shop Item Price",
                  prefixIcon: Icon(Icons.attach_money)),
            ),
            TextFormField(
              controller: url,
              validator: _validator,
              decoration: InputDecoration(
                  hintText: "Shop Item Image", prefixIcon: Icon(Icons.image)),
            ),
            FlatButton.icon(
              icon: Icon(Icons.add_shopping_cart),
              label: Text("Create Shop Item"),
              onPressed: () {
                if (formKey.currentState.validate()) {
                  var shopModel = ShoppingModel(
                      item: title.text, price: price.text, imageURL: url.text);
                  widget.onPressed(shopModel, true);
                } else {
                  widget.onPressed(null, false);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
