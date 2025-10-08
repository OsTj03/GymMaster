import 'package:flutter/material.dart';
import '../data/models/listaproductos.dart';
import '../apps_colors.dart';

class vistaproducto extends StatelessWidget {
  const vistaproducto({
    super.key,
    required this.item,
  });
  final listadeproducto item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () {},
        child: Container (
          color: AppsColors.primaryAccentColor, 
          padding: const EdgeInsets.symmetric(vertical:12, horizontal: 16 ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container( 
                  color: AppsColors.accent, 
                  width: 72,
                  height: 72,
                  child: Image.asset(item.imagen),
                ),
              ),
              Expanded(
                child:Padding(
                  padding: const EdgeInsets.only( left:20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.nombre,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppsColors.accent, 
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsets.only( top:4,),
                        child: Text(
                          item.descripcion,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppsColors.accent, 
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        )
                    ]
                  ),
                  )
              ),
              Row(
                mainAxisSize: MainAxisSize.min, 
                children: [
                  Text(
                    '${item.precio} NIO',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppsColors.accent, 
                    ),
                  ),
                ]
                
              )
            ],
          ),
        ),
      ),
    );
  }
}
