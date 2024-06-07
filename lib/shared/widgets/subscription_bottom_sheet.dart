import 'package:app/route/my_router.dart';
import 'package:app/shared/modules/user/controller/user_controller.dart';
import 'package:app/shared/widgets/back_button.dart';
import 'package:app/shared/widgets/my_button.dart';
import 'package:app/shared/widgets/subscription_success.dart';
import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class SubscriptionBottomSheet extends StatefulWidget {
  const SubscriptionBottomSheet({super.key});

  Future show({required BuildContext context}) {
    return showModalBottomSheet(
      context: context,
      elevation: 16,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: false,
      builder: (_) => this,
    );
  }

  @override
  State<SubscriptionBottomSheet> createState() =>
      _SubscriptionBottomSheetState();
}

class _SubscriptionBottomSheetState extends State<SubscriptionBottomSheet>
    with WidgetsBindingObserver {

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch(state){
      case AppLifecycleState.resumed:
        updateUser();
        break;
      case AppLifecycleState.inactive:
        print("app in inactive");
        break;
      case AppLifecycleState.paused:
        print("app in paused");
        break;
      case AppLifecycleState.detached:
        print("app in detached");
        break;
      case AppLifecycleState.hidden:
        print('app hidden');
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  final colors = AppColors();

  late final userController = Modular.get<UserController>();
  late List<PricingModel> prices;
  late Size size = MediaQuery.of(context).size;

  PricingModel? itemSelected;

  bool openPayment = false;

  Future updateUser() async {
    if(openPayment){
      final result = await userController.checkUserSubscription();
      setState(() {
        openPayment = false;
      });
      if(result){
        MyRouter().pop();
        MyRouter().push(SubscriptionSuccessPage());
      }
    }
  }


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    prices = userController.productModel.map((e) => PricingModel(
      price: double.parse(e.valueProduct),
      totalMonth: e.month,
      detail: e.detailProduct,
      savePercent: e.subDetailProduct,
      url: e.checkoutUrl,
    )).toList();

    itemSelected = prices[1];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.95,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        gradient: LinearGradient(
            tileMode: TileMode.repeated,
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              colors.secondary,
              colors.primary,
              colors.secondary,
            ]),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: SizedBox(
              height: size.height * 0.4,
              child: Image.asset(
                'assets/images/welcome/11.jpeg',
                width: double.maxFinite,
                fit: BoxFit.cover,
                alignment: Alignment.lerp(
                  Alignment.topCenter,
                  Alignment.bottomCenter,
                  0.9,
                )!,
              ),
            ),
          ),
          _effectImage(),
          Column(
            children: [
              SizedBox(
                height: size.height * 0.35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'Diga adeus ao excesso de gordura e destrave todo o seu potencial',
                        style: TextStyle(
                          color: colors.text2,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03),
              _priceChoice(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: MyButton(
                  title: 'CONTINUE',
                  colorButton: colors.text2,
                  colorTitle: colors.primary,
                  border: 8,
                  loading: openPayment,
                  loadingColor: colors.primary,
                  onPress: itemSelected == null ? null : () async {
                    await launchUrl(
                      Uri.parse(generateUrl(itemSelected!.url)),
                    );
                    setState(() {
                      openPayment = true;
                    });
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ).copyWith(
                  bottom: MediaQuery.of(context).padding.bottom + 20,
                ),
                child: Text(
                  'Continuando, você concorda com os nossos Termos de Uso e Política de Privacidade',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colors.text2,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 5),
            child: MyBackButton(
              closeIcon: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceChoice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(prices.length, (index) {
        final item = prices[index];
        bool hasSelected = itemSelected == item;
        return Flexible(
          child: GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              setState(() {
                itemSelected = item;
              });
            },
            child: Opacity(
              opacity: hasSelected ? 1.0 : 0.9,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: index != 1 ? 8 : 0,
                ),
                width: size.width * 0.3,
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: hasSelected ? 2 : 0,
                    color: hasSelected
                        ? colors.text2
                        : Colors.black.withOpacity(0.4),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: (hasSelected && item.detail != null)
                            ? colors.secondary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        item.detail ?? '',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color:
                                hasSelected ? colors.text2 : colors.secondary,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      '${item.totalMonth} ${item.totalMonth == 1 ? 'mês' : 'meses'}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: colors.text2,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      returnPrice(item.price / (item.totalMonth * 4)),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: colors.text2,
                        fontSize: 12,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Divider(
                        thickness: 0.2,
                        height: 0,
                      ),
                    ),
                    Text(
                      'semana',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: colors.text2,
                        fontSize: 8,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Container(
                      margin: const EdgeInsets.only(top: 12, left: 4, right: 4),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: item.savePercent != null
                            ? Colors.white.withOpacity(0.9)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          (item.savePercent ?? '').toString(),
                          style: TextStyle(
                            color: item.savePercent != null
                                ? colors.secondary
                                : Colors.transparent,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.012),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  String generateUrl(String link){
    final user = userController.user;
    return '$link?name=${user.name}&email=${user.email}&cpf=${user.cpf}&phone=${user.cellphone}';
  }

  Widget _effectImage() {
    return Container(
      height: size.height * 0.4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Colors.transparent,
            colors.primary,
          ],
          stops: const [
            0.7,
            1,
          ],
        ),
      ),
    );
  }

  String returnPrice(double text) {
    double value = double.parse(text.toStringAsFixed(2));
    final formatter = NumberFormat("#,##0.00", "pt_BR");
    return "R\$ ${formatter.format(value)}";
  }
}

class PricingModel {
  final int totalMonth;
  final double price;
  final String? detail;
  final String? savePercent;
  final String url;

  PricingModel({
    required this.totalMonth,
    required this.price,
    required this.url,
    this.detail,
    this.savePercent,
  });
}