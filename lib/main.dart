import 'package:chopper/chopper.dart';
import 'package:chopper_json_serializable/core/chopper_client.dart';
import 'package:chopper_json_serializable/core/mock_http_client.dart';
import 'package:chopper_json_serializable/models/article/article.dart';
import 'package:chopper_json_serializable/models/people/people.dart';
import 'package:chopper_json_serializable/services/article_service/article_service.dart';
import 'package:chopper_json_serializable/services/people_service/people_service.dart';
import 'package:flutter/material.dart';

void main() async {
  final mockHttpClient = MockHttpClientBuilder().generateClient();

  final chopperClient = ChopperClientBuilder.buildChopperClient(
    [
      ArticleService.create(),
      PeopleService.create(),
    ],
    mockHttpClient,
  );
  runApp(MyApp(
    chopperClient: chopperClient,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.chopperClient}) : super(key: key);

  final ChopperClient chopperClient;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        chopperClient: chopperClient,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
    required this.title,
    required this.chopperClient,
  }) : super(key: key);

  final String title;
  final ChopperClient chopperClient;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Article? _article;
  People? _person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: [
                Text(
                  'Chopper Client and Services',
                ),
                Text('Article: ${_article?.title ?? 'XOXO'}'),
                Text('People: ${_person?.name ?? 'Cuneyt Arkin'}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _getArticle,
                  child: Text('Fetch Article'),
                ),
                SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: _getPerson,
                  child: Text('Fetch People'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _getArticle() async {
    final response =
        await widget.chopperClient.getService<ArticleService>().getArticle('1');
    setState(() {
      _article = response.body;
    });
  }

  Future<void> _getPerson() async {
    final response =
        await widget.chopperClient.getService<PeopleService>().getPerson('1');
    setState(() {
      _person = response.body;
    });
  }
}
