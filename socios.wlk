
class Socio{
    const property actividades = []
    const maximoDeActividades
    const property edad 
    const property idiomas = #{}

    method esAdoradorDelSol() = actividades.all({ a => a.sirveParaBroncearse() })

    method actividadesEsforzadas() = actividades.filter({a => a.implicaEsfuerzo()})

    method registrarActividad(unaActividad){
        if ( actividades.size() < maximoDeActividades ){
            actividades.add(unaActividad)
        }
        else { self.error("Ya alcanzó el máximo de actividades") }
    }

    method leAtrae(unaActividad)

}

class SocioTranquilo inherits Socio{
    override method leAtrae(unaActividad) = unaActividad.cantidadDias() >= 4
}

class SocioCoherente inherits Socio{
    override method leAtrae(unaActividad) = 
        if ( self.esAdoradorDelSol() ) 
        { unaActividad.sirveParaBroncearse() }
        else 
        { unaActividad.implicaEsfuerzo() }
}

class SocioRelajado inherits Socio{
    override method leAtrae(unaActividad) = 
      not (unaActividad.idiomas().intersection(idiomas).isEmpty())     
}

