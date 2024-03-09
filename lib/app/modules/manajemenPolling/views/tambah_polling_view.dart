import 'package:flutter/material.dart';
import 'package:rtkita/app/providers/polling.dart';
import 'package:rtkita/env/color.dart';

class TambahPolling extends StatefulWidget {
  @override
  State<TambahPolling> createState() => _TambahPollingState();
}

class _TambahPollingState extends State<TambahPolling> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final List<TextEditingController> optionControllers = [];

  @override
  void initState() {
    optionControllers.add(TextEditingController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 56,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 10))
                  ]),
              // ignore: prefer_const_literals_to_create_immutables
              child: Row(children: [
                Expanded(
                  child: Container(
                      transform: Matrix4.translationValues(-20, 0, 0),
                      // ignore: prefer_const_constructors
                      child: BackButton()),
                ),
                // ignore: prefer_const_constructors
                Expanded(
                  flex: 2,
                  child: const Center(
                    child: Text(
                      'Manajemen Polling',
                      style: TextStyle(
                        // ignore: unnecessary_const
                        color: Colors.white,
                        fontFamily: 'roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
              ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Judul:',
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: titleController,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Deskripsi:',
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: descriptionController,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Pilihan:',
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: optionControllers.length,
                        itemBuilder: (context, index) {
                          return TextField(
                            controller: optionControllers[index],
                            decoration: InputDecoration(
                              hintText: 'Pilihan ${index + 1}',
                            ),
                          );
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            optionControllers.add(TextEditingController());
                          });
                        },
                        child: Text('Tambah Pilihan'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FloatingActionButton.extended(
              onPressed: () {
                final pollingProvider = PollingProvider();
                pollingProvider.addPolling(
                    context,
                    titleController.text,
                    descriptionController.text,
                    optionControllers.map((e) => e.text).toList());
              },
              label: Text('Tambah Polling'),
            ),
            SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
