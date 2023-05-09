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
        title: Text('SUPERDATADO'),
      ),
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: (){}, child: Text('Subir Documentos')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: (){}, child: Text('Creacion de Codigo')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: (){},child: Text('Mi Cuenta')),
                )
              ],
            ),

          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: Column(
                children: [
                  Text('Knowledge Center',style: TextStyle(color: Colors.white),),

                  Container(
                    color: Colors.black,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controladorPregunta,
                              style: TextStyle(backgroundColor: Colors.black38,
                              color: Colors.white),
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(onPressed: (){
                              listaPreguntas.add(controladorPregunta.value.text);
                              print(listaPreguntas);
                            }, child: Text('Pregunta')),
                          )
                        ],
                      )),
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
                          Text('Agrega un excel o csv', style: TextStyle(
                              color: Colors.white
                          ),),
                          Icon(Icons.file_upload,color: Colors.white,)
                        ],
                      ),),
                      Container(child:
                      Column(
                        children: [
                          Text('Agrega un excel o csv', style: TextStyle(
                              color: Colors.white
                          ),),
                          Icon(Icons.file_upload,color: Colors.white,)
                        ],
                      ),)
                    ],
                  ),
                  Expanded(
                    child: ListView(
                        children:
                        listaPreguntas.map((e) => Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
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
                        )).toList()
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
