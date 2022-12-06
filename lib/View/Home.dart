import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:langories/View/Detail.dart';
import 'package:langories/model/Product.dart';

import '../Configure/config.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}




class _HomeState extends State<Home> {
 //List<Text> dataTabs =[];

Widget GetGrid(List<Product> data){
  return Padding(
            padding: EdgeInsets.only(top: 10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.5,
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 10),
              itemCount: data.length ,
              itemBuilder: (context, index) {
               return GETCARD(data[index].title, data[index].image!, data[index].price , data[index].description);
                
                
              }),
          );
}
Widget GETCARD(String? title , String? image , double? price , String? description){
   return Card(
      elevation: 10,
                  child: Column(
                    children: [
                      Expanded(child: Center(child: Text("${title}",style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),))),
                      Expanded(
                        flex: 3,
                        child: Image.network(image! ,
                        fit: BoxFit.contain,
                        loadingBuilder: (context, child, loadingProgress) {
                          if(loadingProgress==null) return child;
                          return Center(
                      child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 30, 36, 50),
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                        },
                        )),
                      Expanded(child: Text("\$$price",style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold)))
                     ,MaterialButton(onPressed: (() {
                      print("Images = $image");
                      Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) =>  Detail(image: image,description: description,)),
                       );
                    }),
                    textColor: Color.fromARGB(216, 255, 223, 219),
                    child: Text("Detail"),
                    color: Color.fromRGBO(6, 28, 53, 0.959),),
                    ],
                   
                  ),
   );
}


Config config = Config();
  //  void getAllCategories() async{
  //    Set<String> set =await config.getCategories();
  //      set.forEach((element) {
  //       Text text = Text("$element",style: TextStyle(
  //           fontSize: 15,
  //           color: Colors.blue[500],
  //         )
  //         );
  //         dataTabs.add(text);
  //      });
  //  } 

  @override
  Widget build(BuildContext context) {
     

    // Future<List<Text>> GeneratDataTabs() async {
    //   
    //    Set<String> set =await config.getCategories();
    //    set.forEach((element) {
    //     Text text = Text("$element",style: TextStyle(
    //         fontSize: 15,
    //         color: Colors.blue[500],
    //       )
    //       );
    //       dataTabs.add(text);
    //    });
    //    return dataTabs;
    //  }
   
    Widget? bottoms = const TabBar(
      indicatorColor: Color.fromARGB(255, 125, 141, 179),
      tabs: [
         Text("men's clothing",style: TextStyle(
            fontSize: 15,
            color: Color.fromARGB(216, 255, 223, 219),
          )
         ),
         Text("jewelery",style: TextStyle(
            fontSize: 15,
            color: Color.fromARGB(216, 255, 223, 219),
          )
         ),
         Text("electronics",style: TextStyle(
            fontSize: 15,
            color: Color.fromARGB(216, 255, 223, 219),
          )
         ),
         Text("women's clothing",style: TextStyle(
            fontSize: 15,
            color: Color.fromARGB(216, 255, 223, 219),
          )
         ),



    ]);
    List<Widget> products = [
      FutureBuilder<List<Product>>(
      future: config.getAllProducts("men's clothing"),
      builder: (context,AsyncSnapshot<List<Product>> snapshot) 
       {
        if(snapshot.hasData)
        {
          return GetGrid(snapshot.data!);
          
        }else{
          return const Center(child: CircularProgressIndicator(color: Color.fromARGB(216, 255, 223, 219),));
        }
      }
       
    ),FutureBuilder<List<Product>>(
      future: config.getAllProducts("jewelery"),
      builder: (context,AsyncSnapshot<List<Product>> snapshot) 
       {
        if(snapshot.hasData)
        {
          return GetGrid(snapshot.data!);
          
        }else{
          return const Center(child: CircularProgressIndicator(color: Color.fromARGB(216, 255, 223, 219),));
        }
      }
       
    ),FutureBuilder<List<Product>>(
      future: config.getAllProducts("electronics"),
      builder: (context,AsyncSnapshot<List<Product>> snapshot) 
       {
        if(snapshot.hasData)
        {
          return GetGrid(snapshot.data!);
          
        }else{
          return const Center(child: CircularProgressIndicator(color: Color.fromARGB(216, 255, 223, 219),));
        }
      }
       
    ),FutureBuilder<List<Product>>(
      future: config.getAllProducts("women's clothing"),
      builder: (context,AsyncSnapshot<List<Product>> snapshot) 
       {
        if(snapshot.hasData)
        {
          return GetGrid(snapshot.data!);
          
        }else{
          return const Center(child: CircularProgressIndicator(color: Color.fromARGB(216, 255, 223, 219),));
        }
      }
       
    ),

    
    ];

    // FutureBuilder<List<Widget>>? bottoms = FutureBuilder<List<Widget>>(
    //       future: GeneratDataTabs(),
    //       builder: (context,AsyncSnapshot<List<Widget>> snapshot) {
    //         if(snapshot.hasData)
    //         {return TabBar(tabs: 
    //                  snapshot.data!  
    //         );
    //         }
    //         else{
    //           return Center(child: CircularProgressIndicator());
    //         }
          
          
    //     },);
        
        
        
    return DefaultTabController(
      
      length: 4,
      child: Scaffold(
        backgroundColor:Color.fromARGB(108, 30, 36, 50) ,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(300),
          child: AppBar(
            
            bottom: bottoms as PreferredSizeWidget?,
            actions: [
              const Spacer(),
              const Icon(
                Icons.search,
                color: Color.fromARGB(216, 255, 223, 219),
              ),
              const Spacer(),
              const Icon(
                Icons.favorite,
                color: Color.fromARGB(216, 255, 223, 219),
              ),
              const Spacer(),
              const Icon(
                Icons.autorenew,
                color: Color.fromARGB(216, 255, 223, 219)
              ),
              const Spacer(),
              const Icon(Icons.shopping_cart, color: Color.fromARGB(216, 255, 223, 219)),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  "login/register",
                  style: TextStyle(
                      color: Color.fromARGB(216, 255, 223, 219), fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer()
            ],
            flexibleSpace: Container(
                margin: const EdgeInsets.only(top: 50),   
                child: Image.asset(
                  "images/logo.png",
                   fit: BoxFit.fill,
                ),

              ),
            
            // ignore: prefer_const_constructors
            backgroundColor: Color.fromARGB(255, 30, 36, 50),
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Color.fromARGB(255, 30, 36, 50),
            ),
            
            
          ),
        ),
        body:TabBarView(children: [
          products.elementAt(0),
          products.elementAt(1),
          products.elementAt(2),
          products.elementAt(3),
        ]) 
      ),
    );
  }
}
