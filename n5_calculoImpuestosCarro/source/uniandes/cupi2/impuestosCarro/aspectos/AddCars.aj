package uniandes.cupi2.impuestosCarro.aspectos;

import uniandes.cupi2.impuestosCarro.mundo.CalculadorImpuestos;

/**
 * Aspecto para agregar nuevos carros desde el archivo vehiculos2.txt
 * 
 * Se define privileged para poder invocar metodos private dentro de la clase objetivo.
 * 
 * @author SEBASTIAN
 *
 */
public privileged aspect AddCars {
	/**
	 * Pointcut para cuando se llama al metodo privado cargarVehiculos 
	 */
	pointcut addCars():
		call(* CalculadorImpuestos.cargarVehiculos(..));
	
	after(CalculadorImpuestos ci) : target(ci) && addCars(){
		try {
			ci.cargarVehiculos( "data/vehiculos2.txt" );
		} catch (Exception e) {
			System.out.println("Error al cargar el archivo vehiculos2.txt");
		}
	}
}
