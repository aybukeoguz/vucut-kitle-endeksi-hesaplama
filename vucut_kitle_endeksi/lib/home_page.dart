import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

String getBMIMeaning(double bmi) {
  if (bmi >= 30) {
    return '1.derece Obez';
  } else if (bmi >= 25) {
    return 'Kilolu';
  } else if (bmi >= 18.5) {
    return 'Normal';
  } else if (bmi >= 35) {
    return '2.derece Obez';
  } else if (bmi >= 40) {
    return '3.derece Obez';
  } else {
    return 'Zayıf';
  }
}

class _HomePageState extends State<HomePage> {
  bool isMale = true;
  bool isFemale = false;
  TextEditingController yasKontrol = TextEditingController();
  TextEditingController boyKontrol = TextEditingController();
  TextEditingController kiloKontrol = TextEditingController();
  double bmi = 0.0;
  double boy = 0;
  double kilo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Stack(
          children: [
            SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'BMI Hesaplama',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('logo.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 450,
                          width: 180,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(isMale
                                    ? 'assets/erkek.png'
                                    : isFemale
                                        ? 'assets/mikasa.png'
                                        : 'assets/male.png'),
                                fit: BoxFit.fitHeight),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Cinsiyet',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isFemale = !isFemale;
                                      if (isFemale == true) {
                                        isMale = false;
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: isFemale
                                          ? Colors.redAccent.shade200
                                          : Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.female,
                                        color: Colors.white,
                                        size: 41,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isMale = !isMale;
                                      if (isMale == true) {
                                        isFemale = false;
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: isMale
                                          ? Colors.blueGrey
                                          : Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.male_outlined,
                                        color: Colors.white,
                                        size: 41,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Boy (cm)',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                            SizedBox(
                              height: 90,
                              width: 150,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: boyKontrol,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder()),
                              ),
                            ),
                            Text(
                              'Yaş',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                            SizedBox(
                              height: 90,
                              width: 150,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: yasKontrol,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder()),
                              ),
                            ),
                            Text(
                              'Ağırlık (kg)',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                            SizedBox(
                              height: 90,
                              width: 150,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: kiloKontrol,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder()),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          boy = double.parse(boyKontrol.text) /
                              100; // cm to m conversion
                          kilo = double.parse(kiloKontrol.text);
                          bmi = kilo / (boy * boy);
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Colors.blueGrey,
                              Colors.redAccent,
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'BMI Hesapla',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Vücut Kitle Endeksiniz: ${bmi.toStringAsFixed(2)} (${getBMIMeaning(bmi)})',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bilgilendirme',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '-18,5 kg/m2 ve daha düşük = Zayıf\n'
                            '-18,5 ve 24,9 kg/m2 arası = Normal\n'
                            '-25,0 ve 29,9 kg/m2 arası = Kilolu\n'
                            '-30,0 ve 34,9 kg/m2 arası = 1. derece obezite\n'
                            '-35,0 ve 39,9 kg/m2 arası = 2. derece obezite\n'
                            '-40 kg/m2 ve üzeri = 3. derece obezite',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
