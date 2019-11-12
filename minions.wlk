class Rol{
	method agotarseDefendiendoSector(empleado)=empleado.estamina()/2
	method agotarseLimpiandoSector(sector) = sector.laEstaminaNecesariaParaElSector()
	method esMucama() =false
	method fuerza() = 0
	method seNiegaADefenderSector() = false
}

class Soldado inherits Rol{
	
	var property danioExtraPorPractica = 0
	override method fuerza()= danioExtraPorPractica
	
	method defenderSector(){danioExtraPorPractica = danioExtraPorPractica + 2 }
	override method agotarseDefendiendoSector(empleado) = 0
	
}



class Obrero inherits Rol{
	var property cinturonDeHerramientas = #{}
	
	method cuentaConLasHerramientasNecesarias(tarea) = tarea.herramientasNecesarias().all({herramienta => cinturonDeHerramientas.contains(herramienta)})
	
	
}

class Mucama inherits Rol{
	override method seNiegaADefenderSector() = true
	
	override method esMucama()=true
	override method agotarseLimpiandoSector(sector) = 0
	
}