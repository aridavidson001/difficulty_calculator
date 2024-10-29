import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        title: 'Difficulty Score Calculator',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white10),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  void getNext() {
    notifyListeners();
  }


  }




// ...

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = HomePage();
      case 1:
        page = TrickLevelPage();
      ();
      case 2:
        page = CalculatorPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');

    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                
                extended: constraints.maxWidth >= 600,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.analytics),
                      label: Text('Trick Level'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.calculate),
                       label: Text('Calculate')
                       )
                  ],
                  selectedIndex: selectedIndex,   
                  onDestinationSelected: (value) {
        
                    // ↓ Replace print with this.
                    setState(() {
                      selectedIndex = value;
        
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
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


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();


    return GridView(      
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      children: <Widget>[

     
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                 showDialog(
                context: context, 
                builder: (context) => AlertDialog(
                title: const Text("Settings"),
                    
                
                actions: <Widget>[
                  const SettingsContent(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      child: const Text("okay"),
                    ),
                )
          ]
          )
            );
              },
                icon: const Icon(Icons.settings_outlined),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                 showDialog(
                context: context, 
                builder: (context) => AlertDialog(
                title: const Text("About"),
                actions: [
                  const AboutContent(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      child: const Text("okay"),
                    )
                  )
                ]
                )
                
                );
                  },
                icon: const Icon(Icons.info_outline),
              ),
            ],
          ),
        
      
      const Center(
        child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BigCard(),  
                    ] 
      )
      )
      ],
       
    );
    
  }
}

class AboutContent extends StatelessWidget {
  const AboutContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

  
    return const Center(
      child: Text("Developed and Maintained by Ari Davidson")

    );

    
  }
}


class SettingsContent extends StatelessWidget {
  const SettingsContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

  
    return Settings();

    
  }
}
class Settings extends StatefulWidget {

  @override
  State<Settings> createState() => _SettingsState();

}
class _SettingsState extends State<Settings> {
  
  int brightnesSettings = 50;
  int volumeSettings = 0;
  bool checkbox = false;
  @override
  Widget build(BuildContext context) {
    

    return Column(
      children: [
        Text("Brightness"),
        Slider(
          label: "Brightness",   
          value: brightnesSettings.toDouble(),
          onChanged: (value) {
              setState(() {
                  brightnesSettings = value.toInt();
              });
          },  
          min: 0.0,
          max: 100.0,
           ),
          Text("Volume"),
           Slider(
          label: "Volume",
          value: volumeSettings.toDouble(),
          onChanged: (value) {
            setState(() {
                  volumeSettings = value.toInt(); 
            });
          },
          min: 0,
          max: 100,
           ),
           CheckboxListTile(
            title: const Text('Checkbox :)'),
            value: checkbox,
            onChanged: (value) {
              setState(() {
                checkbox = value!;
              });
            }
           ),
           TextField(
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Team #',
            ),
           )
      ],
    );
  }
}

class TrickLevelPage extends StatelessWidget {
    
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);    

    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    // TODO: add data analysis
    return comingSoon(theme, style);
    }

  Center comingSoon(ThemeData theme, TextStyle style) {
    return Center(
    child: Card(
      color: theme.colorScheme.primary,  
      child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text("Coming Soon!", style: style),
      )
    ),
  );
  }
}
// ...

class CalculatorPage extends StatelessWidget {
   
 
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);    

    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    // TODO: add data analysis
    return comingSoon(theme, style);
    }

  Center comingSoon(ThemeData theme, TextStyle style) {
    return Center(
    child: Card(
      color: theme.colorScheme.primary,  
      child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text("Coming Soon!", style: style),
      )
    ),
  );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);    

    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(

      color: theme.colorScheme.primary,  
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text("Calculator", style: style),
      ),
    );
  }
}
