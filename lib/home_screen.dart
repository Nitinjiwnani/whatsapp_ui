import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexTab = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('WhatsApp'),
          bottom: TabBar(
              onTap: (index) {
                setState(() {
                  indexTab = index;
                });
              },
              tabs: [
                Tab(
                  child: Icon(Icons.camera_alt),
                ),
                Tab(child: Text('Chats')),
                Tab(child: Text('Status')),
                Tab(child: Text('Call')),
              ]),
          actions: [
            Icon(Icons.search),
            SizedBox(
              width: 10,
            ),
            PopupMenuButton(
                icon: Icon(Icons.more_vert_outlined),
                itemBuilder: (context) => [
                      PopupMenuItem(value: '1', child: Text('New group')),
                      PopupMenuItem(value: '2', child: Text('New broadcast')),
                      PopupMenuItem(value: '3', child: Text('Linked devices')),
                      PopupMenuItem(
                          value: '3', child: Text('Starred messages')),
                      PopupMenuItem(value: '3', child: Text('Payments')),
                      PopupMenuItem(value: '3', child: Text('Settings')),
                    ]),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: TabBarView(children: [
          Text('Camera'),
          ListView.builder(
              itemCount: 100,
              itemBuilder: ((context, index) {
                return ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(index % 2 == 0
                          ? 'https://th.bing.com/th?q=Boss+Starz&w=120&h=120&c=1&rs=1&qlt=90&cb=1&dpr=1.25&pid=InlineBlock&mkt=en-IN&cc=IN&setlang=en&adlt=moderate&t=1&mw=247'
                          : 'https://th.bing.com/th/id/OIP.pjPLV7yoKXs7IhbfjoopbQHaGL?w=242&h=202&c=7&r=0&o=5&dpr=1.25&pid=1.7')),
                  title: Text(index % 2 == 0 ? 'Boss' : 'Papa'),
                  subtitle: Text(index % 2 == 0
                      ? 'Your leave is not approved.'
                      : 'Beta, when are you coming home? Doodle misses you so much😢😢'),
                  trailing: Text('10.22pm'),
                );
              })),
          ListView.builder(
              itemCount: 100,
              itemBuilder: ((context, index) {
                if (index == 0) {
                  return ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey,
                          width: 3,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://www.meme-arsenal.com/memes/b6a18f0ffd345b22cd219ef0e73ea5fe.jpg'),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green, shape: BoxShape.circle),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text('My Status'),
                    subtitle: Text('Tap to add status update'),
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      index == 1
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, top: 8.0, bottom: 8.0),
                              child: Text('Recent updates'),
                            )
                          : ListTile(
                              leading: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.green,
                                    width: 3,
                                  ),
                                ),
                                child: CircleAvatar(
                                    backgroundImage: NetworkImage(index % 2 == 0
                                        ? 'https://images.pexels.com/photos/12128380/pexels-photo-12128380.jpeg?auto=compress&cs=tinysrgb&w=300&lazy=load'
                                        : 'https://th.bing.com/th/id/OIP.wpjgMMrLOId-OpooOO5zTQHaF6?w=251&h=201&c=7&r=0&o=5&dpr=1.25&pid=1.7')),
                              ),
                              title: Text(index % 2 == 0 ? 'Crush' : 'Friend'),
                              subtitle: Text('35m ago'),
                            ),
                    ],
                  );
                }
              })),
          ListView.builder(
              itemCount: 100,
              itemBuilder: ((context, index) {
                return ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(index % 2 == 0
                          ? 'https://images.pexels.com/photos/12128380/pexels-photo-12128380.jpeg?auto=compress&cs=tinysrgb&w=300&lazy=load'
                          : 'https://www.bing.com/th?id=OIP.ZtAyWObrDIU9vo-OyCmPSwHaLH&w=150&h=225&c=8&rs=1&qlt=90&o=6&dpr=1.25&pid=3.1&rm=2')),
                  title: Text(index % 2 == 0 ? 'Crush' : 'Yash'),
                  subtitle: Text(
                      index % 2 == 0 ? 'You missed call' : 'July 28, 12:23'),
                  trailing:
                      Icon(index % 2 == 0 ? Icons.phone : Icons.video_call),
                );
              })),
        ]),
        floatingActionButton: Container(
            decoration:
                BoxDecoration(color: Colors.teal, shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: indexTab == 1
                  ? Icon(Icons.message)
                  : indexTab == 2
                      ? Icon(Icons.camera)
                      : Icon(Icons.phone),
            )),
      ),
    );
  }
}
