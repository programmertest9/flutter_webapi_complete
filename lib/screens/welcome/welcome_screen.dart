import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webapi/screens/welcome/components/slider.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
        title: "ยินดีต้อนรับ",
        description:
            "Accept cryptocurrencies and digital assets, keep thern here, or send to orthers",
        image: "assets/images/onboarding/1.svg"),
    SliderPage(
        title: "Buy",
        description:
            "Buy Bitcoin and cryptocurrencies with VISA and MasterVard right in the App",
        image: "assets/images/onboarding/2.svg"),
    SliderPage(
        title: "Sell",
        description:
            "Sell your Bitcoin cryptocurrencies or Change with orthres digital assets or flat money",
        image: "assets/images/onboarding/3.svg"),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {

  // คำสั่งตั้งค่าล็อก Sreen เป็นแนวตั้ง
  SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
  ]);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(_pages.length, (int index) {
                    return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 10,
                        width: (index == _currentPage) ? 30 : 10,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (index == _currentPage)
                                ? Colors.blue
                                : Colors.blue.withOpacity(0.5)));
                  })),
              Material(
                borderRadius: BorderRadius.circular(35),
                color: Colors.blue,
                  child: InkWell(
                  borderRadius: BorderRadius.circular(35),
                  onTap: () {
                    _controller.nextPage(
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeInOutQuint);
                  },
                  child: AnimatedContainer(
                    alignment: Alignment.center,
                    duration: Duration(milliseconds: 300),
                    height: 70,
                    width: (_currentPage == (_pages.length - 1)) ? 200 : 75,
                    child: (_currentPage == (_pages.length - 1))
                        ? FlatButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onPressed: (){
                            Navigator.pushReplacementNamed(context, '/start');
                          }, 
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )
                          )
                        : Icon(
                            Icons.navigate_next,
                            size: 50,
                            color: Colors.white,
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}
