// Kush Darji && Idirs Saad

//Activity 07: App Dev Challenge: Animated Heartbeat App
// Due 02/14/2024 – End of Class
// Everyone will need to submit main dart + APK copy to dropbox assigned and place both names of
// There will be a secret code to validate the in-class submission during class5– no attendance no
// credit period

// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy Valentines\'s Day Grettings',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: HeartPulseAnimation(),
    );
  }
}

class HeartPulseAnimation extends StatefulWidget {
  const HeartPulseAnimation({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _HeartPulseAnimationState createState() => _HeartPulseAnimationState();

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
}

class _HeartPulseAnimationState extends State<HeartPulseAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<String> greetings = [
    "For me, every day with you is Valentine’s Day.",
    "Your smile sets my heart on fire.",
    "Words can’t describe my love for you, so I made you a video!",
    "You and me are meant to be.",
    "My heart is found wherever you are.",
    "Every love story is beautiful, but ours is my favorite.",
    "I’ve loved you from the moment I laid eyes on you.",
    "Right from the start, you stole my heart.",
    "To me, you are perfect. (Yes, you!)"
        "Every moment I spend with you is like a beautiful dream come true"
  ];

  int currentIndex = 0;
  int countdown = 10; // in seconds
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10), // Set animation duration
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(_controller);

    // Start countdown timer
    startTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        if (countdown > 0) {
          countdown--;
        } else {
          t.cancel(); // Stop the timer when countdown reaches 0
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Valentine\'s Day Greetings'),
      ),
      body: Stack(
        children: [
          Center(
            child: ScaleTransition(
              scale: _animation,
              child: Image.asset(
                'assets/images/floating_rotatingheart.gif',
                width: 200,
                height: 200,
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 150,
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(_controller),
              child: Image.asset(
                'assets/images/sparklez_opac.gif',
                width: 200,
                height: 200,
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    greetings[currentIndex],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent,
                      shadows: [
                        Shadow(
                          blurRadius: 3.0,
                          color: Colors.blue,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Remanding watch: $countdown seconds',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    // changes greeting from button press while elapsed time
                    onPressed: () {
                      setState(() {
                        currentIndex = (currentIndex + 1) % greetings.length;
                      });
                    },
                    child: const Text('Howdy ->'),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: CustomPaint(
              painter: ConfettiPainter(
                duration: Duration(seconds: 3),
                colors: [Colors.red, Colors.yellow, Colors.green],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ConfettiPainter extends CustomPainter {
  final Duration duration;
  final List<Color> colors;

  ConfettiPainter({required this.duration, required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.deepOrange
      ..style = PaintingStyle.fill;

    final random = Random();
    for (int i = 0; i < 100; i++) {
      final double x = random.nextDouble() * size.width;
      final double y = random.nextDouble() * size.height;
      final double radius = random.nextDouble() * 3;
      canvas.drawCircle(Offset(x, y), radius, paint);
    }

    // ignore: prefer_typing_uninitialized_variables
    var _animation;
    final t = _animation.duration;
    paint.color = colors[((t * colors.length).floor()) % colors.length];
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
