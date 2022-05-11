import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meow/services/cat_service.dart';
import 'package:meow/utils/app_constants.dart';

// Initiate the service locator
void serviceLocator() {
  GetIt.instance.registerLazySingleton(() => CatService());
}

void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meow Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Meow Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CatService get catService => GetIt.instance<CatService>();
  String _catImageUrl = apiGift;

  @override
  void initState() {
    super.initState();
  }

  // Get the cat image url
  _getCatImage() async {
    var cat = await catService.getCatImageUrl();

    setState(() {
      _catImageUrl = apiUrl + cat.url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(_catImageUrl),
            ElevatedButton(
              onPressed: _getCatImage,
              child: const Text("Meow"),
            ),
          ],
        ),
      ),
    );
  }
}
