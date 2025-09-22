import cosas.*

object camion {
	const property cosas = #{}
	const property tara = 1000
	
	method cargar(unaCosa) {
		if (cosas.contains(unaCosa)) self.error("Ya esta cargado el objeto")
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa) {
		if (!cosas.contains(unaCosa)) self.error("No esta cargado el objeto")
		cosas.remove(unaCosa)
	}
	
	method esElPesoPar() = (cosas.sum({ cosa => cosa.peso() }) % 2) == 0
	
	method hayAlgoDe_Peso(_peso) = cosas.any({ cosa => cosa.peso() == _peso })
	
	method pesoTotal() = tara + cosas.sum({ cosa => cosa.peso() })
	
	method excedidoDePeso() = self.pesoTotal() > 2500
	
	method hayAlgoDe_Peligrosidad(_nivel) = cosas.any(
		{ cosa => cosa.nivelPeligrosidad() == _nivel }
	)
	
	method masPeligrosasQue(nivel) = cosas.filter(
		{ cosa => cosa.nivelPeligrosidad() >= nivel }
	)
	
	method masPeligrosasQue_(nivelCosa) = cosas.filter(
		{ cosa => cosa.nivelPeligrosidad() >= nivelCosa.nivelPeligrosidad() }
	)
	
	method puedeCircularEnRutaNivel(
		nivel
	) = (!self.excedidoDePeso()) && (self.masPeligrosasQue(20) == #{})
	
	method hayAlgoQuePesaEntre_Y_(minimo, maximo) = cosas.any(
		{ cosa => cosa.peso() > minimo }
	) && cosas.any({ cosa => cosa.peso() > minimo })
	
	method cosaMasPesada() {
		if (cosas.isEmpty()) {
			self.error("El camión no esta cargado")
		} else {
			return cosas.max({ cosa => cosa.peso() })
		}
	}
	
	method pesos() = cosas.map({ cosa => cosa.peso() })
	
	method totalBultos() = cosas.sum({ cosa => cosa.cantidadBultos() })
	
	method accidente() {
		cosas.forEach({ cosa => cosa.tenerAccidente() })
	}
	
	method transportar(destino, camino) {
		if (camino.puedeCircular(camion)) {
			destino.cargarTodo(cosas)
			cosas.clear()
		} else {
			self.error("El camino no puede ser recorrido")
		}
	}
}

object almacen {
	const property almacenimiento = #{}
	
	method cargarTodo(cosas) {
		almacenimiento.addAll(cosas)
	}
	
	method cargar(unaCosa) {
		if (almacenimiento.contains(unaCosa)) self.error(
				"El almacenimiento ya tiene esta cosa cargada"
			)
		else almacenimiento.add(unaCosa)
	}
	
	method descargar(unaCosa) {
		if (!almacenimiento.contains(unaCosa)) self.error(
				"El almacén no tiene esa cosa cargada"
			)
		else almacenimiento.remove(unaCosa)
	}
}

object ruta9 {
	method puedeCircular(camion) = camion.puedeCircularEnRutaNivel(20)
}

object caminosVecinales {
	var pesoMaximoPermitido = 3000
	
	method pesoMaximoPermitido(peso) {
		pesoMaximoPermitido = peso
	}
	
	method puedeCircular(camion) = camion.pesoTotal() <= pesoMaximoPermitido
}