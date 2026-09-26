# Contexto del proyecto: Usability Test Dashboard 2.0

## Propósito

Construir una plataforma web para evaluadores UX que permita cargar imágenes o bocetos de interfaces y observaciones de pruebas de usabilidad. La IA analizará esa información para generar historias de usuario para el Product Backlog.

## Equipo y trabajo ágil

- Luis: Product Owner; prioriza el Product Backlog, define historias y valida la usabilidad.
- Kevin: Scrum Master; facilita ceremonias, mantiene Trello y ayuda a eliminar bloqueos.
- Manolo y Ariel: Development Team; trabajan en arquitectura, API, frontend, base de datos e integración de IA.
- Sprint 1: 23–30 de septiembre de 2026; capacidad total comunicada: 32 horas de equipo.
- Elementos en progreso: RF-01 (subida de bocetos) y RNF-01 (respuesta de IA menor a 10 s).
- Las estimaciones 5 SP para RF-01 y 8 SP para RNF-01 son propuestas, no estimaciones aprobadas; validarlas con el Development Team.

## Definition of Done del Sprint 1

Recopilar las evidencias solicitadas en PNG: User Persona y Journey Map (Miro/FigJam), mockups con jerarquía visual (Figma), User Flow (Figma/Miro), Sprint Backlog en Trello, repositorio GitHub funcional con código y documentación, y proyecto base organizado en VS Code.

## Stack y artefactos

- Base de datos considerada: SQL Server.
- Backend tentativo: .NET 8 y Entity Framework Core; confirmar la decisión con el equipo.
- Diseño: Figma y Miro/FigJam.
- La documentación y el DDL del proyecto se mantienen en `Proyecto/documentacion.tex` y `Proyecto/database.sql`.
- Al redactar criterios, usar español profesional y Gherkin (Dado/Cuando/Entonces). No inventar decisiones pendientes; marcarlas para validación del PO o del equipo.

## Alcance de este repositorio

El usuario indicó que el `README.md`, `APE_1/` y los demás archivos heredados que ya existían en la raíz corresponden a otro trabajo. Ignóralos como fuente y no los modifiques. Todo archivo nuevo o cambio del proyecto Usability Test Dashboard 2.0 debe ubicarse dentro de `Proyecto/`, salvo que el usuario indique lo contrario.
