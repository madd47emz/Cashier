import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  final String title;
  final String sub;
  final double mainFontsize;

  const AccountCard( this.title,this.sub,this.mainFontsize,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),

          ),
          elevation: 16,
          shadowColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: mainFontsize,color: Colors.red),)),
                Center(child: Text(sub,style: TextStyle(color: Colors.red.withOpacity(0.7),fontSize: mainFontsize,),)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
