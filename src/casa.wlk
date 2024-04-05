// ---------LA CASA--------------
object casaDePepeYJulian {

	var viveres = 50
	var montoReparaciones = 0
	var reparaciones = false
	var cuentaBancaria = corriente

	method viveres(_viveres) {
		viveres = _viveres
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

//	method reparar() {
//		reparaciones = false
//		montoReparaciones = 0
//	}

	method gastar(importe) {
		cuentaBancaria.extraer(importe)
	} 

	method estaLaCasaEnOrden() {
		return ( self.viveresSuficientes() && !(self.hayQueHacerReparaciones()) )
	}
	
	method cuentaBancaria(_cuentaBancaria) {
		cuentaBancaria = _cuentaBancaria
		
	}

}

// cuentas bancarias
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

