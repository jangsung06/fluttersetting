import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:setting/main.dart';
import 'TouchSoundPlayer.dart';
class TouchTest extends StatefulWidget{

  final String name;
  const TouchTest({required this.name});

  @override
  State<TouchTest> createState()=> _TouchTestState(name);
}

class _TouchTestState extends State<TouchTest> {
  final String name;
  final player = AudioPlayer();

  List<Widget> containers = <Widget>[];
  List<Color> containersColor = <Color>[];
  static const double _minWidth = 63.0;
  static const double _minHeight = 63.0;
  static const double _margin = 1.0;
  _TouchTestState(this.name);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;//
    final EdgeInsets padding = MediaQuery.of(context).padding;
    var screenWidth = size.width - padding.left - padding.right - 1;
    // 「-1」をしないと、horizontalCount分並べたときに、途中で折り返される
    var screenHeight = size.height - padding.top - padding.bottom;
    var horizontalCount = (screenWidth / _minWidth).round();
    var containerWidth = screenWidth / horizontalCount; //
    var verticalCount = (screenHeight / _minHeight).round();
    var containerHeight = screenHeight / verticalCount;

    if (containers.isEmpty == true) {
      int i = 0;
      for (i = 0; i < 600; i++) {
        containersColor.add(Color(0xff89a08a));

      }
    }

    return Scaffold(
      //appBar: AppBar(title: const Text("Test GridView")),
        body: Wrap(
          children: [
            for (int i = 0; i < horizontalCount * verticalCount; i++) ...[
              Container(
                width: containerWidth - (_margin * 2),
                height: containerHeight - (_margin * 2),
                margin: EdgeInsets.all(_margin),
                child: ElevatedButton(
                    child: (i==0 || i==horizontalCount * verticalCount-1) ? Text(('終了').toString())  : Text(('').toString()),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                          return containersColor[i];
                          // Defer to the widget's default.
                        },
                      ),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Color(0xff465d57);
                          }
                        },

                      ),
                    ),
                    onPressed: () =>
                    {
                      touchSoundPlayer.play(),


                      if(i==0||i==horizontalCount * verticalCount-1){
                        {Navigator.pop(context)}

                      }
                      else if(containersColor[i] == Color(0xffd6cfc2))
                        {
                          containersColor[i] = Color(0xff89a08a)
                        }
                      else
                        {
                          containersColor[i] = Color(0xffd6cfc2)
                        }
                    }

                ),
              )
            ],
          ],
        )
    );
  }
}
