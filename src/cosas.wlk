object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

object paqueteDeLadrillos{
	var cantDeLadrillos 
	method cantDeLadrillos(){ return cantDeLadrillos}
	method cantDeLadrillos(_cantDeLadrillos){ cantDeLadrillos = _cantDeLadrillos }
	method peso(){ return 2}
	method nivelPeligrosidad(){ return 2}
	
}

object arenaAGranel{
	
	var peso 
	method peso(){ return peso }
	method peso(_peso){ peso = _peso}
	method nivelDePeligrosidad(){ return 1 }
}

object bateriaAntiaera{
	
	var tieneMisiles = true 
	method tieneMisiles(){ return tieneMisiles}
	method peso(){
		
		if(self.tieneMisiles()){
			
		return 300
		  
		}else{ 
			return 200
		}
	}
	
	method nivelDePeligrosidad(){
		
		if(self.tieneMisiles()){
			return 100
		}else{
			
			return 0
		}
	}
}

object contenedorPortuario{
	var cosas = []
	method peso(){ return 100 + cosas.size()}
	method nivelDePeligrosidad(){
		
		if(not cosas.isEmpety()){
			
			return cosas.find({cosa => self.esElMasPeligroso(cosa)}) //??
		}else{
			
			return 0
		}
	}
}

object residuosRadioactivos{
	
	var peso 
	method peso(){ return 0}
	method peso(_peso){ peso = _peso}
	method nivelDePeligrosidad(){ return 200}
}

object embalajeDeSeguridad{
	var cosa = residuosRadioactivos
	method peso(){ cosa.peso()}
	method nivelDePeligrosidad(){ cosa.nivelDePeligrosidad()}
}

