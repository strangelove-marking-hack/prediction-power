import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 241, 244),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: Column(
              children: [
                const SizedBox(height: 55,),
            Row(
              children: [
              Expanded(child: SizedBox(),),
              Image.asset('assets/images/main_page/HonestSign.png', height: 40,),
              const SizedBox(width: 132,),
              const InkWell(child: Text(
                'Главная',
                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
                 ),
              ),
              const SizedBox(width: 72,),
              const InkWell(child: Text(
                'Сегменты',
                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
                 ),
              ),
              const SizedBox(width: 72,),
              const InkWell(child: Text(
                'Метрики',
                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
                 ),
              ),
              const SizedBox(width: 153,),
              const InkWell(child: Text(
                'FAQ',
                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
                 ),
              ),
              const SizedBox(width: 193,),
              Container(
              // padding: const EdgeInsets.all(10),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  // customBorder: CircleBorder(),
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.white),
                    height: 37,
                    width: 111,
                    child: const Center(child: Text('Войти', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            ),
            ),
            Expanded(child: SizedBox(),),
            ],),
            const SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                // Container(
                //   width: 616,
                //   child: Text(
                //     'Универсальная площадка для отслеживания товаров в удаленном режиме',
                //     overflow: TextOverflow.clip,
                //     style: TextStyle(fontWeight: FontWeight.w800, fontSize: 46),),
                // ),
                Container(
                  width: 616,
                  child: RichText(
                    overflow: TextOverflow.clip,
                    text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Универсальная площадка для отслеживания товаров в ',
                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 46),),
                      TextSpan(
                        text: 'удаленном',
                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 46, color: Color.fromARGB(255, 251, 188, 5),),),
                      TextSpan(
                        text: ' режиме',
                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 46,),)
                    ]
                    )
                  ),
                ),
                  const SizedBox(height: 117,),
                  Container(
              // padding: const EdgeInsets.all(10),
                    child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                  // customBorder: CircleBorder(),
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Color.fromARGB(255, 251, 188, 5)),
                    height: 54,
                    width: 360,
                    child: const Center(child: Text('Начать отслеживать', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                  ),
                ),
              ),
            ),
            ),
              ],),
              Image.asset('assets/images/main_page/YellowMark.png', height: 495,)
            ],),
            const Divider(
              indent: 60,
              endIndent: 60,
              thickness: 1,
              height: 174,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Карта экономического рейтинга округов',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 48),),
              ],
            ),
            const SizedBox(height: 166,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/main_page/Map.png'),
              ],
            ),
            const SizedBox(height: 234,)
      
            // Container(
            //   color: Color.fromARGB(255, 93, 136, 212),
            //   child: Material(
            //     color: Colors.transparent,
            //     child: InkWell(
            //       onTap: () async {
            //         // AuthService.signOut();
            //       },
            //       child: Container(
            //         height: 50,
            //         child: Center(child: const Text('LogOut')),
            //       ),
            //     ),
            //   ),
            // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
