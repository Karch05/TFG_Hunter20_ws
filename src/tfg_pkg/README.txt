Para conectarse con el Robot físico:
	Conectamos el robot al puerto CAN:
	- cd hunter20_ws/src/ugv_sdk/scripts
	- bash setup_can2usb.bash (si es la primera vez usando el robot en este ordenador)
	- bash bringup_can2usb_500k.bash (si no es la primera vez)
	- ros2 launch hunter_base hunter_base.launch.py
	
	Conectarse al hokuyo:
	- cd TFG_Hunter20_ws
	- ros2 launch tfg_pkg urg_hokuyo_launch.py
	
	Iniciar el RVIZ y URDF:
	- cd TFG_Hunter20_ws
	- ros2 launch tfg_pkg simbot_launch.py
	
	Iniciar Nav2 para el Robot real:
	- cd TFG_Hunter20_ws
	- ros2 launch tfg_pkg robot.launch
	
Para utilizar el simulador:
	Iniciar Coppelia y RVIZ:
	- cd TFG_Hunter20_ws
	- ros2 launch tfg_pkg main.launch
	
	Iniciar Nav2 para el modelo simulado:
	- cd TFG_Hunter20_ws
	- ros2 launch tfg_pkg simulator.launch
	
Para usar el control por teclado (sirve para ambos):
- cd TFG_Hunter20_ws
- ros2 run tfg_pkg keyboard_control_plus.cpp


Nota 1: la configuración usada para el Nav2 solo tiene parámetros que tienen en cuenta robots esféricos, por lo que solo se puede introducir el radio del robot. Esto complica la evasión de obstáculos. Por el momento sigue en 0.22m por lo que choca con los objetos antes de parar.

Nota 2: Cuando el robot retrocede, gira en sentido contrario, probablemente por fallos en la lógica del controlador. Esto es solucionado en el simulador pero no en el robot real.
