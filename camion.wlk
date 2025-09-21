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
}