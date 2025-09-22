object knightRider {
	method peso() = 500
	
	method nivelPeligrosidad() = 10
	
	method cantidadBultos() = 1
	
	method tenerAccidente() {
		null
	}
}

object paqueteDeLadrillos {
	var property cantidad = 0
	
	method peso() = 2 * cantidad
	
	method nivelPeligrosidad() = 2
	
	method cantidadBultos() {
		if (cantidad <= 100) {
			return 1
		} else {
			if (cantidad <= 300) {
				return 2
			} else {
				return 3
			}
		}
	}
	
	method tenerAccidente() {
		if (cantidad < 12) {
			cantidad = 0
		} else {
			cantidad -= 1
		}
	}
}

object bateriaAntiaerea {
	var property tieneMisiles = false
	
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
	
	method cantidadBultos() {
		if (tieneMisiles) {
			return 2
		} else {
			return 1
		}
	}
	
	method tenerAccidente() {
		if (self.tieneMisiles()) self.tieneMisiles(false)
	}
}

object residuosRadiactivos {
	var peso = 0
	
	method peso(_peso) {
		peso = _peso
	}
	
	method peso() = peso
	
	method nivelPeligrosidad() = 200
	
	method tenerAccidente() {
		peso += 15
	}
}

object arenaAGranel {
	var peso = 0
	
	method peso(_peso) {
		peso = _peso
	}
	
	method peso() = peso
	
	method nivelPeligrosidad() = 1
	
	method cantidadBultos() = 1
	
	method tenerAccidente() {
		peso += 20
	}
}

object bumblebee {
	var property transformacion = auto
	
	method peso() = 800
	
	method nivelPeligrosidad() = transformacion.nivelPeligrosidad()
	
	method cantidadBultos() = 2
	
	method tenerAccidente() {
		if (transformacion == auto) {
			transformacion = robot
		} else {
			transformacion = auto
		}
	}
}

object auto {
	method nivelPeligrosidad() = 15
}

object robot {
	method nivelPeligrosidad() = 30
}

object contenedorPortuario {
	const contenido = #{}
	const property pesoContenedor = 100
	
	method peso() = pesoContenedor + contenido.sum(
		{ empaquetados => empaquetados.peso() }
	)
	
	method nivelPeligrosidad() {
		if (contenido.isEmpty()) {
			return 0
		}
		return contenido.max(
			{ empaquetados => empaquetados.nivelPeligrosidad() }
		).nivelPeligrosidad()
	}
	
	method empaquetar(cosa) {
		contenido.add(cosa)
	}
	
	method cantidadBultos() = 1 + contenido.sum(
		{ empaquetados => empaquetados.cantidadBultos() }
	)
	
	method tenerAccidente() = 1 + contenido.sum({ cosa => cosa.cantidadBultos() })
}

object embalajeDeSeguridad {
	var embalado = null
	
	method embalar(cosa) {
		embalado = cosa
	}
	
	method desembalar(cosa) {
		if (embalado == cosa) {
			embalado = null
		} else {
			self.error("No esta embalado")
		}
	}
	
	method peso() = embalado.peso()
	
	method nivelPeligrosidad() = embalado.nivelPeligrosidad() / 2
	
	method cantidadBultos() = 2
	
	method tenerAccidente() {
		null
	}
}