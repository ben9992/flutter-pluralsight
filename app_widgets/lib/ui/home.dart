import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            alignment: Alignment.center,
            color: Colors.deepOrangeAccent,
            padding: EdgeInsets.only(top: 30, left: 10),
            child: Column(children: [
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Margerita",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 30,
                        decoration: TextDecoration.none,
                        fontFamily: 'OdibeeSans',
                        fontWeight: FontWeight.normal),
                  )),
                  Expanded(
                      child: Text(
                    "Tomato, Mozzarella, Basil",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 30,
                        decoration: TextDecoration.none,
                        fontFamily: 'OdibeeSans',
                        fontWeight: FontWeight.normal),
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Marinara",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 30,
                        decoration: TextDecoration.none,
                        fontFamily: 'OdibeeSans',
                        fontWeight: FontWeight.normal),
                  )),
                  Expanded(
                      child: Text(
                    "Tomato, Garlic",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 30,
                        decoration: TextDecoration.none,
                        fontFamily: 'OdibeeSans',
                        fontWeight: FontWeight.normal),
                  ))
                ],
              ),
              PizzaImageWidget(),
              OrderBtn()
            ])
            //width: 192,
            //height: 96,
            //margin: EdgeInsets.all(50),
            ));
  }
}

class PizzaImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage pizzaAsset = AssetImage('assets/images/pizza1.png');
    Image img = Image(image: pizzaAsset, width: 300, height: 300);
    return Container(child: img);
  }
}

class OrderBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var btn = Container(
        margin: EdgeInsets.only(top: 50),
        child: ElevatedButton(
          child: Text("Order your Pizza !"),
          style: ElevatedButton.styleFrom(
              onPrimary: Colors.black87,
              primary: Colors.grey[300],
              minimumSize: Size(88, 36),
              padding: EdgeInsets.symmetric(horizontal: 16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2)),
              )),
          onPressed: () {
            order(context);
          },
        ));
    return btn;
  }

  void order(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Order Completed !"),
      content: Text("Thanks for your order"),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
