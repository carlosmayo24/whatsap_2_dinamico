import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


void main() {
  runApp( MaterialApp
    (
    home: tareaW(),
  ));
}

class tareaW extends StatefulWidget {


  @override
  _tareaWState createState() => _tareaWState();
}

class _tareaWState extends State<tareaW>
{

  List<String> lista_mensajes = [];
  String hora_mensaje = '${DateTime.now().hour}:${DateTime.now().minute} ';
  TextEditingController nombre_controlador= new TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    var deviceData=MediaQuery.of(context).size;
    return
      Scaffold
        (
        appBar:  AppBar
          (

          backgroundColor: Colors.green,
          leading: CircleAvatar
            (
            backgroundImage: NetworkImage('https://www.eluniverso.com/resizer/y4Scc_nzI4QX7pgXMIhZpiIGBkg=/1190x670/smart/filters:quality(70)/cloudfront-us-east-1.images.arcpublishing.com/eluniverso/YKYSZKHYV5FOFJCC3ZFY42ABYE.jpg'),

          ),
          title:
          ListTile
            (
            title: Text('Susi',style: TextStyle(fontSize: 25,color: Colors.white),),
            subtitle: Text('Ult.Vez.hoy a las 9:49',style: TextStyle(fontSize: 15,color: Colors.white),),
          ),
          actions: [Icon(Icons.call),Icon(Icons.attach_file),Icon(Icons.more_vert)],

        ),
        body: Stack
          (
          children:
          [
            Positioned.fill
              (

              child: Image.network
                (
                'https://unageek.com/wp-content/uploads/2020/03/Fondo_pantalla_chat_WA_StarWars_UnaGeek_Claro.jpg'
                ,fit: BoxFit.fill,
              ),
            ),
            Container
              (
              child: Column
                (
                children:
                [

                  Expanded(
                    child: Container
                      (

                      child: ListView
                        (
                        reverse: false,
                        children: add_son(lista_mensajes),

                      ),
                    ),
                  ),

                  Container
                    (
                    height:deviceData.height*.13-28,
                    child: Container
                      (
                        height: 50,
                        child: Row
                          (
                          children:
                          [
                            Expanded
                              (
                                flex: 7,
                                child: Container
                                  (

                                  decoration: BoxDecoration
                                    (
                                      color:  Colors.white,
                                      borderRadius: BorderRadius.only
                                        (
                                        topLeft:  Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      )
                                  ),

                                  child: Row
                                    (

                                    children:
                                    [
                                      Expanded
                                        (
                                          flex: 7,
                                          child: Container
                                            (
                                            width: 60,
                                            height: 45,
                                            child: TextField
                                              (
                                              controller: nombre_controlador,
                                              showCursor: false,
                                              style: TextStyle(fontSize: 20),
                                              decoration: InputDecoration
                                                (
                                                  icon: Icon(Icons.emoji_emotions_outlined,size: 24,),
                                                  hintText: 'Escribe un mensaje',
                                                  floatingLabelBehavior: FloatingLabelBehavior.never
                                                  ,border: InputBorder.none
                                              ),
                                            ),
                                          )
                                      ),
                                      IconButton(onPressed: (){}, icon:Icon(Icons.camera_alt))

                                    ],
                                  ),
                                )
                            ),
                            FloatingActionButton
                              (
                              mini: true,onPressed: ()
                            {
                              setState(()
                              {
                                lista_mensajes.add(nombre_controlador.text);

                              });
                            },
                              child: Icon(Icons.send),backgroundColor: Colors.green,
                            )
                          ],
                        )
                    )
                    ,
                  )

                ],
              ),
            )

          ],
        ) ,
      );

  }

  List<Widget> add_son(List<String> lista_mensajes)
  {
    List<Widget> mensajes=[];
    for(var mensaje in lista_mensajes)
    {
      Widget temp_widget=
      Wrap
        (
        alignment: WrapAlignment.end,
        children:
        [
          Container
            (
              decoration: BoxDecoration
                (
                  color:  Color(0xB670B670),
                  borderRadius: BorderRadius.only
                    (
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20)
                  )
              ),
              padding:EdgeInsets.all(10.0) ,
              margin: EdgeInsets.only(top: 5,right: 5),
              child: Wrap
                (
                  alignment: WrapAlignment.end,
                  spacing: 4,
                  children:
                  [
                    Text(mensaje,style: TextStyle(fontSize: 18),),
                    Padding
                      (
                      padding:  EdgeInsets.only(top: 8.0),
                      child: Text(hora_mensaje,style: TextStyle(fontSize: 13,color: Colors.black54),),
                    ),
                    Icon(Icons.done_all,color: Colors.blueAccent,),
                  ]

              )
          )
        ],
      );

      mensajes.add(temp_widget);
      print('hora'+hora_mensaje);
    }
    return mensajes;
  }
}