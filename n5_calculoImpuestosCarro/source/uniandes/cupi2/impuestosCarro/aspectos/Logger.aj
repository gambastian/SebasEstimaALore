package uniandes.cupi2.impuestosCarro.aspectos;

public aspect Logger {
	
	pointcut logger():
		call(* uniandes.cupi2.impuestosCarro.mundo..* (..));
	before() : logger(){
		System.out.println("Nombre método: " + thisJoinPointStaticPart.getSignature());
		System.out.println("Parametros:" + thisJoinPoint.getArgs().toString());
		System.out.println("Objeto sobre el que se invoca:" + thisJoinPoint.getTarget());
	}
	after() returning (Object r) : logger(){
		System.out.println("Resultado: " + r);
	}
	after() throwing (Throwable e) : logger(){
		System.out.println("Excepción: " + e);
	}

}
