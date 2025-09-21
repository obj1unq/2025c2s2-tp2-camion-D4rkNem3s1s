import cosas.*

object camion {
	const cosas = #{}
	const property tara = 1000
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}
	
	method esElPesoPar() = (cosas.sum({ cosa => cosa.peso() }) % 2) == 0
	
	method hayAlgoDe_Peso(_peso) = cosas.any(
		{ cosa, _peso => cosa.peso() == _peso }
	)
	
	method pesoTotal() = tara + cosas.sum({ cosa => cosa.peso() })
	
	method excedidoDePeso() = self.pesoTotal() > 2500
}