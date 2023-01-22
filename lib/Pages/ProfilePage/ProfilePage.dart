import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lottie/lottie.dart';
import 'package:vet_pass/Redux/ProfilePage/ProfilePageState.dart';
import 'package:vet_pass/Variables/Constants.dart';
import '../../Redux/AppState.dart';
import 'package:redux/redux.dart';

import '../../Redux/MainPage/MainPageActions.dart';
import '../../Redux/ProfilePage/ProfilePageAction.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return StoreConnector<AppState, ProfilePageState>(
        converter: (store) => store.state.profilePageState,
        builder: (context, profilePageState) => Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(101, 159, 226, 1),
                    Color.fromRGBO(240, 240, 240, 1),
                  ],
                  begin: FractionalOffset.bottomCenter,
                  end: FractionalOffset.topCenter,
                ),
                image: DecorationImage(
                    image: AssetImage('assets/images/loginBG.png'),
                    fit: BoxFit.cover),
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
                  child: Column(
                    children: [
                      const Text(
                        'Мой\nПрофиль',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 34,
                          color: Color.fromRGBO(240, 240, 240, 1),
                          shadows: [
                            Shadow(
                                blurRadius: 5,
                                color: Colors.black,
                                offset: Offset(3, 2))
                          ],
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Lumberjack',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: height * 0.5,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            double innerHeight = constraints.maxHeight;
                            double innerWidth = constraints.maxWidth;
                            return Stack(
                              fit: StackFit.expand,
                              children: [
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: innerHeight * 0.6,
                                    width: innerWidth,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white70,
                                    ),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 80,
                                        ),
                                        Text(
                                          profilePageState.client.fio ?? '',
                                          style: const TextStyle(
                                            color:
                                                Color.fromRGBO(39, 105, 171, 1),
                                            fontFamily: 'RobotoMono',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 37,
                                          ),
                                        ),
                                        Text(
                                          profilePageState.client.email ?? '',
                                          style: const TextStyle(
                                            color: Color.fromRGBO(
                                                39, 105, 171, 0.7),
                                            fontFamily: 'RobotoMono',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        Text(
                                          profilePageState.client.phone ?? '',
                                          style: const TextStyle(
                                            color: Color.fromRGBO(
                                                39, 105, 171, 0.7),
                                            fontFamily: 'RobotoMono',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                    child: Container(
                                      child: Lottie.asset(
                                        'assets/images/avatar.json',
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30, bottom: 30),
                        height: height * 0.5,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white70,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Настройки',
                                style: TextStyle(
                                  color: Color.fromRGBO(39, 105, 171, 1),
                                  fontSize: 27,
                                  fontFamily: 'RobotoMono',
                                ),
                              ),
                              const Divider(
                                thickness: 2.5,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          _openDialog(
                                              context,
                                              'Пароль',
                                              store,
                                              0);
                                          store.dispatch(getClientThunkAction(store));
                                        },
                                        child: const Card(
                                          margin: EdgeInsets.all(10),
                                          color: primaryLightColor,
                                          child: Center(
                                            child: Text(
                                              'Сменить данные для входа в приложение',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: primaryColor,
                                                fontFamily: 'RobotoMono',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          _openDialog(
                                              context,
                                              'Номер телефона',
                                              store,
                                              1);
                                          store.dispatch(getClientThunkAction(store));
                                        },
                                        child: const Card(
                                          margin: EdgeInsets.all(10),
                                          color: primaryLightColor,
                                          child: Center(
                                            child: Text(
                                              'Указать другой номер телефона',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: primaryColor,
                                                fontFamily: 'RobotoMono',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          _openDialog(
                                              context,
                                              'Почта',
                                              store,
                                              2);
                                          store.dispatch(getClientThunkAction(store));
                                        },
                                        child: const Card(
                                          margin: EdgeInsets.all(10),
                                          color: primaryLightColor,
                                          child: Center(
                                            child: Text(
                                              'Изменить электронную почту',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: primaryColor,
                                                fontFamily: 'RobotoMono',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

 _openDialog(context, String hint, Store<AppState> store, int index) {
    Widget temp = TextField();

    switch (index) {
      case 0:
        temp = TextField(
          onChanged: (value) async =>
              await store.dispatch(SetModalTextAction(value)),
          decoration: InputDecoration(
            prefixIcon: const Padding(
              padding: EdgeInsets.all(16),
            ),
            hintText: hint,
          ),
        );
        break;
      case 1:
        temp = TextField(
          inputFormatters: [
            PhoneInputFormatter(
              defaultCountryCode: 'RU',
            )
          ],
          onChanged: (value) async {
            await store.dispatch(SetModalTextAction(value));
          },
          decoration: const InputDecoration(
            prefix: Text('+7 '),
            hintText: 'Номер телефона',
          ),
        );
        break;
      case 2:
        temp = TextFormField(
          autofillHints: const [AutofillHints.email],
          autovalidateMode: AutovalidateMode.always,
          onChanged: (value) async {
            if (EmailValidator.validate(value)) {
              await store.dispatch(SetModalTextAction(value));
            }
          },
          decoration: InputDecoration(
            helperStyle: const TextStyle(
              color: Color.fromRGBO(240, 240, 240, 1),
              fontSize: 14,
              shadows: [
                Shadow(blurRadius: 5, color: Colors.black, offset: Offset(3, 2))
              ],
              fontFamily: 'Lumberjack',
            ),
            helperText: store.state.profilePageState.client.email == ""
                ? 'Некорректный адрес'
                : '',
            prefixIcon: const Padding(
              padding: EdgeInsets.all(16),
              child: Icon(Icons.edit),
            ),
            hintText: 'Электронная почта',
          ),
        );
        break;
    }

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Введите новое значение'),
        content: temp,
        actions: [
          TextButton(
              onPressed: () {
                switch (index) {
                  case 0:
                    store.dispatch(SetPasswordAction(
                        store.state.profilePageState.modalText));
                    store.dispatch(changeClientThunkAction(store));
                    break;
                  case 1:
                    store.dispatch(
                        SetPhoneAction(store.state.profilePageState.modalText));
                    store.dispatch(changeClientThunkAction(store));
                    break;
                  case 2:
                    store.dispatch(
                        SetEmailAction(store.state.profilePageState.modalText));
                    store.dispatch(changeClientThunkAction(store));
                    break;
                }
              },
              child: const Text('Ок'))
        ],
      ),
    );
  }
}
