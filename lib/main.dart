import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter/widgets.dart';

var dio = Dio();
Future<Welcome> createAlbum(String search) async {
  print('infunction');
  print(search);
    
  final response = await dio.post(
    'http://doorbell-deliveries.in/OldData_10022021/doorbell_old/food_user/searchRest.php',
    data: {'city_id': 5, 'search_keyword': 'amdavadi'},
    options: Options(contentType: Headers.formUrlEncodedContentType),
  );

  if (response.statusCode == 200) {
    print('success');
    print(response);
    return Welcome.fromJson(jsonDecode(response.data));
  } else {
    print('unnnnnsucess');
    throw Exception('Failed to create album.');
  }
}

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);




class Welcome {
  Welcome({
    this.all_restDetails,
    
  });

  List<all_restDetailsDatum> all_restDetails;
  

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    all_restDetails: List<all_restDetailsDatum>.from(json["all_restDetails"].map((x) => all_restDetailsDatum.fromJson(x))),
   
  );

  Map<String, dynamic> toJson() => {
    "all_restDetails": List<dynamic>.from(all_restDetails.map((x) => x.toJson())),
  };
}

class all_restDetailsDatum {
  all_restDetailsDatum({
    this.rest_id,
    this.lat,
    this.lan,
    this.rest_address,
    this.packing_charges,
    this.rest_name,
    this.open_time,
    this.close_time,
    this.rest_open,
    this.rest_image,
    this.discount_value_percent,
    this.rating,
    this.restro_type,
    this.min_order_amt,
    this.gst_percent,
    this.delivery_charges,
    this.wallet_percent_used,
    this.open_time_two,
    this.close_time_two,
    this.rest_discriptions,
    this.rest_open_second_time,
    this.deliverycharege_for_cake,
    this.user_delevery_amt,
    this.expected_delivery_time,

  });

  var rest_id;
  var lat;
  var lan;
  var rest_address;
  var packing_charges;
  var rest_name;
  var open_time;
  var close_time;
  var rest_open;
  var rest_image;
  var discount_value_percent;
  var rating;
  var restro_type;
  var min_order_amt;
  var gst_percent;
  var delivery_charges;
  var wallet_percent_used;
  var expected_delivery_time;
  var open_time_two;
  var close_time_two;
  var rest_discriptions;
  var rest_open_second_time;
  var deliverycharege_for_cake;
  var user_delevery_amt;

  factory all_restDetailsDatum.fromJson(Map<String, dynamic> json) => all_restDetailsDatum(
    rest_id: json["rest_id"],
    lat: json["lat"],
    lan: json["lan"],
    rest_address: json["rest_address"],
    packing_charges: json["packing_charges"],
    rest_name: json["rest_name"],
    open_time: json["open_time"],
    close_time: json["close_time"],
    rest_open: json["rest_open"],
    rest_image: json["rest_image"],
    discount_value_percent: json["discount_value_percent"],
    rating: json["rating"],
    restro_type: json["restro_type"],
    min_order_amt: json["min_order_amt"],
    expected_delivery_time: json["expected_delivery_time"],
    gst_percent: json["gst_percent"],
    delivery_charges: json["delivery_charges"],
    wallet_percent_used: json["wallet_percent_used"],
    open_time_two: json["open_time_two"],
    close_time_two: json["close_time_two"],
    rest_discriptions: json["rest_discriptions"],
    rest_open_second_time: json["rest_open_second_time"],
    deliverycharege_for_cake: json["devliverycharges_for_cake"],
    user_delevery_amt: json["user_develiery_amt"],

  );

  Map<String, dynamic> toJson() => {

    "rest_id" : rest_id,
    "lat" : lat,
    "lan": lan,
    "rest_address": rest_address,
    "packing_charges": packing_charges,
    "rest_name": rest_name,
    "open_time": open_time,
    "close_time": close_time,
    "rest_open": rest_open,
    "rest_image": rest_image,
    "discount_value_percent": discount_value_percent,
    "rating": rating,
    "restro_type": restro_type,
    "min_order_amt": min_order_amt,
    "expected_delivery_time":expected_delivery_time,
    "gst_percent": gst_percent,
    "delivery_charges": delivery_charges,
    "wallet_percent_used": wallet_percent_used,
    "open_time_two": open_time_two,
    "close_time_two": close_time_two,
    "rest_discriptions": rest_discriptions,
    "rest_open_second_time": rest_open_second_time,
    "deliverycharege_for_cake": deliverycharege_for_cake,
    "user_develiery_amt": user_delevery_amt,
  };
}
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Search Restuarant'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final meradata = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: meradata,
                    decoration: InputDecoration(hintText: 'Search  '),
                  ),

                  //summerizing text
                  ElevatedButton(
                    child: Text('Search Restuarant'),
                    // onPressed: () {
                    //   print(meradata.text);
                    //   print('keyword');

                    // },
                    onPressed: () {
                      print(meradata.text);

                      // showDialog(
                      //   context: context,
                      //   builder: (context) {
                      //     return AlertDialog(
                      //       content: Text(meradata.text),
                      //     );
                      //   },
                      // );
                    },
                  ),
                ],
              )),
          if (meradata.text == null)
            Container(child: Text("nhi aaya"))
          else
            FutureBuilder(
              future: createAlbum(meradata.text),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                     snapshot.data.all_restDetails.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          Text(
                            snapshot.data.all_restDetails[index].rest_name),
                        ],
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return CircularProgressIndicator();
              },
            )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
