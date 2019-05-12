import cosas.*

object camion {
	const property cosas = []
	var peso = 1000

	method peso(){ return peso }
	
	method cargar(unaCosa) { cosas.add(unaCosa) }
	
	method hacerCambios(){
		
		cosas.forEach({cosa => cosa.producirCambios()})
	}
	
	method descargar(unaCosa){ cosas.remove(unaCosa) }
	 
	method pesoTotal(){ return self.peso() + cosas.sum{cosa => cosa.peso()}}
	
	method excedidoDePeso(){ return self.peso() > 2500 }
	
	method objetosPeligrosos(nivel){ 
		
		return cosas.filter({cosa => cosa.nivelDePeligrosidad() > nivel})
		
		// filter devuelve una lista con todos los que cumplen la condicion
	}
	
	method objetosMasPeligrososQue(cosa){
		return cosas.filter({carga => carga.nivelDePeligrosidad() > cosa.nivelDePeligrosidad()})
	}
	
	
	method puedeCircularEnRuta(nivelMaximoDePeligrosidad){
		
		return cosas.all({cosa => cosa.nivelDePeligrosidad() < nivelMaximoDePeligrosidad})
		
		//devuelve verdadero si todos cumplen con la condicion, si alguno
		//no la cumple devuelve falso. 
	}
	
	method tieneAlgoQuePesaEntre(min, max){
	return	cosas.any({cosa =>  cosa.peso().between(min,max)})
	
	 //devuelve verdadero , si alguno cumple la condicion 
	}
	
	method cosaMasPesada(){
		
		return cosas.max({cosa => cosa.peso()})
	}
	
	method totalBultos(){
		
		return cosas.sum({cosa => cosa.bultos()})
	}
	
	method pesos(){
		
		return cosas.map({cosa => cosa.peso()})
	}
}
