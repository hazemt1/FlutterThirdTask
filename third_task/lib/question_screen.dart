import 'package:flutter/material.dart';
import 'package:third_task/result_screen.dart';

import 'model/quiz.dart';

class QuestionScreen extends StatefulWidget {
  final int index;
  int result;
  QuestionScreen({this.index, this.result});

  @override
  _State createState() => _State();
}

class _State extends State<QuestionScreen> {
  Quiz quiz = Quiz();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                quiz.quiz[widget.index].question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      if (quiz.quiz[widget.index].answer == true) {
                        widget.result++;
                      }
                      if(quiz.quiz.length==widget.index+1){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                length: widget.index+1,
                                result: widget.result,
                              )),
                        );
                      }
                      else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  QuestionScreen(
                                    index: widget.index + 1,
                                    result: widget.result,
                                  )),
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Center(
                        child: Text(
                          'True',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      if (quiz.quiz[widget.index].answer == false) {
                        widget.result++;
                      }
                      if(quiz.quiz.length==widget.index+1){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                length: widget.index+1,
                                result: widget.result,
                              )),
                        );
                      }
                      else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  QuestionScreen(
                                    index: widget.index + 1,
                                    result: widget.result,
                                  )),
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Center(
                        child: Text(
                          'False',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
