import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isRunning = false;
  int totalSeconds = 1500;
  int totalRounds = 0;
  late Timer timer;

  void onTick(Timer timer) {
    totalSeconds > 0
        ? setState(() {
            totalSeconds -= 1;
          })
        : reStartFunc();
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );

    setState(() {
      isRunning = true;
    });
    format();
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void reStartFunc() {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = 10;
      totalRounds += 1;
    });
  }

  String format() {
    var duration = Duration(seconds: totalSeconds);

    var seconds = duration.toString().substring(2, 7);

    return seconds;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isRunning
          ? Theme.of(context).scaffoldBackgroundColor
          : Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    color: Theme.of(context).cardColor,
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: Icon(isRunning
                        ? Icons.pause_circle_outlined
                        : Icons.play_circle_outlined),
                    iconSize: 150,
                  ),
                  IconButton(
                    iconSize: 50,
                    onPressed: () {
                      timer.cancel();
                      setState(() {
                        totalSeconds = 1500;
                        isRunning = false;
                      });
                    },
                    icon: const Icon(
                      Icons.restore,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30.0,
                  horizontal: 50,
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'round'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          '$totalRounds',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).textTheme.headline1!.color),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3.0, horizontal: 45.0),
                      child: Container(
                        width: 2.0,
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).textTheme.headline1!.color),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'goal'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).textTheme.headline1!.color),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
