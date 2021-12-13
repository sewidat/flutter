import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grid',
      home: MyHomePage(title: "grid2"),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            backgroundColor: const Color.fromRGBO(47, 53, 101, 1),
            leadingWidth: 150,
            leading: Row(
              children: [
                buildIconButton(const Icon(Icons.person)),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                        onPressed: () {
                          print("samer");
                        },
                        child: const Text("username"))),
              ],
            ),
            centerTitle: true,
            title:
                Image.asset("Assets/Images/swayWhiteLogo-removebg-preview.png"),
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 10, 0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          buildIconButton(const Icon(Icons.notification_add)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildIconButton(const Icon(Icons.search)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildIconButton(const Icon(Icons.public)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildIconButton(const Icon(Icons.logout)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Container(
          decoration:
              const BoxDecoration(color: Color.fromRGBO(246, 246, 246, 1)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: FractionallySizedBox(
                    widthFactor: 0.95,
                    heightFactor: 0.5,
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white70,
                            spreadRadius: 1,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              "User Dashboard",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                              child: FractionallySizedBox(
                            widthFactor: 0.8,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: ColWid(
                                      upper: "Time",
                                      down: DateFormat('hh:mm a')
                                          .format(DateTime.now())),
                                ),
                                const VerticalDivider(
                                  indent: 20,
                                  endIndent: 20,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: ColWid(upper: "Shifts", down: "03"),
                                ),
                                const VerticalDivider(
                                  indent: 20,
                                  endIndent: 20,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child:
                                      ColWid(upper: "Orders", down: "123456"),
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: 800,
                    height: 800,
                    child: GridView.count(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      crossAxisSpacing: 100,
                      mainAxisSpacing: 100,
                      crossAxisCount: 4,

                      children: List.generate(12, (index) {
                        return Container(
                          decoration: const BoxDecoration(color: Colors.blueGrey),
                          child: Center(
                              child: Text(
                            "${index + 1}",
                            style: Theme.of(context).textTheme.headline5,
                          )),
                        );
                      }),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  IconButton buildIconButton(Icon icon) {
    return IconButton(
        onPressed: () {
          print("samer");
        },
        icon: icon);
  }
}

class ColWid extends StatelessWidget {
  final String upper;

  final String down;

  const ColWid({Key? key, required this.upper, required this.down})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(
            upper,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        Text(
          down,
          style: const TextStyle(
            color: Colors.lightBlue,
          ),
        ),
      ],
    );
  }
}
