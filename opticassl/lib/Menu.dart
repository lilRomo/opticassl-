import 'package:OpticaSl/AgendasActuales.dart';
import 'package:OpticaSl/Gastos.dart';
import 'package:OpticaSl/MenuGrafica.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:OpticaSl/HistorialClientes.dart';
import 'package:OpticaSl/HistorialCobranzas.dart';
import 'package:OpticaSl/Inventario.dart';
import 'Meta/Grafica_Meta.dart';
import 'package:OpticaSl/VentasPendientes.dart';






 class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

bool _debugLocked = false;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    assert(!_debugLocked);
    
    // to get size
    var size = MediaQuery.of(context).size;
    // style
    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        
        color: Color.fromRGBO(63, 63, 63, 1));

        return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(

        
        
        children: <Widget>[
         
         

          Container(
            height: size.height * .3,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),

             gradient: new LinearGradient(colors: [const Color(0xFF009688), const Color(0xFF4B3DFDB)],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                stops: [0.0,1.0],
                tileMode: TileMode.clamp
                
             
             
             )
            ),
          ),
           
          
          SafeArea(
            
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 84,
                    margin: EdgeInsets.only(bottom: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        
                        CircleAvatar(

                          radius: 42,
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage(
                            
                              'assets/pp1.png'),
                              child: Visibility( 
                              child: IconButton( icon: Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomeScreen()),
    
  );

        }),
        maintainInteractivity: true,
        maintainSize: true, 
  maintainAnimation: true,
        maintainState: true,
        visible: false,
        ),   
                        ),
                        SizedBox(
                          width: 16,
                        ),
                       
                      ],
                    ),
                  ),
                  Expanded(
                    
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        
                        Card(
                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                          child: RaisedButton(
                              shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                            color: Color(0xFF009688),
                            
                            child: Ink.image(image: AssetImage('images/meta.png'), height: 100, alignment: Alignment.center, 
                           ) , 

                            
                             onPressed: (){
                               
                               Route route = MaterialPageRoute(builder: (bc) => Meta());
                               Navigator.of(context).push(route);
                             },
                            ),

                           
                          
                        ),

                        Card(
                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                          child: RaisedButton(
                              shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                            color: Color(0xFF009688),
                            
                            child: Ink.image(image: AssetImage('images/pendientes.png'), height: 100, alignment: Alignment.center, 
                           ) , 

                            
                             onPressed: (){
                               
                               Route route = MaterialPageRoute(builder: (bc) => VentasPendientes());
                               Navigator.of(context).push(route);
                              
                             },
                            ),

                           
                          
                        ),

                        Card(
                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                          child: RaisedButton(
                              shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                            color: Color(0xFF009688),
                            
                            child: Ink.image(image: AssetImage('images/historial.png'), height: 100, alignment: Alignment.center, 
                           ) , 

                            
                             onPressed: (){
                               
                               Route route = MaterialPageRoute(builder: (bc) => HistorialClientes());
                               Navigator.of(context).push(route);
                              
                             },
                            ),

                           
                          
                        ),

                        Card(
                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                          child: RaisedButton(
                              shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                            color: Color(0xFF009688),
                            
                            child: Ink.image(image: AssetImage('images/inventario.png'), height: 100, alignment: Alignment.center, 
                           ) , 

                            
                             onPressed: (){
                               
                               Route route = MaterialPageRoute(builder: (bc) => Inventario());
                               Navigator.of(context).push(route);
                              
                             },
                            ),

                           
                          
                        ),
                        Card(
                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                          child: RaisedButton(
                              shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                            color: Color(0xFF009688),
                            
                            child: Ink.image(image: AssetImage('images/stat.png'), height: 100, alignment: Alignment.center, 
                           ) , 

                            
                             onPressed: (){
                               
                               Route route = MaterialPageRoute(builder: (bc) => MenuGraficas());
                               Navigator.of(context).push(route);
                              
                             },
                            ),

                           
                          
                        ),

                        Card(
                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                          child: RaisedButton(
                              shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                            color: Color(0xFF009688),
                            
                            child: Ink.image(image: AssetImage('images/citas.png'), height: 100, alignment: Alignment.center, 
                           ) , 

                            
                             onPressed: (){
                               
                               Route route = MaterialPageRoute(builder: (bc) => AgendasActuales());
                               Navigator.of(context).push(route);
                              
                             },
                            ),

                        ),

                        Card(
                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                          child: RaisedButton(
                              shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                            color: Color(0xFF009688),
                            
                            child: Ink.image(image: AssetImage('images/cobranza.png'), height: 100, alignment: Alignment.center, 
                           ) , 

                            
                             onPressed: (){
                               
                               Route route = MaterialPageRoute(builder: (bc) => HistorialCobranzas());
                               Navigator.of(context).push(route);
                              
                             },
                            ),

                        ),

                        Card(
                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                          child: RaisedButton(
                              shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation: 4,
                            color: Color(0xFF009688),
                            
                            child: Ink.image(image: AssetImage('images/gastos.png'), height: 100, alignment: Alignment.center, 
                           ) , 

                            
                             onPressed: (){
                               
                               Route route = MaterialPageRoute(builder: (bc) => Gastos());
                               Navigator.of(context).push(route);
                              
                             },
                            ),

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
    );
  }
}