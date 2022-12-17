# Instalación de Rocky Linux 9.1

## Puesta a punto

### Actualizamos

Realizamos un primer update para que todos los paquetes se pongan al día.

    # dnf update -y

### Instalación de paquetes necesarios

Instalamos @minimal-environment, EPEL, VM tools (libres) y nano.

    # dnf install @minimal-environment -y 
    # dnf install open-vm-tools nano -y
    # dnf install epel-release -y
    
Muchos paquetes de EPEL requieren el repositorio CodeRady Builder (CBR). 
Es recomendable activarlo ejecutando el siguiente comando:
    
    # /usr/bin/crb enable

### Poner SELinux en modo permisivo (para evitar problemas)

La configuración de SELinux puede ser compleja si no se conoce el sistema. En este caso lo vamos a poner en modo permisivo, ya que en este modo sigue haciendo un log de todo lo que pasa, quedando el sistema en modo observador.
    
    # nano /etc/sysconfig/selinux

Y cambiamos donde pone:

    SELINUX=enforcing 
 
Por:
    
    SELINUX=permissive

### Reinicio

Reiniciamos la máquina para que todos los cambios se establezcan.
    
    # reboot

## Adaptandolo a las necesidades

### Hostname

Cambiamos el nombre al host.
    
    # hostnamectl set-hostname nombredeequipo --static

O podemos usar también la aplicación nmtui que tiene una interfaz gráfica.
    
    # nmtui
