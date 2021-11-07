import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const FlutterApp());
}

class FlutterApp extends StatelessWidget{
  const FlutterApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController controller = TextEditingController();
  String? text;
  String? errorText;
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget> [
          const Image(
              image: NetworkImage("https://s.iw.ro/gateway/g/ZmlsZVNvdXJjZT1odHRwJTNBJTJGJTJG/c3RvcmFnZTA1dHJhbnNjb2Rlci5yY3Mt/cmRzLnJvJTJGc3RvcmFnZSUyRjIwMTUl/MkYwNyUyRjIzJTJGNDgxNDY4XzQ4MTQ2/OF9jdXJzX3NjaGltYl92YWx1dGFyX2xl/aV9ldXJvXy1fbWVkaWFmYXguanBnJnc9/NzgwJmg9NDQwJmhhc2g9YjY1MTE3MGU3ZTdkMmIwNmU4Yjc3YjVkNmYyNzVkMTY=.thumb.jpg"),
          ),
          Container(
            margin: const EdgeInsetsDirectional.all(16.0),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: (String? value)
              {
                final String value = controller.text;
                final double? double_value =  double.tryParse(value);
                setState(() {
                  if (double_value == null) {
                    errorText = 'please enter a number';
                  }
                  else {
                    errorText = null;
                    double double_value_2 = double_value * 4.94;
                    result = '${double_value_2.toStringAsFixed(2)} RON';
                  }
                });
              },
              decoration: InputDecoration(
                errorText: errorText,
                hintText: 'enter the amount in EUR',
              ),
            ),
          ),
          Text(result),
        ],
      ),
    );
  }
}



