import 'dart:ui';

import '../Model/SupportModel/AnimalImage.dart';

const primaryColor = Color.fromRGBO(43, 130, 186, 1);
const primaryColorCard = Color.fromRGBO(39, 105, 171, 1);
const primaryLightColor = Color.fromRGBO(169, 231, 252, 1);
const secondaryColor = Color.fromRGBO(240, 240, 240, 1);

const baseUrlApi = "http://192.168.0.102:3001/api/";

//const baseUrlApi = "http://192.168.88.128:3001/api/";

List<AnimalImage> animalImageList = [
  const AnimalImage(
      path: 'assets/images/animal/animal_0.png',
      color: Color.fromRGBO(181, 170, 201, 1)),
  const AnimalImage(
      path: 'assets/images/animal/animal_1.png',
      color: Color.fromRGBO(215, 112, 90, 1)),
  const AnimalImage(
      path: 'assets/images/animal/animal_2.png',
      color: Color.fromRGBO(202, 148, 119, 1)),
  const AnimalImage(
      path: 'assets/images/animal/animal_3.png',
      color: Color.fromRGBO(101, 25, 20, 1)),
  const AnimalImage(
      path: 'assets/images/animal/animal_4.png',
      color: Color.fromRGBO(227, 178, 152, 1)),
  const AnimalImage(
      path: 'assets/images/animal/animal_5.png',
      color: Color.fromRGBO(246, 203, 157, 1)),
  const AnimalImage(
      path: 'assets/images/animal/animal_6.png',
      color: Color.fromRGBO(254, 161, 146, 1)),
];

const defaultPadding = 16.0;
