import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Cars Review'),
      debugShowCheckedModeBanner: false,
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
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int jumlahKotak = MediaQuery.of(context).size.width <= 800 ? 2 : 4;
    List data = [
      {
        "nama": "Mclaren 560s",
        "rating": 3.5,
        "review": '7.1k',
        "harga": '\$3,300,300',
        'like': '3.7k'
      },
      {
        "nama": "Lamborgini Aventador",
        "rating": 4.5,
        "review": '8.7k',
        "harga": '\$4,100,00',
        'like': '4.1k'
      },
      {
        "nama": "Ferrarin 480",
        "rating": 4.0,
        "review": '12.4k',
        "harga": '\$2,700,00',
        'like': '8.0k'
      },
      {
        "nama": "BMW M4",
        "rating": 5,
        "review": '10.7k',
        "harga": '\$5,00,00',
        'like': '7.2k'
      }
    ];

    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children:const [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.lightBlue),
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(Icons.food_bank),
                title: Text('Makanan'),
              ),
              ListTile(
                leading: Icon(Icons.local_cafe),
                title: Text('Minuman'),
              )
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            widget.title,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: GridView.count(
            crossAxisCount: jumlahKotak,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 0.45,
            children: [
              ...List.generate(data.length, (index) {
                return Card(
                  // color: Colors.brown[100],
                  elevation: 10,
                  child: LayoutBuilder(builder: (context, constraint) {
                    return Padding(
                      padding: EdgeInsets.all(constraint.maxWidth * 0.05),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  'assets/logo.jpeg',
                                  fit: BoxFit.cover,
                                  height: constraint.maxHeight * 0.07,
                                  width: constraint.maxHeight * 0.07,
                                ),
                              ),
                              SizedBox(
                                width: constraint.maxWidth * 0.08,
                              ),
                              Text(
                                'Cars Review Official',
                                style: TextStyle(
                                    fontSize: constraint.maxWidth * 0.05),
                              )
                            ],
                          ),
                          SizedBox(
                            height: constraint.maxHeight * 0.02,
                          ),
                          Container(
                              height: constraint.maxHeight * 0.3,
                              width: constraint.maxWidth * 0.9,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    constraint.maxWidth * 0.05),
                                child: Image.asset(
                                  'assets/gambar$index.jpeg',
                                  fit: BoxFit.cover,
                                ),
                              )),
                          SizedBox(
                            height: constraint.maxHeight * 0.02,
                          ),
                          Container(
                            // color: Colors.blue,
                            alignment: Alignment.center,
                            height: constraint.maxHeight * 0.17,
                            child: Text(
                              // overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              data[index]['nama'],
                              style: TextStyle(
                                fontSize: constraint.maxWidth * 0.1,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: constraint.maxHeight * 0.02,
                          ),
                          RatingBar.builder(
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              shadows: [
                                Shadow(
                                    color: Colors.black,
                                    offset: Offset(
                                      constraint.maxHeight * 0.001,
                                      constraint.maxHeight * 0.001,
                                    ),
                                    blurRadius: 2)
                              ],
                              color: Colors.orange[300],
                            ),
                            onRatingUpdate: (rating) {},
                            itemSize: constraint.maxHeight * 0.05,
                            initialRating: data[index]['rating'],
                            minRating: 1,
                            maxRating: 5,
                            itemCount: 5,
                            direction: Axis.horizontal,
                            itemPadding: EdgeInsets.symmetric(
                                horizontal: constraint.maxWidth * 0.02),
                            allowHalfRating: true,
                          ),
                          SizedBox(
                            height: constraint.maxHeight * 0.02,
                          ),
                          Text(
                            data[index]['harga'],
                            style:
                                TextStyle(fontSize: constraint.maxWidth * 0.08),
                          ),
                          SizedBox(
                            height: constraint.maxHeight * 0.02,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.comment,
                                  color: Colors.grey[600],
                                  size: constraint.maxWidth * 0.07,
                                ),
                                Text(
                                  data[index]['review'],
                                  style: TextStyle(
                                      fontSize: constraint.maxWidth * 0.05),
                                ),
                                SizedBox(
                                  width: constraint.maxWidth * 0.05,
                                ),
                                Icon(
                                  Icons.thumb_up,
                                  color: Colors.grey[600],
                                  size: constraint.maxWidth * 0.06,
                                ),
                                Text(
                                  data[index]['like'],
                                  style: TextStyle(
                                      fontSize: constraint.maxWidth * 0.05),
                                ),
                              ]),
                          SizedBox(
                            height: constraint.maxHeight * 0.03,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: constraint.maxWidth * 0.05,
                              ),
                              Material(
                                  shape: CircleBorder(),
                                  elevation: 10,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.thumb_up_rounded,
                                        size: constraint.maxHeight * 0.06,
                                      ))),
                              Spacer(),
                              Material(
                                  shape: CircleBorder(),
                                  elevation: 10,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.comment,
                                        size: constraint.maxHeight * 0.06,
                                      ))),
                              SizedBox(
                                width: constraint.maxWidth * 0.05,
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
                );
              })
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
