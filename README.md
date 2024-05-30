# ITO_TAP_U4_SISTEMABANCO
## Descripción

En la implementación del Sistema Modelo Vista Controlador (MVC) denominado "banco", se ha desarrollado una aplicación que facilita la gestión completa de usuarios, incluyendo clientes, ejecutivos y gerentes, a través de cuentas dedicadas para cada tipo de usuario. Todos los datos de usuarios, ejecutivos y gerentes se almacenan de forma segura en una base de datos. Cada tipo de usuario tiene sus propios datos, gestionados de forma separada dentro del modelo de la aplicación, lo que permite una gestión eficiente de la información y una clara separación de responsabilidades entre los diferentes tipos de usuarios.

## Usos

1. **Solicitud y gestión de tarjetas de crédito**: Los clientes pueden utilizar el sistema para solicitar tarjetas de crédito. La aplicación guía al cliente a través del proceso de solicitud, recopilando la información necesaria, como detalles personales.

2. **Gestión de clientes**: El sistema permite agregar nuevos clientes a la base de datos y editar la información de los clientes existentes. Los empleados del banco tienen acceso a los perfiles de los clientes para visualizar detalles como nombre, dirección, información de contacto y tarjetas asociadas.

3. **Administración de ejecutivos y gerentes**: Los gerentes pueden añadir clientes, ejecutivos y otros gerentes. Tienen acceso a la información de los clientes y pueden agregar ejecutivos, mientras que solo los ejecutivos pueden editar la información de los clientes y realizar trámites como la solicitud de tarjeta de crédito.

## Características

1. **Practicidad en la gestión de usuarios**: El sistema ofrece una experiencia de usuario intuitiva y eficiente para la gestión de usuarios, lo que facilita tareas como la creación, edición y eliminación de perfiles de clientes, ejecutivos y gerentes.

2. **Interfaz de usuario intuitiva**: La interfaz del sistema está diseñada de manera simple y amigable, lo que permite a los usuarios navegar y utilizar sus funciones de manera rápida y sencilla. Esto incluye la visualización clara de opciones y la facilidad de uso en todas las funciones disponibles.

3. **Amplia variedad de opciones para la gestión de trabajadores del banco**: El sistema ofrece una gama completa de herramientas y funciones para la gestión de trabajadores del banco, incluyendo la asignación de roles, la supervisión de actividades y la generación de informes de desempeño. Esto permite una gestión eficiente del personal y una coordinación efectiva entre diferentes departamentos.

4. **Generación automática de contratos en formato PDF**: Al momento de dar de alta un usuario, el sistema genera automáticamente un contrato en formato PDF y lo envía al usuario por correo electrónico. Este contrato proporciona una documentación legal y detallada de los términos y condiciones del servicio, garantizando transparencia y confianza en la relación entre el cliente y el banco.

5. **Seguridad y confidencialidad**: El sistema garantiza la seguridad y confidencialidad de la información de los usuarios mediante la implementación de medidas de seguridad robustas, como el cifrado de datos y el control de acceso basado en roles. Esto protege la privacidad y la integridad de los datos del usuario, cumpliendo con los estándares de seguridad bancaria.

6. **Flexibilidad y escalabilidad**: El sistema está diseñado para adaptarse a las necesidades cambiantes del banco y escalar según sea necesario. Esto incluye la capacidad de agregar nuevas funciones, integrar con sistemas existentes y manejar un crecimiento en el número de usuarios y transacciones sin comprometer el rendimiento o la estabilidad del sistema.
   
## Ventana De Inicio
![image](https://github.com/JMGVs/ITO_TAP_U4_SISTEMABANCO/assets/168394248/ea972a0e-3549-4cfd-a875-b23638307196)
```java
 public Ingreso(java.awt.Frame parent, boolean modal) {
    super(parent, modal);
    initComponents();
    Ingreso = new InicioGerente(null,true);
    Inicio = new InicioGe(null,true);
}
```

**Constructor del Codigo**: En este constructor crea 2 instancias de los diálogos de inicio de `Gerente` y `Ejecutivo`. 
```java
private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {                                         
    Ingreso.setVisible(true);
    
    if(Ingreso.getBotonPulsado()==0){
        lblingreso.setText("");
    } else {
        lblingreso.setText("");
    }
}                                        
```

**Este codigo Pertenece**: Los usuarios que pertenescan a Gerentes deberan presionar este boton y los llevara a la  ` Ventana De Gerente` `. 

```java
private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {                                         
    Inicio.setVisible(true);
    
    if(Inicio.getBotonPulsado()==1){
        lblingreso.setText("");
    } else {
        lblingreso.setText("");
    }
}  

}
```

**Este codigo Pertenece**: Los usuarios que pertenescan a Ejecutivos deberan presionar este boton y los llevara a la  ` Ventana De Ejecutivos` `. 

    
## Ventana De Inicio De Gerente

![image](https://github.com/JMGVs/ITO_TAP_U4_SISTEMABANCO/assets/168394248/9bb18424-6aa6-4ffc-9811-b570a6c1ce15)



## Ventana De Inicio De Ejecutivo

![image](https://github.com/JMGVs/ITO_TAP_U4_SISTEMABANCO/assets/168394248/44ab0df5-b0a0-4918-bd4a-51034fd0e010)
