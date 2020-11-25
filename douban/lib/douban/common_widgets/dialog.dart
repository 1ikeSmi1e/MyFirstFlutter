
// 各种弹窗
//
// void _showCallPhoneDialog(String phone){
//   showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('提示'),
//           content: Text('是否拨打：$phone ?'),
//           actions: <Widget>[
//             FlatButton(
//               onPressed: () => NavigatorUtils.goBack(context),
//               child: Text('取消'),
//             ),
//             FlatButton(
//               onPressed: (){
//                 Utils.launchTelURL(phone);
//                 NavigatorUtils.goBack(context);
//               },
//               textColor: Colours.text_red,
//               child: Text('拨打'),
//             ),
//           ],
//         );
//       });
// }