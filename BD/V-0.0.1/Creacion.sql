USE [master]
GO
/****** Object:  Database [dbBiblioteca]    Script Date: 11/28/2017 02:11:13 ******/
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
/****** Object:  Table [dbo].[tblUsuario]    Script Date: 11/28/2017 02:11:14 ******/
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
 CONSTRAINT [PK_tblUsuario] PRIMARY KEY CLUSTERED 
(
	[usuarioId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPermiso]    Script Date: 11/28/2017 02:11:14 ******/
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
/****** Object:  Table [dbo].[tblCategoria]    Script Date: 11/28/2017 02:11:14 ******/
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
/****** Object:  Table [dbo].[tblAutor]    Script Date: 11/28/2017 02:11:14 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Categoria_UpdateCategoria]    Script Date: 11/28/2017 02:11:15 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Categoria_InsertarCategoria]    Script Date: 11/28/2017 02:11:15 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Categoria_GetAll]    Script Date: 11/28/2017 02:11:15 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Categoria_EliminarCategoria]    Script Date: 11/28/2017 02:11:15 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Autor_UpdateAutor]    Script Date: 11/28/2017 02:11:15 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Autor_InsertarAutor]    Script Date: 11/28/2017 02:11:15 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Autor_GetAll]    Script Date: 11/28/2017 02:11:15 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Autor_EliminarAutor]    Script Date: 11/28/2017 02:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Eliminar Autor
-- =============================================
CREATE PROCEDURE [dbo].[usp_Autor_EliminarAutor]
	@intAutorId	INT,
	@varEstado NCHAR(10)
AS
BEGIN
	
	SET NOCOUNT ON;

	UPDATE [dbo].[tblAutor]
	SET [estado] = @varEstado
	WHERE [autorId] = @intAutorId
END
GO
/****** Object:  Table [dbo].[tblUsuarioPermiso]    Script Date: 11/28/2017 02:11:15 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Usuario_UpdateUsuario]    Script Date: 11/28/2017 02:11:15 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Usuario_UpdateContraseña]    Script Date: 11/28/2017 02:11:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 05-10-2017
-- Description:	Mofidificar Constraseña
-- =============================================
CREATE PROCEDURE [dbo].[usp_Usuario_UpdateContraseña]
	@varContraseña		NCHAR(15),
		
	@usuarioId INT
AS
BEGIN
	
	SET NOCOUNT ON;

	UPDATE [dbo].[tblUsuario]
	SET [contraseña] = @varContraseña
 		
	WHERE [usuarioId] = @usuarioId
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Usuario_InsertarUsuario]    Script Date: 11/28/2017 02:11:15 ******/
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
           ,[estado])
     VALUES
           (@varNombre,
            @varApellido,
            @varEmail,
            @varContraseña,
            @varTipoUsuario,
            @varEstado)
                      
    SET @intUsuarioId = SCOPE_IDENTITY()

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Usuario_GetUsuarioByEmail]    Script Date: 11/28/2017 02:11:15 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Usuario_GetUsuario]    Script Date: 11/28/2017 02:11:15 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Usuario_GetEmailByID]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Usuario_GetByUserName]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Usuario_GetById]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Usuario_GetAdminByEmail]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Usuario_GetAdmin]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Usuario_DeleteUsuario]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Permiso_InsertarPermiso]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Permiso_GetPermisoByDescripcion]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Permiso_DeletePermiso]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Permiso_ActualizarPermiso]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  Table [dbo].[tblLibro]    Script Date: 11/28/2017 02:11:16 ******/
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
	[valoracion] [int] NULL,
	[estado] [nchar](10) NULL,
 CONSTRAINT [PK_tblLibro] PRIMARY KEY CLUSTERED 
(
	[LibroId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_UsuarioPermiso_UpdateUsuarioPermiso]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_UsuarioPermiso_InsertarUsuarioPermiso]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_UsuarioPermiso_GetIdByUsuarioId]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_UsuarioPermiso_GetIdByUserIdPermiId]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_UsuarioPermiso_GetAllUsuarioPermiso]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_UsuarioPermiso_EliminarUsuarioPermiso]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  Table [dbo].[tblLectura]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  Table [dbo].[tblDescarga]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Libro_UpdateLibro]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Libro_InsertarLibro]    Script Date: 11/28/2017 02:11:16 ******/
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
	@varValoracion	INT,
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
           ,[valoracion]
           ,[estado])
     VALUES
           (@varAutorId,
           @varCategoriaId,
           @varTitulo,
           @varPortada,
           @varSinopsis,
           @varValoracion,
           @varEstado)
                      
    SET @intLibroId = SCOPE_IDENTITY()

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Libro_GetLibrosById]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Libro_GetAll]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Libro_EliminarLibro]    Script Date: 11/28/2017 02:11:16 ******/
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
	@intLibroId	INT,
	@varEstado NCHAR(10)
AS
BEGIN
	
	SET NOCOUNT ON;

	UPDATE [dbo].[tblLibro]
	SET [estado] = @varEstado
	WHERE [LibroId] = @intLibroId
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Lectura_InsertarLectura]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Lectura_EliminarLectura]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Descarga_InsertarDescarga]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Descarga_EliminarDescarga]    Script Date: 11/28/2017 02:11:16 ******/
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
/****** Object:  ForeignKey [FK_tblUsuarioPermiso_tblPermiso]    Script Date: 11/28/2017 02:11:15 ******/
ALTER TABLE [dbo].[tblUsuarioPermiso]  WITH CHECK ADD  CONSTRAINT [FK_tblUsuarioPermiso_tblPermiso] FOREIGN KEY([permisoId])
REFERENCES [dbo].[tblPermiso] ([permisoId])
GO
ALTER TABLE [dbo].[tblUsuarioPermiso] CHECK CONSTRAINT [FK_tblUsuarioPermiso_tblPermiso]
GO
/****** Object:  ForeignKey [FK_tblUsuarioPermiso_tblUsuario]    Script Date: 11/28/2017 02:11:15 ******/
ALTER TABLE [dbo].[tblUsuarioPermiso]  WITH CHECK ADD  CONSTRAINT [FK_tblUsuarioPermiso_tblUsuario] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tblUsuario] ([usuarioId])
GO
ALTER TABLE [dbo].[tblUsuarioPermiso] CHECK CONSTRAINT [FK_tblUsuarioPermiso_tblUsuario]
GO
/****** Object:  ForeignKey [FK_tblLibro_tblAutor]    Script Date: 11/28/2017 02:11:16 ******/
ALTER TABLE [dbo].[tblLibro]  WITH CHECK ADD  CONSTRAINT [FK_tblLibro_tblAutor] FOREIGN KEY([autorId])
REFERENCES [dbo].[tblAutor] ([autorId])
GO
ALTER TABLE [dbo].[tblLibro] CHECK CONSTRAINT [FK_tblLibro_tblAutor]
GO
/****** Object:  ForeignKey [FK_tblLibro_tblCategoria]    Script Date: 11/28/2017 02:11:16 ******/
ALTER TABLE [dbo].[tblLibro]  WITH CHECK ADD  CONSTRAINT [FK_tblLibro_tblCategoria] FOREIGN KEY([categoriaId])
REFERENCES [dbo].[tblCategoria] ([categoriaID])
GO
ALTER TABLE [dbo].[tblLibro] CHECK CONSTRAINT [FK_tblLibro_tblCategoria]
GO
/****** Object:  ForeignKey [FK_tblLectura_tblLibro]    Script Date: 11/28/2017 02:11:16 ******/
ALTER TABLE [dbo].[tblLectura]  WITH CHECK ADD  CONSTRAINT [FK_tblLectura_tblLibro] FOREIGN KEY([libroId])
REFERENCES [dbo].[tblLibro] ([LibroId])
GO
ALTER TABLE [dbo].[tblLectura] CHECK CONSTRAINT [FK_tblLectura_tblLibro]
GO
/****** Object:  ForeignKey [FK_tblLectura_tblUsuario]    Script Date: 11/28/2017 02:11:16 ******/
ALTER TABLE [dbo].[tblLectura]  WITH CHECK ADD  CONSTRAINT [FK_tblLectura_tblUsuario] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tblUsuario] ([usuarioId])
GO
ALTER TABLE [dbo].[tblLectura] CHECK CONSTRAINT [FK_tblLectura_tblUsuario]
GO
/****** Object:  ForeignKey [FK_tblDescarga_tblLibro]    Script Date: 11/28/2017 02:11:16 ******/
ALTER TABLE [dbo].[tblDescarga]  WITH CHECK ADD  CONSTRAINT [FK_tblDescarga_tblLibro] FOREIGN KEY([libroId])
REFERENCES [dbo].[tblLibro] ([LibroId])
GO
ALTER TABLE [dbo].[tblDescarga] CHECK CONSTRAINT [FK_tblDescarga_tblLibro]
GO
/****** Object:  ForeignKey [FK_tblDescarga_tblUsuario]    Script Date: 11/28/2017 02:11:16 ******/
ALTER TABLE [dbo].[tblDescarga]  WITH CHECK ADD  CONSTRAINT [FK_tblDescarga_tblUsuario] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tblUsuario] ([usuarioId])
GO
ALTER TABLE [dbo].[tblDescarga] CHECK CONSTRAINT [FK_tblDescarga_tblUsuario]
GO
