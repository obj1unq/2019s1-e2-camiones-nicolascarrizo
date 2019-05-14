object knightRider {
	method peso() { return 500 }
	method nivelDePeligrosidad() { return 10 }
	method bultos(){ return 1}
	method producirCambios(){ /*No hace nada */ }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelDePeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bultos(){ return 2}
	method producirCambios(){ self.transformar()} //podria ser false directamente. 
}

//class paqueteDeLadrillos

object paqueteDeLadrillos{
	var cantDeLadrillos = 2
	method cantDeLadrillos(){ return cantDeLadrillos}
	method cantDeLadrillos(_cantDeLadrillos){ cantDeLadrillos += _cantDeLadrillos }
	method peso(){ return cantDeLadrillos *  2}
	method nivelDePeligrosidad(){ return 2}
	method bultos(){
		
		if(cantDeLadrillos <= 100){
			
			return 1
		}else if (cantDeLadrillos.between(101, 300)){
			
			return 2
		}else{
			
			return 3
		}
	}
	
	method producirCambios(){ self.cantDeLadrillos(12)}
	
}

object arenaAGranel{
	
	var peso = 0
	method peso(){ return peso }
	method peso(_peso){ peso = _peso}
	method nivelDePeligrosidad(){ return 1 }
	method bultos(){ return 1}
	method producirCambios(){ peso += 20}
}

object bateriaAntiaera{
	
	var tieneMisiles
	method tieneMisiles(){ return tieneMisiles}
	method cargarMisiles() { tieneMisiles = true}
	method peso(){
		
		if(tieneMisiles){
			
		return 300
		  
		}else{ 
			return 200
		}
	}
	
	method nivelDePeligrosidad(){
		
		if(tieneMisiles){
			return 100
		}else{
			
			return 0
		}
	}
	
	method bultos(){
		
		if(tieneMisiles){
			
			return 2
		}else{
			
			return 1
		}
	}
	
	method producirCambios(){ self.cargarMisiles() }
}

object contenedorPortuario{
	var cosas = []
	method agregarAlContenedor(unaCosa){ cosas.add(unaCosa)}
	method peso(){ return 100 + cosas.size()}
	method nivelDePeligrosidad(){
		
		if(not cosas.isEmpty()){
			
			return cosas.map({cosa => cosa.nivelDePeligrosidad()}).max() 
		}else{
			
			return 0
		}
	}
	
	method bultos(){
		
		return 1 + cosas.map({cosa => cosa.bultos()}).sum()
	} 
	
	method producirCambios(){
		
		cosas.forEach({cosa => cosa.producirCambios()})
	}
}

object residuosRadioactivos{
	
	var peso = 0
	method peso(){ return peso}
	method peso(_peso){ peso = _peso}
	method nivelDePeligrosidad(){ return 200}
	method bultos(){ return 1}
	method producirCambios(){ peso += 15}
}

object embalajeDeSeguridad{
	var cosaQueTengo = residuosRadioactivos
	method cosaQueTengo(_cosa){	cosaQueTengo = _cosa}
	method peso(){ return cosaQueTengo.peso()}
	method nivelDePeligrosidad(){ return cosaQueTengo.nivelDePeligrosidad() / 2}
	method bultos(){ return 2}
	method producirCambios(){ /*No hace nada */}
}

