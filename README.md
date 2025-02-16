# terraform-lab
Teraform Lab para estudio y experimentos

# Que es Terraform?

Terraform es una herramienta de infraestructura como código (IaC) desarrollada por HashiCorp que permite definir, provisionar y gestionar infraestructura de manera declarativa. Utiliza un lenguaje de configuración propio llamado HCL (HashiCorp Configuration Language) para describir los recursos de infraestructura en la nube, on-premise o en servicios de terceros.

## **Características principales de Terraform:**

- **Infraestructura como Código (IaC):** Permite definir y gestionar la infraestructura mediante archivos de configuración, lo que facilita la automatización, el versionamiento y la replicabilidad.

- **Multiplataforma:** Es compatible con múltiples proveedores de nube (AWS, Azure, Google Cloud, etc.) y servicios, lo que permite gestionar infraestructura híbrida o multi-nube.

- **Estado (State):** Mantiene un archivo de estado que registra el estado actual de la infraestructura, lo que permite a Terraform saber qué cambios deben aplicarse.

- **Planificación y Ejecución:** Antes de aplicar cambios, Terraform genera un plan que muestra qué modificaciones se realizarán, lo que ayuda a prevenir errores.

- **Modularidad:** Permite organizar el código en módulos reutilizables, lo que facilita la gestión de configuraciones complejas.

- **Inmutabilidad:** Fomenta el uso de infraestructura inmutable, donde los cambios se implementan creando nuevos recursos en lugar de modificar los existentes.

- **Comunidad y Ecosistema:** Cuenta con un amplio ecosistema de proveedores y módulos creados por la comunidad, lo que facilita la integración con diversas herramientas y servicios.
