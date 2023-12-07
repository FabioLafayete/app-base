import 'package:app/route/pages_name.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:line_icons/line_icons.dart';
import '../../../shared/widgets/image_cropper.dart';
import '../controller/profile_controller.dart';
import '../widgets/list_button.dart';

class ProfilePage extends BaseWidget<ProfileController> {
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
        showAppBar: false,
        paddingPage: 0,
        body: ListView(
          physics: const ClampingScrollPhysics(),
          padding: MediaQuery.of(context).padding.copyWith(top: 0),
          children: [
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 50,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Observer(builder: (_) => ImageCropperWidget(
                textImage: user.name,
                title: user.name,
                imageUrl: user.photoUrl,
                loading: controller.loading,
                onChange: (_){},
                simpleView: true,
              )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  space(0.03),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     color: Colors.white,
                  //   ),
                  //   padding: const EdgeInsets.all(16),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       text(
                  //         "ÍNDICE DE MASSA CORPORAL (IMC)",
                  //         fontSize: 12,
                  //         color: colors.textSecondary
                  //       ),
                  //       const SizedBox(height: 10),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           text(
                  //             imc().toStringAsFixed(2).replaceAll('.', ','),
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.w600,
                  //           ),
                  //           typeImc()
                  //         ],
                  //       ),
                  //       const SizedBox(height: 10),
                  //       Stack(
                  //         children: [
                  //           Column(
                  //             children: [
                  //               Column(
                  //                 children: [
                  //                   Row(
                  //                     children: [
                  //                       Expanded(
                  //                         flex: 1,
                  //                         child: text('10', fontSize: 10),
                  //                       ),
                  //                       Expanded(
                  //                         flex: 1,
                  //                         child: text('18', fontSize: 10),
                  //                       ),
                  //                       Expanded(
                  //                         flex: 1,
                  //                         child: text('25', fontSize: 10),
                  //                       ),
                  //                       Expanded(
                  //                         flex: 3,
                  //                         child: text('30', fontSize: 10),
                  //                       ),
                  //                       Expanded(
                  //                         flex: 0,
                  //                         child: text('60', fontSize: 10),
                  //                       ),
                  //                     ],
                  //                   )
                  //                 ],
                  //               ),
                  //               const SizedBox(height: 5),
                  //               Column(
                  //                 children: [
                  //                   Row(
                  //                     children: [
                  //                       Expanded(
                  //                         flex: 1,
                  //                         child: Container(
                  //                           height: 10,
                  //                           decoration: const BoxDecoration(
                  //                             color: Colors.lightBlueAccent,
                  //                             borderRadius: BorderRadius.only(
                  //                               topLeft: Radius.circular(5),
                  //                               bottomLeft: Radius.circular(5),
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       ),
                  //                       Expanded(
                  //                         flex: 1,
                  //                         child: Container(
                  //                           height: 10,
                  //                           color: Colors.green,
                  //                         ),
                  //                       ),
                  //                       Expanded(
                  //                         flex: 1,
                  //                         child: Container(
                  //                           height: 10,
                  //                           color: Colors.orangeAccent,
                  //                         ),
                  //                       ),
                  //                       Expanded(
                  //                         flex: 2,
                  //                         child: Container(
                  //                           height: 10,
                  //                           color: Colors.redAccent,
                  //                         ),
                  //                       ),
                  //                       Expanded(
                  //                         flex: 1,
                  //                         child: Container(
                  //                           height: 10,
                  //                           decoration: const BoxDecoration(
                  //                             color: Colors.redAccent,
                  //                             borderRadius: BorderRadius.only(
                  //                               topRight: Radius.circular(5),
                  //                               bottomRight: Radius.circular(5),
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   )
                  //                 ],
                  //               ),
                  //               const SizedBox(height: 10),
                  //             ],
                  //           ),
                  //           Positioned(
                  //             top: 12,
                  //             // left: ((width * 0.01) * (18 * 16.6)) / 60,
                  //             left: (width * 1.6) * 18  / width * 0.8,
                  //             child: Column(
                  //               children: [
                  //                 Container(
                  //                   decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(1000),
                  //                     color: Colors.black.withOpacity(0.3),
                  //                     border: Border.all(
                  //                       width: 5, color: Colors.black
                  //                     )
                  //                   ),
                  //                   height: 20,
                  //                   width: 20,
                  //                 )
                  //               ],
                  //             ),
                  //           )
                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // space(0.03),
                  ListButton(
                    list: [
                      ListButtonItem(title: 'Meus dados', icon: LineIcons.user, onPress: (){
                        router.pushNamed(PagesNames.profileData);
                      }),
                      ListButtonItem(title: 'Política de privacidade', icon: LineIcons.userSecret, onPress: (){}),
                      ListButtonItem(title: 'Termos de uso', icon: LineIcons.alternateFile, onPress: (){}),
                      ListButtonItem(title: 'Fale com a gente', icon: LineIcons.questionCircle, onPress: (){
                        router.pushNamed(PagesNames.profileHelp);
                      }),
                      ListButtonItem(title: 'Sair da conta', icon: LineIcons.powerOff, onPress: controller.logout, isLogout: true),
                    ],
                  ),
                ],
              ),
            ),
            Observer(builder: (_) {
              if(controller.version != null) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      text(
                          controller.version!,
                          color: colors.text.withOpacity(0.4),
                        fontSize: 12
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            })
          ],
        )
    );
  }

  Widget typeImc(){
    late Color color;
    late String typeString;
    if(imc() > 30){
      color = Colors.redAccent;
      typeString = 'OBESIDADE';
    } else if(imc() > 24.99 && imc() < 31){
      color = Colors.orangeAccent;
      typeString = 'SOBREPESO';
    } else if(imc() > 18.5 && imc() < 25){
      color = Colors.green;
      typeString = 'NORMAL';
    } else {
      color = Colors.lightBlueAccent;
      typeString = 'MAGREZA';
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: text(
        typeString,
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 10

      ),
    );
  }

  double imc(){
   return (user.weight! / ((user.height! / 100) * (user.height! / 100)));
  }

}
