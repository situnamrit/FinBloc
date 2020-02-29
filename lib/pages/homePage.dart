
/*import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFFF8FBFF),
        Color(0xFFFCFDFD),
      ])),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            primary: true,
            shrinkWrap: true,
            slivers: (MediaQuery.of(context).size.width > 800)
                ? largeItems(context)
                : smallItems(context),
          ),
          endDrawer: endDrawer(context)),
    );
  }

  List<Widget> largeItems(BuildContext context) {
    return [
      NavBar(),
      SliverList(
        delegate: SliverChildListDelegate(
          <Widget>[
            SizedBox(
              height: 550,
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                fit: StackFit.expand,
                children: <Widget>[
                  FractionallySizedBox(
                    alignment: Alignment.bottomRight,
                    widthFactor: .6,
                    child:
                        Image.asset("assets/images/image_01.png", scale: .80),
                  ),
                  FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: .6,
                    child: Padding(
                      padding: EdgeInsets.only(left: 48),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Hello!",
                              style: TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Montserrat-Regular",
                                  color: Color(0xFF8591B0))),
                          RichText(
                            text: TextSpan(
                                text: "WellCome To ",
                                style: TextStyle(
                                    fontSize: 60, color: Color(0xFF8591B0)),
                                children: [
                                  TextSpan(
                                      text: "Widhya",
                                      style: TextStyle(
                                          fontSize: 60,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87))
                                ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 20),
                            child: Text("LET’S EXPLORE THE WORLD"),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          SendBtn()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 50, right: 50),
              height: 2,
              decoration: BoxDecoration(
                color: Colors.black12,
              ),
            ),
          ],
        ),
      ),
      featureSection(context, contentType: "common"),
      SliverPadding(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        sliver: SliverToBoxAdapter(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Frequently Asked Questions",
              style: TextStyle(
                  fontSize: (MediaQuery.of(context).size.width < 800) ? 25 : 60,
                  color: Colors.grey[600]),
            ),
          ),
        ),
      ),
      faqSection(context),
      SliverPadding(
        padding: EdgeInsets.only(left: 50, right: 50),
        sliver: SliverToBoxAdapter(
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              color: Colors.black12,
            ),
          ),
        ),
      ),
      // footerSection(context),
      copyRightWidget(),
    ];
  }

  List<Widget> smallItems(BuildContext context) {
    return [
      NavBar(),
      SliverList(
        delegate: SliverChildListDelegate(
          [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Hello!",
                  style: TextStyle(
                      fontSize: 35,
                      color: Color(0xFF8591B0),
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat-Regular"),
                ),
                RichText(
                  text: TextSpan(
                    text: 'WellCome To ',
                    style: TextStyle(fontSize: 35, color: Color(0xFF8591B0)),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Widhya',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Colors.black87)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 20),
                  child: Text("LET’S EXPLORE THE WORLD"),
                ),
                SizedBox(
                  height: 32,
                ),
                SendBtn(),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Image.network(
                    "assets/image_01.png",
                    scale: 1,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  height: 2,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      featureSectionSmall(context, contentType: "common"),
      SliverPadding(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        sliver: SliverToBoxAdapter(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Frequently Asked Questions",
              style: TextStyle(
                  fontSize: (MediaQuery.of(context).size.width < 800) ? 25 : 60,
                  color: Colors.grey[600]),
            ),
          ),
        ),
      ),
      faqSection(context),
      SliverPadding(
        padding: EdgeInsets.only(left: 10, right: 10),
        sliver: SliverToBoxAdapter(
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              color: Colors.black12,
            ),
          ),
        ),
      ),
      // footerSection(context),
      copyRightWidget(),
    ];
  }
}

Widget featureSection(BuildContext context, {@required String contentType}) {
  return FutureBuilder(
    future: DefaultAssetBundle.of(context).loadString("assets/data/data.json"),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState != ConnectionState.done)
        return SliverToBoxAdapter();
      Map<String, List> data = json.decode(snapshot.data).cast<String, List>();
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final content = data[contentType].elementAt(index);
            return SizedBox(
              height: 300,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                      top: 20,
                      left: 100,
                      right: 100,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: index % 2 != 0
                          ? featuresS1(content["feature"],
                              content["description"], content["image"])
                          : featuresS2(content["feature"],
                              content["description"], content["image"]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 50, right: 50),
                    height: 2,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                    ),
                  )
                ],
              ),
            );
          },
          childCount: data[contentType].length,
        ),
      );
    },
  );
}

Widget featureSectionSmall(BuildContext context,
    {@required String contentType}) {
  return FutureBuilder(
    future: DefaultAssetBundle.of(context).loadString("assets/data/data.json"),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState != ConnectionState.done)
        return SliverToBoxAdapter();
      Map<String, List> data = json.decode(snapshot.data).cast<String, List>();
      return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          final content = data[contentType].elementAt(index);
          return Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  bottom: 20,
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: content["feature"],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Montserrat-Regular",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: content["description"],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                fontFamily: "Montserrat-Regular",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset("assets/images/${content["image"]}",
                            colorBlendMode: BlendMode.multiply)),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                height: 2,
                decoration: BoxDecoration(
                  color: Colors.black12,
                ),
              )
            ],
          );
        }, childCount: data[contentType].length),
      );
    },
  );
}

List<Widget> featuresS1(String title, String desc, String image) {
  return <Widget>[
    Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w600,
                fontFamily: "Montserrat-Regular",
              ),
            ),
          ),
          Container(
            child: RichText(
              text: TextSpan(
                text: desc,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Montserrat-Regular",
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    SizedBox(
      width: 50,
    ),
    SizedBox(
      width: 250,
      height: 250,
      child: Image.asset("assets/images/$image",
          colorBlendMode: BlendMode.multiply),
    ),
  ];
}

List<Widget> featuresS2(String title, String desc, String image) {
  return <Widget>[
    SizedBox(
      width: 250,
      height: 250,
      child: Image.asset("assets/images/$image",
          colorBlendMode: BlendMode.multiply),
    ),
    SizedBox(
      width: 50,
    ),
    Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: RichText(
              text: TextSpan(
                text: title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat-Regular",
                ),
              ),
            ),
          ),
          Container(
            child: RichText(
              text: TextSpan(
                text: desc,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Montserrat-Regular",
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ];
}

Widget faqSection(context) {
  return SliverPadding(
    padding: (MediaQuery.of(context).size.width < 800)
        ? EdgeInsets.only(left: 20, right: 20, bottom: 10)
        : EdgeInsets.only(left: 200, right: 200, bottom: 50),
    sliver: SliverList(
      delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) => FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString("assets/data/data.json"),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done)
                  return Container();
                Map<String, List> data =
                    json.decode(snapshot.data).cast<String, List>();
                return FaqItem(
                  Faq(
                    data["faqs"].elementAt(index)["title"],
                    [
                      Faq(
                        data["faqs"].elementAt(index)["answer"],
                      ),
                    ],
                  ),
                );
              }),
          childCount: 5),
    ),
  );
}*/