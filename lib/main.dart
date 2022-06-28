import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Whatsapp());
  }
}

class Whatsapp extends StatefulWidget {
  const Whatsapp({
    Key? key,
  }) : super(key: key);

  @override
  State<Whatsapp> createState() => _WhatsappState();
}

class _WhatsappState extends State<Whatsapp> {
  Color mainColor = const Color(0xFF177767);

  List<String> name = [
    'RQ',
    'Temiloluwa 59',
    'Israel Codeforces',
    'Haneef ah',
    'Barakah',
    'David Akanmu',
    'Br Sheriff Finlit React'
  ];

  List<String> time = [
    '8:29 AM',
    '8:28 AM',
    '7:55 AM',
    '7:42 AM',
    '6:13 AM',
    '5:44 AM',
    '5:06 AM',
  ];

  List<String> message = [
    'Heyyy',
    'I will send pics',
    'Sticker',
    '... Ramadan Dua:day 23. O AL',
    'Boss',
    'Done for today',
    'Just click on the image & you'
  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            backgroundColor: mainColor,
            appBar: AppBar(
              elevation: 0.0,
              toolbarHeight: 80,
              backgroundColor: mainColor,
              title: const Text('WhatsApp'),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                    )),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                ),
              ],
            ),
            body: Column(children: [
              TabBar(
                  // isScrollable: true,
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                    Tab(
                      child: Text(
                        'CHATS',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'STATUS',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Tab(
                        child: Text(
                          'CALLS',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ]),
              Expanded(
                child: TabBarView(children: [
                  Container(
                      color: Colors.green,
                      child: Center(child: Text('Take a Picture'))),
                  Stack(children: [
                    Expanded(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: 10.0,
                                    bottom: 15.0,
                                    left: 25,
                                    right: 8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.archive_outlined,
                                        color: mainColor, size: 27),
                                    SizedBox(width: 30),
                                    Text(
                                      'Archived',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: w - 210,
                                    ),
                                    Text('4',
                                        style: TextStyle(
                                          color: Colors.green,
                                          // color: Color(0xFF177767),
                                        ))
                                  ],
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: message.length,
                                itemBuilder: (BuildContext context, int index) {
                                  if (index == 1 || index == 4) {
                                    isDone = true;
                                    isText = false;
                                  } else if (index == 3) {
                                    isText = true;
                                  } else {
                                    isDone = false;
                                    isText = false;
                                  }
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: chatTile(
                                          name: name[index],
                                          message: message[index],
                                          time: time[index],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      right: 20,
                      bottom: 20,
                      child: FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: mainColor,
                        child: Icon(Icons.message),
                      ),
                    )
                  ]),
                  Container(
                      color: Colors.green,
                      child: Center(child: Text('Upload Status'))),
                  Container(
                      color: Colors.green,
                      child: Center(child: Text('View Calls'))),
                ]),
              )
            ])));
  }
}

bool isDone = false;
bool isText = false;

// bool isDone = false;

class chatTile extends StatefulWidget {
  final name;
  final message;
  final time;
  const chatTile({
    Key? key,
    this.name,
    this.message,
    this.time,
  }) : super(key: key);

  @override
  State<chatTile> createState() => _chatTileState();
}

class _chatTileState extends State<chatTile> {
  // DateTime now = DateTime.now();
  // String formattedTim = DateFormat.Hms().format(DateTime.now());
  String formattedTime = DateFormat.Hms()
      .format(DateTime.now())
      .substring(0, DateFormat.Hms().format(DateTime.now()).length - 3);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFF177767),
                  child: Icon(Icons.person),
                  radius: 30,
                ),
                SizedBox(width: 5),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.space,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                      SizedBox(height: 5),
                      isDone
                          ? Row(
                              children: [
                                Icon(
                                  Icons.check,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  // 'message',
                                  widget.message,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            )
                          : Text(
                              // 'message',
                              widget.message,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            child: Column(
              children: [
                isText
                    ? Text(
                        widget.time,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.green,
                        ),
                      )
                    : Text(
                        widget.time,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          // color: Colors.green
                        ),
                      ),
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(20),
                //   child: Container(color: Colors.green, child: Text('4')),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
