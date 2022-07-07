import 'package:application/apiService/service.dart';
import 'package:application/auth/login_signup.dart';
import 'package:application/firebase/authentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
  String searchQuery = "";
  bool loading = true;

  var response;
  loadData() async {
    response = await Myservices()
        .getNews(searchQuery == "" ? "b" : searchQuery, filterVal);
    setState(() {
      loading = false;
    });
  }

  String filterVal = 'publishedAt';

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NewsApp"),
        actions: [
          IconButton(
              onPressed: () async {
                await getAuth().gmailOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: 70,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width - 30,
                child: TextFormField(
                  onChanged: ((value) {
                    searchQuery = value;
                  }),
                  onEditingComplete: () {
                    searchQuery = _searchController.text;
                  },
                  keyboardType: TextInputType.text,
                  controller: _searchController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () async {
                        response = await Myservices().getNews(
                            searchQuery != "" ? searchQuery : "b", filterVal);
                        setState(() {
                          loading = false;
                        });
                      },
                      color: Colors.red,
                    ),
                    hintText: "Search in Feed",
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              DropdownButton<String>(
                  value: filterVal,
                  items: <String>['relevancy', 'publishedAt', 'popularity']
                      .map<DropdownMenuItem<String>>((String e) {
                    return DropdownMenuItem(value: e, child: Text(e));
                  }).toList(),
                  onChanged: (val) async {
                    loading = true;
                    var myresponse =
                        await Myservices().getNews(searchQuery, val!);

                    setState(() {
                      filterVal = val.toString();
                      response = myresponse;
                      loading = false;
                    });
                  }),
              SizedBox(
                height: 15,
              ),
              Expanded(
                  child: !loading
                      ? ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: response["totalResults"],
                          padding: EdgeInsets.all(10),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(8),
                              child: Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width - 80,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset.zero, blurRadius: 3)
                                    ],
                                    border: Border.all(),
                                    color: Colors.white),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SingleChildScrollView(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                150,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  DateFormat(
                                                          'yyyy-MM-dd - kk:mm')
                                                      .format(DateTime.parse(
                                                          response["articles"]
                                                                  [index]
                                                              ['publishedAt']))
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Text(
                                                  response["articles"][index]
                                                      ["source"]["name"],
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              response["articles"][index]
                                                  ['title'],
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: response["articles"]
                                                                      [index]
                                                                  ['title']
                                                              .length >
                                                          25
                                                      ? 13
                                                      : 16),
                                            ),
                                            Text(
                                              response["articles"][index]
                                                  ['description'],
                                              style: TextStyle(
                                                  fontSize: response["articles"]
                                                                      [index][
                                                                  'description']
                                                              .length >
                                                          150
                                                      ? 8
                                                      : 12),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        response['articles'][index]
                                            ['urlToImage'],
                                        height: 80,
                                        width: 60,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          })
                      : Column(
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(
                              height: 15,
                            ),
                            Text("Please wait ......")
                          ],
                        )),
            ],
          ),
        ),
      ),
    );
  }
}
