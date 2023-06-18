import 'package:flutter/material.dart';
import '../packages/package.dart';
import '../screens/screens.dart';
import '../components/components.dart';
import '../screens_controllers/home_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class HomeView extends StatelessView<Home, HomeController> {
  const HomeView(HomeController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: AppBar(
            backgroundColor: const Color(0xff25435B),
            centerTitle: true,
            title: const Text(
              'Enrolled Courses',
            )),
        body: WidgetWrapper(child: _body()));
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Padding(
        padding: REdgeInsets.all(10.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: 20.h,
          ),
          const EnrolledCourseWidget(onTap: null),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              const Expanded(
                child: CardWidget(
                  title: 'Enrolled Course',
                  number: '12',
                  onTap: null,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              const Expanded(
                child: CardWidget(
                  title: 'Resources',
                  number: '18',
                  onTap: null,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Expanded(
                child: CardWidget(
                  title: 'Assignment',
                  number: '4',
                  onTap: null,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 120.h,
            child: ListView(
                scrollDirection: Axis.horizontal,
                          children:   <Widget> [
                            const CardWidget(
                              title: 'Resources',
                              number: '18',
                              onTap: null,
                            ),
                            SizedBox(width: 15.w,),
                            const CardWidget(
                              title: 'Resources',
                              number: '18',
                              onTap: null,
                            ),
                            SizedBox(width: 15.w,),
                            const CardWidget(
                              title: 'Resources',
                              number: '18',
                              onTap: null,
                            ),
                            SizedBox(width: 15.w,),
                            CardWidget(
                              title: 'Resources',
                              number: '18',
                              onTap: null,
                            ),

                          ],
                        ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              ResourcesWidget(
                onTap: null,
                type: 'Document',
                number: '12',
                color: Color(0xffFFD188),
                image: 'assets/images/documents.svg',
              ),
              ResourcesWidget(
                onTap: null,
                type: 'Videos',
                number: '12',
                color: Color(0xffC4E4FF),
                image: 'assets/images/videos.svg',
              ),
              ResourcesWidget(
                onTap: null,
                type: 'Audios',
                number: '12',
                color: Color(0xff7DDE86),
                image: 'assets/images/audios.svg',
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          const DocumentResourcesWidget(
              image: 'assets/images/pdf.svg', onTap: null),
          SizedBox(
            height: 10.h,
          ),
          const CourseInfoWidget(
            onTap: null,
          ),
          SizedBox(
            height: 10.h,
          ),
          const DocumentResourcesWidget(
              image: 'assets/images/audio_doc.svg', onTap: null),
          SizedBox(
            height: 10.h,
          ),
          const DocumentResourcesWidget(
              image: 'assets/images/pdf.svg', onTap: null),
          SizedBox(
            height: 10.h,
          ),
          const DocumentResourcesWidget(
              image: 'assets/images/audio_doc.svg', onTap: null),
          SizedBox(
            height: 10.h,
          ),
          const DocumentResourcesWidget(
              image: 'assets/images/pdf.svg', onTap: null),
          SizedBox(
            height: 10.h,
          ),
          const DocumentResourcesWidget(
              image: 'assets/images/audio_doc.svg', onTap: null),
          SizedBox(
            height: 10.h,
          ),
          const DocumentResourcesWidget(
              image: 'assets/images/pdf.svg', onTap: null),
        ]),
      ),
    );
  }
}
