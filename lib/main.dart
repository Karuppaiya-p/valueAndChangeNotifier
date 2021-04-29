import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_4/app/Notifier/counter.dart';

import 'app/MyHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<ValueNotifier<int>>(
        create: (BuildContext context)=> ValueNotifier<int>(0),
      ),
      ChangeNotifierProvider<Counter>(
        create: (BuildContext context)=> Counter(),
      )
    ],
    child: MaterialApp(
      home: MyHomePage()
    ),);
  }
}

// MaterialApp(
//       home: ChangeNotifierProvider<Counter>(
//               create: (context) => Counter() ,
//               child: MyHomePage()
//             ),
//     );
