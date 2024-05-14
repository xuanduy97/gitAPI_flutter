import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/detail.dart';
import 'package:flutter_demo/service/get_method.dart';
import 'models/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Screen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var indexPage = 0;
  List<GitUser> users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gotoPage();
  }

  void gotoPage(){
    GetAPI.fetchUsers(baseUrl: "?since=" + (indexPage*20).toString() + "&per_page=20").then((value) => {
      setState(() {
        users = value;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  child: SizedBox(
                    width: size.width - 110,
                    height: 50,
                    child: const Center(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          hintText: 'Enter a search term',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: SizedBox(
                    width: 80,
                    height: 50,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text("Search")
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: size.height - 255,
              child: ListView.builder(
                itemCount: users.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    child: ListTile(
                      title: Row(
                        children: [
                          users[index].imageUrl != null ?
                          Image.network(
                            users[index].imageUrl! ,
                            width: 40,
                            height: 40,
                          ) :
                          const Icon(Icons.person, size: 40,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                users[index].accountName,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                  "Note Anything"
                              ),
                            ],
                          ),
                        ],
                      ),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen( userId: users[index].accountName),
                          ),
                        );
                      },
                      // subtitle: Text((posts[index].id) as String),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: size.width,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {
                          if(indexPage == 0) return;
                          --indexPage;
                          gotoPage();
                        },
                        child: const Text("Pre")
                    ),
                    Text("$indexPage"),
                    TextButton(
                        onPressed: () {
                          ++indexPage;
                          gotoPage();
                        },
                        child: const Text("Next")
                    ),
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}

