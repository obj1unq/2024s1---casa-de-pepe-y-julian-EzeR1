// ---------LA CASA--------------
object casaDePepeYJulian {

	var viveres = 50
	var montoReparaciones = 0
	var reparaciones = false
	var cuentaBancaria = corriente
	var estrategiaDeAhorro = minimoIndispensable

	method viveres(_viveres) {
		viveres = _viveres
	}

	method viveres() {
		return viveres
	}

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

	method gastar(importe) {
		cuentaBancaria.extraer(importe)
	}

	method comprarViveres(monto) {
		self.gastar(monto)
	}

	method hacerReparaciones() {
		self.gastar(montoReparaciones)
		reparaciones = false
		montoReparaciones = 0
	}

	method estaLaCasaEnOrden() {
		return ( self.viveresSuficientes() && !(self.hayQueHacerReparaciones()) )
	}

	method cuentaBancaria(_cuentaBancaria) {
		cuentaBancaria = _cuentaBancaria
	}

	method saldoDisponibleEnCuentaBancaria() {
		return cuentaBancaria.saldo()
	}

	method depositarEnCuentaBancaria(monto) {
		cuentaBancaria.depositar(1000)
	}

	method estrategiaDeAhorro(_estrategiaDeAhorro) {
		estrategiaDeAhorro = _estrategiaDeAhorro
	}

	method hacerMantenimientoDeLaCasa() {
		estrategiaDeAhorro.hacerMantenimiento()
	}

}

// CUENTAS BANCARIAS ------------
object corriente {

	var saldo = 0

	method depositar(monto) {
		saldo += monto
	}

	method extraer(monto) {
		saldo -= monto
	}

	method saldo() {
		return saldo
	}

}

object gastos {

	var saldo = 0
	var costoPorOperacion = 0

	method depositar(monto) {
		saldo = saldo + (monto - costoPorOperacion)
	}

	method extraer(monto) {
		saldo -= monto
	}

	method saldo() {
		return saldo
	}

	method costoPorOperacion(_costoPorOperacion) {
		costoPorOperacion = _costoPorOperacion
	}

}

object combinada {

	method depositar(monto) {
		combinadaPrimaria.saldoADepositar(monto)
	}

	method extraer(monto) {
		if (combinadaPrimaria.saldo() >= monto) {
			combinadaPrimaria.retirar(monto)
		} else {
			combinadaSecundaria.retirar(monto)
		}
	}

	method saldo() {
		return combinadaPrimaria.saldo() + combinadaSecundaria.saldo()
	}

	method tipoPrimaria(tipo) {
		combinadaPrimaria.tipo(tipo)
	}

	method tipoSecundaria(tipo) {
		combinadaSecundaria.tipo(tipo)
	}

	method saldoSecundaria(saldo) {
		combinadaSecundaria.saldoADepositar(saldo)
	}

}

object combinadaPrimaria {

	var tipo = corriente

	method tipo(_tipo) {
		tipo = _tipo
	}

	method saldo() {
		return tipo.saldo()
	}

	method saldoADepositar(monto) {
		tipo.depositar(monto)
	}

	method retirar(monto) {
		tipo.extraer(monto)
	}

}

object combinadaSecundaria {

	var tipo = corriente

	method tipo(_tipo) {
		tipo = _tipo
	}

	method saldo() {
		return tipo.saldo()
	}

	method saldoADepositar(monto) {
		tipo.depositar(monto)
	}

	method retirar(monto) {
		tipo.extraer(monto)
	}

}

// ESTRATEGIAS DE AHORRO --------------------
object minimoIndispensable {

	var calidadDeAlimentos = 1
	var viveresAComprar = 0

	method calidadDeAlimentos(_calidadDeAlimentos) {
		calidadDeAlimentos = _calidadDeAlimentos
	}

	method hacerMantenimiento() {
		if (not casaDePepeYJulian.viveresSuficientes()) {
			viveresAComprar = 40 - casaDePepeYJulian.viveres()
			casaDePepeYJulian.comprarViveres(viveresAComprar * calidadDeAlimentos)
			casaDePepeYJulian.viveres(viveresAComprar)
		}
	}

}

object full {

	const calidadDeAlimentos = 5

	method hacerMantenimiento() {
		if (casaDePepeYJulian.estaLaCasaEnOrden()) {
			casaDePepeYJulian.comprarViveres((100 - casaDePepeYJulian.viveres()) * calidadDeAlimentos)
			casaDePepeYJulian.viveres(100)
			self.hacerReparacionesSiEsPosible()
		} else {
			casaDePepeYJulian.comprarViveres(40 * calidadDeAlimentos)
			casaDePepeYJulian.viveres(casaDePepeYJulian.viveres() + 40)
			self.hacerReparacionesSiEsPosible()
		}
	}

	method hacerReparacionesSiEsPosible() {
		if (casaDePepeYJulian.saldoDisponibleEnCuentaBancaria() > (casaDePepeYJulian.montoReparaciones() + 1000 )) {
			casaDePepeYJulian.hacerReparaciones()
		}
	}

}

//PARA PENSAR: 
//para agregar una nueva casa, tendria que hacer en cada estrategia de ahorro una variable con
//la casa que se quiera utilizar, sino los metodos funcionan solo sobre la casa de pepe y julian.
//Ademas, cada casa tendria que setear sus propios "valores" de funcionamiento (ej: el 40% limite
//de los viveres puede ser otro valor para otra casa, o el sobrante de 1000 pesos al hacer las reparaciones). 