class Actividad{
  const property idiomas = #{}

  method implicaEsfuerzo()

  method sirveParaBroncearse() = true

  method cantidadDias()

  method esInteresante() = idiomas.size() > 1

  method esRecomendada(unSocio) = 
    self.esInteresante() && unSocio.leAtrae(self) && not unSocio.actividades().contains(self)
}

class ViajeDePlaya inherits Actividad{
  const largo

  override method cantidadDias() = largo / 500

  override method implicaEsfuerzo() = largo > 1200

}

class ExcursionACiudad inherits Actividad{
  const atracciones

  override method cantidadDias() = atracciones / 2
  
  override method implicaEsfuerzo() = atracciones.between(5, 8)

  override method sirveParaBroncearse() = false

  override method esInteresante() = super() || atracciones == 5
}

class ExcursionCiudadTropical inherits ExcursionACiudad{

  override method cantidadDias() = super() + 1

  override method sirveParaBroncearse() = true

}

class SalidaDeTrekking inherits Actividad{
  const kilometrosDeSendero
  const diasDeSolPorAnio

  override method cantidadDias() = kilometrosDeSendero / 50

  override method implicaEsfuerzo() = kilometrosDeSendero > 80

  override method sirveParaBroncearse() =
   diasDeSolPorAnio > 200 || (diasDeSolPorAnio.between(100, 200) && kilometrosDeSendero > 120)

  override method esInteresante() = super() && diasDeSolPorAnio > 140

} 

class ClaseDeGimnasia inherits Actividad{


  override method idiomas() = 1

  override method cantidadDias() = 1

  override method implicaEsfuerzo() = true
  
  override method sirveParaBroncearse() = false

  override method esRecomendada(unSocio) = unSocio.edad().between(20, 30)

}

class TallerLiterario inherits Actividad{
  const libros = #{}

  method initialize() {
    idiomas.clear()
    idiomas.addAll(libros.map({l => l.idioma()}))
  }

  method idiomasUsados() = idiomas

  override method cantidadDias() = libros.size() + 1

  override method implicaEsfuerzo() = 
    libros.any({l => l.cantidadPaginas() > 500}) || 
    (libros.map({l => l.nombreDelAutor()}).asSet().size() == 1 && libros.size() > 1)

  override method sirveParaBroncearse() = false

  override method esRecomendada(unSocio) = unSocio.idiomas().size() > 1

}

class Libro{
  const property idioma
  const property cantidadPaginas
  const property nombreDelAutor

}