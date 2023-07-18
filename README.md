# izi_flutter_app

## Installar los packages

`flutter pub get`

en caso de que no funcione, ejecutar los siguientes comandos

> flutter packages get

> flutter packages upgrade


## VS Code
Abrir emulador o simulator(mac) 

## Conectarse al server 
Descomentar la linea 

### Pc
`final dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8080'));`

### Mac
En mac en la terminal escribir `ifconfig`

` 
    inet `192.168.0.101` netmask 0xffffff00 broadcast 192.168.0.255
	nd6 options=201<PERFORMNUD,DAD>
	media: autoselect
	status: active
`

Reemplazar el numero IP en:

`final dio = Dio(BaseOptions(baseUrl: 'http://192.168.0.101:8080'));`

> F5 para correr la app

correr desde el emulador o simulator


