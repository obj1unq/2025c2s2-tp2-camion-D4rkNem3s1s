object knightRider {
	method peso() = 500
	
	method nivelPeligrosidad() = 10
}

object paqueteDeLadrillos {
	var property cantidad = 0
	
	method peso() = 2 * cantidad
	
	method nivelPeligrosidad() = 2
}

object bateriaAntiaerea {
	var tieneMisiles = false
	
	method peso() = 500
	
	method nivelPeligrosidad() = 10
}

object bateriaConMisiles {
	const property nivelPeligrosidad = 100
	
	method peso() = 300
}

object bateriaSinMisiles {
	const property nivelPeligrosidad = 0
	
	method peso() = 200
}

object residuosRadiactivos {
	var peso = 0
	
	method peso(_peso) {
		peso = _peso
	}
	
	method peso() = peso
	
	method nivelPeligrosidad() = 10
}

object arenaAGranel {
	var property cantidad = 0
	
	method peso(_peso) = _peso
	
	method nivelPeligrosidad() = 10
}

object bumblebee {
	var property transformacion = auto
	
	method peso() = 800
	
	method nivelPeligrosidad() = transformacion.nivelPeligrosidad()
}

object auto {
	method nivelPeligrosidad() = 10
}

object robot {
	method nivelPeligrosidad() = 10
}