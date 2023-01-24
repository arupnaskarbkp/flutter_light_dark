import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_state/view/image_widget.dart';
import 'controller/profile_screen_controller.dart';
import 'controller/theme_controller.dart';
import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';
import 'helper/get_di.dart' as di;
import 'util/color_resources.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
         init: ThemeController(sharedPreferences: Get.find()),
         builder: (themeController) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: themeController.darkTheme ? dark : light,
                home: child,
              );
            },
            child: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GetBuilder<ProfileController>(
              init: ProfileController(),
              builder: (profileController){
                return Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row( children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Icon(Icons.dark_mode,size: 28.0,),
                    ),
                    const Text('dark_mode'),
                    const Spacer(),
                    Transform.scale(
                      scale: 1,
                      child: Switch(
                        onChanged: profileController.toggleSwitch,
                        value: profileController.isSwitched,
                        activeColor: Colors.black26,
                        activeTrackColor: Colors.grey,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.black,

                      ),
                    ),

                  ],
                  ),
                );
              },),
             Text(
              'You have pushed the button this many times:',
              style: TextStyle(color: ColorResources.getRedColor()),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),

            ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.8,
                widthFactor: 0.8,
                child: Image.network("https://cdn.pixabay.com/photo/2022/06/15/13/39/man-7263965_960_720.png"),
              ),
            ),

            SizedBox(height: 10.h,),

            Container(
              height: 100,
              decoration:const ShapeDecoration(
                  shape: CircleBorder(),
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10.h,),
            ClipOval(
              child: Image.network("https://cdn.pixabay.com/photo/2022/06/15/13/39/man-7263965_960_720.png"),
            ),

            SizedBox(height: 10.h,),

            Container(
              height: 400,
              width: 300,
              color: Colors.red,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
              ),
            ),

            SizedBox(height: 10.h,),
            SizedBox(
              height: 100,
              width: 100,
              child: LimitedBox(
                maxHeight: 150,
                maxWidth: 150,
                child: Container(
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            const ImageBuilderWidget(image:"https://cdn.pixabay.com/photo/2015/10/13/15/16/lemons-986304__340.jpg"),
            SizedBox(height: 10.h,),

            SizedBox(height: 10.h,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
