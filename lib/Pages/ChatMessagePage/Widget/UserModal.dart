import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:vet_pass/Model/ClientModel.dart';
import 'package:vet_pass/Variables/Constants.dart';
import 'package:lottie/lottie.dart';
class UserModal extends StatelessWidget {
  final ChatUser client;

  const UserModal({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Dialog(
        alignment: Alignment.center,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        child: SizedBox(
          width: width * 0.6,
          height: height * 0.5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color.fromRGBO(43, 130, 186, 0.9),
            ),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: secondaryColor,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    )),
                Expanded(
                  flex: 6,
                  child: Lottie.asset(
                    'assets/images/avatar.json',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      client.firstName ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: secondaryColor,
                        fontFamily: 'Lumberjack',
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                        shadows: [
                          Shadow(
                              blurRadius: 5,
                              color: Colors.black,
                              offset: Offset(3, 2))
                        ],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
