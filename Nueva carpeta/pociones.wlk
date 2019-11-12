class Posion{
	var property ingredientes = []
	
	method agregarIngrediente(ingrediente){
		ingredientes.add(ingrediente)
	}
	
	method actuarSobre(persona){
		ingredientes.forEach({ingrediente => ingrediente.otorgarBeneficios(persona, self)})
	}
	
	method cantidadDeIngredientes() = ingredientes.size()
}



class Ingrediente{
	
}

class DulceDeLeche{
	method otorgarBeneficios(persona, posion){
		if(persona.estaFueraDeCombate()){
			persona.revivir()
		}
		persona.aumentarFuerza(10)
	}
}

class PunadoDeHongosSilvestres{
	var property cantidadDeHongos
	method otorgarBeneficios(persona, posion){
		if(cantidadDeHongos>5){
			persona.modificarResistencia(0.5)
		}
		persona.aumentarFuerza(cantidadDeHongos)
	}
}

class Grog{
	method otorgarBeneficios(persona, posion){
		persona.aumentarFuerza(posion.cantidadDeIngredientes())
	}
}

class GrogXd inherits Grog{
	override method otorgarBeneficios(persona, posion){
		super(persona, posion)
		persona.modificarResistencia(2)
	}
}