class Tarea{
//var recursos
//var esfuerzo 
//var desgaste
method recursosProducidos(tiempo){
    return 50 * (tiempo - self.desgaste(tiempo) ) * self.esfuerzo()
}
//method recursos() =  recursos
method desgaste(tiempo)
method esfuerzo()
//method tiempo()
}

class Siembra inherits Tarea{
    override method desgaste(tiempo){
      return (tiempo - 8).min(1)
    }
    method validarTiempo(tiempo){
        if(tiempo > self.tiempoPasado()){
            self.error("...")
        }
    }
    method tiempoPasado()
}
class Valle inherits Siembra{
    var property epocaDeLluvias 
    override method recursosProducidos(tiempo){
        self.validarTiempo(tiempo)
       return  if(not epocaDeLluvias){
        super(tiempo)
       }else{
        0
       }
    }
    override method tiempoPasado(){
        return 8
    }
}

class Terraza inherits Siembra{
    override method recursosProducidos(tiempo){
        self.validarTiempo(tiempo)
        return super(tiempo) * 3
    }
    override method tiempoPasado(){
        return 6
    }
}
class Mensaje inherits Tarea{
    override method esfuerzo()= 1.4
    override method desgaste(tiempo){
        return tiempo / 4
    }
}

class MensajeImperial inherits Mensaje{
    override method esfuerzo()= 1.8
    override method desgaste(tiempo)= (super(tiempo) - 2).max(1)
}