import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  MyAppState createState()=> MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{



  late TabController _tabController;
  late ScrollController _ScrollController;

  void initState() {

    _tabController=new TabController(length: 4,vsync:this);
    _ScrollController=new ScrollController();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: NestedScrollView(
          controller: _ScrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget> [
              SliverAppBar(
                actions: <Widget>[
                  Icon(Icons.search),
                  Container(width: 15.0),
                  Icon(Icons.more_vert),
                  Container(width: 20.0)
                ],
                pinned: true,
                floating: true,
                centerTitle: false,
                backgroundColor: Color(0xFF075e54),
                title: Text('whatapp'),
                bottom: TabBar(
                  indicatorWeight: 5.0,
                  indicatorColor: Colors.white,
                  controller: _tabController,

                    tabs: [
                 Tab(
                   child: Icon(Icons.photo_camera),
                 ),
                 Tab(
                   text: 'chats',
                 ) ,
                  Tab(
                    text: 'status',
                  ),
                  Tab(
                    text: 'calls',
                  )
                ]),
              )
            ];
          }, body: TabBarView(
          controller: _tabController,
          children: [
            Text('camera'),
            Chats(),
            Status(),
            Text('calls')
          ],
        ),
        ),

      ),

    );
  }
}

class Chats extends StatefulWidget{
  ChatState createState() => ChatState();
}

class ChatState extends State<Chats> {

  List<String> name = [
    'rahul',
    'ravi',
    'amit',
    'rahul',
    'ravi',
    'amit',
    'rahul',
    'ravi',
    'amit',
  ];

  List<String> text = [
    'hello',
    'how are you',
    'im good',
    'hello',
    'how are you',
    'im good',
    'hello',
    'how are you',
    'im good',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF25d366),
        child: Center(child: Icon(Icons.message),),
        onPressed: null,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: name.length,
            itemBuilder: (context,index) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('data:image/jpeg;base64,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'),
                    ),
                    title: Text(name[index]),
                    subtitle: Text(text[index]),
                    trailing: Text('10:00 AM'),
                  ),
                  Divider()
                ],
              );
            }
        ),
      ),
    );
  }
}


class Status extends StatefulWidget{

  StatusState createState()=> StatusState();
}

class StatusState extends State<Status> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF25d366),
        onPressed: null,
        child: Icon(Icons.photo_camera),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('data:image/jpeg;base64,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'),
              ),
              title: Text('my status'),
              subtitle: Text('tap to add status')
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 20.0,
            child: Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                    'recent update', style: TextStyle(color: Colors.grey))
            ),
          )

        ],
      ),
    );
  }
}