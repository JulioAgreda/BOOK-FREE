USE [master]
GO
/****** Object:  Database [dbBiblioteca]    Script Date: 12/04/2017 18:22:21 ******/
CREATE DATABASE [dbBiblioteca] ON  PRIMARY 
( NAME = N'dbBiblioteca', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\dbBiblioteca.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbBiblioteca_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\dbBiblioteca_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbBiblioteca] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbBiblioteca].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbBiblioteca] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [dbBiblioteca] SET ANSI_NULLS OFF
GO
ALTER DATABASE [dbBiblioteca] SET ANSI_PADDING OFF
GO
ALTER DATABASE [dbBiblioteca] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [dbBiblioteca] SET ARITHABORT OFF
GO
ALTER DATABASE [dbBiblioteca] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [dbBiblioteca] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [dbBiblioteca] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [dbBiblioteca] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [dbBiblioteca] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [dbBiblioteca] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [dbBiblioteca] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [dbBiblioteca] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [dbBiblioteca] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [dbBiblioteca] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [dbBiblioteca] SET  DISABLE_BROKER
GO
ALTER DATABASE [dbBiblioteca] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [dbBiblioteca] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [dbBiblioteca] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [dbBiblioteca] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [dbBiblioteca] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [dbBiblioteca] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [dbBiblioteca] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [dbBiblioteca] SET  READ_WRITE
GO
ALTER DATABASE [dbBiblioteca] SET RECOVERY FULL
GO
ALTER DATABASE [dbBiblioteca] SET  MULTI_USER
GO
ALTER DATABASE [dbBiblioteca] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [dbBiblioteca] SET DB_CHAINING OFF
GO
USE [dbBiblioteca]
GO
/****** Object:  Table [dbo].[tblCategoria]    Script Date: 12/04/2017 18:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategoria](
	[categoriaID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](250) NULL,
	[descripcion] [nvarchar](250) NULL,
	[estado] [nchar](10) NULL,
 CONSTRAINT [PK_tblCategoria] PRIMARY KEY CLUSTERED 
(
	[categoriaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAutor]    Script Date: 12/04/2017 18:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAutor](
	[autorId] [int] IDENTITY(1,1) NOT NULL,
	[nombreCompleto] [nvarchar](250) NULL,
	[estado] [nchar](10) NULL,
 CONSTRAINT [PK_tblAutor] PRIMARY KEY CLUSTERED 
(
	[autorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsuario]    Script Date: 12/04/2017 18:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsuario](
	[usuarioId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[apellido] [nvarchar](50) NULL,
	[email] [nvarchar](150) NULL,
	[contraseña] [nvarchar](15) NULL,
	[tipoUsuario] [nvarchar](15) NULL,
	[estado] [nvarchar](15) NULL,
	[estadoActual] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblUsuario] PRIMARY KEY CLUSTERED 
(
	[usuarioId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPermiso]    Script Date: 12/04/2017 18:22:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPermiso](
	[permisoId] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](250) NULL,
	[estado] [nchar](10) NULL,
 CONSTRAINT [PK_tblPermiso] PRIMARY KEY CLUSTERED 
(
	[permisoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_PERM_GetPermisosByDescription]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 12/10/2017
-- Description:	Obtener Permisos por Descripción
-- =============================================
CREATE PROCEDURE [dbo].[usp_PERM_GetPermisosByDescription]
	@varDescripcion  VARCHAR(45)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [PermisosId]
      ,[descripcion]
    FROM [dbo].[tbl_Permisos]
	WHERE [descripcion] = @varDescripcion;

END
GO
/****** Object:  StoredProcedure [dbo].[usp_PERM_GetPermisos]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 09/10/2017
-- Description:	Obtener Todos los permisos
-- =============================================
CREATE PROCEDURE [dbo].[usp_PERM_GetPermisos] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [PermisosId],
		[descripcion]
	FROM [dbo].[tbl_Permisos]


END
GO
/****** Object:  StoredProcedure [dbo].[usp_Usuario_UpdateUsuario]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Modificar Usuario
-- =============================================
CREATE PROCEDURE [dbo].[usp_Usuario_UpdateUsuario]
	@varNombre		NVARCHAR(50),
	@varApellido	NVARCHAR(50),
	
	@usuarioId INT
AS
BEGIN
	
	SET NOCOUNT ON;

	UPDATE [dbo].[tblUsuario]
	SET [nombre] = @varNombre,
		[apellido] = @varApellido
 		
	WHERE [usuarioId] = @usuarioId
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Usuario_UpdateEstadoUsuario]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Modificar Estado de Usuario
-- =============================================
CREATE PROCEDURE [dbo].[usp_Usuario_UpdateEstadoUsuario]
	@varEstadoActual	NVARCHAR(50),	
	@usuarioId INT
AS
BEGIN	
	SET NOCOUNT ON;
	UPDATE [dbo].[tblUsuario]
	SET 
		[estadoActual] = @varEstadoActual 		
	WHERE [usuarioId] = @usuarioId	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Usuario_InsertarUsuario]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 04/10/2017
-- Description:	Inserta un Usuario
-- =============================================
CREATE PROCEDURE [dbo].[usp_Usuario_InsertarUsuario]
	@varNombre		NVARCHAR(50),
	@varApellido	NVARCHAR(50),
	@varEmail		NVARCHAR(150),
	@varContraseña	NVARCHAR(15),
	@varTipoUsuario	NVARCHAR(15),
	@varEstado		NVARCHAR(15),
	@EstadoActual	NVARCHAR(50),
	
	@intUsuarioId		INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[tblUsuario]
           ([nombre]
           ,[apellido]
           ,[email]
           ,[contraseña]
           ,[tipoUsuario]
           ,[estado]
           ,[estadoActual])
     VALUES
           (@varNombre,
            @varApellido,
            @varEmail,
            @varContraseña,
            @varTipoUsuario,
            @varEstado,
            @EstadoActual)
                      
    SET @intUsuarioId = SCOPE_IDENTITY()

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Usuario_GetUsuarioByEmail]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Todo atravez de Correo
-- =============================================
CREATE PROCEDURE [dbo].[usp_Usuario_GetUsuarioByEmail]		
	@email nvarchar(150)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT *	
	FROM [dbo].[tblUsuario]
	WHERE [email] = @email and [estado] = 'activo' and tipoUsuario = 'usuario'
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Usuario_GetUsuarioActivo]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017 
-- Description:	Mostrar Usuario Acivos
-- =============================================
CREATE PROCEDURE [dbo].[usp_Usuario_GetUsuarioActivo]

AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT * 
	FROM [dbo].[tblUsuario]
	WHERE [estado] = 'activo' and estadoActual = 'on'
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Usuario_GetUsuario]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Usuario
-- =============================================
CREATE PROCEDURE [dbo].[usp_Usuario_GetUsuario]

AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT * 
	FROM [dbo].[tblUsuario]
	WHERE [estado] = 'activo' and tipoUsuario = 'usuario'
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Usuario_GetEmailByID]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Email ID
-- =============================================
CREATE PROCEDURE [dbo].[usp_Usuario_GetEmailByID]
		
	@usuarioId INT
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT [email]	
	FROM [dbo].[tblUsuario]
	WHERE [usuarioId] = @usuarioId and [estado] = 'activo'
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Usuario_GetByUserName]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Todo atravez de Nombre
-- =============================================
CREATE PROCEDURE [dbo].[usp_Usuario_GetByUserName]
		
	@nombre nvarchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT *	
	FROM [dbo].[tblUsuario]
	WHERE [nombre] = @nombre and [estado] = 'activo'
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Usuario_GetById]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Usuario por Id
-- =============================================
CREATE PROCEDURE [dbo].[usp_Usuario_GetById]
		
	@usuarioId INT
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT  usuarioId, nombre, apellido
	FROM [dbo].[tblUsuario]
	WHERE [usuarioId] = @usuarioId and [estado] = 'activo'
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Usuario_GetAdminByEmail]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Todo atravez de Correo
-- =============================================
CREATE PROCEDURE [dbo].[usp_Usuario_GetAdminByEmail]		
	@email nvarchar(150)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT *	
	FROM [dbo].[tblUsuario]
	WHERE [email] = @email and [estado] = 'activo' and tipoUsuario = 'admin'
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Usuario_GetAdmin]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Admin
-- =============================================
CREATE PROCEDURE [dbo].[usp_Usuario_GetAdmin]

AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT * 
	FROM [dbo].[tblUsuario]
	WHERE [estado] = 'activo' and tipoUsuario = 'admin'
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Usuario_DeleteUsuario]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Eliminar Usuario
-- =============================================
CREATE PROCEDURE [dbo].[usp_Usuario_DeleteUsuario]
	@intUsuarioId	INT,
	@varEstado		NCHAR(10)
AS
BEGIN
	
	SET NOCOUNT ON;

	UPDATE [dbo].[tblUsuario]
	SET [estado] = @varEstado
	WHERE [usuarioId] = @intUsuarioId
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Permiso_InsertarPermiso]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Permiso por Descripcion
-- =============================================
CREATE PROCEDURE [dbo].[usp_Permiso_InsertarPermiso]

@descripcion	NVARCHAR(250), 
@estado			NCHAR(10),

@permisoId		INT OUTPUT
AS
BEGIN	
	SET NOCOUNT ON;	
	INSERT INTO [dbo].[tblPermiso]
           ([descripcion]
           ,[estado])
     VALUES
           (@descripcion,
            @estado)                      
    SET @permisoId = SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Permiso_GetPermisoByDescripcion]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Permiso por Descripcion
-- =============================================
CREATE PROCEDURE [dbo].[usp_Permiso_GetPermisoByDescripcion]
@descripcion NVARCHAR(250)
AS
BEGIN
	
	SET NOCOUNT ON;	
	SELECT * 
	FROM [dbo].tblPermiso
	WHERE [estado] = 'activo' and descripcion = @descripcion
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Permiso_DeletePermiso]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Eliminar Permiso
-- =============================================
CREATE PROCEDURE [dbo].[usp_Permiso_DeletePermiso]
	@permisoId	INT,
	@varEstado	NCHAR(10)
AS
BEGIN	
	SET NOCOUNT ON;

	UPDATE [dbo].tblPermiso
	SET [estado] = @varEstado
	WHERE permisoId = @permisoId
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Permiso_ActualizarPermiso]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mofidificar Permiso
-- =============================================
CREATE PROCEDURE [dbo].[usp_Permiso_ActualizarPermiso]
	@varDescripcion	NVARCHAR(250),
			
	@permisoId INT
AS
BEGIN	
	SET NOCOUNT ON;

	UPDATE [dbo].tblPermiso
	SET descripcion = @varDescripcion
 		
	WHERE permisoId = @permisoId
	
END
GO
/****** Object:  Table [dbo].[tblLibro]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLibro](
	[LibroId] [int] IDENTITY(1,1) NOT NULL,
	[autorId] [int] NOT NULL,
	[categoriaId] [int] NOT NULL,
	[titulo] [nvarchar](250) NOT NULL,
	[portada] [nvarchar](max) NULL,
	[sinopsis] [nvarchar](max) NULL,
	[estado] [nchar](10) NULL,
 CONSTRAINT [PK_tblLibro] PRIMARY KEY CLUSTERED 
(
	[LibroId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsuarioPermiso]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsuarioPermiso](
	[usuarioPermisoId] [int] IDENTITY(1,1) NOT NULL,
	[usuarioId] [int] NOT NULL,
	[permisoId] [int] NOT NULL,
 CONSTRAINT [PK_tblUsuarioPermiso] PRIMARY KEY CLUSTERED 
(
	[usuarioPermisoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_Autor_GetAllById]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Todos los Autores por Id
-- =============================================
Create PROCEDURE [dbo].[usp_Autor_GetAllById]
	@autorId INT
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT * 
	FROM	tblAutor
	WHERE [estado] = 'activo' and autorId = @autorId
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Autor_GetAll]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Todos los Autores
-- =============================================
CREATE PROCEDURE [dbo].[usp_Autor_GetAll]
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT * 
	FROM	tblAutor
	WHERE [estado] = 'activo'
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Categoria_UpdateCategoria]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Modificar Categoria
-- =============================================
CREATE PROCEDURE [dbo].[usp_Categoria_UpdateCategoria]
	@nombre NVARCHAR(250),	
	@CategoriaId INT
AS
BEGIN	
	SET NOCOUNT ON;
	UPDATE [dbo].tblCategoria		
	SET	   
		nombre = @nombre		   
	WHERE categoriaID =  @CategoriaId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Categoria_InsertarCategoria]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 04/10/2017
-- Description:	Inserta un Categoria
-- =============================================
CREATE PROCEDURE [dbo].[usp_Categoria_InsertarCategoria]
	@varNombre			NVARCHAR(250),
	@varDescripcion		VARCHAR(250),
	@varEstado			NCHAR(10),
	@intCategoriaId		INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[tblCategoria]
           ([nombre]
           ,[descripcion]
           ,[estado])
     VALUES
           (@varNombre,
            @varDescripcion,
            @varEstado)           
    SET @intCategoriaId = SCOPE_IDENTITY()

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Categoria_GetAllByNombre]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Todos los Categoria Por nombre
-- =============================================
CREATE PROCEDURE [dbo].[usp_Categoria_GetAllByNombre]
	@varNombre NVARCHAR(250)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT * 
	FROM	tblCategoria
	WHERE [estado] = 'activo'and nombre like '%'+@varNombre+'%'
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Categoria_GetAllById]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Todos las Categoria por Id
-- =============================================
CREATE PROCEDURE [dbo].[usp_Categoria_GetAllById]
	@categoriaId int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT * 
	FROM	tblCategoria
	WHERE [estado] = 'activo' and categoriaID = @categoriaId
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Categoria_GetAll]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Todos las Categoria
-- =============================================
CREATE PROCEDURE [dbo].[usp_Categoria_GetAll]
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT * 
	FROM	tblCategoria
	WHERE [estado] = 'activo'
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Categoria_EliminarCategoria]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Eliminar Categoria
-- =============================================
CREATE PROCEDURE [dbo].[usp_Categoria_EliminarCategoria]
	@intCategoriaID	INT,
	@varEstado NCHAR(10)
AS
BEGIN
	
	SET NOCOUNT ON;

	UPDATE [dbo].[tblCategoria]
	SET [estado] = @varEstado
	WHERE [categoriaID] = @intCategoriaID
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Autor_UpdateAutor]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Modificar Autor
-- =============================================
CREATE PROCEDURE [dbo].[usp_Autor_UpdateAutor]
	@nombreCompleto NVARCHAR(250),	
	@autorId INT
AS
BEGIN	
	SET NOCOUNT ON;
	UPDATE [dbo].tblAutor		
	SET	   
		nombreCompleto = @nombreCompleto		   
	WHERE autorId =  @autorId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Autor_InsertarAutor]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 04/10/2017
-- Description:	Inserta un Autor
-- =============================================
CREATE PROCEDURE [dbo].[usp_Autor_InsertarAutor]
	@varNombreCompleto	NVARCHAR(250),
	@varEstado			NCHAR(10),
	@intAutorId			INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[tblAutor]
           ([nombreCompleto]
           ,[estado])
     VALUES
           (@varNombreCompleto,
           @varEstado)
           
    SET @intAutorId = SCOPE_IDENTITY()

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Autor_GetAllByNombre]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Todos los Autores Por nombre
-- =============================================
CREATE PROCEDURE [dbo].[usp_Autor_GetAllByNombre]
	@varNombre NVARCHAR(250)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	select l.*
	from tblAutor a, tblLibro l
	where l.autorId = a.autorId and nombreCompleto like '%'+@varNombre+'%'
	
END
GO
/****** Object:  Table [dbo].[tblValoracion]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblValoracion](
	[valoracionID] [int] IDENTITY(1,1) NOT NULL,
	[usuarioId] [int] NULL,
	[libroId] [int] NULL,
	[valor] [int] NULL,
 CONSTRAINT [PK_tblValoracion] PRIMARY KEY CLUSTERED 
(
	[valoracionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLectura]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLectura](
	[lecturaId] [int] IDENTITY(1,1) NOT NULL,
	[usuarioId] [int] NOT NULL,
	[libroId] [int] NOT NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_tblLectura] PRIMARY KEY CLUSTERED 
(
	[lecturaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDescarga]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDescarga](
	[descargaId] [int] IDENTITY(1,1) NOT NULL,
	[usuarioId] [int] NOT NULL,
	[libroId] [int] NOT NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_tblDescarga] PRIMARY KEY CLUSTERED 
(
	[descargaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_Libro_InsertarLibro]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 04/10/2017
-- Description:	Inserta un Libro
-- =============================================
CREATE PROCEDURE [dbo].[usp_Libro_InsertarLibro]
	@varAutorId		int,
	@varCategoriaId	int,
	@varTitulo		NVARCHAR(250),
	@varPortada		NVARCHAR(MAX),
	@varSinopsis	NVARCHAR(MAX),
	@varEstado		NCHAR(10),
	
	@intLibroId		INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[tblLibro]
           ([autorId]
           ,[categoriaId]
           ,[titulo]
           ,[portada]
           ,[sinopsis]
           ,[estado])
     VALUES
           (@varAutorId,
           @varCategoriaId,
           @varTitulo,
           @varPortada,
           @varSinopsis,
           @varEstado)
                      
    SET @intLibroId = SCOPE_IDENTITY()

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Libro_GetLibrosById]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Todos por Id
-- =============================================
CREATE PROCEDURE [dbo].[usp_Libro_GetLibrosById]
	@usuarioId INT
AS
BEGIN	
	SET NOCOUNT ON;	
	SELECT	* 
	FROM	tblLibro
	WHERE	[estado] = 'activo' and libroID = @usuarioId	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Libro_GetLibrosByAutor]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Todos por Autor
-- =============================================
CREATE PROCEDURE [dbo].[usp_Libro_GetLibrosByAutor]
	@autorId INT
AS
BEGIN	
	SET NOCOUNT ON;	
	SELECT	* 
	FROM	tblLibro
	WHERE	[estado] = 'activo' and autorId = @autorId	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Libro_GetAll]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Todos los Libros
-- =============================================
CREATE PROCEDURE [dbo].[usp_Libro_GetAll]
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT * 
	FROM	tblLibro
	WHERE [estado] = 'activo'
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Libro_EliminarLibro]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Eliminar Libro
-- =============================================
CREATE PROCEDURE [dbo].[usp_Libro_EliminarLibro]
	@intLibroId	INT
AS
BEGIN
	
	SET NOCOUNT ON;

	UPDATE [dbo].[tblLibro]
	SET [estado] = 'inactivo'
	WHERE [LibroId] = @intLibroId	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UsuarioPermiso_UpdateUsuarioPermiso]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mofidificar UsuarioPermiso
-- =============================================
CREATE PROCEDURE [dbo].[usp_UsuarioPermiso_UpdateUsuarioPermiso]
	@permisoId INT,		
	@usuarioId INT,
	@usuarioPermiso INT
AS
BEGIN
	
	SET NOCOUNT ON;

	UPDATE [dbo].[tblUsuarioPermiso]
	SET
	 [permisoId] = @permisoId,
	 [usuarioId] = @usuarioId
	WHERE [usuarioPermisoId] = @usuarioPermiso
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UsuarioPermiso_InsertarUsuarioPermiso]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 04/10/2017
-- Description:	Inserta una UsuarioPermiso
-- =============================================
CREATE PROCEDURE [dbo].[usp_UsuarioPermiso_InsertarUsuarioPermiso]
	@varUsuarioId	int,
	@varPermisoId	int,
	
	@intUsuarioPermisoId	INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[tblUsuarioPermiso]
           ([usuarioId]
           ,[permisoId])
     VALUES
           (@varUsuarioId,
           @varPermisoId)
           
    SET @intUsuarioPermisoId = SCOPE_IDENTITY()

END
GO
/****** Object:  StoredProcedure [dbo].[usp_UsuarioPermiso_GetIdByUsuarioId]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 04/10/2017
-- Description:	Mostrar Id UsuarioPermiso
-- =============================================
CREATE PROCEDURE [dbo].[usp_UsuarioPermiso_GetIdByUsuarioId]
	@varUsuarioId	int
AS
BEGIN
	SET NOCOUNT ON;
	select *
	from tblUsuarioPermiso
	where usuarioId = @varUsuarioId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UsuarioPermiso_GetIdByUserIdPermiId]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 04/10/2017
-- Description:	Mostrar una UsuarioPermiso
-- =============================================
CREATE PROCEDURE [dbo].[usp_UsuarioPermiso_GetIdByUserIdPermiId]
	@varUsuarioId	int,
	@varPermisoId	int
AS
BEGIN
	SET NOCOUNT ON;
	select *
	from tblUsuarioPermiso
	where usuarioId = @varUsuarioId and permisoId = @varPermisoId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UsuarioPermiso_GetAllUsuarioPermiso]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 04/10/2017
-- Description:	Mostrar una UsuarioPermiso
-- =============================================
CREATE PROCEDURE [dbo].[usp_UsuarioPermiso_GetAllUsuarioPermiso]
AS
BEGIN
	SET NOCOUNT ON;
	select *
	from tblUsuarioPermiso 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UsuarioPermiso_EliminarUsuarioPermiso]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Eliminar UsuarioPermiso
-- =============================================
CREATE PROCEDURE [dbo].[usp_UsuarioPermiso_EliminarUsuarioPermiso]
	@intUsuarioPermisoId	INT
AS
BEGIN
	
	SET NOCOUNT ON;

	DELETE FROM [dbo].[tblUsuarioPermiso]
	WHERE [usuarioPermisoId] = @intUsuarioPermisoId
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Libros_GetAllByTitulo]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Todos los Libros Por Titulo
-- =============================================
CREATE PROCEDURE [dbo].[usp_Libros_GetAllByTitulo]
	@varTitulo NVARCHAR(250)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT * 
	FROM	tblLibro
	WHERE [estado] = 'activo'and titulo like '%'+@varTitulo+'%'
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Libro_UpdateLibro]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Modificar Libro
-- =============================================
CREATE PROCEDURE [dbo].[usp_Libro_UpdateLibro]
	@varAutor INT,
	@varCategoria INT,
	@varTitulo	NVARCHAR(250),
	@varPortada NVARCHAR(max),
	@varSinopsis NVARCHAR(max),
	
	@libroId INT
AS
BEGIN	
	SET NOCOUNT ON;

	UPDATE [dbo].[tblLibro]
	
	SET	   [autorId] = @varAutor,
		   [categoriaId] = @varCategoria
		   ,[titulo] = @varTitulo
		   ,[portada] = @varPortada
		   ,[sinopsis] = @varSinopsis
		   
	WHERE [libroId] =  @libroId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Valoracion_UpdateValoracion]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Modificar Valoracion
-- =============================================
CREATE PROCEDURE [dbo].[usp_Valoracion_UpdateValoracion]
	@usuarioId INT,	
	@libroId INT,
	
	@valoracionId int
AS
BEGIN	
	SET NOCOUNT ON;
	UPDATE [dbo].tblValoracion		
	SET	   
		usuarioId = @usuarioId,
		libroId = @libroId	
				   
	WHERE valoracionID =  @valoracionId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Valoracion_InsertarValoracion]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 04/10/2017
-- Description:	Inserta un Valoracion
-- =============================================
CREATE PROCEDURE [dbo].[usp_Valoracion_InsertarValoracion]
	@varUsuarioId	int,
	@varLibroId		int,
	@varValor		int,

	
	@intValoracionId	INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[tblValoracion]
           ([usuarioId]
           ,[libroId]
           ,[valor])
     VALUES
           (@varUsuarioId,
           @varLibroId,
           @varValor)
                      
    SET @intValoracionId = SCOPE_IDENTITY()

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Valoracion_GetAll]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Todos los Valoracion
-- =============================================
CREATE PROCEDURE [dbo].[usp_Valoracion_GetAll]
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT * 
	FROM	tblValoracion
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Valoracion_EliminarValoracion]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Eliminar Valoracion
-- =============================================
CREATE PROCEDURE [dbo].[usp_Valoracion_EliminarValoracion]
	@valoracionId	INT,
	@varValor		INT
AS
BEGIN	
	SET NOCOUNT ON;
	UPDATE [dbo].[tblValoracion]
	SET [valor] = 	@varValor
	WHERE [valoracionID] = @valoracionId
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Libro_MasDescargados]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Todos Libros Mas Descargados
-- =============================================
CREATE PROCEDURE [dbo].[usp_Libro_MasDescargados]
AS
BEGIN	
	SET NOCOUNT ON;
	
	select *
	from tblLibro
	where LibroId in(select DISTINCT libroId from tblDescarga)
	order by libroId desc

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Lecturas_GetAll]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Todos las Lecturas
-- =============================================
CREATE PROCEDURE [dbo].[usp_Lecturas_GetAll]
AS
BEGIN
	
	SET NOCOUNT ON;	
	SELECT * 
	FROM	tblLectura
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Lectura_Update]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Modificar Lectura
-- =============================================
CREATE PROCEDURE [dbo].[usp_Lectura_Update]
	@libro int,	
	@lectura INT
AS
BEGIN	
	SET NOCOUNT ON;
	UPDATE [dbo].tblLectura		
	SET	   
		libroId =	@libro	   
	WHERE lecturaId =  @lectura
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Lectura_InsertarLectura]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 04/10/2017
-- Description:	Inserta un Lectura
-- =============================================
CREATE PROCEDURE [dbo].[usp_Lectura_InsertarLectura]
	@varUsuarioId	int,
	@varLibroId		int,
	@varFecha		DATE,
	
	@intLecturaId	INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[tblLectura]
           ([usuarioId]
           ,[libroId]
           ,[fecha])
     VALUES
           (@varUsuarioId,
           @varLibroId,
           @varFecha)
           
    SET @intLecturaId = SCOPE_IDENTITY()

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Lectura_GetAllById]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Todos las Lecturas por Id
-- =============================================
CREATE PROCEDURE [dbo].[usp_Lectura_GetAllById]
	@lecturaId int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT * 
	FROM	tblLectura
	WHERE lecturaId = @lecturaId
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Lectura_EliminarLectura]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Eliminar Lectura
-- =============================================
CREATE PROCEDURE [dbo].[usp_Lectura_EliminarLectura]
	@intLecturaId	INT
AS
BEGIN
	
	SET NOCOUNT ON;

	DELETE FROM [dbo].[tblLectura]
	WHERE [lecturaId] = @intLecturaId
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Descargar_GetAll]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Todos las Descargas
-- =============================================
CREATE PROCEDURE [dbo].[usp_Descargar_GetAll]
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT * 
	FROM	tblDescarga
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Descarga_UpdateDescarga]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Modificar Descarga
-- =============================================
CREATE PROCEDURE [dbo].[usp_Descarga_UpdateDescarga]
	@libro int,	
	@descarga INT
AS
BEGIN	
	SET NOCOUNT ON;
	UPDATE [dbo].tblDescarga		
	SET	   
		libroId =	@libro	   
	WHERE descargaId =  @descarga
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Descarga_InsertarDescarga]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 04/10/2017
-- Description:	Inserta una Descarga
-- =============================================
CREATE PROCEDURE [dbo].[usp_Descarga_InsertarDescarga]
	@varUsuarioId	int,
	@varLibroId		int,
	@varFecha		DATE,
	
	@intDescargaId	INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[tblDescarga]
           ([usuarioId]
           ,[libroId]
           ,[fecha])
     VALUES     
           (@varUsuarioId,
           @varLibroId,
           @varFecha)
           
    SET @intDescargaId = SCOPE_IDENTITY()

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Descarga_GetAllById]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mostrar Todos las descargas por Id
-- =============================================
CREATE PROCEDURE [dbo].[usp_Descarga_GetAllById]
	@descargaID int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT * 
	FROM	tblDescarga
	WHERE descargaId = @descargaID
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Descarga_EliminarDescarga]    Script Date: 12/04/2017 18:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Eliminar Descarga
-- =============================================
CREATE PROCEDURE [dbo].[usp_Descarga_EliminarDescarga]
	@intDescargaId	INT
AS
BEGIN
	
	SET NOCOUNT ON;

	DELETE FROM [dbo].[tblDescarga]
	WHERE [descargaId] = @intDescargaId
	
END
GO
/****** Object:  ForeignKey [FK_tblLibro_tblAutor]    Script Date: 12/04/2017 18:22:23 ******/
ALTER TABLE [dbo].[tblLibro]  WITH CHECK ADD  CONSTRAINT [FK_tblLibro_tblAutor] FOREIGN KEY([autorId])
REFERENCES [dbo].[tblAutor] ([autorId])
GO
ALTER TABLE [dbo].[tblLibro] CHECK CONSTRAINT [FK_tblLibro_tblAutor]
GO
/****** Object:  ForeignKey [FK_tblLibro_tblCategoria]    Script Date: 12/04/2017 18:22:23 ******/
ALTER TABLE [dbo].[tblLibro]  WITH CHECK ADD  CONSTRAINT [FK_tblLibro_tblCategoria] FOREIGN KEY([categoriaId])
REFERENCES [dbo].[tblCategoria] ([categoriaID])
GO
ALTER TABLE [dbo].[tblLibro] CHECK CONSTRAINT [FK_tblLibro_tblCategoria]
GO
/****** Object:  ForeignKey [FK_tblLibro_tblLibro]    Script Date: 12/04/2017 18:22:23 ******/
ALTER TABLE [dbo].[tblLibro]  WITH CHECK ADD  CONSTRAINT [FK_tblLibro_tblLibro] FOREIGN KEY([LibroId])
REFERENCES [dbo].[tblLibro] ([LibroId])
GO
ALTER TABLE [dbo].[tblLibro] CHECK CONSTRAINT [FK_tblLibro_tblLibro]
GO
/****** Object:  ForeignKey [FK_tblLibro_tblLibro1]    Script Date: 12/04/2017 18:22:23 ******/
ALTER TABLE [dbo].[tblLibro]  WITH CHECK ADD  CONSTRAINT [FK_tblLibro_tblLibro1] FOREIGN KEY([LibroId])
REFERENCES [dbo].[tblLibro] ([LibroId])
GO
ALTER TABLE [dbo].[tblLibro] CHECK CONSTRAINT [FK_tblLibro_tblLibro1]
GO
/****** Object:  ForeignKey [FK_tblUsuarioPermiso_tblPermiso]    Script Date: 12/04/2017 18:22:23 ******/
ALTER TABLE [dbo].[tblUsuarioPermiso]  WITH CHECK ADD  CONSTRAINT [FK_tblUsuarioPermiso_tblPermiso] FOREIGN KEY([permisoId])
REFERENCES [dbo].[tblPermiso] ([permisoId])
GO
ALTER TABLE [dbo].[tblUsuarioPermiso] CHECK CONSTRAINT [FK_tblUsuarioPermiso_tblPermiso]
GO
/****** Object:  ForeignKey [FK_tblUsuarioPermiso_tblUsuario]    Script Date: 12/04/2017 18:22:23 ******/
ALTER TABLE [dbo].[tblUsuarioPermiso]  WITH CHECK ADD  CONSTRAINT [FK_tblUsuarioPermiso_tblUsuario] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tblUsuario] ([usuarioId])
GO
ALTER TABLE [dbo].[tblUsuarioPermiso] CHECK CONSTRAINT [FK_tblUsuarioPermiso_tblUsuario]
GO
/****** Object:  ForeignKey [FK_tblValoracion_tblLibro]    Script Date: 12/04/2017 18:22:23 ******/
ALTER TABLE [dbo].[tblValoracion]  WITH CHECK ADD  CONSTRAINT [FK_tblValoracion_tblLibro] FOREIGN KEY([libroId])
REFERENCES [dbo].[tblLibro] ([LibroId])
GO
ALTER TABLE [dbo].[tblValoracion] CHECK CONSTRAINT [FK_tblValoracion_tblLibro]
GO
/****** Object:  ForeignKey [FK_tblValoracion_tblUsuario]    Script Date: 12/04/2017 18:22:23 ******/
ALTER TABLE [dbo].[tblValoracion]  WITH CHECK ADD  CONSTRAINT [FK_tblValoracion_tblUsuario] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tblUsuario] ([usuarioId])
GO
ALTER TABLE [dbo].[tblValoracion] CHECK CONSTRAINT [FK_tblValoracion_tblUsuario]
GO
/****** Object:  ForeignKey [FK_tblLectura_tblLibro]    Script Date: 12/04/2017 18:22:23 ******/
ALTER TABLE [dbo].[tblLectura]  WITH CHECK ADD  CONSTRAINT [FK_tblLectura_tblLibro] FOREIGN KEY([libroId])
REFERENCES [dbo].[tblLibro] ([LibroId])
GO
ALTER TABLE [dbo].[tblLectura] CHECK CONSTRAINT [FK_tblLectura_tblLibro]
GO
/****** Object:  ForeignKey [FK_tblLectura_tblUsuario]    Script Date: 12/04/2017 18:22:23 ******/
ALTER TABLE [dbo].[tblLectura]  WITH CHECK ADD  CONSTRAINT [FK_tblLectura_tblUsuario] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tblUsuario] ([usuarioId])
GO
ALTER TABLE [dbo].[tblLectura] CHECK CONSTRAINT [FK_tblLectura_tblUsuario]
GO
/****** Object:  ForeignKey [FK_tblDescarga_tblLibro]    Script Date: 12/04/2017 18:22:23 ******/
ALTER TABLE [dbo].[tblDescarga]  WITH CHECK ADD  CONSTRAINT [FK_tblDescarga_tblLibro] FOREIGN KEY([libroId])
REFERENCES [dbo].[tblLibro] ([LibroId])
GO
ALTER TABLE [dbo].[tblDescarga] CHECK CONSTRAINT [FK_tblDescarga_tblLibro]
GO
/****** Object:  ForeignKey [FK_tblDescarga_tblUsuario]    Script Date: 12/04/2017 18:22:23 ******/
ALTER TABLE [dbo].[tblDescarga]  WITH CHECK ADD  CONSTRAINT [FK_tblDescarga_tblUsuario] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tblUsuario] ([usuarioId])
GO
ALTER TABLE [dbo].[tblDescarga] CHECK CONSTRAINT [FK_tblDescarga_tblUsuario]
GO
