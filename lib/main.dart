import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  MediaQueryData? mediaQueryData;
  double? screenW, screenH;
  Orientation? mOrientation;


  @override
  Widget build(BuildContext context) {

    initialValues(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive'),
      ),
      body: MediaQuery.of(context).size.width>MediaQuery.of(context).size.height? Container(
        color: Colors.orange,
        ///landscape
        child: Row(
          children: [
            Container(
              width: screenW!*0.7,
              color: Colors.green,
              child : LayoutBuilder(
                builder: (_, constraints){
                  print("Internal Box Width : ${constraints.maxWidth}");
                  print("Internal Box Height : ${constraints.maxHeight}");
                  return Center(
                    child: Container(
                      color: Colors.grey,
                      height: 200,
                      width: 200,
                    ),
                  );
                },
              )
            ),

            Expanded(
              child: Container(
                color: Colors.blueGrey,
                child: Center(
                  child: Text('1', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                ),
              ),
            ),
          ],
        )
      ) : Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          ),

          Container(
            height: screenH!*0.6,
            color: Colors.blueGrey,
              child: OrientationBuilder(
                builder: (_, orientation){
                  if(orientation==Orientation.landscape){
                    return Center(child: Text('Internal landscape'));
                  } else {
                    return Center(child: Text('Internal Portrait'));
                  }
                },
              )
          ),
        ],
      )
    );
  }

  void initialValues(BuildContext context){
    mediaQueryData = MediaQuery.of(context);
    screenW = mediaQueryData!.size.width;
    screenH = mediaQueryData!.size.height;
    mOrientation = mediaQueryData!.orientation;
  }
}


