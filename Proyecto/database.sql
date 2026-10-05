USE UsabilityDashboard;
GO

SET NOCOUNT ON;
GO

/* =========================================================
   1. ENTIDADES DEL SPRINT 1 (Tu código original intacto)
   ========================================================= */

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
        CONSTRAINT CK_Usuarios_Nombre_NoVacio CHECK (LEN(LTRIM(RTRIM(Nombre))) > 0),
        CONSTRAINT CK_Usuarios_Correo_NoVacio CHECK (LEN(LTRIM(RTRIM(Correo))) > 0)
    );
END;
GO

/* Cada prueba pertenece a un usuario evaluador. */
IF OBJECT_ID(N'dbo.PruebasUsabilidad', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.PruebasUsabilidad
    (
        IdPrueba        INT IDENTITY(1,1) NOT NULL,
        UsuarioId       INT NOT NULL,
        Titulo          NVARCHAR(200) NOT NULL,
        Descripcion     NVARCHAR(2000) NULL,
        FechaCreacion   DATETIME2(3) NOT NULL
            CONSTRAINT DF_PruebasUsabilidad_FechaCreacion DEFAULT (SYSUTCDATETIME()),

        CONSTRAINT PK_PruebasUsabilidad PRIMARY KEY CLUSTERED (IdPrueba),
        CONSTRAINT CK_PruebasUsabilidad_Titulo_NoVacio CHECK (LEN(LTRIM(RTRIM(Titulo))) > 0),
        CONSTRAINT FK_PruebasUsabilidad_Usuarios
            FOREIGN KEY (UsuarioId) REFERENCES dbo.Usuarios (UsuarioId)
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
        CONSTRAINT CK_TareasPrueba_Titulo_NoVacio CHECK (LEN(LTRIM(RTRIM(TituloTarea))) > 0),
        CONSTRAINT FK_TareasPrueba_PruebasUsabilidad
            FOREIGN KEY (PruebaId) REFERENCES dbo.PruebasUsabilidad (IdPrueba)
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
        CONSTRAINT CK_Observaciones_Detalle_NoVacio CHECK (LEN(LTRIM(RTRIM(DetalleObservacion))) > 0),
        CONSTRAINT FK_Observaciones_TareasPrueba
            FOREIGN KEY (TareaId) REFERENCES dbo.TareasPrueba (TareaId)
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
        CONSTRAINT FK_HistoriasUsuario_PruebasUsabilidad
            FOREIGN KEY (PruebaId) REFERENCES dbo.PruebasUsabilidad (IdPrueba)
    );
END;
GO

/* =========================================================
   2. NUEVA ENTIDAD SPRINT 2 (RF-01) - Adaptada a tu estándar
   ========================================================= */

IF OBJECT_ID(N'dbo.Bocetos', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Bocetos
    (
        IdBoceto            INT IDENTITY(1,1) NOT NULL,
        IdPrueba            INT NOT NULL,
        NombreArchivo       NVARCHAR(255) NOT NULL,
        Formato             NVARCHAR(10) NOT NULL,
        PesoMB              DECIMAL(5,2) NOT NULL,
        RutaAlmacenamiento  NVARCHAR(500) NOT NULL,
        FechaCarga          DATETIME2(3) NOT NULL
            CONSTRAINT DF_Bocetos_FechaCarga DEFAULT (SYSUTCDATETIME()),

        CONSTRAINT PK_Bocetos PRIMARY KEY CLUSTERED (IdBoceto),
        CONSTRAINT CK_Bocetos_Nombre_NoVacio CHECK (LEN(LTRIM(RTRIM(NombreArchivo))) > 0),
        CONSTRAINT FK_Bocetos_PruebasUsabilidad
            FOREIGN KEY (IdPrueba) REFERENCES dbo.PruebasUsabilidad (IdPrueba)
            ON DELETE CASCADE
    );
END;
GO

/* =========================================================
   3. ÍNDICES (Originales + el nuevo para Bocetos)
   ========================================================= */
IF COL_LENGTH(N'dbo.PruebasUsabilidad', N'UsuarioId') IS NOT NULL
   AND NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'IX_PruebasUsabilidad_UsuarioId' AND object_id = OBJECT_ID(N'dbo.PruebasUsabilidad'))
    CREATE INDEX IX_PruebasUsabilidad_UsuarioId ON dbo.PruebasUsabilidad (UsuarioId);
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'IX_TareasPrueba_PruebaId' AND object_id = OBJECT_ID(N'dbo.TareasPrueba'))
    CREATE INDEX IX_TareasPrueba_PruebaId ON dbo.TareasPrueba (PruebaId);
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'IX_Observaciones_TareaId' AND object_id = OBJECT_ID(N'dbo.Observaciones'))
    CREATE INDEX IX_Observaciones_TareaId ON dbo.Observaciones (TareaId);
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'IX_HistoriasUsuario_PruebaId' AND object_id = OBJECT_ID(N'dbo.HistoriasUsuario'))
    CREATE INDEX IX_HistoriasUsuario_PruebaId ON dbo.HistoriasUsuario (PruebaId);
GO

-- Nuevo índice para acelerar búsquedas de imágenes por prueba
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'IX_Bocetos_IdPrueba' AND object_id = OBJECT_ID(N'dbo.Bocetos'))
    CREATE INDEX IX_Bocetos_IdPrueba ON dbo.Bocetos (IdPrueba);
GO
