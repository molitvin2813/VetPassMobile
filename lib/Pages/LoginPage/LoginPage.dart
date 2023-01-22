import 'package:flutter/material.dart';
import 'package:vet_pass/Pages/RegistrationPage/RegistrationPage.dart';
import 'package:vet_pass/Redux/AppState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vet_pass/Redux/LoginPage/LoginState.dart';
import '../../Redux/LoginPage/LoginActions.dart';
import '../../Variables/GlobalVariables.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);

    return Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(107, 211, 248, 1),
          image: DecorationImage(
              image: AssetImage('assets/images/loginBG2.png'),
              fit: BoxFit.cover),
        ),
        child: StoreConnector<AppState, LoginState>(
          converter: (store) => store.state.loginState,
          builder: (context, loginState) => Scaffold(
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
                            "Добро\nПожаловать",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromRGBO(240, 240, 240, 1),
                              shadows: [
                                Shadow(
                                    blurRadius: 5,
                                    color: Colors.black,
                                    offset: Offset(3, 2))
                              ],
                              fontFamily: 'Lumberjack',
                              fontSize: 46,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )),
                    Container(
                      padding: const EdgeInsets.only(
                          right: 35, left: 35, top: 35, bottom: 35),
                      child: Column(children: [
                        TextField(
                          onChanged: (value) =>
                              store.dispatch(SetLoginAction(value)),
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
                              store.dispatch(SetPasswordAction(value)),
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
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Войти',
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
                                onPressed:  () async {

                                  await store.dispatch(loginThunkAction(store));

                                  if (loginState.isLogged == 0) {

                                    _scaffoldKey.currentState?.showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Невозможно войти. Проверьте корректность данных для входа')),
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
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegistrationPage()));
                                },
                                icon: const Icon(
                                  Icons.account_circle,
                                  shadows: [
                                    Shadow(
                                        blurRadius: 5,
                                        color: Colors.black,
                                        offset: Offset(3, 2))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ]),
                    ),
                  ],
                ),
              )),
        ));
  }
}
