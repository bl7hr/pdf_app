// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:nfc_manager/nfc_manager.dart';
//
// class Nfc extends StatelessWidget {
//   const Nfc({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Nfc App'),),
//       body: Column(
//         children: [
//
//           Container(child: MaterialButton(onPressed:()     =>NfcManager.instance.startSession(onDiscovered: (tag)async{
//             Ndef? nfc=Ndef.from(tag);
//             NdefMessage message=NdefMessage([
//             NdefRecord.createExternal('andriod.com', 'pkg', Uint8List.fromList('com.example'.codeUnits))
//
//             ]);
//             try{
//               await nfc!.write(message);
//               NfcManager.instance.stopSession();
//               return;
//             }catch(e){
//               print('$e');
//               return;
//                       }
//           })
//          ,child: Text('buttton')),)
//
//         ],
//       ),
//     );
//   }
// }
