import 'package:OpticaSl/Menu.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:intl/intl.dart';



 class Gastos extends StatefulWidget {
  Gastos({Key key}) : super(key: key);

  @override
  _GastosState createState() => _GastosState();
}

TextEditingController _textFieldController = TextEditingController();
TextEditingController _textFieldNombre = TextEditingController();
final db = Firestore.instance;
  String id;
int _currentValue = 1;
dynamic  cantidad;
String nombre;

class _GastosState extends State<Gastos> {

  TextFormField buildTextFormFieldCantidad() {
  
    return TextFormField(
                keyboardType: TextInputType.number,
                controller: _textFieldController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Color(0xFF009688)),
                 borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.transparent),
                 borderRadius: BorderRadius.all(Radius.circular(30))
                 ),
                 prefixIcon: Icon(Icons.attach_money),
                 hintText: "Cantidad",
                 filled: true,
                 fillColor: Colors.grey[200]
            ),
             
            );
  }

  TextFormField buildTextFormFieldNombre() {
  
    return TextFormField(
                keyboardType: TextInputType.text,
                controller: _textFieldNombre,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Color(0xFF009688)),
                 borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.transparent),
                 borderRadius: BorderRadius.all(Radius.circular(30))
                 ),
                 prefixIcon: Icon(Icons.person_add),
                 hintText: "Nombre",
                 filled: true,
                 fillColor: Colors.grey[200]
            ),
             
            );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _getCustomAppBar(),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[

          SizedBox(height: 50.0),
          Form(
            
            //key: _riKey1,
            child: buildTextFormFieldNombre(),
          ),
          SizedBox(height: 10.0,),
          Form(
            child: buildTextFormFieldCantidad(),
          ),
           Form(
            
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new NumberPicker.integer(
                
                initialValue: _currentValue,
                minValue: 1,
                maxValue: 10,
                onChanged: (newValue) =>
                    setState(() => _currentValue = newValue)),
            new Text("Sucursal: $_currentValue",style: TextStyle(color: Colors.black),),
          ],
        ),
      
          ),
          SizedBox(height: 50.0),
          ButtonTheme(
                
                minWidth: 250.0,
                height: 50.0,
                child: RaisedButton(
    color: Color(0xFF009688), 
    child: Row( 
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.max, 
    children: <Widget>[
        Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
              "Crear",
              style: TextStyle(
                fontSize: 18, 
                color: Colors.white, 
              ),
          ),
        ),
        Icon(
          Icons.create_new_folder, 
          color: Colors.white,
          size: 20, 
        ),
    ],
    ),
            onPressed: () {
                crateData();                                
            },
),
              ),
        ]
      ),
    );
  }

  _getCustomAppBar(){
  return PreferredSize(
    preferredSize: Size.fromHeight(60),
    child: Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF009688),
            Color(0xFF011579B),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomeScreen()),
  );

        }),
        Text('Gastos', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
        IconButton(icon: Icon(Icons.money_off), onPressed: (){}),
      ],),
    ),
  );
}
void crateData() async
{
      DateTime now = DateTime.now();
      String mes = DateFormat('MMM').format(now);
      int currentPage2 = DateTime.now().day;
      int semana;
      int numerofecha;
      String dia = DateFormat('d').format(now);

      if(currentPage2 >= 1 && currentPage2 <= 7)
      {

        semana = 1;
      }
      
      if(currentPage2 >= 8 && currentPage2 <= 14)
      {
        semana = 2;
      }
      
      if(currentPage2 >= 15 && currentPage2 <= 21)
      {
        semana = 3;
      }
      
      if(currentPage2 >= 22 && currentPage2 > 31)
      {
        semana = 4;
      }
      switch(mes)
      {
        case 'Jan':
            numerofecha = 1;
        break;
        case 'Feb':
            numerofecha = 2;
        break;
        case 'Mar':
            numerofecha = 3;
        break;
        case 'Apr':
            numerofecha = 4;
        break;
        case 'May':
            numerofecha = 5;
        break;
        case 'Jun':
            numerofecha = 6;
        break;
        case 'Jul':
            numerofecha = 7;
        break;
        case 'Aug':
            numerofecha = 8;
        break;
        case 'Sep':
            numerofecha = 9;
        break;
        case 'Oct':
            numerofecha = 10;
        break;
        case 'Nov':
            numerofecha = 11;
        break;
        case 'Dec':
            numerofecha = 12;
        break;
      }


                               nombre = _textFieldNombre.text.toString();
                               cantidad = double.parse(_textFieldController.text);
                               Firestore.instance.collection('Gastos').add({'Nombre': nombre,'Cantidad': cantidad,  'Sucursal': _currentValue, 'Semana': semana, 'Mes': numerofecha, 'Dia': int.parse(dia)});   
                               _textFieldController.text="";
                               _textFieldNombre.text="";
}
}