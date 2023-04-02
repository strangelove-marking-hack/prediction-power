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

class SortingWidget extends StatefulWidget {
  SortingWidget({super.key});

  final List statusList = [-1, -1, -1, -1];

  @override
  State<SortingWidget> createState() => _SortingWidgetState();
}

class _SortingWidgetState extends State<SortingWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
            ContentBox('assets/images/main_page/Beer.png', 'Пиво и слабоалкогольные напитки'),
            ContentBox('assets/images/main_page/MilkProduct.png', 'Молочная продукция'),
            ContentBox('assets/images/main_page/Water.png', 'Упакованная вода'),
            ContentBox('assets/images/main_page/TouletWater.png', 'Духи и туалетная вода'), 
          ]),
        ),
        const Divider(
          thickness: 1,
          endIndent: 60,
          indent: 60,
          height: 46,
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 60),
        //   child: ,)
      ],
    );
  }
}

class ContentBox extends StatelessWidget {
  const ContentBox(this.imagePath, this.textContent, {super.key});
  final String imagePath;
  final String textContent;
  

  @override
  Widget build(BuildContext context) {
    return Material(
            color: Colors.transparent,
            child: InkWell(
              customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              ),
              onTap: (){},
              child: SizedBox(
                height: 250,
                width: 300,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(width: 1)
                  ),
                  child: Column(children: [
                    const SizedBox(height: 58,),
                    Image.asset(imagePath, height: 77,),
                    const SizedBox(height: 33,),
                    Container(
                      width: 201,
                      child: Text(
                        textContent,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                  ]),
                ),
              ),
            ),
          );
  }
}
