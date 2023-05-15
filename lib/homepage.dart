import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controladorPregunta= TextEditingController(text: 'Haz aqui tu pregunta');
  List<String> listaPreguntas = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SUPERDATADO',style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Row(
        children: [
          Container(
            color: Color.fromRGBO(25, 22, 22, 0.8),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BotonSidePanel(nombre: 'Subir Documentos',),
                BotonSidePanel(nombre: 'Creacion de Codigo'),
                BotonSidePanel(nombre:'Mi Cuenta')
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: Column(
                children: [
                  Text('Knowledge Center',style: TextStyle(
                      color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15,),

                  Container(
                    width: MediaQuery.of(context).size.width*0.6,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(15)
                              ),
                              margin: EdgeInsets.only(right:15),
                              child: TextFormField(
                                showCursor: true,
                                autofocus: false,
                                decoration:  InputDecoration(
                                  labelText: 'Haz tu pregunta',
                                  fillColor: Colors.black12,
                                  enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  disabledBorder: UnderlineInputBorder(),
                                  border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  contentPadding: EdgeInsets.only(left: 30)
                                ),
                                cursorColor: Colors.white,
                                maxLines: 2,
                                controller: controladorPregunta,
                                style: TextStyle(

                                color: Colors.white),
                              ),
                            ),
                            flex: 6,
                          ),
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(onPressed: (){
                              setState(() {
                                listaPreguntas.add(controladorPregunta.value.text);
                              });
                              }, child: Text('Pregunta')),
                          )
                        ],
                      )),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(child:
                        Column(
                          children: [
                            Text('Agrega un excel o csv', style: TextStyle(
                              color: Colors.white
                            ),),
                            Icon(Icons.file_upload,color: Colors.white,)
                          ],
                        ),),
                      Container(child:
                      Column(
                        children: [
                          Text('Descarga Archivo', style: TextStyle(
                              color: Colors.white
                          ),),
                          Icon(Icons.file_download,color: Colors.white,)
                        ],
                      ),),
                      Container(child:
                      Column(
                        children: [
                          Text('Eliminar Conversacion', style: TextStyle(
                              color: Colors.white
                          ),),
                          Icon(Icons.delete_outline,color: Colors.white,)
                        ],
                      ),)
                    ],
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left:20, top: 10),
                      color: Color.fromRGBO(240, 240, 240, 0.14),
                      child: ListView(
                          children:
                          listaPreguntas.map((e) { return

                            Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.5,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: (Text(e,style: TextStyle(

                                      backgroundColor: Colors.white
                                    ),)),
                                  ),
                                ),
                              ),
                            ],
    );}).toList()
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}

class BotonSidePanel extends StatelessWidget {
  final String nombre;
  final String route;
  const BotonSidePanel({
    super.key,
    this.nombre='',
    this.route = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(

        width: MediaQuery.of(context).size.width*0.15,
          child: ElevatedButton(
              onPressed: (){}, child: Text(nombre))),
    );
  }
}
