// ---------LA CASA--------------
object casaDePepeYJulian {

	var viveres = 50
	var montoReparaciones = 0
	var reparaciones = false

	method viveres(_viveres) {
		viveres = _viveres
	}
	
//	method montoReparaciones(_montoReparaciones) {
//		montoReparaciones = _montoReparaciones
//	}

	method montoReparaciones() {
		return montoReparaciones
	}

	method viveresSuficientes() {
		return (100 >= viveres && viveres > 40)
	}

	method hayQueHacerReparaciones() {
		return reparaciones
	}

	method romper(valor) {
		reparaciones = true
		montoReparaciones += valor
	}

	method reparar() {
		reparaciones = false
		montoReparaciones = 0
	}

	
	method estaLaCasaEnOrden() {
		return ( self.viveresSuficientes() && !(self.hayQueHacerReparaciones()) ) 
	}

}

