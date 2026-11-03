import habitantes.*
import imperio.*

class Ayllu {
  const zonas = #{}
  
  method mejorZonaPara(habitante) = zonas.max(
    { zona => zona.recursosTotales(habitante) }
  )
  
  method zonasSuaves(habitante) = zonas.filter(
    { zona => zona.esSuave(habitante) }
  )
  
  method zonaMasExigente(habitante) = zonas.map(
    { zona => zona.tareaMasExigente(habitante) }
  )
}

class Zona {
  const tareas = #{}
  
  method recursosTotales(habitante) = tareas.sum(
    { tarea => tarea.recursosProducidos(tarea) }
  )
  
  method esSuave(habitante) = tareas.any(
    { tarea => habitante.recursosProducidos(tarea) <= 200 }
  )
  
  method tareaMasExigente(habitante) = tareas.max(
    { tarea => habitante.recursosProducidos(tarea) }
  )
}