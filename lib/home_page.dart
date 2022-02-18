import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portfolio_ui/hover_text.dart';

Widget buildSocialButton({required image}) {
  return Container(
    width: 30,
    height: 30,
    margin: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(image),
      ),
      border: Border.all(
        color: Color(0xFF50545d),
      ),
      borderRadius: BorderRadius.circular(30),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return Desktop();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return Desktop();
        } else {
          return Mobile();
        }
      },
    );
  }
}

class Desktop extends StatefulWidget {
  const Desktop({Key? key}) : super(key: key);

  @override
  _DesktopState createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  buildTopPart() {
    return AppBar(
      backgroundColor: Color(0xff010101),
      title: DefaultTextStyle(
        style: const TextStyle(fontSize: 35, color: Colors.white, shadows: [
          BoxShadow(
            blurRadius: 7.0,
            color: Colors.white,
            offset: Offset(0, 0),
          )
        ]),
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            FlickerAnimatedText(
              "Muntair Ifaz",
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            )
          ],
          onTap: () {
            print("onTap");
          },
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 40.0),
          child: Row(
            children: [
              HoverText(
                onTap: () {},
                text: "About",
              ),
              SizedBox(
                width: 30,
              ),
              HoverText(
                onTap: () {},
                text: "Portfolio",
              ),
              SizedBox(
                width: 30,
              ),
              HoverText(
                onTap: () {},
                text: "Contact",
              ),
              SizedBox(
                width: 30,
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff010101),
      appBar: buildTopPart(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSocialButton(
                        image: "assets/facebook.gif",
                      ),
                      buildSocialButton(
                        image: "assets/instagram.gif",
                      ),
                      buildSocialButton(
                        image: "assets/linkedin.gif",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/5.jpg"),
                        )),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: DefaultTextStyle(
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              WavyAnimatedText(
                                "Hello...!!!",
                                textStyle: TextStyle(
                                  fontSize: 100,
                                  fontFamily: "myfont",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )
                            ],
                            isRepeatingAnimation: true,
                            onTap: () {
                              print("onTap");
                            },
                          ),
                        ),
                      ),
                      Flexible(
                        child: DefaultTextStyle(
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                "Maybe we are all fools, one way or another :-)",
                                textStyle: TextStyle(
                                  fontSize: 30,
                                  color: Color(0xff666d77),
                                ),
                              )
                            ],
                            onTap: () {
                              print("onTap");
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Mobile extends StatefulWidget {
  const Mobile({Key? key}) : super(key: key);

  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  Widget buildDrawer() {
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff1e1e1e),
            ),
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.blueAccent,
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/6.png",
                        ),
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Muntasir Ifaz",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Portfolio",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              "Contact",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              "About",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
            onTap: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildSocialButton(
                image: "assets/facebook.gif",
              ),
              buildSocialButton(
                image: "assets/instagram.gif",
              ),
              buildSocialButton(
                image: "assets/linkedin.gif",
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xFF010101),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: DefaultTextStyle(
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "myfont",
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              WavyAnimatedText(
                                "Hello...!!!",
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "myfont",
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                  MediaQuery.of(context).size.width * 0.1,
                                ),
                              ),
                            ],
                            isRepeatingAnimation: true,
                            onTap: () {},
                          ),
                        ),
                      ),
                      Flexible(
                        child: DefaultTextStyle(
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xFF666d77),
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                "Maybe we are all fools, one way or another :-)",
                                textStyle: TextStyle(
                                  color: Color(0xFF666d77),
                                  fontSize:
                                  MediaQuery.of(context).size.width / 30,
                                ),
                              ),
                            ],
                            isRepeatingAnimation: true,
                            onTap: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/5.jpg"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
