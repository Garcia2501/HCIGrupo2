# Requerimientos y Recomendación Final - Caso GABO'S

## Actividad 2: Identificar usuarios y necesidades

| Usuario | Objetivo | Necesidad | Dificultad actual |
| :--- | :--- | :--- | :--- |
| **Paciente** | Agendar, modificar o cancelar una cita de fisioterapia rápidamente. | Conocer la disponibilidad real de horarios de su fisioterapeuta preferido de forma clara y oportuna. | Depende de los tiempos de respuesta por WhatsApp; riesgo de mensajes perdidos o solapamiento de turnos. |
| **Fisioterapeuta** | Atender a los pacientes programados sin interrupciones y gestionar su tiempo clínico. | Tener una vista consolidada, actualizada y sin conflictos de su agenda diaria/semanal. | La información fragmentada causa desinformación sobre cancelaciones de última hora o tiempos muertos. |
| **Personal administrativo** | Coordinar eficientemente los horarios entre los 5 fisioterapeutas y los pacientes. | Una herramienta centralizada que prevenga conflictos, actualice estados en tiempo real y reduzca la carga manual. | Sobrecarga cognitiva y trabajo manual repetitivo al transcribir mensajes a la agenda física; alta propensión al error. |
| **Administrador del centro** | Analizar el rendimiento de GABO'S y optimizar la ocupación del centro. | Indicadores consolidados sobre citas atendidas, canceladas y nivel de demanda por especialista. | Imposibilidad de obtener métricas automáticas, ya que los datos están atrapados en agendas físicas y chats informales. |

## Actividad 8: Emitir una recomendación

Tras analizar las necesidades de los usuarios, los indicadores de eficiencia operativa y la factibilidad técnica en el contexto de GABO'S Readaptación y Movimiento, se recomienda implementar un **Mecanismo Híbrido** (autoagendamiento para casos estándar, con soporte administrativo para excepciones).

Esta decisión se sustenta en evidencias concretas de usabilidad y eficiencia (HCI):

* **Reducción del esfuerzo administrativo:** Al delegar el agendamiento estándar al paciente, se elimina el cuello de botella de la transcripción manual (WhatsApp a Agenda física). Esto reduce drásticamente el tiempo total de confirmación.
* **Prevención de errores:** Al centralizar la información en una plataforma digital y eliminar el doble ingreso de datos, se previenen los conflictos de horarios y los solapamientos entre los 5 fisioterapeutas.
* **Accesibilidad y Factibilidad:** El enfoque híbrido es el más factible culturalmente para el centro. Los pacientes digitalizados tendrán el control directo, mientras que los pacientes menos tecnológicos podrán seguir solicitando citas por WhatsApp, las cuales el personal ingresará al mismo sistema.
* **Visibilidad de métricas:** Resuelve directamente la necesidad del Administrador, permitiendo que la interacción diaria genere automáticamente los indicadores consolidados.
