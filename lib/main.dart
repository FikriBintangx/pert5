import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LayoutRulesExample(),
  ));
}

class LayoutRulesExample extends StatelessWidget {
  const LayoutRulesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiga Aturan Layout Flutter'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyPages1(),
            Divider(height: 40, thickness: 2),
            MyPages2(),
            Divider(height: 40, thickness: 2),
            MyPages3(),
          ],
        ),
      ),
    );
  }
}

class MyPages1 extends StatelessWidget {
  const MyPages1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '1 & 2. Aturan Constraints (Batas) dan Size (Ukuran)',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'Induk memaksa anak berada di batas 100x100 hingga 200x200. '
          'Anak meminta ukuran 500x50, tapi dipaksa mengikuti batas induk (mentok di lebar 200, tinggi 100).',
        ),
        const SizedBox(height: 10),
        ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 100,
            maxWidth: 200,
            minHeight: 100,
            maxHeight: 200,
          ),
          child: SizedBox(
            width: 500,
            height: 50,
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Colors.blue),
              child: const Center(
                child: Text(
                  'Saya minta 500x50, tapi dapatnya 200x100',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyPages2 extends StatelessWidget {
  const MyPages2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '3. Aturan Posisi (dengan Center & Align)',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'Induk abu-abu berukuran 200x200. Kotak merah 80x80 diletakkan di tengah menggunakan Center.',
        ),
        const SizedBox(height: 10),
        Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.grey[300],
            child: Center(
              child: Container(
                width: 80,
                height: 80,
                color: Colors.red,
                child: const Center(
                  child: Text('Center', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Induk abu-abu berukuran 200x200. Kotak hijau 80x80 ditempatkan di pojok kanan bawah menggunakan Align.',
        ),
        const SizedBox(height: 10),
        Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.grey[300],
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 80,
                height: 80,
                color: Colors.green,
                child: const Center(
                  child: Text('Align', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyPages3 extends StatelessWidget {
  const MyPages3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Percobaan Aturan 3 (Tanpa Center / Tight Constraints)',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'Tanpa widget Center/Align, anak merah (80x80) dipaksa memenuhi seluruh ukuran induk (200x200).',
        ),
        const SizedBox(height: 10),
        Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.grey[300],
            child: Container(
              width: 80,
              height: 80,
              color: Colors.red,
              child: const Center(
                child: Text('Full 200x200', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}