import 'package:flutter/material.dart';
import 'package:practice/screen2.dart';

void main() {
runApp(practice());
}


class practice extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: counter(),

    );
  }

}


class counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _counterState();
  }

}

class _counterState extends State<counter> {

  Mysnackbar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }
  String text = 'Hi';
  int counter = 0;


  void _incrementCounter() {
    setState(() {
      counter++;
      if (counter == 5) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Counter value is 5!'),
              actions: [
                TextButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else if (counter == 10) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondScreen()),
        );
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      counter--;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful'),
        backgroundColor: Colors.black,

      ),
      body: Center(

        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter Value: $counter',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                    onPressed: _incrementCounter,
                    child: Text('Increment'),
                  ),
                ),
                SizedBox(width: 10,),
                Flexible(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                    onPressed: _decrementCounter,
                    child: Text('Decrement'),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: SizedBox(),
                ),
              ],
            ),
          ],
        )
      ),



    );
  }
}

