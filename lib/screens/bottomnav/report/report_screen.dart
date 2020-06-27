import 'package:flutter/material.dart';
import 'package:flutter_webapi/screens/bottomnav/report/components/bar_chart_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_webapi/models/covid_model.dart';

class ReportScreen extends StatefulWidget {
  ReportScreen({Key key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {

  // การเรียกใช้ Model CovidModel
  CovidModel _dataCovidAPI;

  // สร้าง method ที่ใช้ทดสอบโหลดข้อมูลจาก api
  Future<void> getData() async {
     var url = 'https://covid19.th-stat.com/api/open/today';
     try{
       var response = await http.get(url);
       print('Status: ${response.statusCode}');
       print('Body: ${response.body}');

       // ่ทำการ setStat ข้อมูลใน _dataCovidAPI
       setState(() {
         _dataCovidAPI = covidModelFromJson(response.body);
       });

     }catch(error){
       print(error);
     }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
       body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'ติดเชื้อสะสม',
                              style: TextStyle(fontSize: 20.0, color: Colors.white),
                            ),
                            Text(
                              '${_dataCovidAPI?.confirmed ?? "..."}',
                              style: TextStyle(fontSize: 40.0, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'เสียชีวิต',
                              style: TextStyle(fontSize: 20.0, color: Colors.white),
                            ),
                            Text(
                               '${_dataCovidAPI?.deaths ?? "..."}',
                              style: TextStyle(fontSize: 40.0, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:24.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'หายแล้ว',
                                style: TextStyle(fontSize: 20.0, color: Colors.white),
                              ),
                              Text(
                                '${_dataCovidAPI?.recovered ?? "..."}',
                                style: TextStyle(fontSize: 30.0, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'รักษาอยู่',
                                style: TextStyle(fontSize: 20.0, color: Colors.white),
                              ),
                              Text(
                                '${_dataCovidAPI?.hospitalized ?? "..."}',
                                style: TextStyle(fontSize: 30.0, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'รายใหม่',
                                style: TextStyle(fontSize: 20.0, color: Colors.white),
                              ),
                              Text(
                                 '${_dataCovidAPI?.newConfirmed ?? "..."}',
                                style: TextStyle(fontSize: 30.0, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ),
                ],
              ),
            ),
            Expanded(
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0),
                  )
                ),
                child: Column(
                children: <Widget>[
                   BarChartPage()
                ],
                  ),
              ),
            )
          ],
        ),
    );
  }
}