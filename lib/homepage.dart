import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
   @override
   State<Homepage> createState() => _HomepageState();
    }

class _HomepageState extends State<Homepage> {
    final _controller=TextEditingController();
    String _result='';
    String _selectedConversion = "USD to LBP";
    bool _roundResult = false;
    @override
    Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
    appBar: AppBar(
    title:
    const Text(
          "Unit Converter",
           style:TextStyle(
           fontSize: 30.0,
           fontWeight: FontWeight.bold,
           fontStyle: FontStyle.italic,
           color: Colors.black

           ),
           ),
          backgroundColor: Colors.green,
          centerTitle: true,
           ),
      body: Column(
         children: <Widget>[
         const SizedBox(height: 15.0),
         const Padding(padding:
          EdgeInsets.only(left: 10.0),

         child:  Text(
               "Select conversation type :",
                 style: TextStyle(
                 fontSize: 30.0,
                 fontStyle: FontStyle.italic,
                  color: Colors.black,
                  fontWeight: FontWeight.bold

                     )
                     )
                     ),
                        Padding(padding:
                        const EdgeInsets.all(15),
                        child:DropdownButton<String>(
                        value:  _selectedConversion,
                        onChanged: (String? newValue) {
                        setState(() {
                        _selectedConversion=newValue!;
                        //_result:'';
                      }
                      );
                      },
                          items: <String>['USD to LBP','USD to Euro','LBP to USD']
                              .map <DropdownMenuItem<String>>((String value){
                              return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                              value,
                              style:const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                                color: Colors.black
                          )
                          )
                          );
                          }
                          ).toList()
                      )
                      ),
                   Padding(
                         padding:
                         const  EdgeInsets.all(15),
                         child: TextField(
                              decoration:InputDecoration(
                              hintText: "Enter a number",
                              border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                                ),
                                  focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(width: 3.0, color: Colors.green), // Border when focused
                                ),
                                ),
                                  maxLength: 10,
                                  keyboardType: TextInputType.number,
                                  controller: _controller,
                                  style:const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                )
                                )
                                ),
           Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Checkbox(
                     value: _roundResult,
                     onChanged: (bool? value) {
                     setState(() {
                     _roundResult = value!;
                   }
                   );
                   }
                   ),
                  const Text(
                  "Round off result",
                   style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                 )
                 )
                 ]
                 ),

                   ElevatedButton(onPressed: (){
                      if(_controller.text.isEmpty||double.tryParse(_controller.text)
                      ==null){
                      setState(() {
                      _result=" please enter a valid number";
                    }
                    );
                      return;
                    }
                    setState(() {
                    double input=  double.tryParse(_controller.text)?? 0.0;
                    double result;
                    if(_selectedConversion=="USD to LBP"){
                           result = input * 89500;
                          _result = _roundResult
                          ? '${result.round()} LBP'
                          : '${result.toStringAsFixed(2)} LBP';

                    }
                    else if(_selectedConversion=="USD to Euro"){
                          result = input * 0.95515;
                          _result = _roundResult
                          ? '${result.round()} Euro'
                          : '${result.toStringAsFixed(2)} Euro';
                    }
                    else if  (_selectedConversion=="LBP to USD")
                  {
                        result = input / 89500;
                        _result = _roundResult
                        ? '${result.round()} USD'
                        : '${result.toStringAsFixed(2)} USD';
                    }
                    }
                    );
                    },
                     style: TextButton.styleFrom(
                     backgroundColor:Colors.green
                   ),
                 child:const Text(
                     "convert",
                      style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                      fontStyle: FontStyle.italic
                   )
                   )
                   ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  Text(
                        _result,
                        style:const TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                    )
                    ),
                  const SizedBox(height: 40),
                  TextButton.icon(
                  onPressed: (){
                  setState(() {
                  _controller.clear();
                  _result='';
                }
                );
                },

                  icon: Icon(Icons.delete,
                  color:Colors.black
                ),

                 label:const Text(
                     "Clear",
                      style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      letterSpacing: 1.2,
                      fontStyle: FontStyle.italic
                    )
                    ),

        style:TextButton.styleFrom(
        backgroundColor:Colors.red[800],
              )
              )
              ]
              )
              );
              }
              }
