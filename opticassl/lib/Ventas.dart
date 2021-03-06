import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:intl/intl.dart';
import 'package:OpticaSl/Menu.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:OpticaSl/VentasPendientes.dart';

 class Ventas extends StatefulWidget {
  Ventas({Key key}) : super(key: key);

  @override
  _VentasState createState() => _VentasState();
}
TextEditingController _textFieldController = TextEditingController();
TextEditingController _textApellidos = TextEditingController();
TextEditingController _textTelefono = TextEditingController();
TextEditingController _textGraduacionI = TextEditingController();
TextEditingController _textGraduacionD = TextEditingController();
TextEditingController _textDireccion = TextEditingController();
TextEditingController _textCosto = TextEditingController();
TextEditingController _textCorreo = TextEditingController();
TextEditingController _textCantidad = TextEditingController();
String id;
final db = Firestore.instance;
var selectedCurrency, selectedType;
dynamic cantidadInventario;
String productoInventario;
int cont;
dynamic cantidad;
int _currentValue = 1;

TextFormField buildTextFormFieldNombre() {

     return TextFormField(

                keyboardType: TextInputType.text,
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
                 prefixIcon: Icon(Icons.person),
                 hintText: "Nombre",
                 filled: true,
                 fillColor: Colors.grey[200]
            ),
             
            );
  }

  TextFormField buildTextFormFieldApellidos() {
     return TextFormField(
                keyboardType: TextInputType.text,
                controller: _textApellidos,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Color(0xFF009688)),
                 borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.transparent),
                 borderRadius: BorderRadius.all(Radius.circular(30))
                 ),
                 prefixIcon: Icon(Icons.person),
                 hintText: "Apellidos",
                 filled: true,
                 fillColor: Colors.grey[200]
            ),
             
            );
  }
  TextFormField buildTextFormFieldTelefono() {
     return TextFormField(
                keyboardType: TextInputType.number,
                controller: _textTelefono,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Color(0xFF009688)),
                 borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.transparent),
                 borderRadius: BorderRadius.all(Radius.circular(30))
                 ),
                 prefixIcon: Icon(Icons.phone),
                 hintText: "Teléfono",
                 filled: true,
                 fillColor: Colors.grey[200]
            ),
             
            );
  }
  TextFormField buildTextFormFieldCantidad() {
     return TextFormField(
                keyboardType: TextInputType.number,
                controller: _textCantidad,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Color(0xFF009688)),
                 borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.transparent),
                 borderRadius: BorderRadius.all(Radius.circular(30))
                 ),
                 prefixIcon: Icon(Icons.storage),
                 hintText: "Cantidad",
                 filled: true,
                 fillColor: Colors.grey[200]
            ),
             
            );
  }

  TextFormField buildTextFormFieldGraduacioni() {

     return TextFormField(
                keyboardType: TextInputType.number,
                controller: _textGraduacionI,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Color(0xFF009688)),
                 borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.transparent),
                 borderRadius: BorderRadius.all(Radius.circular(30))
                 ),
                 prefixIcon: Icon(Icons.remove_red_eye),
                 hintText: "Graduación Izq.",
                 filled: true,
                 fillColor: Colors.grey[200]
            ),
             
            );
  }

  TextFormField buildTextFormFieldGraduaciond() {

     return TextFormField(
                keyboardType: TextInputType.number,
                controller: _textGraduacionD,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Color(0xFF009688)),
                 borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.transparent),
                 borderRadius: BorderRadius.all(Radius.circular(30))
                 ),
                 prefixIcon: Icon(Icons.remove_red_eye),
                 hintText: "Graduación Der.",
                 filled: true,
                 fillColor: Colors.grey[200]
            ),
             
            );
  }

  TextFormField buildTextFormFieldDireccion() {

     return TextFormField(
                keyboardType: TextInputType.text,
                controller: _textDireccion,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Color(0xFF009688)),
                 borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.transparent),
                 borderRadius: BorderRadius.all(Radius.circular(30))
                 ),
                 prefixIcon: Icon(Icons.location_on),
                 hintText: "Dirección",
                 filled: true,
                 fillColor: Colors.grey[200]
            ),
             
            );
  }
  TextFormField buildTextFormFieldCosto() {

     return TextFormField(
                keyboardType: TextInputType.number,
                controller: _textCosto,
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
                 hintText: "Costo",
                 filled: true,
                 fillColor: Colors.grey[200]
            ),
             
            );
  }

  TextFormField buildTextFormFieldCorreo() {

     return TextFormField(
                keyboardType: TextInputType.number,
                controller: _textCorreo,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Color(0xFF009688)),
                 borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.transparent),
                 borderRadius: BorderRadius.all(Radius.circular(30))
                 ),
                 prefixIcon: Icon(Icons.mail),
                 hintText: "Correo",
                 filled: true,
                 fillColor: Colors.grey[200]
            ),
             
            );
  }



class _VentasState extends State<Ventas> {

  bool pendiente;
  
  @override
  void initState() {
    pendiente = Global.shared.pendiente;
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black,
      appBar: _getCustomAppBar(), 
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[

          SizedBox(height: 50.0),
          Form(
            child: buildTextFormFieldNombre(),
          ),
          SizedBox(height: 20.0),
          Form(
            child: buildTextFormFieldApellidos(),
          ),
          SizedBox(height: 20.0),
          Form(
            child: buildTextFormFieldCorreo(),
          ),
          SizedBox(height: 20.0,),
          Form(
            child:  ListView(
              scrollDirection: Axis.vertical,
    shrinkWrap: true,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.storage, color: Colors.white),
                    SizedBox(width: 55.0,),
                     StreamBuilder<QuerySnapshot>(
                       
                  stream: db.collection('Inventario').snapshots(),
                  
                  builder: (context, snapshot) {
                    
                    if (!snapshot.hasData)

                      const Text("Loading.....");
                    else {
                      List<DropdownMenuItem> currencyItems = [];
                      for (int i = 0; i < snapshot.data.documents.length; i++) {
                        DocumentSnapshot snap = snapshot.data.documents[i];
                        currencyItems.add(
                          DropdownMenuItem(
                            child: Text(
                              
                              snap.reference.documentID,
                              style: TextStyle(color: Color.fromARGB(255,98,97,97)),
                            ),
                            value: "${snap.documentID}",
                          ),
                        );
                      }return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          
                          
                          DropdownButton(
                            
                            items: currencyItems,
                            onChanged: (currencyValue) {
                              final snackBar = SnackBar(
                                backgroundColor: Colors.black,
                                content: Text(
                                  'Armazón: $currencyValue',
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                              setState(() {
                                selectedCurrency = currencyValue;
                              });
                            },
                            value: selectedCurrency,
                            isExpanded: false,
                            hint: new Text(
                              "Seleccione Armazón",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      );
                    }
                  }),
                  
                  SizedBox(width: 10.0,),
                   
                  SizedBox(width: 10.0,),
                  ],
                  
                ),
                
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Form(
            child: buildTextFormFieldTelefono(),
          ),
          
          SizedBox(height: 20.0,),
          Form(
            child:
            buildTextFormFieldGraduacioni(), 
          ),
          SizedBox(height:20.0,),
          Form(
            child:
            buildTextFormFieldGraduaciond(), 
          ),
          SizedBox(height: 20.0,),
          Form(
            child: buildTextFormFieldDireccion(),
            ),
            SizedBox(height: 20.0,),
          Form(
            child: buildTextFormFieldCosto(),
            ),
            SizedBox(height: 20.0,),
          Form(
            child: buildTextFormFieldCantidad(),
            ),
          SizedBox(height: 20.0,),
          Form(
             child:LiteRollingSwitch(
    //initial value
     
    value: false,
    textOn: 'Contado',
    textOff: 'Credito',
    colorOn: Color(0xFF009688),
    colorOff: Colors.redAccent[700],
    iconOn: Icons.done,
    iconOff: Icons.remove_circle_outline,
    textSize: 16.0,
    
    onChanged: (bool isOn) {
      
            pendiente = isOn;
             Global.shared.pendiente = isOn;
             isOn = isOn;
        print(isOn); 
    },
    
    
), 
          ),
          SizedBox(height: 20.0,),
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
            new Text("Sucursal: $_currentValue",style: TextStyle(color: Colors.white),),
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
              "Generar Venta",
              style: TextStyle(
                fontSize: 18, 
                color: Colors.white, 
              ),
          ),
        ),
        Icon(
          Icons.send, 
          color: Colors.white,
          size: 20, 
        ),
    ],
    ),
            onPressed: () {
               
                if(_textFieldController.text.isEmpty || _textApellidos.text.isEmpty || _textTelefono.text.isEmpty || _textCantidad.text.isEmpty || _textGraduacionI.text.isEmpty|| _textGraduacionD.text.isEmpty || _textDireccion.text.isEmpty || _textCosto.text.isEmpty )
                {

                    return showDialog<void>(
                                                        context: context,
                                                        barrierDismissible: false, // user must tap button!
                                                        builder: (BuildContext context) {
                                                          return AlertDialog(
                                                            title: Text('Llena todos los datos', textAlign: TextAlign.center),
                                                            content: SingleChildScrollView(
                                                              child: ListBody(
                                                                children: <Widget>[
                                                                  Image.asset(
                                                                      "images/wrong.gif",
                                                                      height: 125.0,
                                                                      width: 125.0,
                                                                    )
                                                                ],
                                                              ),
                                                            ),
                                                            actions: <Widget>[
                                                              FlatButton(
                                                                child: Text('Approve'),
                                                                onPressed: () {
                                                                  Navigator.of(context).pop();
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );

                }
                else{
                createData();
                 actualizarInventario();
                 String apellido;
                 apellido = _textApellidos.text;
                 Firestore.instance.collection('NombreClientes').document("$nombre"+"$apellido").setData({'NombreCliente': '$nombre'});
                 _textApellidos.text = "";
                 _textCosto.text = "";
                 _textDireccion.text = "";
                 _textFieldController.text = "";
                 _textGraduacionI.text ="";
                 _textGraduacionD.text="";
                 _textTelefono.text="";
                 _textCantidad.text="";
                 _displayDialog(context);
                }
                
            },
),
              ),
        
        ],
        
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
        Text('Ventas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
        IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){}),
      ],),
    ),
  );
}
void createData() async {
  String nombre, apellido, direccion, correo;
  dynamic graduacioni, telefono, total, saldo, graduaciond;

  nombre = _textFieldController.text;
  apellido = _textApellidos.text;
  direccion = _textDireccion.text;
  correo = _textCorreo.text;
  
  graduacioni = double.parse(_textGraduacionI.text);
  graduaciond = double.parse(_textGraduacionD.text);
  telefono = double.parse(_textTelefono.text);
  total = double.parse(_textCosto.text);
  cantidad = double.parse(_textCantidad.text);
  
      DateTime now = DateTime.now();
      String fecha = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
      String mes = DateFormat('MMM').format(now);
      String dia = DateFormat('d').format(now);
      int numerofecha;
      int currentPage2 = DateTime.now().day;
      int semana;

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
      if(pendiente == false)
      {
        pendiente = true;
        saldo = total;
        DocumentReference ref = await db.collection('VentasSucursal1').add({'Nombre': '$nombre', 'Apellidos': '$apellido','Armazon': selectedCurrency, 'Costo': total = 0, 'Saldo': saldo, 'Fecha': '$fecha', 'Credito': pendiente, 'Mes': numerofecha, 'Semana': semana,'Dia': int.parse(dia), 'GraduacionI': graduacioni,'GraduacionD': graduaciond, 'Telefono': telefono, 'Direccion': direccion, 'Cantidad': cantidad, 'Sucursal': _currentValue, 'Correo': correo});
      setState(() => id = ref.documentID);


      }

      else {
        pendiente = false;
        DocumentReference ref = await db.collection('VentasSucursal1').add({'Nombre': '$nombre', 'Apellidos': '$apellido','Armazon': selectedCurrency, 'Costo': total, 'Fecha': '$fecha', 'Credito': pendiente, 'Mes': numerofecha,'Dia': int.parse(dia),'GraduacionI': graduacioni,'GraduacionD': graduaciond, 'Semana': semana, 'Telefono': telefono, 'Direccion': direccion, 'Cantidad': cantidad, 'Sucursal': _currentValue, 'Correo': correo});
      setState(() => id = ref.documentID); 
      }

      

  
    
  }
   _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Venta Generada'),
            content: SingleChildScrollView(
                                                              child: ListBody(
                                                                children: <Widget>[
                                                                  Image.asset(
                                                                      "images/done.gif",
                                                                      height: 125.0,
                                                                      width: 125.0,
                                                                    )
                                                                ],
                                                              ),
                                                            ),
            
            actions: <Widget>[
              new FlatButton(
                child: new Text('Guardar'),
                onPressed: () {
                 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => VentasPendientes()),
    
  );
                },
              
              )
            ],
          );
        });
  }
   void actualizarInventario() async
 {
   cont = 0;
   db
      .collection("Inventario")
      .where("Nombre", isEqualTo: selectedCurrency)
      .snapshots()
      .listen((result) {
    result.documents.forEach((result) {
      productoInventario = result.data['Cantidad'].toString();
      cantidadInventario = double.parse(productoInventario);
   if(pendiente==true)
   {
     cantidadInventario -= cantidad;
     cont++;
     if(cont == 1)
     {
         db.collection('Inventario').document('$selectedCurrency').updateData({'Cantidad': cantidadInventario});
     }
   }
   else
   {
    cantidadInventario -= cantidad;
     cont++;
     if(cont == 1)
     {
         db.collection('Inventario').document('$selectedCurrency').updateData({'Cantidad': cantidadInventario});
     }
   }
    });
  });
  
 }
 
}

class Global{
  static final shared =Global();
  bool pendiente = false;
}