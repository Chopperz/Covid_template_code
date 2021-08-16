import 'package:flutter/material.dart';
import 'package:flutter_for_test/Controller/connectApi.dart';
import 'package:flutter_for_test/Model/modelApi.dart';
import 'package:flutter_for_test/View/home_v.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  CovidModelData? covidModelData;
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await ServiceCovid.connectCovid().then((CovidModelData? data) {
      if (data != null) {
        covidModelData = data;
      } else {
        //
      }
    }).whenComplete(() async {
      await Future.delayed(Duration(seconds: 2));
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: HomeViewWidget(context).appBarHome(_openDrawer),
      backgroundColor: Colors.white,
      drawerEnableOpenDragGesture: false,
      drawer: HomeViewWidget(context).drawerHome(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green.shade700),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                HomeViewWidget(context).cardCountCovid(covidModelData!),
                HomeViewWidget(context).preventions(),
                HomeViewWidget(context).cardMedicalHelp(),
              ],
            ),
    );
  }

  void _openDrawer() => _scaffoldState.currentState!.openDrawer();
}
