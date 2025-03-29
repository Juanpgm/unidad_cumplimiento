import 'dart:math'; // Importa dart:math para generar números aleatorios
import 'package:unidad_cumplimiento/src/datos_proceso.dart'; // Importa datos_proceso.dart para usar la lista "organismos"

final Random random = Random();

final List<Map<String, String>> usuarios = [
  {
    'nombre': 'Juan Pérez',
    'userImagen': 'https://randomuser.me/api/portraits/men/1.jpg',
    'estado': 'Activo',
    'profesion': 'Ingeniero',
    'correoElectronico': 'juan.perez@example.com',
    'celular': '3001234567',
    'organismo': organismos[random.nextInt(organismos.length)], // Asigna un organismo aleatorio
  },
  {
    'nombre': 'María García',
    'userImagen': 'https://randomuser.me/api/portraits/women/1.jpg',
    'estado': 'Inactivo',
    'profesion': 'Doctora',
    'correoElectronico': 'maria.garcia@example.com',
    'celular': '3012345678',
    'organismo': organismos[random.nextInt(organismos.length)], // Asigna un organismo aleatorio
  },
  {
    'nombre': 'Carlos López',
    'userImagen': 'https://randomuser.me/api/portraits/men/2.jpg',
    'estado': 'Activo',
    'profesion': 'Abogado',
    'correoElectronico': 'carlos.lopez@example.com',
    'celular': '3023456789',
    'organismo': organismos[random.nextInt(organismos.length)], // Asigna un organismo aleatorio
  },
  {
    'nombre': 'José González',
    'userImagen': 'https://randomuser.me/api/portraits/men/4.jpg',
    'estado': 'Activo',
    'profesion': 'Contador',
    'correoElectronico': 'jose.gonzalez@example.com',
    'celular': '3034567890',
    'organismo': organismos[random.nextInt(organismos.length)], // Asigna un organismo aleatorio
  },
  {
    'nombre': 'Marta Sánchez',
    'userImagen': 'https://randomuser.me/api/portraits/women/4.jpg',
    'estado': 'Inactivo',
    'profesion': 'Psicóloga',
    'correoElectronico': 'marta.sanchez@example.com',
    'celular': '3045678901',
    'organismo': organismos[random.nextInt(organismos.length)], // Asigna un organismo aleatorio
  },
  {
    'nombre': 'David Ramírez',
    'userImagen': 'https://randomuser.me/api/portraits/men/5.jpg',
    'estado': 'Activo',
    'profesion': 'Desarrollador',
    'correoElectronico': 'david.ramirez@example.com',
    'celular': '3056789012',
    'organismo': organismos[random.nextInt(organismos.length)], // Asigna un organismo aleatorio
  },
  {
    'nombre': 'Sara Torres',
    'userImagen': 'https://randomuser.me/api/portraits/women/5.jpg',
    'estado': 'Inactivo',
    'profesion': 'Diseñadora',
    'correoElectronico': 'sara.torres@example.com',
    'celular': '3067890123',
    'organismo': organismos[random.nextInt(organismos.length)], // Asigna un organismo aleatorio
  },
  {
    'nombre': 'Jorge Díaz',
    'userImagen': 'https://randomuser.me/api/portraits/men/6.jpg',
    'estado': 'Activo',
    'profesion': 'Analista',
    'correoElectronico': 'jorge.diaz@example.com',
    'celular': '3078901234',
    'organismo': organismos[random.nextInt(organismos.length)], // Asigna un organismo aleatorio
  },
  {
    'nombre': 'Elena Ruiz',
    'userImagen': 'https://randomuser.me/api/portraits/women/6.jpg',
    'estado': 'Inactivo',
    'profesion': 'Investigadora',
    'correoElectronico': 'elena.ruiz@example.com',
    'celular': '3089012345',
    'organismo': organismos[random.nextInt(organismos.length)], // Asigna un organismo aleatorio
  },
  {
    'nombre': 'Pedro Morales',
    'userImagen': 'https://randomuser.me/api/portraits/men/7.jpg',
    'estado': 'Activo',
    'profesion': 'Gerente',
    'correoElectronico': 'pedro.morales@example.com',
    'celular': '3090123456',
    'organismo': organismos[random.nextInt(organismos.length)], // Asigna un organismo aleatorio
  },
  {
    'nombre': 'Isabel Ortiz',
    'userImagen': 'https://randomuser.me/api/portraits/women/7.jpg',
    'estado': 'Inactivo',
    'profesion': 'Consultora',
    'correoElectronico': 'isabel.ortiz@example.com',
    'celular': '3101234567',
    'organismo': organismos[random.nextInt(organismos.length)], // Asigna un organismo aleatorio
  },
  {
    'nombre': 'Ricardo Castro',
    'userImagen': 'https://randomuser.me/api/portraits/men/8.jpg',
    'estado': 'Activo',
    'profesion': 'Administrador',
    'correoElectronico': 'ricardo.castro@example.com',
    'celular': '3112345678',
    'organismo': organismos[random.nextInt(organismos.length)], // Asigna un organismo aleatorio
  },
];