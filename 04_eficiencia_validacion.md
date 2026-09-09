# Eficiencia y Validación - Caso GABO'S

## Actividad 4: Operacionalizar la eficiencia

**Variable dependiente:** Eficiencia del proceso de agendamiento: grado en que una operación se completa correctamente utilizando menor tiempo y esfuerzo humano, sin incrementar errores ni reprocesos.

| Operación | Inicio | Final | Indicadores seleccionados |
| :--- | :--- | :--- | :--- |
| **Consultar disponibilidad** | El usuario accede a la vista de calendario general o selecciona el perfil de un fisioterapeuta específico. | El usuario visualiza claramente los bloques horarios libres y ocupados en la pantalla. | **Éxito:** Encuentra un horario libre sin asistencia.<br>**Acciones:** Número de clics o desplazamientos para cambiar de semana/mes.<br>**Errores:** Intentar seleccionar una fecha pasada o no notar con qué especialista está filtrando. |
| **Registrar una cita** | El usuario hace clic sobre un bloque de horario disponible e inicia el formulario de reserva. | El sistema muestra un mensaje de confirmación visible y la cita aparece bloqueada en la agenda central. | **Éxito:** Cita guardada en la base de datos sin duplicidad.<br>**Acciones:** Campos de texto completados y clics en botones de acción.<br>**Errores:** Omitir datos obligatorios, o agendar en un horario recién ocupado (conflicto de concurrencia). |
| **Modificar una cita** | El usuario abre el detalle de una cita existente desde la vista de agenda. | El sistema confirma el cambio de datos (ej. motivo de consulta) y actualiza la tarjeta de la cita. | **Éxito:** Datos actualizados sin alterar la fecha u hora accidentalmente.<br>**Acciones:** Edición de campos y guardado exitoso.<br>**Errores:** Descartar cambios sin querer por falta de advertencias antes de cerrar la ventana. |
| **Cancelar una cita** | El usuario selecciona la opción "Cancelar" dentro de los detalles de una cita activa. | El sistema pide confirmación, elimina la cita de la agenda y libera el horario inmediatamente. | **Éxito:** El espacio vuelve a estar disponible para todos los usuarios.<br>**Acciones:** Clic en cancelar y confirmación en el cuadro de diálogo.<br>**Errores:** Cancelar la cita equivocada por falta de contraste o información poco clara. |
| **Reagendar una cita** | El usuario selecciona la opción de reagendar o arrastra la tarjeta de la cita a un nuevo horario. | La cita se traslada a la nueva fecha/hora y el espacio anterior queda liberado. | **Éxito:** Traslado del paciente sin perder su historial o motivo de consulta.<br>**Acciones:** Selección de nueva fecha y confirmación.<br>**Errores:** Duplicar la cita en lugar de moverla, o moverla a un horario ocupado. |
## Actividad 7: Proponer la validación

**Protocolo para ejecutar tareas con usuarios representativos:**
*   Encontrar un horario disponible.
*   Registrar una cita.
*   Cambiar la fecha o el fisioterapeuta.
*   Cancelar la cita.
*   Agendar nuevamente después de una cancelación.

| Participante | Tarea | Éxito (S/N) | Tiempo | Acciones observables | Intervención | Errores comunes observados |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **P1** | Encontrar un horario disponible y registrar una cita. | S | 1m 20s | Clics hasta guardar, uso de filtros por especialista. | Veces que solicita ayuda o se detiene a preguntar. | Selecciona el especialista equivocado; omite campos obligatorios. |
| **P2** | Cambiar la fecha o el fisioterapeuta de una cita ya existente. | S | 0m 45s | Uso de opciones de edición o arrastrar y soltar (drag & drop). | Ayuda necesaria para ubicar el botón de edición. | Crea una cita nueva en lugar de modificar la existente; genera solapamiento. |
| **P3** | Cancelar la cita y agendar nuevamente después de la cancelación. | S | 1m 15s | Interacción con cuadros de confirmación y liberación de estado. | Aclaraciones sobre si el horario realmente quedó libre. | Cancela sin leer la advertencia; el horario antiguo no aparece disponible al reagendar. |