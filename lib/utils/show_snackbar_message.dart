import 'package:flutter/material.dart';

ScaffoldFeatureController showSnackbarMessage(
  BuildContext context,
  String snackBarMessage,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        snackBarMessage,
      ),
    ),
  );
}

Future<dynamic> successDialog(
    BuildContext context, String text, Function onConfirmed) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          padding: EdgeInsets.all(20.5),
          width: 295,
          height: 390,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/bg_success.png',
                // Ubah path sesuai dengan path gambar Anda
                width: 156,
                height: 161,
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'Berhasil',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Expanded(
                child: Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  onConfirmed();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 120,
                  height: 43,
                  decoration: BoxDecoration(
                      color: Color(0xff00008F),
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text(
                    "Ok",
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
