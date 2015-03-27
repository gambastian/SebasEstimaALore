package uniandes.cupi2.impuestosCarro.aspectos;

import java.io.FileNotFoundException;
import java.io.IOException;

import uniandes.cupi2.impuestosCarro.mundo.SendEmail;

/**
 * Aspecto que envia un e-mail cuando los impuestos de un vehiculo superan los 2000000
 * @author Tachu
 *
 */
public aspect Mailer {

	//Se declara un pointcut para el metodo calcularPago de la clase CalculadorImpuestos
	pointcut mailer():
		call(* uniandes.cupi2.impuestosCarro.mundo.CalculadorImpuestos.calcularPago(..));

	//Se envia un e-mail al correo electronico que se indique en la propiedad adminmail
	after() returning (Object r) throws FileNotFoundException, IOException : mailer(){
		System.out.println("Resultado: " + r);
		if (Double.valueOf(r.toString()) > 2000000)
			SendEmail.send();
	}

	//Se imprime la excepcion si algo no se ejecuta bien
	after() throwing (Throwable e) : mailer(){
		System.out.println("Excepción: " + e);
	}
}
