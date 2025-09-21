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
	
	method tieneMisiles(_tieneMisiles) {
		tieneMisiles = _tieneMisiles
	}
	
	method peso() {
		var peso = 200
		if (tieneMisiles) {
			peso = 300
		}
		return peso
	}
	
	method nivelPeligrosidad() {
		var nivel = 0
		if (tieneMisiles) {
			nivel = 100
		}
		return nivel
	}
}

object residuosRadiactivos {
	var peso = 0
	
	method peso(_peso) {
		peso = _peso
	}
	
	method peso() = peso
	
	method nivelPeligrosidad() = 200
}

object arenaAGranel {
	var peso = 0
	
	method peso(_peso) {
		peso = _peso
	}
	
	method peso() = peso
	
	method nivelPeligrosidad() = 1
}

object bumblebee {
	var property transformacion = auto
	
	method peso() = 800
	
	method nivelPeligrosidad() = transformacion.nivelPeligrosidad()
}

object auto {
	method nivelPeligrosidad() = 15
}

object robot {
	method nivelPeligrosidad() = 30
}