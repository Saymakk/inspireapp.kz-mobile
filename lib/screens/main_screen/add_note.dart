import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspire/constants/constants.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  bool isVisible = true;

  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 24, right: 24, bottom: 10),
          padding: EdgeInsets.only(
            left: 16,
            top: 12,
          ),
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xffF7FAFB),
              border: Border.all(color: Color(0xffE5EBED))),
          child: TextFormField(
              cursorColor: Color(0xffCFD7D9),
              maxLines: 3,
              controller: controller,
              onChanged: (text) {
                setState(() {
                  controller.text.isEmpty
                      ? isVisible = true
                      : isVisible = false;
                });
              },
              decoration: InputDecoration(
                  border: InputBorder.none,

                  hintStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Color(0xffCFD7D9),
                          fontSize: 14,
                          height: 1.3))),
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      height: 1.3))),
        ),
        Visibility(
          visible: isVisible,
          child: Container(
              margin: EdgeInsets.only(top: 24, left: 40),
              child: Row(
                children: [
                  Image.asset(
                    Const.icns + 'pencil.png',
                    color: Color(0xffCFD7D9),
                    height: 14,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Добавьте заметку этого дня',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Color(0xffCFD7D9),
                            fontSize: 14,
                            height: 1.3)),
                  )
                ],
              )),
        ),
      ],
    );
  }
}
