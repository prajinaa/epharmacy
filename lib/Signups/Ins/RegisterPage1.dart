
import 'package:flutter/material.dart';

class RegisterPage1 extends StatelessWidget {
  const RegisterPage1({ Key? key }) : super(key: key);
  static const String routeName = '/RegisterPage1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
  appBar:PreferredSize(
          preferredSize: Size.fromHeight(70.0), // here the desired height
          child: AppBar(
  title: new Padding(
      padding: const EdgeInsets.only(left: 200.0),
      child: new Text("Luveen",  style: TextStyle(fontStyle: FontStyle.normal,fontSize: 30.0, color: Colors.white),),
  

    ),

  automaticallyImplyLeading: true,
),
  ),
  body: Padding(padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 25.0),
  child: Column(children: [
         const Text(
  "Enter your details:",
  style: TextStyle(fontStyle: FontStyle.normal,fontSize: 25,color: Colors.black54
        ),
),
         const SizedBox(
                height: 30
            
                    
              ),
              
        
         Padding(
                padding: const EdgeInsets.all(0.0),
                child: SizedBox(
                  width: 350,
                  height: 45,
                  child: 
                  TextField(  
                      obscureText: false,  
                      decoration: InputDecoration(  
                        border: OutlineInputBorder(),  
                        labelText: 'First name',  
                       
                      ),  
                    ), ),),
              const SizedBox(
                height: 15
            
                    
              ),
             
         Padding(
                padding: const EdgeInsets.all(0.0),
                child: SizedBox(
                  width: 350,
                  height: 45,
                  child: 
                  TextField(  
                      obscureText: false,  
                      decoration: InputDecoration(  
                        border: OutlineInputBorder(),  
                        labelText: 'Last name',  
                       
                      ),  
                    ), ),),
              const SizedBox(
                height: 15
            
                    
              ),
             
         Padding(
                padding: const EdgeInsets.all(0.0),
                child: SizedBox(
                  width: 350,
                  height: 45,
                  child: 
                  TextField(  
                      obscureText: false,  
                      decoration: InputDecoration(  
                        border: OutlineInputBorder(),  
                        labelText: 'Age',  
                       
                      ),  
                    ), ),),
              const SizedBox(
                height: 15
            
                    
              ),
              
         Padding(
                padding: const EdgeInsets.all(0.0),
                child: SizedBox(
                  width: 350,
                  height: 45,
                  child: 
                  TextField(  
                      obscureText: false,  
                      decoration: InputDecoration(  
                        border: OutlineInputBorder(),  
                        labelText: 'Address',  
                       
                      ),  
                    ), ),),
              const SizedBox(
                height: 15
            
                    
              ),
              
         Padding(
                padding: const EdgeInsets.all(0.0),
                child: SizedBox(
                  width: 350,
                  height: 45,
                  child: 
                  TextField(  
                      obscureText: false,  
                      decoration: InputDecoration(  
                        border: OutlineInputBorder(),  
                        labelText: 'Phone number',  
                       
                      ),  
                    ), ),),
              const SizedBox(
                height: 15
            
                    
              ),
             
         Padding(
                padding: const EdgeInsets.all(0.0),
                child: SizedBox(
                  width: 350,
                  height: 45,
                  child: 
                  TextField(  
                      obscureText: false,  
                      decoration: InputDecoration(  
                        border: OutlineInputBorder(),  
                        labelText: 'Gender', 
                       
                      ),  
                    ), ),),
              const SizedBox(
                height: 15
            
                    
              ),
              
              
  ],)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: const Icon(Icons.check)
      ),
      //BUTTON LOCATION
      
);

}
}

