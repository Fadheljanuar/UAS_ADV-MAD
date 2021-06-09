part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String msg = "Fail";
  bool isLoading = false;
  TextEditingController _email =
      TextEditingController(text: "Fadheljanuar123@gmail.com");
  TextEditingController password = TextEditingController(text: "Fadhel2002");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      backgroundColor: grey.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Color(0xff67727d)),
                ),
                TextField(
                  controller: _email,
                  cursorColor: black,
                  style: TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold, color: black),
                  decoration: InputDecoration(
                      hintText: "Email", border: InputBorder.none),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Password",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Color(0xff67727d)),
                ),
                TextField(
                  obscureText: true,
                  controller: password,
                  cursorColor: black,
                  style: TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold, color: black),
                  decoration: InputDecoration(
                      hintText: "Password", border: InputBorder.none),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(top: 350, right: 20),
            child: ElevatedButton.icon(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await AuthServices.signOut().then((value) {
                    if (value) {
                      setState(() {
                        isLoading = false;
                      });
                      AcitivityServices.showToast(
                          "Logout success", Colors.greenAccent);
                      Navigator.pushReplacementNamed(context, Login.routeName);
                    } else {
                      setState(() {
                        isLoading = false;
                      });
                      AcitivityServices.showToast(msg, Colors.redAccent);
                    }
                  });
                },
                icon: Icon(Icons.logout),
                label: Text("Logout"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  elevation: 10,
                  minimumSize: Size(200, 40),
                  shape: StadiumBorder(),
                )),
          ),
        ],
      ),
    );
  }
}
