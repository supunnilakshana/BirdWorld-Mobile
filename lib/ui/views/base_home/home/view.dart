import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:birdworld/ui/theme/color.dart';
import 'package:birdworld/ui/views/base_home/home/identification_screen/view.dart';
import 'package:birdworld/ui/widgets/cards/chat_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:stacked/stacked.dart';

import '../chat/ai_chat_screen.dart';
import 'view_model.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    // final AppConfProvider chatconf = Provider.of(context);
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        return viewModel.onBack();
      },
      child: Scaffold(
        backgroundColor: AppColors.md_theme_light_background,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: size.height * 1.1),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                        height: size.height * 0.3,
                        width: size.width,
                        color: AppColors.appPrimary,
                        child: SafeArea(
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.05,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.05),
                                  child: AnimatedTextKit(
                                    repeatForever: true,
                                    animatedTexts: [
                                      WavyAnimatedText('Welcome to Bird World',
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17)),
                                    ],
                                    isRepeatingAnimation: true,
                                    onTap: () {
                                      print("Tap Event");
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.05),
                                child: ListTile(
                                    title: const Text(
                                      "Hi, Supun",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        "Welcome to Birld World",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    trailing: CircleAvatar(
                                      backgroundImage: const AssetImage(
                                          'assets/images/tewmplogo.png'),
                                      backgroundColor: AppColors.appPrimary,
                                      radius: size.width * 0.1,
                                    )),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height: size.height * 0.16),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ChatCard(
                          img: 'assets/images/bird_chat.png',
                          title: "Idetify Birds",
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const IdentificationScreenView();
                                },
                              ),
                            );
                          },
                        ),
                        ChatCard(
                          img: "assets/images/bird_chat.png",
                          title: "Chat with Bird",
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const AIChatView();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
                Positioned(
                  top: size.height * 0.23,
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  child: GestureDetector(
                    onTap: () {},
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 5,
                        color: const Color.fromARGB(255, 226, 234, 255),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Column(
                                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Search and Discover About  Birds",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: AppColors.appPrimary,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        const Text(
                                          "Join our flock of bird lovers! 🕊️ Explore diverse species, share sightings, and connect with fellow enthusiasts.",
                                          style: TextStyle(
                                              color: AppColors.appPrimary,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.01),
                                    child: SizedBox(
                                      //height: size.height * 0.1,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          const Text(
                                            "Identifly",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: AppColors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Icon(
                                            const FaIcon(
                                                    FontAwesomeIcons.arrowRight)
                                                .icon,
                                            size: 18,
                                            color: AppColors.fontcolor(context),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  viewModelBuilder(BuildContext context) => HomeViewModel(Provider.of(context));

  @override
  void onViewModelReady(HomeViewModel viewModel) => viewModel.init();
}
