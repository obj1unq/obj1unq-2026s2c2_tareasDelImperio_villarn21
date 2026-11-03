class Tarea {
  //var recursos
  //var esfuerzo 
  //var desgaste
  method recursosProducidos(tiempo) = (50 * (tiempo - self.desgaste(
    tiempo
  ))) * self.esfuerzo()
  
  //method recursos() =  recursos
  method desgaste(tiempo)
  
  method esfuerzo()
}

class Siembra inherits Tarea {
  const property esfuerzo
  
  override method desgaste(tiempo) = 1 + (tiempo - self.jornadaNormal()).max(0)
  
  /*method validarTiempo(tiempo) {
    if (tiempo > self.jornadaNormal()) self.error("...")
  }*/
  
  method jornadaNormal()
}

class Valle inherits Siembra {
  var property epocaDeLluvias
  
  override method recursosProducidos(tiempo) {
    if (epocaDeLluvias) {
      return 0
    } else {
      return super(tiempo)
    }
  }
  
  override method jornadaNormal() = 8
}

class Terraza inherits Siembra {
  override method recursosProducidos(tiempo) {
    //self.validarTiempo(tiempo)
    return super(tiempo) * 3
  }
  
  override method jornadaNormal() = 6
}

class Mensaje inherits Tarea {
  override method esfuerzo() = 1.4
  
  override method desgaste(tiempo) = tiempo / 4
}

class MensajeImperial inherits Mensaje {
  override method esfuerzo() = 1.8
  
  override method desgaste(tiempo) = (super(tiempo) - 2).max(1)
}