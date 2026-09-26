/*
    Usability Test Dashboard 2.0
    Esquema relacional inicial para SQL Server.

    Seleccione la base de datos destino antes de ejecutar este script.
    Es idempotente para una instalación limpia o para volver a ejecutarlo:
    crea cada tabla/índice únicamente si aún no existe.
*/

SET NOCOUNT ON;
GO

/* Un usuario puede crear varias pruebas de usabilidad. */
IF OBJECT_ID(N'dbo.Usuarios', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Usuarios
    (
        UsuarioId       INT IDENTITY(1,1) NOT NULL,
        Nombre          NVARCHAR(150) NOT NULL,
        Correo          NVARCHAR(254) NOT NULL,
        FechaRegistro   DATETIME2(3) NOT NULL
            CONSTRAINT DF_Usuarios_FechaRegistro DEFAULT (SYSUTCDATETIME()),

        CONSTRAINT PK_Usuarios PRIMARY KEY CLUSTERED (UsuarioId),
        CONSTRAINT UQ_Usuarios_Correo UNIQUE (Correo),
        CONSTRAINT CK_Usuarios_Nombre_NoVacio
            CHECK (LEN(LTRIM(RTRIM(Nombre))) > 0),
        CONSTRAINT CK_Usuarios_Correo_NoVacio
            CHECK (LEN(LTRIM(RTRIM(Correo))) > 0)
    );
END;
GO

/* Cada prueba pertenece a un usuario evaluador. */
IF OBJECT_ID(N'dbo.PruebasUsabilidad', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.PruebasUsabilidad
    (
        PruebaId        INT IDENTITY(1,1) NOT NULL,
        UsuarioId       INT NOT NULL,
        Titulo          NVARCHAR(200) NOT NULL,
        Descripcion     NVARCHAR(2000) NULL,
        FechaCreacion   DATETIME2(3) NOT NULL
            CONSTRAINT DF_PruebasUsabilidad_FechaCreacion DEFAULT (SYSUTCDATETIME()),

        CONSTRAINT PK_PruebasUsabilidad PRIMARY KEY CLUSTERED (PruebaId),
        CONSTRAINT CK_PruebasUsabilidad_Titulo_NoVacio
            CHECK (LEN(LTRIM(RTRIM(Titulo))) > 0),
        CONSTRAINT FK_PruebasUsabilidad_Usuarios
            FOREIGN KEY (UsuarioId)
            REFERENCES dbo.Usuarios (UsuarioId)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
    );
END;
GO

/* Cada tarea forma parte de una prueba de usabilidad. */
IF OBJECT_ID(N'dbo.TareasPrueba', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.TareasPrueba
    (
        TareaId         INT IDENTITY(1,1) NOT NULL,
        PruebaId        INT NOT NULL,
        TituloTarea     NVARCHAR(200) NOT NULL,
        Descripcion     NVARCHAR(2000) NULL,

        CONSTRAINT PK_TareasPrueba PRIMARY KEY CLUSTERED (TareaId),
        CONSTRAINT CK_TareasPrueba_Titulo_NoVacio
            CHECK (LEN(LTRIM(RTRIM(TituloTarea))) > 0),
        CONSTRAINT FK_TareasPrueba_PruebasUsabilidad
            FOREIGN KEY (PruebaId)
            REFERENCES dbo.PruebasUsabilidad (PruebaId)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
    );
END;
GO

/* Cada observación se asocia a una tarea específica evaluada. */
IF OBJECT_ID(N'dbo.Observaciones', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Observaciones
    (
        ObservacionId       INT IDENTITY(1,1) NOT NULL,
        TareaId             INT NOT NULL,
        DetalleObservacion  NVARCHAR(MAX) NOT NULL,
        TipoHallazgo        NVARCHAR(50) NOT NULL
            CONSTRAINT DF_Observaciones_TipoHallazgo DEFAULT (N'General'),
        FechaCreacion       DATETIME2(3) NOT NULL
            CONSTRAINT DF_Observaciones_FechaCreacion DEFAULT (SYSUTCDATETIME()),

        CONSTRAINT PK_Observaciones PRIMARY KEY CLUSTERED (ObservacionId),
        CONSTRAINT CK_Observaciones_Detalle_NoVacio
            CHECK (LEN(LTRIM(RTRIM(DetalleObservacion))) > 0),
        CONSTRAINT CK_Observaciones_TipoHallazgo_NoVacio
            CHECK (LEN(LTRIM(RTRIM(TipoHallazgo))) > 0),
        CONSTRAINT FK_Observaciones_TareasPrueba
            FOREIGN KEY (TareaId)
            REFERENCES dbo.TareasPrueba (TareaId)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
    );
END;
GO

/* Las historias generadas pertenecen a la prueba analizada. */
IF OBJECT_ID(N'dbo.HistoriasUsuario', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.HistoriasUsuario
    (
        HistoriaUsuarioId   INT IDENTITY(1,1) NOT NULL,
        PruebaId            INT NOT NULL,
        Titulo              NVARCHAR(200) NOT NULL,
        DescripcionGherkin  NVARCHAR(MAX) NOT NULL,
        StoryPoints         SMALLINT NULL,
        Estado              NVARCHAR(30) NOT NULL
            CONSTRAINT DF_HistoriasUsuario_Estado DEFAULT (N'Pendiente de revisión'),
        FechaCreacion       DATETIME2(3) NOT NULL
            CONSTRAINT DF_HistoriasUsuario_FechaCreacion DEFAULT (SYSUTCDATETIME()),

        CONSTRAINT PK_HistoriasUsuario PRIMARY KEY CLUSTERED (HistoriaUsuarioId),
        CONSTRAINT CK_HistoriasUsuario_Titulo_NoVacio
            CHECK (LEN(LTRIM(RTRIM(Titulo))) > 0),
        CONSTRAINT CK_HistoriasUsuario_Gherkin_NoVacio
            CHECK (LEN(LTRIM(RTRIM(DescripcionGherkin))) > 0),
        CONSTRAINT CK_HistoriasUsuario_StoryPoints_Positivos
            CHECK (StoryPoints IS NULL OR StoryPoints > 0),
        CONSTRAINT CK_HistoriasUsuario_Estado_NoVacio
            CHECK (LEN(LTRIM(RTRIM(Estado))) > 0),
        CONSTRAINT FK_HistoriasUsuario_PruebasUsabilidad
            FOREIGN KEY (PruebaId)
            REFERENCES dbo.PruebasUsabilidad (PruebaId)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
    );
END;
GO

/* Índices para las búsquedas y uniones por llaves foráneas. */
IF NOT EXISTS
(
    SELECT 1
    FROM sys.indexes
    WHERE name = N'IX_PruebasUsabilidad_UsuarioId'
      AND object_id = OBJECT_ID(N'dbo.PruebasUsabilidad')
)
BEGIN
    CREATE INDEX IX_PruebasUsabilidad_UsuarioId
        ON dbo.PruebasUsabilidad (UsuarioId);
END;
GO

IF NOT EXISTS
(
    SELECT 1
    FROM sys.indexes
    WHERE name = N'IX_TareasPrueba_PruebaId'
      AND object_id = OBJECT_ID(N'dbo.TareasPrueba')
)
BEGIN
    CREATE INDEX IX_TareasPrueba_PruebaId
        ON dbo.TareasPrueba (PruebaId);
END;
GO

IF NOT EXISTS
(
    SELECT 1
    FROM sys.indexes
    WHERE name = N'IX_Observaciones_TareaId'
      AND object_id = OBJECT_ID(N'dbo.Observaciones')
)
BEGIN
    CREATE INDEX IX_Observaciones_TareaId
        ON dbo.Observaciones (TareaId);
END;
GO

IF NOT EXISTS
(
    SELECT 1
    FROM sys.indexes
    WHERE name = N'IX_HistoriasUsuario_PruebaId'
      AND object_id = OBJECT_ID(N'dbo.HistoriasUsuario')
)
BEGIN
    CREATE INDEX IX_HistoriasUsuario_PruebaId
        ON dbo.HistoriasUsuario (PruebaId);
END;
GO
