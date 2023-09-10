import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCard(),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                //Фото
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AppString.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                //ФИО
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    AppString.fio,
                    style: TextStyle(
                        fontFamily: AppString.montserrat,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Иконки
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(
                      AppString.iconPhone,
                      width: 25.0,
                      height: 25.0,
                      color: Colors.white,
                    ),
                    SvgPicture.asset(
                      AppString.iconWhatsApp,
                      width: 25.0,
                      height: 25.0,
                      color: Colors.white,
                    ),
                    SvgPicture.asset(
                      AppString.iconMail,
                      width: 25.0,
                      height: 25.0,
                      color: Colors.white,
                    ),
                  ],
                ),

                const SizedBox(height: 30.0),
                //О себе
                const Text(
                  AppString.about,
                  style: TextStyle(
                      fontFamily: AppString.montserrat,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Divider(),
                const Text(
                  AppString.aboutDescription,
                  style: TextStyle(
                      fontFamily: AppString.radiotechna,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Хобби
                const Text(
                  AppString.hobby,
                  style: TextStyle(
                      fontFamily: AppString.montserrat,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Divider(),
                const Text(
                  AppString.hobbyDescription,
                  style: TextStyle(
                      fontFamily: AppString.radiotechna,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Опыт
                const Text(
                  AppString.experience,
                  style: TextStyle(
                      fontFamily: AppString.montserrat,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Divider(),
                const Text(
                  AppString.experienceDescription,
                  style: TextStyle(
                      fontFamily: AppString.radiotechna,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class AppString {
  //Fonts
  static const montserrat = 'Montserrat';
  static const radiotechna = 'Radiotechna';

  //Icons
  static const image = 'lib/assets/photo/myPhoto.JPG';
  static const iconWhatsApp = 'lib/assets/icon/icon_watsapp.svg';
  static const iconMail = 'lib/assets/icon/icon_mail.svg';
  static const iconPhone = 'lib/assets/icon/icon_phone.svg';

  //Strings
  static const fio = 'Чумаков Сергей Валерьевич';
  static const about = 'О себе';
  static const hobby = 'Увлечения';
  static const hobbyDescription =
      'Разработка мобильных приложений (Flutter), написание музыки (Fl Studio, Logic)';
  static const experience = 'Опыт';
  static const experienceDescription = '15 месяцев';
  static const aboutDescription = '''- Уверенные знания в Flutter ,Dart,
- Уверенные знания механизмов асинхронности Async,
- Уверенные знания ООП, понимание основных шаблонов проектирования, принципов SOLID,
- Владение и понимание архитектурных паттернов BLoC/ Cubit / Provider
- Понимание принципов клиент-серверного взаимодействия, протоколов HTTP/HTTPS
- Опыт работы с Git,
- Опыт работы с Firebase,Figma,''';
}
