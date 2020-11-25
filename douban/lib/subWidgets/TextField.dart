import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  TextFieldPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {

  final _userNameController = TextEditingController();
  final _pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField"),
      ),
      body: GestureDetector(
        onTap: () {
          // 触摸收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        behavior: HitTestBehavior.translucent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              CustomContainer(),
              SizedBox(height: 20,),
              UserNameField(userNameController: _userNameController,),
              SizedBox(height: 8,),
              PwdField(pwdController: _pwdController,),
              SizedBox(height: 18,),
              ButtonTheme(
                minWidth: 250,
                height: 50,
                child: FlatButton(
                  child: Text("确 定", style: TextStyle(color: Colors.white),),
                  padding: EdgeInsets.all(0),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () {
                    print("确认登录：${_userNameController.text}, ${_pwdController.text}");
                  },
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ),
      ),

    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class CustomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      width: 150,
      height: 150,
      alignment: Alignment(0, 0),
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(10),
      child: Icon(Icons.add_alert, color: Colors.yellow,),
      decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(width: 1, color: Colors.orange),
          borderRadius: BorderRadius.circular(150/2),
          boxShadow: [
            BoxShadow(color: Colors.blue, offset: Offset(3, 3) ,blurRadius: 20, spreadRadius:0 ),
          ],
      ),
    );
  }
}


class PwdField extends StatelessWidget {
  final pwdController;

  const PwdField({Key key, this.pwdController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(

      controller: pwdController,
        decoration: InputDecoration(
          labelText: "labelText",
          icon: Icon(Icons.lock),
          hintText: "please input you password",
          border: OutlineInputBorder(),
          filled: true,
          // fillColor: Colors.red[100],
        ),
        obscureText: true,
        onChanged: (value) {
          print(value);
        },
        onSubmitted: (value) {
          print("onSubmitted: $value");
        });
  }
}


class UserNameField extends StatelessWidget {

  final userNameController;

  const UserNameField({Key key, this.userNameController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: userNameController,
        decoration: InputDecoration(
          labelText: "labelText",
          icon: Icon(Icons.people_outline),
          hintText: "please input you name",
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.red[100],
        ),
        onChanged: (value) {
          print(value);
        },
        onSubmitted: (value) {
          print("onSubmitted: $value");
        });
  }
}
