import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.texto,
    this.icon,
    this.subtitulo,
    this.sideIcon,
    this.ontap
  });

  final String texto;
  final IconData? icon;
  final String? subtitulo;
  final IconData? sideIcon;
  final void Function()? ontap;

  static final estiloTexto = TextStyle(fontWeight: FontWeight.bold);
  static final estiloSub = TextStyle(fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        texto,
        style: estiloTexto,
      ),
      subtitle: subtitle(subtitulo: subtitulo),
      leading: icon != null ? Icon(icon) : null,
      trailing: sideIcon != null ? Icon(sideIcon) : null,
      onTap: ontap,
    );
  }

  Widget? subtitle({subtitulo}){
    if(subtitulo != null){
      return Text(subtitulo, style: estiloSub);
    }
    return null;
  }
}
