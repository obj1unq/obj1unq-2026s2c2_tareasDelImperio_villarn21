import imperio.*

class Persona {
  var property energia
  
  method indiceResistencia()
  
  method tiempo()
  
  //   var categoriaSocial
  method realizarTarea(tarea) {
    self.validarTarea(tarea)
    energia = energia - self.energiaPerdida(tarea)
  }
  
  method energiaPerdida(tarea) = tarea.recursosProducidos(
    self.tiempo()
  ) / self.indiceResistencia()
  
  method validarTarea(tarea) {
    self.validarEnergia(tarea)
  }
  
  method validarEnergia(tarea) {
    if (self.energiaPerdida(tarea) >= energia) self.error("...")
  }
  
  method recursosProducidos(tarea) = tarea.recursosProducidos(self.tiempo())
}

class Campesina inherits Persona {
  const tiempoPorTarea
  
  override method tiempo() = tiempoPorTarea
  
  override method indiceResistencia() = 10
}

class Elite inherits Persona {
  override method indiceResistencia() = 12
  
  override method energiaPerdida(tarea) = super(tarea) - 5
  
  override method tiempo() = 10
  
  override method validarTarea(tarea) {
    self.validarRecursos(tarea)
    super(tarea)
  }
  
  method validarRecursos(tarea) {
    if (tarea.recursosProducidos(self.tiempo()) <= 500) self.error("...")
  }
}