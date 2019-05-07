import cosas.*

object camion {
	const property cosas = []
	var peso = 0
	var tara = 1000
	method peso(){ return peso }
	
	method cargar(unaCosa) { cosas.add(unaCosa) }
	
	method descargar(unaCosa){ cosas.remove(unaCosa) }
	
	method pesoTotal(){ }
	
	method excedidoDePeso(){ return self.peso() > 2.5 }
	
	method objetosPeligrosos(nivel){ 
		
		cosas.filter({cosa => cosa.superanPeligrosidad(nivel)})
	}
	
	method objetosMasPeligrososQue(cosa){
		cosas.filter({carga => carga.esMasPeligrosoQue(cosa)})
	}
	
	method puedeCircularEnRuta(nivelMaximoDePeligrosidad){
		
		cosas.all({cosa => cosa.superanPeligrosidad(nivelMaximoDePeligrosidad)})
	}
	
	method tieneAlgoQuePesaEntre(min, max){
		cosas.find({cosa => cosa.pesaEntre(min, max) })
	}
	
	method cosaMasPesada(){
		
		cosas.find({cosa => cosa.tienePesoMayor()})
	}
	
	method peso(){
		
		cosas.map({cosa => cosa.peso()})
	}
	
	//totalBultos es un bulto cada uno 
}
