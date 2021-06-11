import 'package:flutter/material.dart';

class CartCounterWidget extends StatefulWidget {
  CartCounterWidget(
      {Key key,
      @required this.rate,
      @required this.label,
      this.textColor = Colors.grey,
      @required this.assetImage,
      @required this.rateAdd,
      @required this.rateMinus})
      : super(key: key);

  final String label;
  final Color textColor;
  final String assetImage;
  final double rate;
  Function(double, int) rateAdd;
  Function(double, int) rateMinus;

  @override
  _CartCounterWidgetState createState() => _CartCounterWidgetState();
}

class _CartCounterWidgetState extends State<CartCounterWidget> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        // side: borderColor != null
        //     ? BorderSide(color: borderColor)
        //     : BorderSide(color: buttonColor),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 40,
                  child: Center(
                    child: Image.asset(widget.assetImage),
                  ),
                ),
                Center(
                  child: Text(
                    widget.label,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: widget.textColor, fontSize: 12),
                  ),
                ),
                Container(
                  // width: 80,
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.all(0),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.remove,
                            size: 12,
                            color: widget.textColor,
                          ),
                          onPressed: () {
                            if (counter <= 0) return;

                            setState(() {
                              counter--;
                            });
                            widget.rateMinus(widget.rate, counter);
                          }),
                      Text('$counter', style: Theme.of(context).textTheme.bodyText1.copyWith(color: widget.textColor),),
                      IconButton(
                          icon: Icon(Icons.add, size: 12, color: widget.textColor,),
                          onPressed: () {
                            setState(() {
                              counter++;
                            });
                            widget.rateAdd(widget.rate, counter);
                          }),
                    ],
                  ),
                ),
                Container(
                  width: 75,
                  child: Row(
                    children: <Widget>[
                      Text('Rs ${counter * widget.rate}', style: Theme.of(context).textTheme.bodyText1.copyWith(color: widget.textColor),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
