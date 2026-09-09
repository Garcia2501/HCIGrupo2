

## 5. Actividad 3: Comparar mecanismos de agendamiento

Se analizan cuatro mecanismos alternativos al proceso actual de GABO'S, evaluándolos de acuerdo con los requerimientos exigidos: tiempo administrativo y tiempo total de confirmación, acciones del paciente y del personal por separado, intervención humana, prevención de conflictos, tasa de errores, facilidad de uso, accesibilidad, privacidad, factibilidad técnica y compatibilidad con el trabajo de los cinco fisioterapeutas.

### Análisis detallado por criterio de comparación:

1. **Tiempo administrativo y tiempo total de confirmación:**
   * **Agenda digital interna:** Tiempo administrativo alto (el personal hace todo); tiempo total de confirmación medio (sigue dependiente del operador).
   * **Solicitud con confirmación:** Tiempo administrativo alto; tiempo total de confirmación medio (requiere revisión y respuesta manual).
   * **Autoagendamiento:** Tiempo administrativo mínimo (casi nulo para gestiones estándar); tiempo total de confirmación bajo (inmediato, en segundos).
   * **Mecanismo híbrido:** Tiempo administrativo bajo para casos estándar y moderado para excepciones; tiempo total de confirmación bajo (inmediato automatizado, asistido controlado).

2. **Acciones del paciente y acciones del personal (medidas por separado):**
   * **Agenda digital interna:** *Paciente:* Ninguna interacción directa (sigue escribiendo por WhatsApp). *Personal:* Recibe solicitudes, consulta disponibilidad manual, transcribe datos a la web.
   * **Solicitud con confirmación:** *Paciente:* Llena formulario web con sus datos. *Personal:* Recibe el registro estructurado, evalúa, valida y confirma en el sistema.
   * **Autoagendamiento:** *Paciente:* Selecciona fisioterapeuta, escoge horario libre y confirma directamente. *Personal:* Sin intervención en la reserva estándar; supervisión global.
   * **Mecanismo híbrido:** *Paciente (Estándar):* Autoagenda directamente en la plataforma. *Paciente (Excepción/Asistido):* Envía solicitud por WhatsApp. *Personal:* Atiende excepciones ingresándolas al sistema centralizado y supervisa la agenda global.

3. **Intervención humana, prevención de conflictos y tasa de errores:**
   * **Agenda digital interna:** Intervención humana alta, alta probabilidad de errores por transcripción manual, prevención de conflictos parcial (depende de la atención del operador).
   * **Solicitud con confirmación:** Intervención humana alta, prevención parcial de conflictos, tasa de errores moderada por doble manipulación de datos.
   * **Autoagendamiento:** Intervención humana mínima, prevención automática estricta (el sistema bloquea horarios ocupados), tasa de errores muy baja.
   * **Mecanismo híbrido:** Intervención humana parcial (reservada solo a excepciones), prevención de conflictos automática en ambos canales (el sistema rechaza solapamientos de manera nativa), tasa de errores reducida al mínimo.

4. **Facilidad de uso, accesibilidad, privacidad y factibilidad técnica:**
   * **Agenda digital interna:** Factibilidad técnica alta, accesibilidad limitada para el paciente (sigue en WhatsApp), privacidad moderada.
   * **Solicitud con confirmación:** Factibilidad alta, accesibilidad media (excluye usuarios con baja alfabetización digital), privacidad estándar.
   * **Autoagendamiento:** Factibilidad técnica media (requiere desarrollo o integración), accesibilidad media (exige internet/smartphone), privacidad alta para los datos del usuario.
   * **Mecanismo híbrido:** Factibilidad técnica media (requiere planificación inicial), accesibilidad alta (inclusivo al integrar el canal digital y el soporte asistido por WhatsApp), privacidad alta centralizada.

5. **Compatibilidad con la forma de trabajo de los cinco fisioterapeutas:**
   * **Agenda digital interna:** Media (requiere que el personal traduzca la disponibilidad verbal o manual de cada especialista).
   * **Solicitud con confirmación:** Media (mantiene la intermediación administrativa entre el paciente y el especialista).
   * **Autoagendamiento:** Alta (permite que cada fisioterapeuta mantenga su disponibilidad reflejada en tiempo real en la plataforma).
   * **Mecanismo híbrido:** Alta (totalmente compatible, ya que centraliza la agenda de los cinco especialistas y permite autoasignación o gestión asistida sin colapsar su tiempo clínico).

### Matriz de Decisión Final

| Criterio de Evaluación | Agenda Digital Interna | Solicitud con Confirmación | Autoagendamiento | Mecanismo Híbrido ⭐ |
| :--- | :--- | :--- | :--- | :--- |
| **Tiempo total / administrativo** | 🟡 Medio | 🟡 Medio | 🟢 Bajo | 🟢 Bajo |
| **Intervención humana** | 🔴 Alta | 🔴 Alta | 🟢 Mínima | 🟡 Parcial |
| **Prevención de conflictos y errores** | 🟡 Parcial | 🟡 Parcial | 🟢 Automática | 🟢 Automática |
| **Accesibilidad / Inclusión** | 🟡 Media | 🟡 Media | 🟡 Media | 🟢 Alta |
| **Factibilidad técnica** | 🟢 Alta | 🟢 Alta | 🟡 Media | 🟡 Media |
| **Compatibilidad con 5 fisioterapeutas** | 🟡 Media | 🟡 Media | 🟢 Alta | 🟢 Alta |

**✅ Mecanismo Seleccionado:** **Mecanismo Híbrido.**  
Representa la alternativa con mayor equilibrio operativo e inclusivo para GABO'S, automatizando el flujo estándar y manteniendo soporte asistido para excepciones.

---

## 6. Actividad 4: Operacionalizar la eficiencia

La eficiencia del proceso de agendamiento se define como el grado en que una operación se completa correctamente utilizando menor tiempo y esfuerzo humano, sin incrementar errores ni reprocesos.

| Operación | Inicio | Final | Indicadores seleccionados |
| :--- | :--- | :--- | :--- |
| **Consultar disponibilidad** | El usuario accede a la vista del calendario general o selecciona el perfil de un fisioterapeuta específico. | El usuario visualiza claramente los bloques horarios libres y ocupados en la pantalla. | • **Éxito:** Encuentra un horario libre sin asistencia.<br>• **Acciones:** Número de clics o desplazamientos para cambiar de semana/mes.<br>• **Errores:** Intentar seleccionar una fecha pasada o confundir especialista. |
| **Registrar una cita** | El usuario hace clic sobre un bloque de horario disponible e inicia el formulario de reserva. | El sistema muestra un mensaje de confirmación visible y la cita aparece bloqueada en la agenda central. | • **Éxito:** Cita guardada en base de datos sin duplicidad.<br>• **Acciones:** Campos completados y clics en botones de acción.<br>• **Errores:** Omitir datos obligatorios o intentar agendar en un horario recién ocupado. |
| **Modificar una cita** | El usuario abre el detalle de una cita existente desde la vista de agenda. | El sistema confirma el cambio de datos (ej. motivo de consulta) y actualiza la tarjeta de la cita. | • **Éxito:** Datos actualizados sin alterar la fecha u hora accidentalmente.<br>• **Acciones:** Edición de campos y guardado exitoso.<br>• **Errores:** Descartar cambios sin querer por falta de advertencias. |
| **Cancelar una cita** | El usuario selecciona la opción "Cancelar" dentro de los detalles de una cita activa. | El sistema pide confirmación, elimina la cita de la agenda y libera el horario inmediatamente. | • **Éxito:** El espacio vuelve a estar disponible para todos los usuarios.<br>• **Acciones:** Clic en cancelar y confirmación en cuadro de diálogo.<br>• **Errores:** Cancelar la cita equivocada por falta de contraste visual. |
| **Reagendar una cita** | El usuario selecciona la opción de reagendar o desplaza la tarjeta de la cita a un nuevo horario. | La cita se traslada a la nueva fecha/hora y el espacio anterior queda liberado. | • **Éxito:** Traslado del paciente sin perder su historial o motivo.<br>• **Acciones:** Selección de nueva fecha y confirmación.<br>• **Errores:** Duplicar la cita en lugar de moverla o moverla a un horario ocupado. |

---

## 🔗 Enlace al Prototipo en Figma
> **[Prototipo de Figma — GABO'S](https://www.figma.com/make/8EAC09nLDxo64JqiCcenq8/Prototipo-GABO-S-Readaptaci%C3%B3n?t=9bLFf6EjfkmuhT49-1)**

---

## Explicativo del Prototipo de Interfaz (Soporte al Mecanismo Híbrido)

El prototipo funcional interactivo de **GABO'S** se estructuró en **7 frames** diseñados bajo los principios de IHC, traduciendo el flujo híbrido seleccionado en una experiencia fluida, accesible y libre de sobrecarga cognitiva:

1. **Frame 1 (Login y Selector de Rol):** Permite un acceso rápido y diferenciado según el tipo de actor (*Paciente, Fisioterapeuta, Administrador*), incorporando un diseño de alto contraste con el color corporativo (`#1A73E8`) y una clara jerarquía visual que subordina los enlaces secundarios (*Ley Figura-Fondo*).
2. **Frame 2 (Dashboard Paciente):** Centraliza la información crítica del usuario. Destaca la tarjeta *"Tu próxima cita"* con un badge verde de confirmación y accesos directos al autoagendamiento y notificaciones oportunas.
3. **Frame 3 (Autoagendamiento en 3 pasos):** Guía al paciente mediante un *stepper* superior:
   * *Paso 1:* Selección visual de entre los 5 fisioterapeutas con tarjetas de especialidad.
   * *Paso 2:* Calendario interactivo con prevención automática de conflictos (bloques ocupados en gris inactivo y disponibles en verde, resaltando en azul al seleccionar).
   * *Paso 3:* Resumen de confirmación con feedback inmediato mediante un modal con animación de éxito (✅).
4. **Frame 4 (Dashboard Fisioterapeuta):** Ofrece una vista transparente de la agenda semanal de lunes a viernes, mostrando los bloques sin tiempos muertos ocultos y explicitando los espacios libres como *"Disponible"*.
5. **Frame 5 (Panel Administrativo de Asistencia):** Resuelve la integración del canal WhatsApp asistido. Permite al personal ingresar solicitudes externas al calendario centralizado, activando alertas visuales automáticas en caso de detectar solapamientos de horarios (banner rojo de conflicto).
6. **Frame 6 (Dashboard Administrador del Centro):** Resuelve la carencia de métricas del modelo AS-IS mediante tarjetas de KPIs automatizados, gráficos de demanda por especialista y filtros de fechas.
7. **Frame 7 (Cancelar / Reagendar Cita):** Gestiona las modificaciones del usuario mediante modales de confirmación con advertencias claras de liberación de turnos y redirección fluida al flujo de selección de horarios.
