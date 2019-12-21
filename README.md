# Descripción de la Evaluación
## Introducción
La prueba consiste en resolver una problemática dada utilizando como plataforma de base al Framework .NET (o .NET Core). Se solicita se utilice una arquitectura lo más desacoplada posible, separando las capas de **Presentación, Servicios/Negocio** y **Acceso a datos**.

Se lista una serie de guías y herramientas recomendadas en la sección de **[Guías y Herramientas](#guías-y-herramientas)**, aunque el uso de las mismas no es mandatorio.

El esfuerzo estimado para la generación de los entregables es de **2 días**, por lo que es importante priorizar los principales aspectos de la solución y dejar documentados todos aquellos que no pudieron ser resueltos por falta de tiempo.

## Problemática a resolver
Implementar la transferencia de fondos de un usuario registrado en un sistema de eBanking. Donde deberán tenerse en cuenta los siguientes elementos:
- La transferencia se hará entre cuentas del usuario.
- Deberá solicitarse: cuenta origen, cuenta destino, monto a transferir y una descripción para la transferencia.
- Deberán actualizarse los saldos de las cuentas involucradas al momento de realizar la transferencia.
- Se deberá validar que la cuenta origen tenga saldo suficiente para realizar la transferencia.
- El sistema eBanking mencionado, es un sistema de gran porte que contiene varios módulos entre ellos el módulo de Transferencias al cual hace referencia este caso.

El modelo de datos propuesto es el siguiente:

![Alt text](/Documentos/ModeloBD.jpg?raw=true "Modelo")

Dónde la relación con la tabla de usuarios se deja abierta a que se defina de la forma más conveniente para la implementación.

# Guías y Herramientas
## Guías
Se listan a continuación guías que pueden tomarse como referencia:

**Presentación**
- MVC .NET: https://dotnet.microsoft.com/apps/aspnet/mvc
- Web Forms: https://dotnet.microsoft.com/apps/aspnet/web-forms
- Angular: https://angular.io/

**Servicios**
- WCF: https://docs.microsoft.com/en-us/dotnet/framework/wcf/getting-started-tutorial
- .NET WebApi: https://dotnet.microsoft.com/apps/aspnet/apis

**Acceso a datos**
- EntityFramework: https://docs.microsoft.com/en-us/ef/#pivot=ef6x
- LinQ to SQL: https://docs.microsoft.com/en-us/dotnet/framework/data/adonet/sql/linq/
- Dapper: https://dapper-tutorial.net/dapper

**Otros**
- Guía de arquitectura: https://archive.codeplex.com/?p=apparchguide
- Package Manager (.NET): https://www.nuget.org/
- Package Manager (Node): https://docs.npmjs.com/about-npm/

## Herramientas
Se listan a continuación las herramientas que podrán ser utilizadas. Esta lista no pretende limitar al uso de las
mismas, sino servir como guía.
- Visual Studio Community: https://visualstudio.microsoft.com/vs/community/
- SQL Server 2017 - Developer: https://go.microsoft.com/fwlink/?linkid=853016
- SQL Server Management Studio: https://docs.microsoft.com/en-us/sql/ssms/download-sql-servermanagement-studio-ssms?view=sql-server-2017
