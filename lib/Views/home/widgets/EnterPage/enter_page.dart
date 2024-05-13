// import 'package:flutter/material.dart';

// class EnterPage extends StatelessWidget {
//   const EnterPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Container(
//           width: 700,
//           height: 500,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Enter you',
//                 style: TextStyle(
//                     fontWeight: FontWeight.w800, fontSize: 75, height: 1.2),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Text(
//                 'Is a polygraphic substitution cipher that employs a 5x5 grid of letters for encryption, making it more resistant to frequency analysis compared to traditional ciphers. Its strength lies in its use of digraphs, where pairs of letters are encrypted based on their positions within the grid.',
//                 style: TextStyle(fontSize: 21, height: 1.7),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnterPage extends StatefulWidget {
  const EnterPage({super.key});

  @override
  _EnterPageState createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {
  TextEditingController plaintextController = TextEditingController();
  TextEditingController ciphertextController = TextEditingController();
  String key = '';
  List<List<String>> table = [];
  int _selectedMode = 0; // 0 for encryption, 1 for decryption
  final Map<int, Widget> _modes = const <int, Widget>{
    0: Text('  Encrypt  '),
    1: Text('  Decrypt  ')
  };
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.transparent,
              width: MediaQuery.sizeOf(context).width / 3.1,
              height: 500,
              child: Column(
                verticalDirection: VerticalDirection.down,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Enter Your Key and Plaintext',
                    style: TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 60, height: 1.2),
                  ),
                  const SizedBox(height: 30),
                  // const Text(
                  //   'A polygraphic substitution cipher that employs a 5x5 grid of letters for encryption, making it more resistant to frequency analysis compared to traditional ciphers. It uses digraphs, where pairs of letters are encrypted based on their positions within the grid.',
                  //   style: TextStyle(fontSize: 21, height: 1.7),
                  // ),
                ],
              ),
            ),
            SizedBox(
              width: 26,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width / 3.2,
              child: Column(
                children: [
                  TextField(
                    cursorColor: Colors.black,
                    cursorHeight: 18,
                    cursorWidth: 1,
                    onChanged: (value) {
                      setState(() {
                        key = value
                            .toUpperCase()
                            .replaceAll(RegExp(r'[^A-Z]'), '')
                            .replaceAll('J', 'I');
                        generatePlayfairTable(key);
                      });
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.black,
                      labelText: 'Key',
                      labelStyle: TextStyle(color: Colors.black),
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: Icon(Icons.vpn_key),
                      filled: true,
                      fillColor: Color.fromARGB(180, 245, 245, 245),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CupertinoSegmentedControl<int>(
                    children: _modes,
                    onValueChanged: (int val) {
                      setState(() {
                        _selectedMode = val;
                      });
                    },
                    groupValue: _selectedMode,
                    padding: EdgeInsets.all(4),
                    unselectedColor: Colors.white,
                    borderColor: Colors.black,
                    selectedColor: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  if (_selectedMode == 0) ...[
                    TextField(
                      cursorColor: Colors.black,
                      cursorHeight: 18,
                      cursorWidth: 1,
                      controller: plaintextController,
                      onChanged: (value) {
                        setState(() {
                          ciphertextController.text = encrypt(value, key);
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter Plaintext for Encryption',
                        focusColor: Colors.black,
                        labelStyle: TextStyle(color: Colors.black),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: Icon(Icons.email_outlined),
                        filled: true,
                        fillColor: Color.fromARGB(180, 245, 245, 245),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      cursorColor: Colors.black,
                      cursorHeight: 18,
                      cursorWidth: 1,
                      controller: ciphertextController,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Encrypted Ciphertext',
                        focusColor: Colors.black,
                        labelStyle: TextStyle(color: Colors.black),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: Icon(Icons.lock),
                        filled: true,
                        fillColor: Color.fromARGB(180, 245, 245, 245),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                      ),
                    ),
                  ] else ...[
                    TextField(
                      cursorColor: Colors.black,
                      cursorHeight: 18,
                      cursorWidth: 1,
                      controller: ciphertextController,
                      onChanged: (value) {
                        setState(() {
                          plaintextController.text = decrypt(value, key);
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter Ciphertext for Decryption',
                        focusColor: Colors.black,
                        labelStyle: TextStyle(color: Colors.black),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: Icon(Icons.lock),
                        filled: true,
                        fillColor: Color.fromARGB(180, 245, 245, 245),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      cursorColor: Colors.black,
                      cursorHeight: 18,
                      cursorWidth: 1,
                      controller: plaintextController,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Decrypted Plaintext',
                        focusColor: Colors.black,
                        labelStyle: TextStyle(color: Colors.black),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: Icon(Icons.lock_open),
                        filled: true,
                        fillColor: Color.fromARGB(180, 245, 245, 245),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: showPlayfairTableDialog,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black, // foreground
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('Show Playfair Table'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showPlayfairTableDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Playfair Table'),
          content: SingleChildScrollView(
            child: Column(
              children: table
                  .map((row) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: row
                            .map((letter) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: (letter == 'I' || letter == 'J')
                                      ? Text('I/J',
                                          style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold))
                                      : Text(letter,
                                          style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold)),
                                ))
                            .toList(),
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  void generatePlayfairTable(String key) {
    Set<String> seen = {};
    List<String> keyChars =
        key.split('').where((char) => seen.add(char)).toList();
    String remainingChars = 'ABCDEFGHIKLMNOPQRSTUVWXYZ'
        .split('')
        .where((char) => !seen.contains(char))
        .join('');
    List<String> grid = keyChars + remainingChars.split('');
    table = List.generate(5, (i) => List.generate(5, (j) => grid[i * 5 + j]));
  }

  String encrypt(String plaintext, String key) {
    return _processText(plaintext, key, false);
  }

  String decrypt(String ciphertext, String key) {
    return _processText(ciphertext, key, true);
  }

  String _processText(String text, String key, bool decrypt) {
    text = text
        .toUpperCase()
        .replaceAll(RegExp(r'[^A-Z]'), '')
        .replaceAll('J', 'I');

    List<String> pairs = [];
    for (int i = 0; i < text.length; i += 2) {
      if (i + 1 < text.length) {
        if (text[i] == text[i + 1]) {
          pairs.add(text[i] + 'X');
          i -=
              1; // Adjust index to process next char in the new pair in next iteration
        } else {
          pairs.add(text.substring(i, i + 2));
        }
      } else {
        pairs.add(text[i] + 'X');
      }
    }

    String result = '';
    for (String pair in pairs) {
      String a = pair[0];
      String b = pair[1];

      int aRow = 0, aCol = 0, bRow = 0, bCol = 0;

      for (int row = 0; row < 5; row++) {
        for (int col = 0; col < 5; col++) {
          if (table[row][col] == a) {
            aRow = row;
            aCol = col;
          }
          if (table[row][col] == b) {
            bRow = row;
            bCol = col;
          }
        }
      }

      if (aRow == bRow) {
        if (decrypt) {
          result += table[aRow][(aCol + 4) % 5]; // Move left for decryption
          result += table[bRow][(bCol + 4) % 5];
        } else {
          result += table[aRow][(aCol + 1) % 5]; // Move right for encryption
          result += table[bRow][(bCol + 1) % 5];
        }
      } else if (aCol == bCol) {
        if (decrypt) {
          result += table[(aRow + 4) % 5][aCol]; // Move up for decryption
          result += table[(bRow + 4) % 5][bCol];
        } else {
          result += table[(aRow + 1) % 5][aCol]; // Move down for encryption
          result += table[(bRow + 1) % 5][bCol];
        }
      } else {
        result += table[aRow][bCol];
        result += table[bRow][aCol];
      }
    }

    return result;
  }
}
