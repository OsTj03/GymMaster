import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../core/config/apps_colors.dart';
import 'package:gymmaster/routes.gr.dart';

@RoutePage()
class PantallaScreen extends StatelessWidget {
  const PantallaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'assets/images/gymini.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height:240 ,
          ),
          
          const SizedBox(height: 20),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'bienvenido a GymMaster',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppsColors.primaryAccentColor,
                  ),
                ),
              
                const SizedBox(height: 10),
                
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 1.0,
                  children: <Widget>[
                    _buildSquareButton(context, 'Categoria', Icons.category, () {
                      AutoRouter.of(context).push(const CategoriaRoute());
                    }),
                    _buildSquareButton(context, 'Ventas', Icons.monetization_on, () {
                      AutoRouter.of(context).push(const VentaRoute());
                    }),
                    _buildSquareButton(context, 'Compras', Icons.shopping_cart, () {
                      AutoRouter.of(context).push(const HistorialComprasRoute());
                    }),
                    _buildSquareButton(context, 'Productos', Icons.fitness_center, () {
                      AutoRouter.of(context).push(const ProductoRoute());
                    }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSquareButton(BuildContext context, String title, IconData icon, VoidCallback onPressed) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppsColors.accent, AppsColors.sizedboxcolor.withOpacity(0.9)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 50,
                color: AppsColors.textPrimary,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppsColors.primaryAccentColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}