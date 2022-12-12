import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatelessWidget {
  NewsPage({@required this.res});
  final res;

  TextEditingController editer = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("from news.dart ");
    print("$res");

    editer.text = res.toString();
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(res['title']),
          SizedBox(
            height: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              res['urlToImage'],
              height: 250,
              width: 200,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            res["description"],
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: 15,
          ),
          Text("To get full update click below link"),
          SizedBox(
            height: 5,
          ),
          RichText(
              text: TextSpan(children: [
            new TextSpan(
                text: "visit here",
                style: TextStyle(color: Colors.blueAccent),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launchUrl(
                        Uri.parse(
                          res["url"],
                        ),
                        mode: LaunchMode.inAppWebView);
                  })
          ]))
        ],
      )),
    ));
  }
}
