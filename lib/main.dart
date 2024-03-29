import 'package:flutter/material.dart';
import 'package:setting/dev/colortest.dart';
import 'package:setting/dev/touchtest.dart';
import 'package:setting/dev/audio_player_page.dart';
import 'package:window_manager/window_manager.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dev/TouchSoundPlayer.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    //size: Size(800, 600),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    //titleBarStyle: TitleBarStyle.hidden,
    //fullScreen: true
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
    await windowManager.setPosition(const Offset(1025, 0));
  });

  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'navi',
          home:FirstRoute()));
}

class FirstRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _FirstRoute();
  }
}
class _FirstRoute extends State<FirstRoute>{
  var switchValue = false;
  String monitor = 'SCREEN CHANGE(横)';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor:  Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            "SETTING FOR 新POS",
            style:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.white),
                          fixedSize: MaterialStateProperty.all(const Size(180, 200))),
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondRoute(name: 'color',)));},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(height: 30,),
                          Icon(Icons.invert_colors,color: Color(0xff5f6368),size: 60,),
                          SizedBox(height: 20,),
                          Text(style: TextStyle(color: Color(0xff465d57),fontSize: 12),'COLOR TEST'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10,),
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.white),
                          fixedSize: MaterialStateProperty.all(const Size(180, 200))),
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const TouchTest(name: 'touch',)));},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(height: 30,),
                          Icon(Icons.touch_app_outlined,color: Color(0xff5f6368),size: 60,),
                          SizedBox(height: 20,),
                          Text(style: TextStyle(color: Color(0xff465d57),fontSize: 12),'TOUCH TEST'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.white),
                            fixedSize: MaterialStateProperty.all(const Size(180, 200))),
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const AudioPlayerPage(name: 'audio',)));},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(height: 30,),
                            Icon(Icons.volume_up_outlined,color: Color(0xff5f6368),size: 60,),
                            SizedBox(height: 20,),
                            Text(style: TextStyle(color: Color(0xff465d57),fontSize: 12),'SOUND TEST'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10,),
                      ElevatedButton(
                        style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.white),
                            fixedSize: MaterialStateProperty.all(const Size(180, 200))),
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondRoute(name: 'color',)));},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(height: 30,),
                            Icon(Icons.movie_outlined,color: Color(0xff5f6368),size: 60,),
                            SizedBox(height: 20,),
                            Text(style: TextStyle(color: Color(0xff465d57),fontSize: 12),'VIDEO TEST'),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
            ]

        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color(0xff03dac6),
          foregroundColor: Colors.black,

          onPressed: () {
            final player1 = AudioPlayer();
            final player2 = AudioPlayer();
            if (monitor == 'SCREEN CHANGE(横)') {
              setState(() {
                monitor = 'SCREEN CHANGE(縦)';
                windowManager.setPosition(const Offset(0, 0));
                player1.setBalance(1);
              });
            } else {
              setState(() {
                monitor = 'SCREEN CHANGE(横)';
                windowManager.setPosition(const Offset(1025, 0));
                player2.setBalance(-1);
              });
            }

          },
          icon: Icon(Icons.monitor),
          label: Text('$monitor'),

        ),

      ),
    );}}




