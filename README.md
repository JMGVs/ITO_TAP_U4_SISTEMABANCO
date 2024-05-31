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

    
## Ventana De Inicio De Ejecutivo

![image](https://github.com/JMGVs/ITO_TAP_U4_SISTEMABANCO/assets/168394248/9bb18424-6aa6-4ffc-9811-b570a6c1ce15)

 **El JDBC Es:** JDBC (Java Database Connectivity) es una API de Java que permite a los desarrolladores de aplicaciones Java conectarse a bases de datos.
 ```java
  private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {                                         
        try {
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/banco", "root", "zorrito21");
            PreparedStatement consulta = conexion.prepareStatement("SELECT * FROM ejecutivo WHERE id_ejecutivo = ?");
            consulta.setString(1, txtNumGerente.getText().trim());
            ResultSet rs = consulta.executeQuery();
            if (rs.next()) {
                String clave = rs.getString("clave");
                if (clave.equals(jPasswordField1.getText().trim())) {

                    InicioGe.setVisible(true);

                    if (InicioGe.getBotonPulsado() == 0) {
                        txtNumGerente.setText("");
                    } else {
                        txtNumGerente.setText("");
                    }

                } else {

                    JOptionPane.showMessageDialog(this, "Clave incorrecta", "Error", JOptionPane.ERROR_MESSAGE);
                }
            } else {

                JOptionPane.showMessageDialog(this, "No se encontró ningún ejecutivo con el ID especificado", "Error", JOptionPane.ERROR_MESSAGE);
            }
        } catch (Exception e) {

            e.printStackTrace();
        }

       
    }                                        
}
```
**Este codigo pertenece cuando el usuario pulsa el boton continuar**: Realiza una conexión a la base de datos MySQL utilizando JDBC y verifica si hay un ejecutivo con el ID especificado en el campo txtNumGerente. Luego, compara la clave ingresada en el campo jPasswordField1 con la clave almacenada en la base de datos. Si la clave coincide, avanza a la siguiente  ` Vista Ejecutivo `. Si la clave no coincide o no se encuentra ningún ejecutivo con el ID especificado, muestra un mensaje de error correspondiente.

   ```java
    private void jPasswordField1MousePressed(java.awt.event.MouseEvent evt) {                                             
        
        jPasswordField1.setText("");
    }               
```
**Este método se llama cuando se presiona el mouse en el campo de contraseña jPasswordField1**. Borra el texto actual en el campo para permitir al usuario ingresar una nueva contraseña.
## Ventana De Inicio De Gerente


 **El JDBC Es:** JDBC (Java Database Connectivity) es una API de Java que permite a los desarrolladores de aplicaciones Java conectarse a bases de datos.
 
![image](https://github.com/JMGVs/ITO_TAP_U4_SISTEMABANCO/assets/168394248/44ab0df5-b0a0-4918-bd4a-51034fd0e010)

```java
  try {
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/banco", "root", "zorrito21");
            PreparedStatement consulta = conexion.prepareStatement("SELECT * FROM gerente WHERE id_gerente = ?");
            consulta.setString(1, jTextField1.getText().trim());
            ResultSet rs = consulta.executeQuery();
            if (rs.next()) {
                String clave = rs.getString("Clave");
                if (clave.equals(jPasswordField2.getText().trim())) {
                    inicioGerente.setVisible(true);

                    if (inicioGerente.getBotonPulsado() == 0) {
                        lblRegistro.setText("");
                    } else {
                        lblRegistro.setText("");
                    }

                } else {

                    JOptionPane.showMessageDialog(this, "Clave incorrecta", "Error", JOptionPane.ERROR_MESSAGE);
                }
            } else {

                JOptionPane.showMessageDialog(this, "No se encontró ningún ejecutivo con el ID especificado", "Error", JOptionPane.ERROR_MESSAGE);
            }
        } catch (Exception e) {

            e.printStackTrace();
        }

    }
```
**Este codigo pertenece cuando el usuario pulsa el boton continuar**: Realiza una conexión a la base de datos MySQL utilizando JDBC y verifica si hay un ejecutivo con el ID especificado en el campo txtNumGerente. Luego, compara la clave ingresada en el campo jPasswordField1 con la clave almacenada en la base de datos. Si la clave coincide, avanza a la siguiente  ` Vista Gerente `. Si la clave no coincide o no se encuentra ningún gerente con el ID especificado, muestra un mensaje de error correspondiente.

## Ventana Opciones De Genrente y ejecutivo


![image](https://github.com/JMGVs/ITO_TAP_U4_SISTEMABANCO/assets/168394248/70042e87-2cab-469b-ab14-00d26f67bf7e)      ![image](https://github.com/JMGVs/ITO_TAP_U4_SISTEMABANCO/assets/168394248/3cdceada-ab3a-452c-a5e8-63842f803fb7)

```java
private void lblTramiteMousePressed(java.awt.event.MouseEvent evt) {                                        
//BotonPulsado = 0;
//this.dispose();
Tramites tramites = new Tramites(new javax.swing.JFrame(), true);

tramites.setVisible(true);

if(tramites.getBotonPulsado()==0){
    lblTramite.setText("");
} else {
    lblTramite.setText("");
}
        // TODO add your handling code here:
    }                                       

    private void lblNuevoClienteMousePressed(java.awt.event.MouseEvent evt) {                                             
//BotonPulsado = 0;
//this.dispose();
NuevoCliente ventanaCliente = new NuevoCliente(new javax.swing.JFrame(), true);

ventanaCliente.setVisible(true);
if(ventanaCliente.getBotonPulsado()==0){
    lblNuevoCliente.setText("");
} else {
    lblNuevoCliente.setText("");
}
        // TODO add your handling code here:
    }                                            

    private void lblBajaMousePressed(java.awt.event.MouseEvent evt) {                                     
//BotonPulsado = 0;
//this.dispose();
Tabla bajaCliente = new Tabla(new javax.swing.JFrame(), true);

bajaCliente.setVisible(true);
if(bajaCliente.getBotonPulsado()==0){
    lblBaja.setText("");
} else {
    lblBaja.setText("");
}
        // TODO add your handling code here:
    }

```
**Action de botones de imagenes**:Cada boton tiene un action  en este caso tiene un evento llamado MausePreseend al momento de pulsar una imagen cada una va a abrir un menu distinto la unica diferencia entre ambos menus es que el gerente puede agregar nuevo Ejecutivos


## Menu Nuevo cliente

![image](https://github.com/JMGVs/ITO_TAP_U4_SISTEMABANCO/assets/168394248/61a55fda-495b-40c4-b67f-c847fc743a50)

**El método generarContratoPDF:** se encarga de crear un archivo PDF que contiene un contrato bancario con información del cliente y del banco. Aquí están los pasos principales del método:
**Definir Ruta Del Archivo:**:Se obtiene el directorio del escritorio del usuario y se define la ruta completa donde se guardará el archivo PDF.
```java
String userHome = System.getProperty("user.home");
String desktopPath = userHome + File.separator + "Desktop";
String dest = desktopPath + File.separator + nombreArchivo;
```

**Crear un Nuevo Documento::** Se crea una instancia de la clase Document de iText, que representará el PDF.
```java
Document document = new Document();

```


**Inicializar el Escritor de PDF:** Se inicializa un PdfWriter para escribir en el archivo especificado. Luego, se abre el documento para poder agregar contenido.
```java
PdfWriter.getInstance(document, new FileOutputStream(dest));
document.open();


```
**Agregar Contenido al Documento:** Se define una fuente para el título y se agrega al documento.
```java
Font fontTitulo = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16);
document.add(new Paragraph("Contrato de Servicios Bancarios", fontTitulo));


```

**Agregar Información del Cliente y del Contrato:** Se agregan párrafos al documento que incluyen los detalles del contrato, como los datos personales del cliente, información bancaria y condiciones del contrato.
```java
document.add(new Paragraph("Entre Unibanco, en adelante \"el Banco\", y el Sr./Sra. " + nombreCliente +
        ", con número de identificación: " + numerodocumento + " en adelante \"el Cliente\", se establecen las siguientes condiciones:"));
document.add(new Paragraph("1. **Datos Personales del Cliente:**"));
document.add(new Paragraph("   - Nombre Completo: " + nombreCliente));
document.add(new Paragraph("   - Apellido Paterno: " + apellidoPaterno));
document.add(new Paragraph("   - Apellido Materno: " + apellidoMaterno));
document.add(new Paragraph("   - Domicilio: " + direccion));
document.add(new Paragraph("   - Correo Electrónico: " + correoElectronico));
document.add(new Paragraph("2. **Número de Cliente:**"));
document.add(new Paragraph("   - Número de Cliente: " + idClienteGenerado));
document.add(new Paragraph("3. **Datos Bancarios:**"));
document.add(new Paragraph("   - Fecha de Ingreso al Banco: " + fechaRegistro));
document.add(new Paragraph("   - Número de Tarjeta Bancaria: " + numeroTarjeta));
document.add(new Paragraph("   - Fecha de Expiración de la Tarjeta: " + fechaExpiracion));
document.add(new Paragraph("4. **Saldo:**" + monto));
document.add(new Paragraph("   - El Cliente se compromete a mantener un saldo mínimo en su cuenta bancaria según lo establecido por Unibanco."));
document.add(new Paragraph("   - El Cliente podrá realizar depósitos, retiros y transferencias de fondos según los servicios ofrecidos por Unibanco."));
document.add(new Paragraph("   - El Banco se reserva el derecho de cobrar tarifas por ciertos servicios bancarios, las cuales serán informadas al Cliente previamente."));
document.add(new Paragraph("5. **Seguridad de la Información:**"));
document.add(new Paragraph("   - El Cliente se compromete a mantener la confidencialidad de su información bancaria, incluyendo su número de tarjeta y clave secreta."));
document.add(new Paragraph("   - Unibanco implementará medidas de seguridad para proteger la información del Cliente, pero no se responsabilizará por pérdidas causadas por el uso no autorizado de la cuenta."));
document.add(new Paragraph("6. **Plazo del Contrato:**"));
document.add(new Paragraph("   - El presente contrato entrará en vigor a partir de la fecha de su firma y tendrá una duración indefinida, salvo que sea rescindido por alguna de las partes de acuerdo con lo establecido en la ley."));
document.add(new Paragraph("7. **Legislación Aplicable:**"));
document.add(new Paragraph("   - Este contrato se regirá e interpretará de acuerdo con las leyes del [País], y cualquier disputa relacionada con este contrato estará sujeta a la jurisdicción exclusiva de los tribunales de [Ciudad, País]."));


```
**Cerrar el Documento:** Se cierra el documento para finalizar la escritura del archivo PDF.
```java
document.close();

```

**Mostrar Mensaje de Confirmación:** Se muestra un mensaje emergente confirmando que el contrato se ha generado correctamente.
```java
JOptionPane.showMessageDialog(null, "Contrato bancario generado en el escritorio.");

```
**Manejo de Excepciones:** Si ocurre un error durante la generación del PDF, se captura la excepción, se muestra un mensaje de error y se imprime la traza de la pila.
```java
} catch (IOException | DocumentException e) {
    JOptionPane.showMessageDialog(null, "Error al generar el archivo PDF: " + e.getMessage());
    e.printStackTrace();
    return null; 
}

```
## Funcionamineto de Email
**Obtener el correo del destinatario y establecer el asunto::** Este bloque obtiene el correo electrónico del destinatario desde un campo de texto (correo) y establece el asunto del correo.

```java
emailTo = correo.getText().trim();
subject = "Contrato de Unibanco";


```

**Configurar las propiedades del protocolo Simple Mail Transfer Protocol (SMTP):** Aquí se configuran las propiedades necesarias para conectarse al servidor SMTP de Gmail, incluyendo el host, el puerto, y las opciones de autenticación y seguridad.

```java
mProperties.put("mail.smtp.host", "smtp.gmail.com");
mProperties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
mProperties.setProperty("mail.smtp.starttls.enable", "true");
mProperties.setProperty("mail.smtp.port", "587");
mProperties.setProperty("mail.smtp.user", emailFrom);
mProperties.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
mProperties.setProperty("mail.smtp.auth", "true");

```

**Inicializar la sesión de correo::** Se inicializa una sesión de correo con las propiedades configuradas anteriormente.

```java
mSession = Session.getDefaultInstance(mProperties);


```

**Crear el mensaje de correo::**  Este bloque crea un nuevo mensaje de correo (MimeMessage), establece el remitente, el destinatario y el asunto del correo.

```java
try {
    mCorreo = new MimeMessage(mSession);
    mCorreo.setFrom(new InternetAddress(emailFrom));
    mCorreo.setRecipient(Message.RecipientType.TO, new InternetAddress(emailTo));
    mCorreo.setSubject(subject);

```


**Agregar el cuerpo del mensaje::** Aquí se crea el cuerpo del mensaje principal, se establece el texto y se añade a un contenedor multipart para manejar múltiples partes del mensaje.
```java
    BodyPart messageBodyPart = new MimeBodyPart();
    messageBodyPart.setText("Por favor, encuentre adjunto el contrato bancario.");
    Multipart multipart = new MimeMultipart();
    multipart.addBodyPart(messageBodyPart);


```

**Adjuntar el contrato PDF::** En este bloque se crea una nueva parte del mensaje para adjuntar el archivo PDF generado. El archivo se adjunta y se añade al contenedor multipart. Finalmente, el contenido del mensaje se establece como el contenedor multipart.

```java
    messageBodyPart = new MimeBodyPart();
    String filename = generarContratoPDF("contrato_bancario.pdf");
    DataSource source = new FileDataSource(filename);
    messageBodyPart.setDataHandler(new DataHandler(source));
    messageBodyPart.setFileName(new File(filename).getName());
    multipart.addBodyPart(messageBodyPart);
    mCorreo.setContent(multipart);
} catch (AddressException ex) {
    Logger.getLogger(NuevoCliente.class.getName()).log(Level.SEVERE, null, ex);
} catch (MessagingException ex) {
    Logger.getLogger(NuevoCliente.class.getName()).log(Level.SEVERE, null, ex);
}


```
## Metodo SendEmail
**Enviar el correo:** Este método se encarga de enviar el correo electrónico. Se obtiene un objeto Transport de la sesión, se conecta usando las credenciales del remitente (emailFrom y passwordFrom), se envía el mensaje y luego se cierra la conexión

```java
dtry {
    Transport mTransport = mSession.getTransport("smtp");
    mTransport.connect(emailFrom, passwordFrom);
    mTransport.sendMessage(mCorreo, mCorreo.getRecipients(Message.RecipientType.TO));
    mTransport.close();
} catch (NoSuchProviderException ex) {
    Logger.getLogger(NuevoCliente.class.getName()).log(Level.SEVERE, null, ex);
} catch (MessagingException ex) {
    Logger.getLogger(NuevoCliente.class.getName()).log(Level.SEVERE, null, ex);
}


```

**Validar el formato del correo electrónico:** Este método usa una expresión regular para asegurarse de que el correo electrónico tenga un formato válido y pertenezca a uno de los dominios especificados (hotmail, gmail, yahoo, outlook). La función devuelve true si el correo es válido y false en caso contrario.

```java
Pattern pattern = Pattern.compile("(\\W|^)[\\w.\\-]{0,25}@(hotmail|gmail|yahoo|outlook)\\.com(\\W|$)");
Matcher matcher = pattern.matcher(correo);
return matcher.find();

```
**Validar la longitud del NIP:** Este método verifica que el NIP (Número de Identificación Personal) tenga exactamente 6 caracteres, devolviendo true si cumple esta condición y false si no.
```java
return nip.length() == 6;
```

## Acción del botón Cuando pulsa Generar

**Este método se activa cuando el usuario hace clic en el botón asociado y realiza una serie de acciones para guardar los datos del cliente, generar un contrato PDF y enviar un correo electrónico.**

**Obtener y validar los datos del formulario::** Aquí se obtienen los datos ingresados por el usuario en el formulario.
```java
try {
    nombreCliente = nombre.getText().trim();
    apellidoPaterno = paterno.getText().trim();
    apellidoMaterno = materno.getText().trim();
    correoElectronico = correo.getText().trim();
    nip = pasword.getText().trim();
    monto = Double.parseDouble(mo.getText().trim());
    telefono = nombre1.getText().trim();
    direccion = mo1.getText().trim();
    fechaExpiracion = "2026-05-27";



```

**Aquí se obtienen los datos ingresados por el usuario en el formulario.:** 
```java
    String tipoCuenta = jComboBox1.getSelectedItem().equals("Ahorro") ? "Ahorros" : "Corriente";

```


**Se obtiene el tipo de cuenta seleccionada por el usuario y se asigna el valor correspondiente.:** 

```java
       String tipoCuenta = jComboBox1.getSelectedItem().equals("Ahorro") ? "Ahorros" : "Corriente";


```


**Se valida el correo electrónico, el NIP y el monto mínimo. Si alguna validación falla, se muestra un mensaje de error y se sale del método.:**

```java
    if (!validarCorreo(correoElectronico) || !validarNIP(nip) || monto < 2000) {
        JOptionPane.showMessageDialog(null, "Los datos ingresados son inválidos.");
        return;
    }


```

**Obtener la fecha actual y formatearla::** Se obtiene la fecha actual y se formatea en el formato yyyy-MM-dd.

```java
    Date fechaActual = new Date();
    SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
    fechaRegistro = formatoFecha.format(fechaActual);



```

**Conectar a la base de datos y preparar consultas SQL:** Se establece una conexión a la base de datos y se preparan las consultas SQL para insertar datos en las tablas Cliente y tarjeta.

```java
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/banco", "root", "");
    PreparedStatement consultaCliente = conexion.prepareStatement(
        "INSERT INTO Cliente (id_cliente, nombre, apellido_paterno, apellido_materno, email, telefono, direccion, fecha_registro, tipo_cuenta, saldo, NIP) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
        Statement.RETURN_GENERATED_KEYS
    );
    PreparedStatement consultaTarjeta = conexion.prepareStatement(
        "INSERT INTO tarjeta (numero_tarjeta, fecha_emision, fecha_expiracion, saldo_disponible, cliente_id, credito,tarjetaCredito,limite) VALUES (?, ?, ?, ?, ?, ?,?,?)"
    );

```


**Rellenar y ejecutar la consulta de cliente:** Se rellenan los valores en la consulta de cliente y se ejecuta la inserción. Luego se obtiene el id_cliente generado automáticamente.

```java
      consultaCliente.setString(1, "0");
    consultaCliente.setString(2, nombreCliente);
    consultaCliente.setString(3, apellidoPaterno);
    consultaCliente.setString(4, apellidoMaterno);
    consultaCliente.setString(5, correoElectronico);
    consultaCliente.setString(6, telefono);
    consultaCliente.setString(7, direccion);
    consultaCliente.setString(8, fechaRegistro);
    consultaCliente.setString(9, tipoCuenta);
    consultaCliente.setDouble(10, monto);
    consultaCliente.setString(11, nip);
    consultaCliente.executeUpdate();

    ResultSet generatedKeys = consultaCliente.getGeneratedKeys();
    if (generatedKeys.next()) {
        idClienteGenerado = generatedKeys.getInt(1);
    }


```


**Rellenar y ejecutar la consulta de tarjeta:** Se genera un número de tarjeta aleatorio y se rellenan los valores en la consulta de tarjeta. Luego se ejecuta la inserción.

```java
       numeroTarjeta = (long) (Math.random() * 10000000000000000L);
    consultaTarjeta.setLong(1, numeroTarjeta);
    consultaTarjeta.setString(2, fechaRegistro);
    consultaTarjeta.setString(3, fechaExpiracion);
    consultaTarjeta.setDouble(4, monto);
    consultaTarjeta.setInt(5, idClienteGenerado);
    consultaTarjeta.setBoolean(6, false);
    consultaTarjeta.setInt(7, 0);
    consultaTarjeta.setInt(8, 0);
    consultaTarjeta.executeUpdate();


```
**Generar el contrato PDF y enviar el correo electrónico:** Se genera un número de documento aleatorio, se crea el contrato en formato PDF y, si se genera correctamente, se prepara y envía un correo electrónico con el contrato adjunto.

```java
        numerodocumento = (int)(Math.random() * (max - min + 1)) + min;
    String contratoPDF = generarContratoPDF("contrato_bancario.pdf");

    if (contratoPDF != null) {
        createEmail();
        sendEmail();
    } else {
        JOptionPane.showMessageDialog(null, "Error al generar el contrato bancario.");
    }

```

**Limpiar los campos del formulario y cerrar recursos::** Se limpian los campos del formulario y se muestran mensajes de confirmación o error. Finalmente, se cierran los recursos de base de datos para liberar memoria.


```java
       nombre.setText("");
    paterno.setText("");
    materno.setText("");
    mo.setText("");
    correo.setText("");
    pasword.setText("");

    JOptionPane.showMessageDialog(null, "Datos guardados correctamente.");

    generatedKeys.close();
    consultaTarjeta.close();
    consultaCliente.close();
    conexion.close();
} catch (NumberFormatException e) {
    JOptionPane.showMessageDialog(null, "El monto ingresado es inválido.");
} catch (SQLException e) {
    JOptionPane.showMessageDialog(null, "Error al guardar los datos en la base de datos: " + e.getMessage());
}


```

## Ventana De Tramites
![image](https://github.com/JMGVs/ITO_TAP_U4_SISTEMABANCO/assets/168394248/5adae539-37e7-4b54-a218-93a9cb58fda3)

**Establecimiento de la conexión a la base de datos:** Aquí se está estableciendo una conexión a una base de datos MySQL llamada "banco" en el localhost (la misma máquina donde se está ejecutando el código). Se está utilizando el usuario "root" sin contraseña

```java
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/banco", "root", "");


```
**Preparación y ejecución de consultas SQL:** Se está preparando y ejecutando una consulta SQL para seleccionar datos de la tabla "cliente" donde el campo "id_cliente" sea igual al valor proporcionado en un campo de texto llamado "jTextField11".

```java
   PreparedStatement consulta = conexion.prepareStatement("SELECT * from cliente WHERE id_cliente = ?");
consulta.setString(1, jTextField11.getText().trim());
ResultSet rs = consulta.executeQuery();


```

**Extracción de datos y llenado de campos de texto::** Se están extrayendo datos del ResultSet y estableciendo el texto en varios campos de texto en la interfaz de usuario

```java
   txtNombre.setText(rs.getString("nombre"));

```


**Generación de valores aleatorios para una nueva tarjeta:** Se prepara y ejecuta una consulta para insertar una nueva fila en la tabla "tarjeta". Se establecen los valores de las columnas utilizando los valores aleatorios generados anteriormente. 

```java
      PreparedStatement consulta3 = conexion.prepareStatement("INSERT INTO tarjeta (credito, tarjetaCredito, limite) VALUES (?, ?, ?)");
consulta3.setBoolean(1, true);
consulta3.setLong(2, numeroTarjeta);
consulta3.setInt(3, limiteAleatorio);
int filasAfectadas = consulta3.executeUpdate();

```

**Manejo de excepciones:** Se capturan y manejan excepciones que puedan ocurrir durante la ejecución del código. Se muestra un mensaje de error con detalles sobre la excepción y se imprime el stack trace para depuración.

```java
       } catch (Exception e) {
    JOptionPane.showMessageDialog(this, "Error al consultar datos: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
    e.printStackTrace();
}


```

## Alta De Ejecutivo y Gerente
**Solo cambian el nombre de las variables en ambos codigos pero en si estan echos basados en el mismo principio**

![image](https://github.com/JMGVs/ITO_TAP_U4_SISTEMABANCO/assets/168394248/f4e8f365-3dbc-4366-9fae-a21d9888b173) ![image](https://github.com/JMGVs/ITO_TAP_U4_SISTEMABANCO/assets/168394248/a78d88de-5d24-4914-9c9c-69dbc9f77401)


**Obtención y limpieza de datos del formulario:** Aquí se obtienen los datos ingresados por el usuario en los campos de texto (jTextField14, jTextField13, jTextField15, jTextField16, jTextField17, jPasswordField3) y se eliminan espacios en blanco al inicio y final.
```java
String nombreEjecutivo = jTextField14.getText().trim();
String apellidoPaternoEje = jTextField13.getText().trim();
String apellidoMaternoEje = jTextField15.getText().trim();
String telefono = jTextField16.getText().trim();
String correoElectronico = jTextField17.getText().trim();
int clave = Integer.parseInt(jPasswordField3.getText().trim());


```

**Generación de un salario aleatorio:** Se genera un salario aleatorio entre 2000 y 20000 usando la función Math.random().

```java
double salario = 2000 + Math.random() * (20000 - 2000);


```

**Obtención de la fecha actual:** Se obtiene la fecha actual y se formatea en el formato "YYYY-MM-DD".



```java
     Date fechaActual = new Date();
SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
String fechaRegistro = formatoFecha.format(fechaActual);



```

**Selección de un departamento aleatorio::**
```java
String[] departamentos = {"Ventas", "Operaciones", "Recursos Humanos", "Finanzas", "Marketing"};
Random random = new Random();
int indiceAleatorio = random.nextInt(departamentos.length);
String seleccionAleatoria = departamentos[indiceAleatorio];

```

**Generación de una clave aleatoria y selección de una sucursal aleatoria:**
```java
int min = 100000;
int max = 999999;
int claveAleatoria = random.nextInt((max - min) + 1) + min;
int idsucursal = random.nextInt(3) + 1;



```

**Validación del correo electrónico:** Se valida el correo electrónico usando la función validarCorreo. Si el correo no es válido, se muestra un mensaje de error y se detiene la ejecución.
```java

if (!validarCorreo(correoElectronico)) {
    JOptionPane.showMessageDialog(null, "Los datos ingresados son inválidos.");
    return;
}

```

**Conexión a la base de datos y preparación de la consulta:** Se establece una conexión a la base de datos MySQL y se prepara una consulta SQL para insertar los datos en la tabla gerente
```java

Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/banco", "root", "");
PreparedStatement consulta = conexion.prepareStatement("INSERT INTO gerente (id, nombreEjecutivo, apellidoPaternoEje, apellidoMaternoEje, correoElectronico, telefono, fechaRegistro, salario, departamento, idSucursal, clave) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

```

**Establecimiento de parámetros de la consulta:** Se ejecuta la consulta para insertar los datos en la base de datos.
```java
consulta.setInt(1, 0);  // Asumiendo que el campo 'id' es autoincremental, este valor se ignorará
consulta.setString(2, nombreEjecutivo);
consulta.setString(3, apellidoPaternoEje);
consulta.setString(4, apellidoMaternoEje);
consulta.setString(5, correoElectronico);
consulta.setString(6, telefono);
consulta.setString(7, fechaRegistro);
consulta.setDouble(8, salario);
consulta.setString(9, seleccionAleatoria);
consulta.setInt(10, idsucursal);
consulta.setInt(11, clave);

```

**Ejecucion De Consulta:** 
```java
consulta.executeUpdate();
```

## Explicacion de Librerias 

   ## Librerías de iText
         Estas librerías se utilizan para crear y manipular documentos PDF:

1. **com.itextpdf.text.Document**: Representa un documento PDF.
2. **com.itextpdf.text.DocumentException:** Maneja excepciones relacionadas con el manejo de documentos PDF.
3. **com.itextpdf.text.Font:** Define estilos y tamaños de fuente.
4. **com.itextpdf.text.FontFactory:** Facilita la creación de objetos Font.
5. **com.itextpdf.text.Paragraph:** Representa un párrafo en un documento PDF.
6. **com.itextpdf.text.pdf.AcroFields:** Maneja los campos de un formulario en un documento PDF.
7. **com.itextpdf.text.pdf.PdfReader:** Lee documentos PDF existentes.
8. **com.itextpdf.text.pdf.PdfStamper:** Permite modificar y agregar contenido a un documento PDF existente.
9. **com.itextpdf.text.pdf.PdfWriter: * *Escribe el contenido del documento en un archivo PDF.


   ## Librerías de MySQL
      Estas librerías se utilizan para interactuar con una base de datos MySQL:

1. **com.mysql.jdbc.Statement:** Ejecuta sentencias SQL (consulta, actualización).
2. **java.sql.Connection:** Establece una conexión con la base de datos.
3. **java.sql.DriverManager:** Gestiona los controladores de la base de datos y establece conexiones.
4. **java.sql.PreparedStatement:** Representa una sentencia SQL precompilada.
5. **java.sql.SQLException:** Maneja las excepciones relacionadas con la base de datos.
6. **java.sql.ResultSet:** Representa el resultado de una consulta a la base de datos.

  ## Librerías de Java para GUI y manejo de excepciones
      Estas librerías se utilizan para crear interfaces gráficas de usuario y manejar excepciones:

1. **javax.swing.*:** Proporciona clases para crear interfaces gráficas de usuario (botones, campos de texto, etc.).
2. **java.io.File:** Maneja archivos y directorios.
3. **java.io.FileOutputStream:** Permite la escritura de datos en un archivo.
4. **java.io.IOException:** Maneja las excepciones de entrada/salida.
5. **java.text.SimpleDateFormat:** Proporciona una forma de formatear y analizar fechas.
6. **java.util.Date:** Representa una fecha y hora específicas.
7. **java.util.regex.Matcher:** Coincide un patrón regular con una secuencia de caracteres.
8. **java.util.regex.Pattern:** Define un patrón de expresiones regulares.
9. **java.util.logging.Level:** Define niveles de logging.
10.  **java.util.logging.Logger:** Proporciona capacidades de logging.

 # Librerías de JavaMail
    
         Estas librerías se utilizan para enviar correos electrónicos:

1. **java.util.Properties:** Proporciona una estructura de datos para almacenar pares clave-valor, usado aquí para configurar las propiedades del correo.
2. **javax.mail.*:** Proporciona clases y interfaces para manejar correos electrónicos.
3. **javax.mail.internet.*:** Proporciona clases para crear y analizar mensajes de correo electrónico en el formato de Internet.
4. **javax.activation.DataHandler:** Maneja datos MIME.
5. **javax.activation.DataSource:** Representa una fuente de datos.
6. **javax.activation.FileDataSource:** Implementación de DataSource que encapsula un archivo.




