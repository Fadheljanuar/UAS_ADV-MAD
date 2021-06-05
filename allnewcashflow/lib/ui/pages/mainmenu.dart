part of 'pages.dart';

class MainMenu extends StatefulWidget {
  static const String routeName = "/mainmenu";
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int pageIndex = 0;
  bool isLoading = false;
  String msg = "Fail";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Main Menu"),
        ),
        body: Stack(
          children: [
            // Container(
            //   alignment: Alignment.bottomCenter,
            //   child: ElevatedButton.icon(
            //       onPressed: () async {
            //         setState(() {
            //           isLoading = true;
            //         });
            //         await AuthServices.signOut().then((value) {
            //           if (value) {
            //             setState(() {
            //               isLoading = false;
            //             });
            //             AcitivityServices.showToast(
            //                 "Logout success", Colors.greenAccent);
            //             Navigator.pushReplacementNamed(
            //                 context, Login.routeName);
            //           } else {
            //             setState(() {
            //               isLoading = false;
            //             });
            //             AcitivityServices.showToast(msg, Colors.redAccent);
            //           }
            //         });
            //       },
            //       icon: Icon(Icons.logout),
            //       label: Text("Logout"),
            //       style: ElevatedButton.styleFrom(
            //         primary: Colors.deepOrange[400],
            //         elevation: 0,
            //       )),
            // ),
            isLoading == true ? AcitivityServices.loadings() : Container()
          ],
        ),
        bottomNavigationBar: getFooter(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              //selectedTab(4);
            },
            child: Icon(
              Icons.add,
              size: 25,
            ),
            backgroundColor: Colors.pink
            //params
            ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Widget getBody() {}
  Widget getFooter() {
    List<IconData> iconItems = [
      Ionicons.md_calendar,
      Ionicons.md_stats,
      Ionicons.md_wallet,
      Ionicons.ios_person,
    ];

    return AnimatedBottomNavigationBar(
      activeColor: primary,
      splashColor: secondary,
      inactiveColor: Colors.black.withOpacity(0.5),
      icons: iconItems,
      activeIndex: pageIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      onTap: (index) {
        selectedTab(index);
      },
      //other params
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
