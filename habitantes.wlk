import imperio.*

class Persona{
var energia
var categoriaSocial
method tiempo()
method realizarTarea(tarea){
   self.validarTarea(tarea)
   energia -= self.energiaPerdida(tarea)

}
method energiaPerdida(tarea){
    return  tarea.recursosProducidos(self.tiempo()) / self.indiceResistencia()
}
method indiceResistencia()
method validarTarea(tarea){
    self.validarEnergia(tarea)
}
method validarEnergia(tarea){
    if(self.energiaPerdida(tarea) > energia){
        self.error("...")
    }
}
}

class Campesina inherits Persona{
    override method indiceResistencia()= 10
}
class Elite inherits Persona{
    override method indiceResistencia()= 12
    override method energiaPerdida(tarea)= super(tarea) - 5
    override method tiempo() = 10
    override method validarTarea(tarea){
        self.validarRecursos(tarea)
        super(tarea)
    }
    method validarRecursos(tarea){
        if(tarea.recursosProducidos(self.tiempo() < 500 )){
            self.error("...")
        }
    }
}