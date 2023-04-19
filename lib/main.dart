import 'package:flutter/material.dart';

void main() {
  runApp(const PersonalPortfolioApp());
}

class PersonalPortfolioApp extends StatelessWidget {
  const PersonalPortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: PersonalPortfolio(),
        ),
      ),
    );
  }
}

class PersonalPortfolio extends StatefulWidget {
  const PersonalPortfolio({Key? key}) : super(key: key);

  @override
  PersonalPortfolioState createState() => PersonalPortfolioState();
}

class PersonalPortfolioState extends State<PersonalPortfolio>
    with TickerProviderStateMixin {
  final Color appColor = Colors.blueAccent;
  final String avatarImg =
      'https://drive.google.com/uc?export=view&id=1wNYSI6O9Qm9zSoej9MUcPk-SNmikGNLQ';

  late AnimationController ctrl;
  late AnimationController contentCtrl;

  @override
  void initState() {
    super.initState();
    ctrl =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();

    contentCtrl =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..forward();
  }

  @override
  void dispose() {
    ctrl.dispose();
    contentCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: contentCtrl, curve: Curves.easeInOut)),
        child: SlideTransition(
            position:
                Tween<Offset>(begin: const Offset(0.0, 0.125), end: Offset.zero)
                    .animate(CurvedAnimation(
                        parent: contentCtrl, curve: Curves.easeInOut)),
            child: Center(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Stack(children: [
                    FadeTransition(
                        opacity: Tween<double>(begin: 1.0, end: 0.0).animate(
                            CurvedAnimation(
                                parent: ctrl, curve: Curves.easeInOut)),
                        child: ScaleTransition(
                            scale: Tween<double>(begin: 1.0, end: 1.5).animate(
                                CurvedAnimation(
                                    parent: ctrl, curve: Curves.easeInOut)),
                            child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: appColor,
                                  borderRadius: BorderRadius.circular(50),
                                )))),
                    Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                                image: NetworkImage(avatarImg),
                                fit: BoxFit.cover),
                            border: Border.all(color: appColor, width: 8)))
                  ]),
                  Text('Gideon Salami',
                      style: TextStyle(
                          color: appColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const Text('Flutter Developer / Software Engineer'),
                  const SizedBox(height: 20),
                  TextButton(
                      onPressed: () {},
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.email, color: appColor),
                            const SizedBox(width: 10),
                            Text('salamigideon01@gmail.com',
                                style: TextStyle(color: appColor))
                          ])),
                  const SizedBox(height: 2),
                  TextButton(
                      onPressed: () {},
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.language, color: Colors.blueAccent),
                            SizedBox(width: 10),
                            Text('salamitech.web.app',
                                style: TextStyle(color: Colors.blueAccent))
                          ]))
                ]))));
  }
}
