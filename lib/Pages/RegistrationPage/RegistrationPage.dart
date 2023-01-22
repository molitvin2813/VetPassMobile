import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:lottie/lottie.dart';
import 'package:vet_pass/Redux/AppState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vet_pass/Redux/RegistrationPage/RegistrationActions.dart';
import 'package:vet_pass/Redux/RegistrationPage/RegistrationState.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);

    return StoreConnector<AppState, RegistrationState>(
      converter: (store) => store.state.registrationState,
      builder: (context, registrationState) => Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(107, 211, 248, 1),
          image: DecorationImage(
              image: AssetImage('assets/images/loginBG2.png'),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 0, top: 50),
                    child: const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Регистрация",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(240, 240, 240, 1),
                          shadows: [
                            Shadow(
                                blurRadius: 5,
                                color: Colors.black,
                                offset: Offset(3, 2))
                          ],
                          fontSize: 46,
                          fontFamily: 'Lumberjack',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )),
                Container(
                  padding: const EdgeInsets.only(
                      right: 35, left: 35, top: 35, bottom: 20),
                  child: Column(children: [
                    TextField(
                      onChanged: (value) =>
                          store.dispatch(SetClientLoginAction(value)),
                      decoration: const InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(16),
                          child: Icon(Icons.person),
                        ),
                        hintText: 'Логин',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      onChanged: (value) =>
                          store.dispatch(SetClientPasswordAction(value)),
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(16),
                          child: Icon(Icons.lock),
                        ),
                        hintText: 'Пароль',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      onChanged: (value) =>
                          store.dispatch(SetClientFIOAction(value)),
                      decoration: const InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(16),
                          child: Icon(Icons.edit),
                        ),
                        hintText: 'ФИО',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      inputFormatters: [
                        PhoneInputFormatter(
                          defaultCountryCode: 'RU',
                        )
                      ],
                      onChanged: (value) {
                        store.dispatch(SetClientPhoneAction(value));
                      },
                      decoration: const InputDecoration(
                        prefix: Text('+7 '),
                        hintText: 'Номер телефона',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      autofillHints: const [AutofillHints.email],
                      autovalidateMode: AutovalidateMode.always,
                      onChanged: (value) {
                        if (EmailValidator.validate(value)) {
                          store.dispatch(SetClientEmailAction(value));
                        } else {
                          store.dispatch(SetClientEmailAction(''));
                        }
                      },
                      decoration: InputDecoration(
                        helperStyle: const TextStyle(
                          color: Color.fromRGBO(240, 240, 240, 1),
                          fontSize: 14,
                          shadows: [
                            Shadow(
                                blurRadius: 5,
                                color: Colors.black,
                                offset: Offset(3, 2))
                          ],
                          fontFamily: 'Lumberjack',
                        ),
                        helperText: registrationState.client.email == ""
                            ? 'Некорректный адрес'
                            : '',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(16),
                          child: Icon(Icons.edit),
                        ),
                        hintText: 'Электронная почта',
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Регистрация',
                          style: TextStyle(
                            color: Color.fromRGBO(240, 240, 240, 1),
                            fontSize: 27,
                            shadows: [
                              Shadow(
                                  blurRadius: 5,
                                  color: Colors.black,
                                  offset: Offset(3, 2))
                            ],
                            fontFamily: 'Lumberjack',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          child: IconButton(
                            color: Color.fromRGBO(240, 240, 240, 1),
                            iconSize: 40,
                            onPressed: () {
                              if (registrationState.client.login != '' &&
                                  registrationState.client.password != '' &&
                                  registrationState.client.fio != '' &&
                                  registrationState.client.phone != '') {
                                showDialog(
                                  context: context,
                                  builder: (context) => Center(
                                    child: Lottie.asset(
                                      'assets/images/loader.json',
                                      fit: BoxFit.fitWidth,
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                );
                                store.dispatch(registerThunkAction(store));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Для регистрации необходимо заполнить все поля ')),
                                );
                              }
                            },
                            icon: const Icon(
                              Icons.arrow_forward,
                              shadows: [
                                Shadow(
                                    blurRadius: 5,
                                    color: Colors.black,
                                    offset: Offset(3, 2))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
