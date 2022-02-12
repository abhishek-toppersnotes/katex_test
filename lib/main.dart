import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart' as flutterMathFork;
import 'package:flutter_tex/flutter_tex.dart';
import 'package:flutter_tex_js/flutter_tex_js.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: test10(),
        ),
      ),
    );
  }

  // flutter_tex

  // test 1 (Fail)
  Widget test1() {
    return TeXView(
      child: TeXViewDocument(
          r"What is the value of\n\\( \\left[\\frac{12}{(\\sqrt{5}+\\sqrt{3})}+\\frac{18}{(\\sqrt{5}-\\sqrt{3})}\\right] ? \\)"),
    );
  }

  // test 2 (Fail)
  Widget test2() {
    return TeXView(
      child: TeXViewDocument(laticCode(
          "What is the value of\n\\( \\left[\\frac{12}{(\\sqrt{5}+\\sqrt{3})}+\\frac{18}{(\\sqrt{5}-\\sqrt{3})}\\right] ? \\)")),
    );
  }

  // test 3 (Somewhat working)
  Widget test3() {
    return TeXView(
      child: TeXViewDocument(laticCode(
          r"What is the value of\n\\( \\left[\\frac{12}{(\\sqrt{5}+\\sqrt{3})}+\\frac{18}{(\\sqrt{5}-\\sqrt{3})}\\right] ? \\)")),
    );
  }

  // flutter_tex_js

  // test 4 (FAIL)
  Widget test4() {
    return TexImage(
        r"What is the value of\n\\( \\left[\\frac{12}{(\\sqrt{5}+\\sqrt{3})}+\\frac{18}{(\\sqrt{5}-\\sqrt{3})}\\right] ? \\)");
  }

  // test 5 (FAIL)
  Widget test5() {
    return TexImage(laticCode(
        r"What is the value of\n\\( \\left[\\frac{12}{(\\sqrt{5}+\\sqrt{3})}+\\frac{18}{(\\sqrt{5}-\\sqrt{3})}\\right] ? \\)"));
  }

  // test 6 (FAIL)
  Widget test6() {
    return TexImage(laticCode(
        "What is the value of\n\\( \\left[\\frac{12}{(\\sqrt{5}+\\sqrt{3})}+\\frac{18}{(\\sqrt{5}-\\sqrt{3})}\\right] ? \\)"));
  }

  // flutter_math_fork

  // test 7 (fail)
  Widget test7() {
    return flutterMathFork.Math.tex(
        r"What is the value of\n\\( \\left[\\frac{12}{(\\sqrt{5}+\\sqrt{3})}+\\frac{18}{(\\sqrt{5}-\\sqrt{3})}\\right] ? \\)");
  }

  // test 8 (fail)
  Widget test8() {
    return flutterMathFork.Math.tex(laticCode(
        r"What is the value of\n\\( \\left[\\frac{12}{(\\sqrt{5}+\\sqrt{3})}+\\frac{18}{(\\sqrt{5}-\\sqrt{3})}\\right] ? \\)"));
  }

  // test 9 (fail)
  Widget test9() {
    return flutterMathFork.Math.tex(laticCode(
        "What is the value of\n\\( \\left[\\frac{12}{(\\sqrt{5}+\\sqrt{3})}+\\frac{18}{(\\sqrt{5}-\\sqrt{3})}\\right] ? \\)"));
  }

  // Other tries (not using our api data format)

  // test10
  Widget test10() {
    return flutterMathFork.Math.tex(r"\frac {\sqrt ab} b");
  }

  // test11
  Widget test11() {
    return TexImage(r"r'a=\pm\sqrt{b^2+c^2} \int_\infty^\beta d\gamma");
  }

  // test12
  Widget test12() {
    return TeXView(
      child: TeXViewDocument(r"""<p>                                
                       When \(a \ne 0 \), there are two solutions to \(ax^2 + bx + c = 0\) and they are
                       $$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$</p>"""),
    );
  }

  static String laticCode(String input) {
    print(input);
    return input
        .replaceAll("\\\\\n&", r"$''$")
        .replaceAll("\\\\", r"$''$")
        .replaceAll("\\(", r"$")
        .replaceAll("\\)", r"$")
        .replaceAll("\\mathrm", "")
        .replaceAll("\\left", "")
        .replaceAll("\\right", "")
        .replaceAll(r"$\\", "")
        .replaceAll(r"\\", "")
        .replaceAll(
            RegExp(
              r'((https?:\/\/)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,4}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*))',
              caseSensitive: false,
              dotAll: true,
            ),
            "")
        .replaceAll("<img src=", "")
        .replaceAll("''>", " ")
        .replaceAll(r"$$", "")
        .replaceAll(r"''", "")
        .replaceAll("\\begin{aligned}", "")
        .replaceAll("\\end{aligned}", "")
        .replaceAll("\n&", "")
        .replaceAll(r"\underline", r"")
        .replaceAll("\\,", r",")
        .replaceAll("\\quad", r"")
        .replaceAll("\\mathcal", r"")
        .replaceAll("\\begin", r"")
        .replaceAll("\\end", r"")
        .replaceAll("\\mathbf", r"")
        .replaceAll("\\overline", r"")
        .replaceAll("\\cdots", r"")
        .replaceAll("\\hline", r"")
        .replaceAll("\\operatorname", r"");
  }
}
