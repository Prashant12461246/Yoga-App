import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tabbar/customclass/listdetails.dart';
import 'common/constant.dart';

class Course extends StatefulWidget {
  @override
  _CourseState createState() => _CourseState();
}

class _CourseState extends State<Course> with SingleTickerProviderStateMixin {
  List<ListDetails> listdetails = [
    ListDetails(
        image:
            "https://images.unsplash.com/photo-1463704131914-97e5aaa0e339?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
        title: "Easy yoga for complete begineers",
        subtitle: "1 week workout"),
    ListDetails(
        image:
            "https://images.unsplash.com/photo-1518611012118-696072aa579a?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
        title: "Yoga for 3 week begineer",
        subtitle: "3 week workout"),
    ListDetails(
        image:
            "https://images.unsplash.com/photo-1463704131914-97e5aaa0e339?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
        title: "Yoga for 4 week begineer",
        subtitle: "4 week workout"),
    ListDetails(
        image:
            "https://images.unsplash.com/photo-1575052814086-f385e2e2ad1b?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
        title: "Yoga for 5 week begineer",
        subtitle: "5 week workout"),
    ListDetails(
        image:
            "https://images.unsplash.com/photo-1463704131914-97e5aaa0e339?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
        title: "Yoga for 6 week begineer",
        subtitle: "6 week workout")
  ];
  Widget cardTemplate(listdetail) {
    // Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        print(listdetail.title);
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                margin: EdgeInsets.fromLTRB(
                    10, kDefaultPadding, 0, kDefaultPadding),
                width: 270,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(listdetail.image)),
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 260,
                child: Text(
                  listdetail.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(top: 5),
                width: 260,
                child: Text(
                  listdetail.subtitle,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ScrollController _scrollViewController;
  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                elevation: 0,
                floating: false,
                pinned: false,
                snap: false, //<-- floating to true
                forceElevated: innerBoxIsScrolled,
                expandedHeight: 0,
                title: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text("My Courses",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold))),

                actions: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: 38,
                      child: IconButton(
                        icon: SvgPicture.asset("assets/icons/search.svg",
                            color: kBackgroundColor),
                        onPressed: () => {},
                      ),
                    ),
                  ),
                  SizedBox(
                    width: kDefaultPadding / 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: 40,
                      child: IconButton(
                        icon: SvgPicture.asset("assets/icons/notification.svg",
                            color: kBackgroundColor),
                        onPressed: () => {},
                      ),
                    ),
                  ),
                  SizedBox(
                    width: kDefaultPadding / 2,
                  ),
                ],
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: size.height * 2.3 - kDefaultPadding,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: size.height * 0.19),
                        height: size.height * 2.1,
                        decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(24),
                              topLeft: Radius.circular(24)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 50, left: 30),
                        height: size.height * 0.2,
                        width: size.width * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 20),
                                  blurRadius: 60,
                                  color: kTextColor.withOpacity(0.63))
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: size.height * 0.2 / 3,
                              decoration: BoxDecoration(
                                  border: Border(
                                      left: BorderSide(
                                          color: Color(0xFF21BBAF), width: 10),
                                      bottom: BorderSide(
                                        color: Color(0xFF000000),
                                        width: 0.4,
                                      ))),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(width: 10),
                                  Image.asset(
                                    "assets/icons/greenfile.png",
                                    height: 33,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "4 days",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: size.height * 0.2 / 3,
                              decoration: BoxDecoration(
                                  border: Border(
                                      left: BorderSide(
                                          color: Color(0xFF3AC7EF), width: 10),
                                      bottom: BorderSide(
                                        color: Color(0xFF000000),
                                        width: 0.4,
                                      ))),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(width: 10),
                                  SvgPicture.asset(
                                    "assets/icons/clock.svg",
                                    height: 31,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "3 hr 45 min",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: size.height * 0.2 / 3,
                              decoration: BoxDecoration(
                                  border: Border(
                                      left: BorderSide(
                                          color: Color(0xFFF36A22),
                                          width: 10))),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(width: 10),
                                  SvgPicture.asset(
                                    "assets/icons/fire.svg",
                                    height: 34,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "435 kcal",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                          right: size.width * .1 - 10,
                          child: Image.asset(
                            "assets/images/course.png",
                            height: size.height * 0.27,
                          )),
                      Positioned(
                          top: 30,
                          right: 20,
                          child: Container(
                            height: 70.0,
                            width: 70.0,
                            child: Center(
                                child: Text(
                              "Beginner",
                              style: TextStyle(color: Colors.white),
                            )),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFF1556B),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 20),
                                    blurRadius: 60,
                                    color: kTextColor.withOpacity(0.63))
                              ],
                            ),
                          )),
                      Container(
                        height: size.height * 2,
                        width: size.width,
                        margin: EdgeInsets.only(top: size.height * 0.3),
                        child: Column(
                          children: <Widget>[
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 150,
                                    width: 40,
                                    margin: EdgeInsets.only(
                                        top: kDefaultPadding + 5),
                                    decoration: BoxDecoration(color: kCyan),
                                    child: RotatedBox(
                                      quarterTurns: -1,
                                      child: Container(
                                        width: 260,
                                        child: Center(
                                          child: Text(
                                            "BEGINNER",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                letterSpacing: 5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: listdetails
                                        .map((e) => cardTemplate(e))
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: kDefaultPadding + 5),
                                    height: 150,
                                    width: 40,
                                    decoration: BoxDecoration(color: kBlue),
                                    child: RotatedBox(
                                      quarterTurns: -1,
                                      child: Container(
                                        width: 260,
                                        child: Center(
                                          child: Text(
                                            "INTERMEDIATE",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                letterSpacing: 2),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: listdetails
                                        .map((e) => cardTemplate(e))
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: kDefaultPadding + 5),
                                    height: 150,
                                    width: 40,
                                    decoration: BoxDecoration(color: kPink),
                                    child: RotatedBox(
                                      quarterTurns: -1,
                                      child: Container(
                                        width: 260,
                                        child: Center(
                                          child: Text(
                                            "EXPERT",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                letterSpacing: 5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: listdetails
                                        .map((e) => cardTemplate(e))
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: kDefaultPadding),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: kDefaultPadding),
                                      height: 2,
                                      width: size.width / 5,
                                      color: kCyan,
                                    ),
                                    Text("SPECIAL COURSE",
                                        style: TextStyle(
                                            color: kCyan,
                                            letterSpacing: 2,
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: kDefaultPadding),
                                      height: 2,
                                      width: size.width / 5,
                                      color: kCyan,
                                    ),
                                  ],
                                )),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 150,
                                    width: 40,
                                    margin: EdgeInsets.only(
                                        top: kDefaultPadding + 5),
                                    decoration: BoxDecoration(color: kCyan),
                                    child: RotatedBox(
                                      quarterTurns: -1,
                                      child: Container(
                                        width: 260,
                                        child: Center(
                                          child: Text(
                                            "BEGINNER",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                letterSpacing: 5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: listdetails
                                        .map((e) => cardTemplate(e))
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: kDefaultPadding + 5),
                                    height: 150,
                                    width: 40,
                                    decoration: BoxDecoration(color: kBlue),
                                    child: RotatedBox(
                                      quarterTurns: -1,
                                      child: Container(
                                        width: 260,
                                        child: Center(
                                          child: Text(
                                            "INTERMEDIATE",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                letterSpacing: 2),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: listdetails
                                        .map((e) => cardTemplate(e))
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: kDefaultPadding + 5),
                                    height: 150,
                                    width: 40,
                                    decoration: BoxDecoration(color: kPink),
                                    child: RotatedBox(
                                      quarterTurns: -1,
                                      child: Container(
                                        width: 260,
                                        child: Center(
                                          child: Text(
                                            "EXPERT",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                letterSpacing: 5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: listdetails
                                        .map((e) => cardTemplate(e))
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
