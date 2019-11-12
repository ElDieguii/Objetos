import pociones.*

/*
 * Punto 1 
 * a:persona.poder()
 * b:persona.persona.recibirDanio(danio)
 * Punt 2
 * persona.tomarPosionMagica(posion)
 * Punto 3
 * ejercito.poder()
 * 
 * Punto 4
 * ejercito.recibirDanio(danio)
 * 
 * Punto 5
 * ejercito.enfrentar(enemigo)
 */
 



class Ejercito{
	var property integrantes = #{}
	
	method cantidadIntegrantesAlFrente() = 10
	
	method agregarIntegrante(integrante){
		integrantes.add(integrante)
	}
	
	method cantidadDeIntegrantes() = integrantes.size()
	
	method poder() = self.integrantesEnCombate().sum({integrante => integrante.poder()})
	
	method recibirDanio(danio){self.losMasValientes(self.cantidadIntegrantesAlFrente()).forEach({integrante => integrante.recibirDanio(danio)})} 
	
	method integrantesEnCombate() = integrantes.filter({integrante => !integrante.estaFueraDeCombate()})
	
	method ejercitoFueraDeCombate() = self.integrantesEnCombate().isEmpty()
	
	method losMasValientes(cantidadIntegrantesAlFrente){
		if(self.cantidadDeIntegrantes()<cantidadIntegrantesAlFrente){
			return integrantes
		}else{
			return self.integrantesAlFrente(cantidadIntegrantesAlFrente)
		}
	} 
	
	method integrantesAlFrente(cantidadIntegrantesAlFrente) = self.deMasPoderosoAMasDebil().take(cantidadIntegrantesAlFrente)
	
	method deMasPoderosoAMasDebil() = integrantes.sortedBy({integrante1, integrante2 => integrante1.poder() > integrante2.poder()})
	
	method enfrentarEnemigo(enemigo){
		if(self.ejercitoFueraDeCombate()){
			self.error("El ejercito esta completamente fuera de combate")
		}else{
			self.menosPoderoso(enemigo).recibirDanio(self.diferenciaDePoderes(enemigo))
		}
	}
	
	method menosPoderoso(enemigo){
		if(self.poder()>enemigo.poder()){
			return enemigo
		}else{
			return self
		}
	}
	
	method diferenciaDePoderes(enemigo) = (enemigo.poder()-self.poder()).abs()

}


class CambioATortuga{
	var property minimoEstablecido = 1
	
	method seAlcanzaElMinimoPreestablecido(poder) = minimoEstablecido >= poder
}

class Legion inherits Ejercito{
	
	var property formacion
	var property minimoDePoder = new CambioATortuga()
	
	override method recibirDanio(danio){
		super(formacion.recibirDanio(danio))
		if(minimoDePoder.seAlcanzaElMinimoPreestablecido(self.poder())){
			formacion = new Tortuga()
		}
	} 
	
	override method poder() = super() * formacion.poder()
	
	override method cantidadIntegrantesAlFrente() = formacion.cantidadIntegrantesAlFrente(self)
	
}


class Tortuga {
	method poder() = 0
	
	method recibirDanio(danio) = 0
	method cantidadIntegrantesAlFrente(legion) = 0
}

class EnCuadro{
	var property integrantesAlFrente
	method cantidadIntegrantesAlFrente(legion) = integrantesAlFrente
	
}

class FrontemAllargate {
	
	method poder() = 1.1
	
	method cantidadIntegrantesAlFrente(legion)= legion.cantidadDeIntegrantes() /2
	
	method recibirDanio(danio)= danio * 2
}



class Persona{
	var property fuerza = 0
	var property resistencia = 0
	
	method poder() = fuerza * resistencia
	
	method recibirDanio(danio){resistencia = 0.max(resistencia - danio)} 
	
	method aumentarFuerza(cantidad){fuerza = fuerza + cantidad}
	
	method modificarResistencia(modificador){resistencia = resistencia * modificador}
	
	method estaFueraDeCombate() = resistencia == 0
	
	method revivir(){resistencia = resistencia + 2}
	
	method tomarPosionMagica(posion){
		posion.actuarSobre(self)
	}
}
