import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/startscreen.dart';
import 'Homescreen.dart';

class Settings extends StatefulWidget{
  Settings ({Key key}) : super(key:key);


  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  List<String> settingsList = [
    "About",
    "Contact",
    "Send Feedback",
    "Version",
    "Sign Out"
  ];



  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                leading: IconButton(icon: Icon(Icons.home,),
                  onPressed: () {
                    Navigator.push( context, MaterialPageRoute(builder: (_) => HomeScreen()));
                  },
                ),
                centerTitle: true,
                title: Text('Settings'),
                backgroundColor: Colors.deepOrange,
              ),
              body: Center(

                  child: Stack(
                    children: [

                    FractionallySizedBox(
                        widthFactor: 0.9,
                        heightFactor: 0.3,
                        child: Container(
                            color: Color.fromRGBO(0, 255, 0, 0.5),
                            //Todo: add list of matches.
                          child: Container(
                              width: 100,
                              height: 200,
                              child: Image.asset('images/tennisball.png')),

                        ),
                    ),
                 FractionallySizedBox(
                      widthFactor: 0.9,
                      heightFactor: 0.9,
                      child: Container(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          //Todo: add list of matches.
                        child: FractionallySizedBox(
                          alignment: Alignment.bottomCenter,
                          heightFactor: 0.66,
                          child: Container(
                            color: Color.fromRGBO(255, 255, 255, 0),
                            child: buildSettingsListView(),
                          ),
                        ),

                      ),

                  ),

              ],
          ),
          ),
          ),
        ]
    );
  }

  Widget buildPopupAbout(BuildContext context) {
    return new AlertDialog(
      title: const Text('About'),
      content: const Text("This is a tennis matching app made by group 74 for the course PVT vt21"),
      actions: <Widget>[
        TextButton(onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
        ),
      ],
    );
  }

  Widget buildPopupVersion(BuildContext context) {
    return new AlertDialog(
      title: const Text('Version'),
      content: const Text("Current version: 0.1"),
      actions: <Widget>[
        TextButton(onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }

  Widget buildPopupContact(BuildContext context) {
    return new AlertDialog(
      title: const Text('Contact'),
      content: const Text("You can contact us through iLearn"),
      actions: <Widget>[
        TextButton(onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }

  Widget buildPopupSendFeedback(BuildContext context) {
    return new AlertDialog(
      title: const Text('Send Feedback'),
      content: TextField(
      ),
      actions: <Widget>[
        TextButton(onPressed: () => Navigator.pop(context, 'cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(onPressed: () => Navigator.pop(context, 'Send'),
          child: const Text('Send'),
        ),
      ],
    );
  }

  Widget buildSettingsListView() {
    return ListView.builder(
      itemCount: settingsList.length,
      itemBuilder: (context, index){
        return Card(
          child: ListTile(
            onTap: (){
              if(settingsList[index] == "Sign Out") {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                    builder: (context) => StartScreen(),
                ));
              } else if(settingsList[index] == "About") {
                showDialog(context: context, builder: buildPopupAbout,);
              } else if(settingsList[index] == "Version") {
                showDialog(context: context, builder: buildPopupVersion);
              } else if(settingsList[index] == "Contact") {
                showDialog(context: context, builder: buildPopupContact);
              } else if(settingsList[index] == "Send Feedback") {
                showDialog(context: context, builder: buildPopupSendFeedback);
              }

            },
            title: Text(settingsList[index])
          ),
        );
      }

    );
  }

}
