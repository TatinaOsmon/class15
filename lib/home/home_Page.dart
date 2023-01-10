import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter Piano'),
      ),
      body: Column(
        children: [
          const Expanded(
            flex: 1,
            child: Center(child: Text('do,re, mi, fa, sol,la, si,do')),
          ),
          Expanded(
            flex: 3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        pianoWhiteButton(
                          nameNote: '6669.mp3',
                        ),
                        pianoWhiteButton(
                          nameNote: '6670.mp3',
                        ),
                        pianoWhiteButton(
                          nameNote: '6672.mp3',
                        ),
                        pianoWhiteButton(
                          nameNote: '6673.mp3',
                        ),
                        pianoWhiteButton(
                          nameNote: '6674.mp3',
                        ),
                        pianoWhiteButton(
                          nameNote: '6675.mp3',
                        ),
                        pianoWhiteButton(
                          nameNote: '6676.mp3',
                        ),
                      ],
                    ),
                    Positioned(
                      left: 40,
                      right: 0,
                      top: 0,
                      child: Row(
                        children: const [
                          pianoBlackButton(
                            nameNote: '6669.mp3',
                          ),
                          pianoBlackButton(
                            nameNote: '6670.mp3',
                          ),
                          pianoBlackButton(
                            visible: false,
                            nameNote: '6676.mp3',
                          ),
                          pianoBlackButton(
                            nameNote: '6672.mp3',
                          ),
                          pianoBlackButton(
                            nameNote: '6673.mp3',
                          ),
                          pianoBlackButton(
                            nameNote: '6674.mp3',
                          ),
                          pianoBlackButton(
                            nameNote: '6675.mp3',
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class pianoBlackButton extends StatelessWidget {
  const pianoBlackButton({
    Key? key,
    this.visible = true,
    required this.nameNote,
  }) : super(key: key);
  final bool visible;
  final String nameNote;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: SizedBox(
        width: 63,
        height: 130,
        child: Visibility(
          visible: visible,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.resolveWith(((states) => Colors.black)),
              overlayColor: MaterialStateProperty.resolveWith((states) {
                return states.contains(MaterialState.pressed)
                    ? Colors.red
                    : null;
              }),
            ),
            onPressed: () {
              AudioPlayer().play(
                AssetSource('notes/6669.mp3'),
              );
            },
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  '',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class pianoWhiteButton extends StatelessWidget {
  const pianoWhiteButton({
    Key? key,
    required this.nameNote,
  }) : super(key: key);
  final String nameNote;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        width: 80,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith(((states) => Colors.white)),
            overlayColor: MaterialStateProperty.resolveWith((states) {
              return states.contains(MaterialState.pressed) ? Colors.red : null;
            }),
          ),
          onPressed: () {
            AudioPlayer().play(
              AssetSource('notes/$nameNote'),
            );
          },
          child: const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 15,
              ),
              child: Text(
                '',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
