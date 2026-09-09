# Análisis del Proceso Actual y Comparación de Mecanismos

**Integrante:** Garcia Amores Manolo Jose  
**Rol:** Backend  
**Asignatura:** Interacción Humano/Computador  
**Caso:** GABO'S Readaptación y Movimiento  

---

## Actividad 1: Análisis del proceso actual (AS-IS)

### Actores e información del proceso

El proceso actual de gestión de citas en GABO'S Readaptación y Movimiento involucra los siguientes actores principales:

| Actor | Rol en el proceso |
|:---|:---|
| **Paciente** | Inicia el proceso enviando un mensaje por WhatsApp solicitando una cita con un fisioterapeuta específico o con disponibilidad general. |
| **Personal administrativo** | Recibe la solicitud, consulta la agenda física, coordina con el fisioterapeuta correspondiente y confirma la cita al paciente. |
| **Fisioterapeuta** | Informa verbalmente su disponibilidad al personal administrativo; no interactúa directamente con el sistema. |
| **Administrador del centro** | Supervisa el rendimiento general sin acceso a indicadores consolidados, dependiendo de reportes manuales. |

La información que circula en el proceso incluye: nombre del paciente, motivo de consulta, preferencia de horario, disponibilidad del fisioterapeuta y estado de la cita (confirmada, cancelada, reagendada). Esta información se fragmenta entre WhatsApp y la agenda física, sin un registro centralizado.

---

### Flujo actual de agendamiento (AS-IS)

| Paso | Acción actual | Medio |
|:---:|:---|:---|
| 1 | El paciente solicita una cita. | WhatsApp |
| 2 | El personal revisa los mensajes y consulta disponibilidad. | WhatsApp y agenda física |
| 3 | Se coordina el horario con el fisioterapeuta. | Conversación o revisión manual |
| 4 | La cita se registra y se confirma al paciente. | Agenda física y WhatsApp |
| 5 | Los cambios o cancelaciones se procesan manualmente. | WhatsApp y agenda física |

---

### Puntos de fricción identificados

El análisis del flujo AS-IS revela múltiples fricciones que afectan la eficiencia, consistencia y retroalimentación del proceso:

- **Esperas no controladas:** El paciente envía su solicitud por WhatsApp y no recibe respuesta inmediata. El tiempo de espera depende de la disponibilidad del personal, lo cual puede extenderse de minutos a horas, sin que el paciente tenga visibilidad del estado de su solicitud.

- **Transcripción manual y doble ingreso de datos:** Cada cita confirmada requiere ser trasladada del chat de WhatsApp a la agenda física. Esta transcripción introduce riesgo de errores tipográficos (nombre incorrecto, horario equivocado) y representa una acción duplicada que no agrega valor al proceso.

- **Acciones duplicadas y solapamiento:** Al gestionar cinco fisioterapeutas con una agenda física única, el personal puede asignar el mismo horario a dos pacientes distintos si la consulta se realiza sin verificación simultánea, generando conflictos de programación.

- **Errores por falta de trazabilidad:** Los cambios y cancelaciones por WhatsApp no siempre se reflejan de forma inmediata en la agenda física. Esto provoca que el fisioterapeuta espere a un paciente que ya canceló, o que un horario liberado no se ofrezca oportunamente.

- **Problemas de retroalimentación y visibilidad:** El paciente no puede consultar el estado de su cita sin volver a escribir al personal. No existe notificación automática de confirmación, recordatorio previo ni alerta de cancelación, lo que incrementa las inasistencias y reprogramaciones de último momento.

- **Inconsistencia de la información:** Al existir dos repositorios de datos (WhatsApp y agenda física) sin sincronización automática, el estado real de la agenda queda ambiguo y dependiente de la memoria del personal administrativo.

---

### Factores humanos y tecnológicos

#### 🧠 Factores humanos

**1. Sobrecarga cognitiva del personal administrativo**

El personal debe mantener en memoria activa múltiples solicitudes simultáneas por WhatsApp, al tiempo que consulta y actualiza la agenda física. Según los principios de IHC, un sistema que exige retener más de **7 ± 2 elementos** en memoria de trabajo de manera continua es inherentemente propenso al fallo humano. Esta carga aumenta la probabilidad de errores, especialmente en horarios de alta demanda.

**2. Ausencia de retroalimentación para el paciente**

El paciente carece de confirmación visible e inmediata de que su solicitud fue recibida y procesada. Esta falta de visibilidad del estado del sistema genera incertidumbre, reenvíos innecesarios e insatisfacción con el servicio, afectando negativamente la experiencia de uso.

#### 💻 Factores tecnológicos

**1. Fragmentación de herramientas sin integración**

El proceso combina WhatsApp (no diseñada para gestión de citas) con una agenda física (sin sincronización digital). Esta fragmentación impide la automatización de validaciones, la generación de recordatorios y la consulta de disponibilidad en tiempo real, imposibilitando la trazabilidad y las métricas de desempeño.

**2. Imposibilidad de escalar sin reprocesos**

El modelo escala linealmente en esfuerzo humano: a mayor demanda, más tiempo dedicado a transcripciones manuales. La ausencia de validaciones automatizadas (ej. no permitir doble asignación de un horario) representa una debilidad crítica desde el punto de vista de la ingeniería de software y la IHC.

---

## Actividad 3: Comparación de mecanismos de agendamiento

Se analizan cuatro mecanismos alternativos al proceso actual, evaluados según los criterios del enunciado: tiempo de confirmación, intervención humana, prevención de conflictos, accesibilidad, factibilidad técnica y compatibilidad con los cinco fisioterapeutas.

---

### Mecanismo 1 — Agenda Digital Interna

> El personal registra y gestiona todas las citas en un calendario web centralizado (ej. Google Calendar), sin intervención directa del paciente.

| | |
|:---|:---|
| **Tiempo de confirmación** | Medio — sigue dependiendo de la disponibilidad del personal |
| **Intervención humana** | Alta — el personal recibe solicitudes por WhatsApp y las transcribe al sistema |
| **Prevención de conflictos** | Parcial — el sistema puede alertar duplicados pero el ingreso manual persiste |
| **Accesibilidad** | Media — el paciente sigue usando WhatsApp como siempre |
| **Factibilidad técnica** | Alta — bajo costo, herramientas existentes (Google Calendar, etc.) |

**✔ Ventajas:** Centraliza la información · Elimina la agenda física · Vista consolidada por fisioterapeuta  
**✘ Limitaciones:** No elimina la transcripción manual · Persiste la sobrecarga cognitiva · No reduce el tiempo de respuesta al paciente

---

### Mecanismo 2 — Solicitud con Confirmación

> El paciente envía su solicitud mediante un formulario digital (ej. Google Forms). El personal la recibe estructurada, la evalúa y la confirma manualmente en el sistema.

| | |
|:---|:---|
| **Tiempo de confirmación** | Medio — requiere revisión y respuesta manual del personal |
| **Intervención humana** | Alta — el personal sigue siendo el paso final de confirmación |
| **Prevención de conflictos** | Parcial — la información llega ordenada pero no se valida automáticamente |
| **Accesibilidad** | Media — requiere que el paciente use un formulario web |
| **Factibilidad técnica** | Alta — Google Forms u otras soluciones gratuitas |

**✔ Ventajas:** Elimina mensajes no estructurados · Reduce errores de transcripción · Bajo costo de implementación  
**✘ Limitaciones:** Tiempo de confirmación aún lento · Sin prevención automática de conflictos · Excluye pacientes con baja alfabetización digital

---

### Mecanismo 3 — Autoagendamiento

> El paciente accede a una plataforma digital y selecciona directamente un horario disponible del fisioterapeuta de su elección, sin intervención del personal para la reserva estándar.

| | |
|:---|:---|
| **Tiempo de confirmación** | **Bajo** — confirmación inmediata (segundos) |
| **Intervención humana** | **Mínima** — solo para excepciones complejas |
| **Prevención de conflictos** | **Automática** — el sistema bloquea horarios ya ocupados |
| **Accesibilidad** | Media — requiere smartphone e internet |
| **Factibilidad técnica** | Media — requiere desarrollo o contratación de plataforma |

**✔ Ventajas:** Eliminación total del cuello de botella administrativo · Métricas y trazabilidad automática · Escalable  
**✘ Limitaciones:** Mayor inversión inicial · Excluye pacientes sin acceso digital · Sin gestión de excepciones si no hay respaldo humano

---

### Mecanismo 4 — Híbrido ⭐ (Seleccionado)

> Los casos estándar se gestionan mediante autoagendamiento. Las excepciones (primera consulta, horarios especiales, pacientes sin acceso digital) son asistidas por el personal, quien las ingresa directamente al sistema centralizado.

| | |
|:---|:---|
| **Tiempo de confirmación** | **Bajo** — inmediato para casos estándar, asistido para excepciones |
| **Intervención humana** | **Parcial** — solo cuando el paciente lo necesita |
| **Prevención de conflictos** | **Automática** — independientemente del canal de entrada |
| **Accesibilidad** | **Alta** — inclusivo: digital y asistido disponibles |
| **Factibilidad técnica** | Media — requiere planificación inicial y capacitación |

**✔ Ventajas:** Combina eficiencia y flexibilidad · Inclusivo · Centraliza toda la información · Genera indicadores automáticos · Compatible con 5 fisioterapeutas  
**✘ Limitaciones:** Mayor configuración inicial · Requiere capacitación del personal · Depende de que los fisioterapeutas mantengan su agenda actualizada

---

### Matriz de decisión final

| Criterio | AS-IS | Agenda Digital | Solicitud/Conf. | Autoagend. | **Híbrido** |
|:---|:---:|:---:|:---:|:---:|:---:|
| Tiempo total de confirmación | 🔴 Alto | 🟡 Medio | 🟡 Medio | 🟢 Bajo | 🟢 **Bajo** |
| Intervención humana necesaria | 🔴 Total | 🔴 Alta | 🔴 Alta | 🟢 Mínima | 🟡 **Parcial** |
| Prevención de conflictos | 🔴 Nula | 🟡 Parcial | 🟡 Parcial | 🟢 Automática | 🟢 **Automática** |
| Accesibilidad / Inclusión | 🟡 Alta* | 🟡 Media | 🟡 Media | 🟡 Media | 🟢 **Alta** |
| Generación de métricas | 🔴 Nula | 🟡 Parcial | 🟡 Parcial | 🟢 Completa | 🟢 **Completa** |
| Factibilidad técnica | — | 🟢 Alta | 🟢 Alta | 🟡 Media | 🟡 **Media** |
| Compatibilidad con 5 fisioterapeutas | 🔴 Baja | 🟡 Media | 🟡 Media | 🟢 Alta | 🟢 **Alta** |

> *Alta solo por ser el canal conocido, no por diseño inclusivo deliberado.

### ✅ Mecanismo seleccionado: Híbrido

El **mecanismo híbrido** es la alternativa con el mayor equilibrio entre eficiencia operativa, inclusión del paciente y factibilidad técnica para el contexto de GABO'S. Reduce el tiempo de confirmación al nivel del autoagendamiento para la mayoría de casos, mantiene un canal asistido para excepciones, centraliza toda la información y genera indicadores de desempeño automáticamente, resolviendo directamente las fricciones críticas detectadas en el flujo AS-IS.
