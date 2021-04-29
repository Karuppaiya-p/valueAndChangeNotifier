import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_4/app/Notifier/counter.dart';

class MyHomePage extends StatelessWidget{
MyHomePage() : super();

@override
Widget build(BuildContext context) {

  final commonCounter = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title:Text("Home Page")
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Consumer<Counter>(
              builder: (__, value, _) { 
                return  Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text('Addition with common Provider: ${value.value} + ${commonCounter.value} = '+(value.value+commonCounter.value).toString()),
                        );
              }
            ),
            Consumer<ValueNotifier<int>>(
              builder: (__, value, _) { 
                return  Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text('Subtraction with Common Provider: ${value.value} + ${commonCounter.value} = '+(value.value+commonCounter.value).toString()),
                        );
              }
            )
          ],
        ),
      ),
      floatingActionButton:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () { 
                  Provider.of<Counter>(context,listen: false).increment();
                },
                
          ),
          FloatingActionButton(
                child: Icon(Icons.remove),
                onPressed: () { 
                  Provider.of<ValueNotifier<int>>(context,listen: false).value--;
                },
                
          ),
        ],
      ),
      );
  }
  
}