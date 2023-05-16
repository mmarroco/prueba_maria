import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'App Maria',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey.shade300),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      case 2:
        page = FavoritesPage();
        break;
        default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: Text("SUPERDATADO", style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold),), backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(backgroundColor: Colors.blueGrey.shade50,
                  extended: constraints.maxWidth >= 600,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.upload_sharp),
                      label: Text('Subir Documentos'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.code),
                      label: Text('Creación de Código'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.account_circle_rounded),
                      label: Text('Mi Cuenta'),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                   setState(() {
                     selectedIndex = value;
                   });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.background,
                  child: page,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('Página no creada todavía'),
      );
    }

   return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('Tienes '
              '${appState.favorites.length} palabras favoritas:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}

class GeneratorPage extends StatelessWidget {
  TextEditingController controladorPregunta= TextEditingController(text: ' Haz aqui tu pregunta');
  List<String> listaPreguntas = [];
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    return Center(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Knowledge center", style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontStyle: FontStyle.italic, fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 15),
          Container(
              color: Theme.of(context).colorScheme.onPrimary,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controladorPregunta,
                      style: TextStyle(backgroundColor: Colors.black12,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    flex: 3,
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton.icon(
                        onPressed: (){
                      listaPreguntas.add(controladorPregunta.value.text);
                      print(listaPreguntas);
                        },
                      icon: Icon(Icons.check),
                      label: Text('Pregunta', style: TextStyle(color: Theme.of(context).colorScheme.secondary, backgroundColor: Colors.blueGrey.shade50),),
                    ),
                  )
                ],
              )),
          SizedBox(height: 15),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(Icons.cloud_upload),
                label: Text('Agregar un excel o csv', style: TextStyle(color: Theme.of(context).colorScheme.secondary, backgroundColor: Colors.blueGrey.shade50),),
              ),
              SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(Icons.upload_file),
                label: Text('Agregar un PDF', style: TextStyle(color: Theme.of(context).colorScheme.secondary, backgroundColor: Colors.blueGrey.shade50)),
              ),
              SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(Icons.connected_tv),
                label: Text('Agregar una conexión a SQL', style: TextStyle(color: Theme.of(context).colorScheme.secondary, backgroundColor: Colors.blueGrey.shade50)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class BigCart extends StatelessWidget {
  const BigCart({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      elevation: 20,
      color: theme.colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Text(pair.asLowerCase,
            style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}