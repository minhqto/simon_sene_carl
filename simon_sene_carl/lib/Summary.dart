import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simon_sene_carl/CongratulationScreen.dart';
import 'package:simon_sene_carl/widgets/drawer.dart';
import "themeColor.dart";


class MySummary extends StatefulWidget{
  final String ticker;
  final double marketVal;
  final int quantity;


  MySummary({@required this.ticker,@required  this.marketVal,@required  this.quantity});


  @override
  _Summary createState() => new _Summary();
}

class _Summary extends State<MySummary> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        backgroundColor: getTheme(),
        extendBodyBehindAppBar: false,
        appBar: new AppBar(
          elevation: 0,
          backgroundColor: getTheme(),
          iconTheme: new IconThemeData(color: Colors.black),
          title: Text("Prosper",
              style:
              TextStyle(fontFamily: "MonarchDisplay", color: Colors.black)),
        ),
        drawer: MyDrawer(),
        body: ListView(
          children: <Widget>[
            Container(
                padding: getHeaderPadding(),
                child: Text("Summary",
                    style: TextStyle(
                        fontFamily: "Medium",
                        fontSize: 28
                    )
                )),
            Container(
                padding: getHeaderPadding(),
                child: Text(
                    "Review details, then confirm to purchase the stock",
                    style: TextStyle(
                        fontFamily: "Regular",
                        fontSize: 18
                    ))
            ),
            Row(
                children: <Widget>[

                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 40, left: 20),
                        child: Text('Account', textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 14, fontFamily: "Regular")),
                      )),

                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 40, right: 20),
                        child: Text('TFSA', textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 20, fontFamily: "Regular")),
                      )),

                ]),
            Divider(
              color: Colors.grey,
            ),
            Row(
                children: <Widget>[

                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        child: Text('Symbol', textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 14, fontFamily: "Regular")),
                      )),

                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, right: 20),
                        child: Text(widget.ticker, textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 20, fontFamily: "Regular")),
                      )),

                ]),
            Divider(
              color: Colors.grey,
            ),
            Row(
                children: <Widget>[

                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        child: Text('Market Value', textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 14, fontFamily: "Regular")),
                      )),

                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, right: 20),
                        child: Text(widget.marketVal.toString(), textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 20, fontFamily: "Regular")),
                      )),

                ]),
            Divider(
              color: Colors.grey,
            ),
            Row(
                children: <Widget>[

                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        child: Text('Quantity', textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 14, fontFamily: "Regular")),
                      )),

                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, right: 20),
                        child: Text(widget.quantity.toString(), textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 20, fontFamily: "Regular")),
                      )),

                ]),
            Divider(
              color: Colors.grey,
            ),
            Row(
                children: <Widget>[

                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        child: Text('Estimated Cost', textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 14, fontFamily: "Regular")),
                      )),

                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, right: 20),
                        child: Text((widget.quantity * widget.marketVal).toString(), textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 20, fontFamily: "Regular")),
                      )),

                ]),
            Divider(
              color: Colors.grey,
            ),
            Row(
                children: <Widget>[

                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        child: Text('Fee', textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 14, fontFamily: "Regular")),
                      )),

                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, right: 20),
                        child: Text("\$9.95 CAD", textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 20, fontFamily: "Regular")),
                      )),

                ]),
            Padding(
                padding: EdgeInsets.only(bottom: 50)
            ),
            Divider(
              color: Colors.black,
              thickness: 3,
            ),
            Row(
                children: <Widget>[

                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        child: Text('Total Cost', textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 14, fontFamily: "Regular")),
                      )),

                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, right: 20),
                        child: Text("\$"+(widget.quantity * widget.marketVal + 9.95).toString() + " CAD", textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 20, fontFamily: "Regular")),
                      )),

                ]),
            Row(
                children: <Widget>[

                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(top: 40, left: 20),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel', textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 14, fontFamily: "Regular")),
                          ))),

                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(top: 40, right: 20),
                          child: OutlineButton(
                            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Congratulation()));},

                            child: Text(
                                'Confirm Purchase', textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 12, fontFamily: "Regular")),
                          ))),

                ]),
          ],
        )
    );
  }
}


