USE [master]
GO
/****** Object:  Database [dbBiblioteca]    Script Date: 11/30/2017 09:59:53 ******/
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
/****** Object:  Table [dbo].[tblCategoria]    Script Date: 11/30/2017 09:59:54 ******/
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
/****** Object:  Table [dbo].[tblAutor]    Script Date: 11/30/2017 09:59:54 ******/
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
/****** Object:  StoredProcedure [dbo].[prod_PROD_UpdatePelicula]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 21/10/2017
-- Description:	Actualizar Películas
-- =============================================
CREATE PROCEDURE [dbo].[prod_PROD_UpdatePelicula]
	-- Add the parameters for the stored procedure here
	@Nombre NVARCHAR(60),
	@PrecioVenta DECIMAL(10,2),
	@PrecioAlquiler DECIMAL(10, 2),
	@Descripcion NVARCHAR(2000),
	@Director NVARCHAR(50),
	@Elenco NVARCHAR(500),
	@Foto NVARCHAR(500),
	@trailerCode NVARCHAR(20),
	@movieCode NVARCHAR(20),
	
	@PeliculaId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[tbl_Peliculas]
	SET [nombre] = @Nombre
      ,[precioVenta] = @PrecioVenta
	  ,[precioAlquiler] = @PrecioAlquiler
      ,[descripcion] = @Descripcion
      ,[director] = @Director
      ,[elenco] = @Elenco
      ,[foto] = @Foto
	  ,[trailerCode] = @trailerCode
	  ,[movieCode] = @movieCode
	WHERE [peliculaId] = @PeliculaId;
END
GO
/****** Object:  StoredProcedure [dbo].[prod_PROD_InsertPelicula]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 21/10/2017
-- Description:	Insertar Películas
-- =============================================
CREATE PROCEDURE [dbo].[prod_PROD_InsertPelicula]
	-- Add the parameters for the stored procedure here
	@Nombre NVARCHAR(60),
	@PrecioVenta DECIMAL(10,2),
	@PrecioAlquiler DECIMAL(10,2),
	@Descripcion NVARCHAR(2000),
	@Director NVARCHAR(50),
	@Elenco NVARCHAR(500),
	@Foto NVARCHAR(500),
	@TrailerCode NVARCHAR(20),
	@MovieCode NVARCHAR(20),
	@Estado BIT,
	
	@PeliculaId INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO [dbo].[tbl_Peliculas]
           ([nombre]
           ,[precioVenta]
		   ,[precioAlquiler]
           ,[descripcion]
           ,[director]
           ,[elenco]
           ,[foto]
		   ,[trailerCode]
		   ,[movieCode]
           ,[estado])
     VALUES
           (@Nombre
           ,@PrecioVenta
		   ,@PrecioAlquiler
           ,@Descripcion
           ,@Director
           ,@Elenco
           ,@Foto
		   ,@TrailerCode
		   ,@MovieCode
           ,@Estado)

	SET @PeliculaId = SCOPE_IDENTITY()

END
GO
/****** Object:  StoredProcedure [dbo].[prod_PROD_GetPeliculas]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 21/10/2017
-- Description:	Obtener Peliculas
-- =============================================
CREATE PROCEDURE [dbo].[prod_PROD_GetPeliculas]
	-- Add the parameters for the stored procedure here	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * 
	FROM [dbo].[tbl_Peliculas]
END
GO
/****** Object:  StoredProcedure [dbo].[prod_PROD_GetPeliculaByName]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 21/10/2017
-- Description:	Obtener Peliculas por Nombre
-- =============================================
CREATE PROCEDURE [dbo].[prod_PROD_GetPeliculaByName]
	-- Add the parameters for the stored procedure here	
	@Nombre NVARCHAR(60)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * 
	FROM [dbo].[tbl_Peliculas]
	WHERE [nombre] = @Nombre
END
GO
/****** Object:  StoredProcedure [dbo].[prod_PROD_GetPeliculaById]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 21/10/2017
-- Description:	Obtener Peliculas por ID
-- =============================================
CREATE PROCEDURE [dbo].[prod_PROD_GetPeliculaById]
	-- Add the parameters for the stored procedure here	
	@PeliculaId INT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * 
	FROM [dbo].[tbl_Peliculas]
	WHERE [peliculaId] = @PeliculaId 
END
GO
/****** Object:  StoredProcedure [dbo].[prod_PROD_DeletePelicula]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 21/10/2017
-- Description:	Eliminar Películas
-- =============================================
CREATE PROCEDURE [dbo].[prod_PROD_DeletePelicula]
	-- Add the parameters for the stored procedure here
	@PeliculaId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[tbl_Peliculas]
	SET [estado] = 0 
    WHERE [peliculaId] = @PeliculaId;
END
GO
/****** Object:  StoredProcedure [dbo].[per_PERM_UpdatePermiso]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fullá
-- Create date: 05/10/17
-- Description:	Ingresa los permisos
-- =============================================
CREATE PROCEDURE [dbo].[per_PERM_UpdatePermiso] 
	@Descripcion VARCHAR(45), 
	@PermisosId INT 
AS 
BEGIN 

	UPDATE [dbo].[tbl_Permisos]
   SET [descripcion] = @Descripcion 
	WHERE[PermisosId]=@PermisosId 

END
GO
/****** Object:  StoredProcedure [dbo].[per_PERM_InsertPermiso]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fullá
-- Create date: 05/10/17
-- Description:	Ingresa los permisos
-- =============================================
CREATE PROCEDURE [dbo].[per_PERM_InsertPermiso] 
	@Descripcion VARCHAR(45), 
	@PermisosId INT  OUTPUT 
AS 
BEGIN 

INSERT INTO [dbo].[tbl_Permisos] 
           ([descripcion]) 
     VALUES 
           (@Descripcion ) 
	SET @PermisosId=SCOPE_IDENTITY() 


END
GO
/****** Object:  StoredProcedure [dbo].[per_PERM_DeletePermiso]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fullá
-- Create date: 05/10/17
-- Description:	Elimina los Permisos 
-- =============================================
CREATE PROCEDURE [dbo].[per_PERM_DeletePermiso] 	
	@PermisosId INT
AS 
BEGIN 
		DELETE FROM [dbo].[tbl_Permisos] 
		WHERE [PermisosId]=@PermisosId  
END
GO
/****** Object:  StoredProcedure [dbo].[LIKE_UpdateLikes]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 25/11/2017
-- Description:	Actualizar los Likes
-- =============================================
CREATE PROCEDURE [dbo].[LIKE_UpdateLikes]
	-- Add the parameters for the stored procedure here
	@IsLike	BIT,
	@UserId	INT,
	@PeliculaId	INT, 

	@LikeID	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[tbl_Like]
	SET [isLike] = @IsLike
      ,[UserId] = @UserId
      ,[peliculaId] = @PeliculaId 
	WHERE [LikeId] = @LikeID 

END
GO
/****** Object:  StoredProcedure [dbo].[LIKE_InsertLike]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 25/11/2017
-- Description:	Insertar Likes
-- =============================================
CREATE PROCEDURE [dbo].[LIKE_InsertLike]
	-- Add the parameters for the stored procedure here
	@IsLike	BIT,	 
	@UserId	INT,
	@PeliculaId	INT,

	@LikeId	INT OUTPUT
					
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[tbl_Like]
           ([isLike]           
           ,[UserId]
           ,[peliculaId])
     VALUES
           (@IsLike           
           ,@UserId
           ,@PeliculaId)

	SET @LikeId = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[LIKE_GetLikeByUserPeliculaID]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 25/11/2017
-- Description:	Obtener likes por UsuarioId y PeliculaId
-- =============================================
CREATE PROCEDURE [dbo].[LIKE_GetLikeByUserPeliculaID]
	-- Add the parameters for the stored procedure here
	@UserID	INT,
	@PeliculaID	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[tbl_Like] 
	WHERE [UserId]  = @UserID 
	AND [peliculaId] = @PeliculaID 
	
END
GO
/****** Object:  StoredProcedure [dbo].[LIKE_GetCantLikes]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 25/11/2017
-- Description:	Obtener la cantidad de Likes por PeliculaID
-- =============================================
CREATE PROCEDURE [dbo].[LIKE_GetCantLikes]
	-- Add the parameters for the stored procedure here	
	@PeliculaID	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[tbl_Like] 
	WHERE [peliculaId] = @PeliculaID 
	AND [isLike] = 1 
	
END
GO
/****** Object:  StoredProcedure [dbo].[LIKE_GetCantDisLikes]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 25/11/2017
-- Description:	Obtener la cantidad de Dislikes por PeliculaID
-- =============================================
CREATE PROCEDURE [dbo].[LIKE_GetCantDisLikes]
	-- Add the parameters for the stored procedure here	
	@PeliculaID	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[tbl_Like] 
	WHERE [peliculaId] = @PeliculaID 
	AND [isLike] = 0 
	
END
GO
/****** Object:  StoredProcedure [dbo].[LIKE_DeleteLike]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 25/11/2014
-- Description:	Eliminar Likes
-- =============================================
CREATE PROCEDURE [dbo].[LIKE_DeleteLike]
	-- Add the parameters for the stored procedure here
	@LikeID	INT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [dbo].[tbl_Like]
    WHERE [LikeId] = @LikeID 

END
GO
/****** Object:  StoredProcedure [dbo].[gen_GEN_GetGeneros]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 21/10/2017
-- Description:	Obtener Todos los géneros
-- =============================================
CREATE PROCEDURE [dbo].[gen_GEN_GetGeneros]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * 
	FROM [dbo].[tblGeneros]
END
GO
/****** Object:  StoredProcedure [dbo].[gen_GEN_GetGeneroById]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 26/10/2017
-- Description:	Obtener Generos por ID
-- =============================================
CREATE PROCEDURE [dbo].[gen_GEN_GetGeneroById]
	-- Add the parameters for the stored procedure here
	@generoId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * 
	FROM [dbo].[tblGeneros]
	WHERE [generoId] = @generoId 
END
GO
/****** Object:  StoredProcedure [dbo].[comp_COMP_UpdateCompra]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 13/11/2017
-- Description: Actualizar Película
-- =============================================
CREATE PROCEDURE [dbo].[comp_COMP_UpdateCompra]
	-- Add the parameters for the stored procedure here
	@Fecha	DATETIME,
	@TotalPago	DECIMAL(10, 2),
	@TarjetaCredito	NVARCHAR(30),
	@CodigoTarjeta	NVARCHAR(20),
	@Estado	BIT,

	@CompraId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[tbl_Compra]
	SET [fecha] = @Fecha 
      ,[totalPago] = @TotalPago
      ,[tarjetaCredito] = @TarjetaCredito
      ,[codigoTarjeta] = @CodigoTarjeta
      ,[estado] = @Estado
	WHERE [CompraId] = @CompraId

END
GO
/****** Object:  StoredProcedure [dbo].[comp_COMP_InsertCompra]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fulla
-- Create date: 13/11/2017
-- Description:	Insertar Compra
-- =============================================
CREATE PROCEDURE [dbo].[comp_COMP_InsertCompra]
	-- Add the parameters for the stored procedure here
	@Fecha	DATETIME,
	@TotalPago	DECIMAL(10, 2),
	@TarjetaCredito	NVARCHAR(30),
	@CodigoTarjeta	NVARCHAR(20),
	@Estado	BIT,
	@UserId	INT,
	@PeliculaId	INT,

	@CompraId INT OUTPUT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	

	INSERT INTO [dbo].[tbl_Compra]
			([fecha]
			,[totalPago]
			,[tarjetaCredito]
			,[codigoTarjeta]
			,[estado]
			,[UserId]
			,[peliculaId])
		VALUES
			(@Fecha
			,@TotalPago
			,@TarjetaCredito
			,@CodigoTarjeta
			,@Estado
			,@UserId
			,@PeliculaId)

	SET @CompraId = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[comp_COMP_GetComprasByUserId]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 13/11/2017
-- Description:	Obtener todas las compras por Usuario
-- =============================================
CREATE PROCEDURE [dbo].[comp_COMP_GetComprasByUserId]
	-- Add the parameters for the stored procedure here	
	@UserId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * 
	FROM [dbo].[tbl_Compra] 
	WHERE [UserId] = @UserId 
	ORDER BY [fecha] DESC 
END
GO
/****** Object:  StoredProcedure [dbo].[comp_COMP_GetComprasById]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 13/11/2017
-- Description:	Obtener todas las compras por CompraId
-- =============================================
CREATE PROCEDURE [dbo].[comp_COMP_GetComprasById]
	-- Add the parameters for the stored procedure here	
	@CompraId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * 
	FROM [dbo].[tbl_Compra] 
	WHERE [CompraId] = @CompraId 
	ORDER BY [fecha] DESC 
END
GO
/****** Object:  StoredProcedure [dbo].[comp_COMP_GetAllCompras]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 13/11/2017
-- Description:	Obtener todas las compras
-- =============================================
CREATE PROCEDURE [dbo].[comp_COMP_GetAllCompras]
	-- Add the parameters for the stored procedure here	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * 
	FROM [dbo].[tbl_Compra] 
	ORDER BY [fecha] DESC 
END
GO
/****** Object:  StoredProcedure [dbo].[comp_COMP_ExistTransaction]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 13/11/2017
-- Description:	Para ver si el usuario ya había comprado la película antes
-- =============================================
CREATE PROCEDURE [dbo].[comp_COMP_ExistTransaction]
	-- Add the parameters for the stored procedure here
	@UserId		INT,
	@PeliculaId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[tbl_Compra] 
	WHERE [UserId] = @UserId 
	AND [peliculaId] = @PeliculaId 
END
GO
/****** Object:  StoredProcedure [dbo].[comp_COMP_DeleteCompra]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fulla
-- Create date: 13/11/2017
-- Description:	Eliminar compra por ID
-- =============================================
CREATE PROCEDURE [dbo].[comp_COMP_DeleteCompra]
	-- Add the parameters for the stored procedure here
	@CompraId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here	

	UPDATE [dbo].[tbl_Compra]
	SET [estado] = 0    
	WHERE [CompraId] = @CompraId 

END
GO
/****** Object:  StoredProcedure [dbo].[COMENT_InsertComentario]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 24/11/2017
-- Description:	Insert Comentario
-- =============================================
CREATE PROCEDURE [dbo].[COMENT_InsertComentario]
	-- Add the parameters for the stored procedure here
	@Texto	NTEXT,
	@Fecha	DATETIME,
	@UserID	INT,
	@PeliculaID	INT,

	@ComentarioId	INT OUTPUT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[tbl_Comentario]
           ([texto]
           ,[fecha]
           ,[UserId]
           ,[peliculaId])
     VALUES
           (@Texto
           ,@Fecha
           ,@UserID
           ,@PeliculaID)

	SET @ComentarioId = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[COMENT_GetComentsByPeliculaID]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 24/11/2017
-- Description:	Obtener Comentarios por PeliculaID
-- =============================================
CREATE PROCEDURE [dbo].[COMENT_GetComentsByPeliculaID]
	-- Add the parameters for the stored procedure here	
	@PeliculaID	INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [tc].[ComentarioId]
		  ,[tc].[texto]
		  ,[tc].[fecha]
		  ,[tc].[UserId]
		  ,[tu].[nombre] + ' ' + [tu].[apellido] [userName]
		  ,[tc].[peliculaId]
	FROM [dbo].[tbl_Comentario] tc, [dbo].[tbl_UserCLI] tu
	WHERE [tc].[peliculaId] = @PeliculaID 
	AND [tu].[UserId] = [tc].[UserId] 
	ORDER BY [fecha] DESC 
END
GO
/****** Object:  StoredProcedure [dbo].[busc_Busqueda]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 26/10/2017
-- Description:	Busqueda por Nombre de Pelicula
-- =============================================
CREATE PROCEDURE [dbo].[busc_Busqueda]
	-- Add the parameters for the stored procedure here
	@nombre NVARCHAR(60)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * 
	FROM [dbo].[tbl_Peliculas]
	WHERE nombre like '%' + @nombre + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[alq_ALQ_UpdateAlquiler]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fulla
-- Create date: 16/11/2017
-- Description:	Actualizar Alquiler
-- =============================================
CREATE PROCEDURE [dbo].[alq_ALQ_UpdateAlquiler]
	-- Add the parameters for the stored procedure here
	@TotalPago	DECIMAL(10, 2),
	@FechaAlqui	DATETIME,
	@FechaDevol	DATETIME,
	@TarjetaCredito	NVARCHAR(30),
	@CodigoTarjeta	NVARCHAR(20),
	@Estado		BIT,

	@AlquilerId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[tbl_Alquiler]
	SET [totalPago] = @TotalPago
      ,[fechaAlqui] = @FechaAlqui
      ,[fechaDevol] = @FechaDevol
	  ,[tarjetaCredito] = @TarjetaCredito
	  ,[codigoTarjeta] = @CodigoTarjeta	  
      ,[estado] = @Estado      
	WHERE [AlquilerId] = @AlquilerId

END
GO
/****** Object:  StoredProcedure [dbo].[alq_ALQ_InsertAlquiler]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fulla
-- Create date: 15/11/2017
-- Description:	Insertar Alquiler
-- =============================================
CREATE PROCEDURE [dbo].[alq_ALQ_InsertAlquiler]
	-- Add the parameters for the stored procedure here
	@TotalPago	DECIMAL(10, 2),
	@FechaAlqui	DATETIME,
	@FechaDevol	DATETIME,
	@TarjetaCredito	NVARCHAR(30),
	@CodigoTarjeta	NVARCHAR(20),
	@Estado	BIT,
	@UserId	INT,
	@PeliculaId	INT,

	@AlquilerId	INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[tbl_Alquiler]
           ([totalPago]
           ,[fechaAlqui]
           ,[fechaDevol]
           ,[tarjetaCredito]
           ,[codigoTarjeta]
           ,[estado]
           ,[UserId]
           ,[peliculaId])
     VALUES
           (@TotalPago
           ,@FechaAlqui
           ,@FechaDevol
           ,@TarjetaCredito
           ,@CodigoTarjeta
           ,@Estado
           ,@UserId
           ,@PeliculaId)

	SET @AlquilerId = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[alq_ALQ_GetAlquileresByUserId]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Full
-- Create date: 16/11/2017
-- Description:	Obtener Alquileres por UserID
-- =============================================
CREATE PROCEDURE [dbo].[alq_ALQ_GetAlquileresByUserId]
	-- Add the parameters for the stored procedure here
	@UserId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[tbl_Alquiler] 
	WHERE [UserId] = @UserId 
	ORDER BY [fechaAlqui] DESC 
END
GO
/****** Object:  StoredProcedure [dbo].[alq_ALQ_GetAlquilerById]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Full
-- Create date: 16/11/2017
-- Description:	Obtener Alquileres por ID
-- =============================================
CREATE PROCEDURE [dbo].[alq_ALQ_GetAlquilerById]
	-- Add the parameters for the stored procedure here
	@AlquilerId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[tbl_Alquiler] 
	WHERE [AlquilerId] = @AlquilerId 
	ORDER BY [fechaAlqui] DESC 
END
GO
/****** Object:  StoredProcedure [dbo].[alq_ALQ_GetAllAlquileres]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fulla
-- Create date: 16/11/2017
-- Description:	Optener todos los alquileres
-- =============================================
CREATE PROCEDURE [dbo].[alq_ALQ_GetAllAlquileres]
	-- Add the parameters for the stored procedure here		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[tbl_Alquiler] 
	ORDER BY [fechaAlqui] DESC 	

END
GO
/****** Object:  StoredProcedure [dbo].[alq_ALQ_ExistAlquiler]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fulla
-- Create date: 16/11/2017
-- Description:	Si el alquiler ya existe
-- =============================================
CREATE PROCEDURE [dbo].[alq_ALQ_ExistAlquiler]
	-- Add the parameters for the stored procedure here	
	@UserId	INT,
	@PeliculaId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[tbl_Alquiler] 
	WHERE [UserId] = @UserId 
	AND [peliculaId] = @PeliculaId

END
GO
/****** Object:  StoredProcedure [dbo].[alq_ALQ_DeleteAlquiler]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fulla
-- Create date: 16/11/2017
-- Description:	Delete Alquiler
-- =============================================
CREATE PROCEDURE [dbo].[alq_ALQ_DeleteAlquiler]
	-- Add the parameters for the stored procedure here	
	@AlquilerId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[tbl_Alquiler]
	SET [estado] = 0 
	WHERE [AlquilerId] = @AlquilerId

END
GO
/****** Object:  StoredProcedure [dbo].[admper_ADMPERM_UpdateAdmiPerm]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Fullá
-- Create date: 07/10/17
-- Description:	Actualizar la tabla administrador-permisos
-- =============================================
CREATE PROCEDURE [dbo].[admper_ADMPERM_UpdateAdmiPerm] 
@UserId int,  
@PermisoId int 
AS 
BEGIN 

UPDATE [dbo].[tbl_UserADM_Permisos]
   SET [PermisosId] = @PermisoId
 WHERE [UserId]=@UserId;

END
GO
/****** Object:  StoredProcedure [dbo].[admper_ADMPERM_InsertAdmiPerm]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Fullá
-- Create date: 07/10/17
-- Description:	Insertar de la tabla administrador-permisos
-- =============================================
CREATE PROCEDURE [dbo].[admper_ADMPERM_InsertAdmiPerm] 
@UserId int,  
@PermisoId int 
AS 
BEGIN 

INSERT INTO [dbo].[tbl_UserADM_Permisos]
           ([UserId]
           ,[PermisosId])
     VALUES
           (@UserId
           ,@PermisoId); 

END
GO
/****** Object:  StoredProcedure [dbo].[admper_ADMPERM_GetAdminPermiso]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 12/10/2017
-- Description:	Optner los permisos de los admin
-- =============================================
CREATE PROCEDURE [dbo].[admper_ADMPERM_GetAdminPermiso] 
	-- Add the parameters for the stored procedure here
	@intUserId INT,
	@intPermisoId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT [UserId]
      ,[PermisosId]
	FROM [dbo].[tbl_UserADM_Permisos]
	WHERE [UserId] = @intUserId 
	AND [PermisosId] = @intPermisoId

END
GO
/****** Object:  StoredProcedure [dbo].[admper_ADMPERM_DeleteAdmiPermALl]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[admper_ADMPERM_DeleteAdmiPermALl] 
	-- Add the parameters for the stored procedure here
	@UserId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM [dbo].[tbl_UserADM_Permisos]
      WHERE[UserId]=@UserId 	 
END
GO
/****** Object:  StoredProcedure [dbo].[admper_ADMPERM_DeleteAdmiPerm]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Fullá
-- Create date: 07/10/17
-- Description:	Eliminar la tabla administrador-permisos
-- =============================================
CREATE PROCEDURE [dbo].[admper_ADMPERM_DeleteAdmiPerm] 
@PermisoId int,
@UserId int 
AS 
BEGIN 

DELETE FROM [dbo].[tbl_UserADM_Permisos]
      WHERE[UserId]=@UserId 
	  AND [PermisosId] = @PermisoId;

END
GO
/****** Object:  StoredProcedure [dbo].[adm_USER_UpdateAdmin]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fullá
-- Create date: 04/10/17
-- Description:	Actualiza un usuario
-- =============================================
CREATE PROCEDURE [dbo].[adm_USER_UpdateAdmin] 
	@varNombre NVARCHAR(50), 
	@varApellido NVARCHAR(50), 
	@varEmail NVARCHAR(50), 
	@varPassword NVARCHAR(50), 
	@varCI NVARCHAR(10), 
	@varTelefono NVARCHAR(11), 
	@varDireccion NVARCHAR(100), 
	@intUsuarioId INT 
AS 
BEGIN 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

UPDATE [dbo].[tbl_User_ADM] 
   SET [nombre] = @varNombre 
      ,[apellido] = @varApellido 
      ,[email] = @varEmail 
      ,[password] = @varPassword 
      ,[CI] = @varCI 
      ,[telefono] = @varTelefono 
      ,[direccion] = @varDireccion 
 WHERE [UserId]=@intUsuarioId  

END
GO
/****** Object:  StoredProcedure [dbo].[adm_USER_InsertAdmin]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fullá
-- Create date: 04/10/17
-- Description:	Inserta un usuario
-- =============================================
CREATE PROCEDURE [dbo].[adm_USER_InsertAdmin] 
	@varNombre NVARCHAR(50), 
	@varApellido NVARCHAR(50), 
	@varEmail NVARCHAR(50), 
	@varPassword NVARCHAR(50), 
	@varCI NVARCHAR(10), 
	@varTelefono NVARCHAR(11), 
	@varDireccion NVARCHAR(100), 
	@intUsuarioId INT OUTPUT 
AS 
BEGIN 
-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
INSERT INTO [dbo].[tbl_User_ADM] 
           ([nombre] 
           ,[apellido] 
           ,[email] 
           ,[password] 
           ,[CI] 
           ,[telefono] 
           ,[direccion]) 
     VALUES 
			(	@varNombre, 
				@varApellido, 
				@varEmail, 
				@varPassword, 
				@varCI, 
				@varTelefono, 
				@varDireccion 
		   ) 
	SET @intUsuarioId=SCOPE_IDENTITY() 

END
GO
/****** Object:  StoredProcedure [dbo].[adm_USER_GetAdmins]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Fullá 
-- Create date: 07/10/17
-- Description:	Obtener Administradores
-- =============================================
CREATE PROCEDURE [dbo].[adm_USER_GetAdmins] 
AS 
BEGIN 
	
-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT [UserId]
      ,[nombre]
      ,[apellido]
      ,[email]
      ,[password]
      ,[CI]
      ,[telefono]
      ,[direccion]
  FROM [dbo].[tbl_User_ADM]

END
GO
/****** Object:  StoredProcedure [dbo].[adm_USER_GetAdminByID]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Fulla
-- Create date: 06/10/17
-- Description:	Obtiene Reportes de Administradores por ID
-- =============================================
CREATE PROCEDURE [dbo].[adm_USER_GetAdminByID] 
	@id INT 
AS 
BEGIN 
-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * 
	FROM tbl_User_ADM 
	WHERE UserId=@id; 
END
GO
/****** Object:  StoredProcedure [dbo].[adm_USER_GetAdminByEmail]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Fulla
-- Create date: 06/10/17
-- Description:	Obtiene Reportes de Administradores por Email
-- =============================================
CREATE PROCEDURE [dbo].[adm_USER_GetAdminByEmail] 
@Email NVARCHAR(50) 

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * 
	FROM tbl_User_ADM 
	WHERE email=@Email;

END
GO
/****** Object:  StoredProcedure [dbo].[adm_USER_GetAdminByCI]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Fulla
-- Create date: 06/10/17
-- Description:	Obtiene Reportes de Administradores por CI
-- =============================================
CREATE PROCEDURE [dbo].[adm_USER_GetAdminByCI]
	@Ci NVARCHAR(10) 
AS 
BEGIN 
-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * 
	FROM tbl_User_ADM 
	WHERE CI=@Ci;
END
GO
/****** Object:  StoredProcedure [dbo].[adm_USER_DeleteAdmin]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fullá
-- Create date: 04/10/17
-- Description:	Actualiza un usuario
-- =============================================
CREATE PROCEDURE [dbo].[adm_USER_DeleteAdmin] 
	@intUsuarioId INT 
AS 
BEGIN 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DELETE FROM [dbo].[tbl_User_ADM] 
      WHERE [UserId]=@intUsuarioId 

END
GO
/****** Object:  Table [dbo].[tblUsuario]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  Table [dbo].[tblPermiso]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[pelgen_PELGEN_UpdatePelGen]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 21/10/2017
-- Description:	Actualizar los Generos de Películas
-- =============================================
CREATE PROCEDURE [dbo].[pelgen_PELGEN_UpdatePelGen]
	-- Add the parameters for the stored procedure here
	@PeliculaId	INT,
	@GeneroId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[tblPeliculaGenero]
    SET [generoId] = @GeneroId
	WHERE [peliculaId] = @PeliculaId

END
GO
/****** Object:  StoredProcedure [dbo].[pelgen_PELGEN_InsertPelGen]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 21/10/2017
-- Description:	Insertar Generos a Películas
-- =============================================
CREATE PROCEDURE [dbo].[pelgen_PELGEN_InsertPelGen]
	-- Add the parameters for the stored procedure here
	@PeliculaId	INT,
	@GeneroId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[tblPeliculaGenero]
           ([peliculaId]
           ,[generoId])
     VALUES
           (@PeliculaId
           ,@GeneroId)

END
GO
/****** Object:  StoredProcedure [dbo].[pelgen_PELGEN_GetPeliculasByGenero]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 21/10/2017
-- Description:	Obtener los Peliculas por Genero
-- =============================================
CREATE PROCEDURE [dbo].[pelgen_PELGEN_GetPeliculasByGenero]
	-- Add the parameters for the stored procedure here	
	@GeneroId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * 
	FROM [dbo].[tblPeliculaGenero]
	WHERE [generoId] = @GeneroId
END
GO
/****** Object:  StoredProcedure [dbo].[pelgen_PELGEN_GetPelGen]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 21/10/2017
-- Description:	Obtener los Generos de Películas
-- =============================================
CREATE PROCEDURE [dbo].[pelgen_PELGEN_GetPelGen]
	-- Add the parameters for the stored procedure here
	@PeliculaId	INT,
	@GeneroId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * 
	FROM [dbo].[tblPeliculaGenero] 
	WHERE [peliculaId] = @PeliculaId 
	AND [generoId] = @GeneroId 
END
GO
/****** Object:  StoredProcedure [dbo].[pelgen_PELGEN_DeletePelGen]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 21/10/2017
-- Description:	Eliminar los Generos de Películas
-- =============================================
CREATE PROCEDURE [dbo].[pelgen_PELGEN_DeletePelGen]
	-- Add the parameters for the stored procedure here
	@PeliculaId	INT,
	@GeneroId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM [dbo].[tblPeliculaGenero] 
	WHERE [peliculaId] = @PeliculaId 
	AND [generoId] = @GeneroId 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_PERM_GetPermisosByDescription]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_PERM_GetPermisos]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_USER_UpdateUsuario]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fulla
-- Create date: 05/10/17
-- Description:	Actualiza un Usuario
-- =============================================
CREATE PROCEDURE [dbo].[usp_USER_UpdateUsuario] 
	@varNombre NVARCHAR(50),   
	@varApellido NVARCHAR(50),
	@varEmail NVARCHAR(50), 
	@intUsuarioId INT 
AS 
BEGIN 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[tbl_UserCLI] 
	 SET [nombre] = @varNombre 
		,[apellido] = @varApellido  
		,[email] = @varEmail
	WHERE [UserId]=@intUsuarioId 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_USER_ObtenerCantidadDeUsuarios]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_USER_ObtenerCantidadDeUsuarios]  
@count int output 
AS 
BEGIN 

SET @count= (select COUNT(UserId) from tbl_UserCLI); 

END
GO
/****** Object:  StoredProcedure [dbo].[usp_USER_InsertUsuario]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fullá
-- Create date: 04/10/17
-- Description:	Inserta un usuario
-- =============================================
CREATE PROCEDURE [dbo].[usp_USER_InsertUsuario] 
	@varNombre NVARCHAR(50), 
	@varApellido NVARCHAR(50), 
	@varEmail NVARCHAR(50), 
	@varPassword NVARCHAR(50), 
	@intUsuarioId INT OUTPUT 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO [dbo].[tbl_UserCLI]
           ([nombre]
           ,[apellido]
           ,[email]
           ,[password])
     VALUES
           (@varNombre,
           @varApellido,
           @varEmail,
           @varPassword) 
	SET @intUsuarioId=SCOPE_IDENTITY() 


END
GO
/****** Object:  StoredProcedure [dbo].[usp_USER_GetUsuarios]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Fullá 
-- Create date: 07/10/17
-- Description:	Obtener Administradores
-- =============================================
CREATE PROCEDURE [dbo].[usp_USER_GetUsuarios] 
AS 
BEGIN 
	
-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


SELECT [UserId]
      ,[nombre]
      ,[apellido]
      ,[email]
      ,[password]
  FROM [dbo].[tbl_UserCLI]




END
GO
/****** Object:  StoredProcedure [dbo].[usp_USER_GetUsuarioByID]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Fullá
-- Create date: 07/10/17
-- Description:	Obtener usuario por CI
-- =============================================
CREATE PROCEDURE [dbo].[usp_USER_GetUsuarioByID]
@ID int
AS 
BEGIN 
-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * 
	FROM tbl_UserCLI 
	WHERE [UserId]=@ID; 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_USER_GetUsuarioByEmail]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Fullá
-- Create date: 07/10/17
-- Description:	Obtener usuario por Email
-- =============================================
CREATE PROCEDURE [dbo].[usp_USER_GetUsuarioByEmail]
@Email NVARCHAR(50) 
AS 
BEGIN 
-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * 
	FROM tbl_UserCLI 
	WHERE email=@Email;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_USER_DeleteUsuario]    Script Date: 11/30/2017 09:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dayana Stefany Fulla
-- Create date: 05/10/17
-- Description:	Borrar Cuenta
-- =============================================
CREATE PROCEDURE [dbo].[usp_USER_DeleteUsuario] 
	@intUsuarioId INT 
AS 
BEGIN 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DELETE FROM [dbo].[tbl_UserCLI] 
      WHERE [UserId]=@intUsuarioId 

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Categoria_UpdateCategoria]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Categoria_InsertarCategoria]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Categoria_GetAllById]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Categoria_GetAll]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Categoria_EliminarCategoria]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Autor_UpdateAutor]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Autor_InsertarAutor]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Autor_GetAllById]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Autor_GetAll]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Autor_EliminarAutor]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  Table [dbo].[tblUsuarioPermiso]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Permiso_InsertarPermiso]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Permiso_GetPermisoByDescripcion]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Permiso_DeletePermiso]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Permiso_ActualizarPermiso]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  Table [dbo].[tblLibro]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Usuario_UpdateUsuario]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Usuario_UpdateContraseña]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Usuario_InsertarUsuario]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Usuario_GetUsuarioByEmail]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Usuario_GetUsuario]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Usuario_GetEmailByID]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Usuario_GetByUserName]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Usuario_GetById]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Usuario_GetAdminByEmail]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Usuario_GetAdmin]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Usuario_DeleteUsuario]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_UsuarioPermiso_UpdateUsuarioPermiso]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_UsuarioPermiso_InsertarUsuarioPermiso]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_UsuarioPermiso_GetIdByUsuarioId]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_UsuarioPermiso_GetIdByUserIdPermiId]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_UsuarioPermiso_GetAllUsuarioPermiso]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_UsuarioPermiso_EliminarUsuarioPermiso]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  Table [dbo].[tblDescarga]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  Table [dbo].[tblLectura]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Libro_UpdateLibro]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Libro_InsertarLibro]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Libro_GetLibrosById]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Libro_GetAll]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Libro_EliminarLibro]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Lectura_InsertarLectura]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Lectura_EliminarLectura]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Descarga_InsertarDescarga]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Descarga_EliminarDescarga]    Script Date: 11/30/2017 09:59:55 ******/
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
/****** Object:  ForeignKey [FK_tblUsuarioPermiso_tblPermiso]    Script Date: 11/30/2017 09:59:55 ******/
ALTER TABLE [dbo].[tblUsuarioPermiso]  WITH CHECK ADD  CONSTRAINT [FK_tblUsuarioPermiso_tblPermiso] FOREIGN KEY([permisoId])
REFERENCES [dbo].[tblPermiso] ([permisoId])
GO
ALTER TABLE [dbo].[tblUsuarioPermiso] CHECK CONSTRAINT [FK_tblUsuarioPermiso_tblPermiso]
GO
/****** Object:  ForeignKey [FK_tblUsuarioPermiso_tblUsuario]    Script Date: 11/30/2017 09:59:55 ******/
ALTER TABLE [dbo].[tblUsuarioPermiso]  WITH CHECK ADD  CONSTRAINT [FK_tblUsuarioPermiso_tblUsuario] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tblUsuario] ([usuarioId])
GO
ALTER TABLE [dbo].[tblUsuarioPermiso] CHECK CONSTRAINT [FK_tblUsuarioPermiso_tblUsuario]
GO
/****** Object:  ForeignKey [FK_tblLibro_tblAutor]    Script Date: 11/30/2017 09:59:55 ******/
ALTER TABLE [dbo].[tblLibro]  WITH CHECK ADD  CONSTRAINT [FK_tblLibro_tblAutor] FOREIGN KEY([autorId])
REFERENCES [dbo].[tblAutor] ([autorId])
GO
ALTER TABLE [dbo].[tblLibro] CHECK CONSTRAINT [FK_tblLibro_tblAutor]
GO
/****** Object:  ForeignKey [FK_tblLibro_tblCategoria]    Script Date: 11/30/2017 09:59:55 ******/
ALTER TABLE [dbo].[tblLibro]  WITH CHECK ADD  CONSTRAINT [FK_tblLibro_tblCategoria] FOREIGN KEY([categoriaId])
REFERENCES [dbo].[tblCategoria] ([categoriaID])
GO
ALTER TABLE [dbo].[tblLibro] CHECK CONSTRAINT [FK_tblLibro_tblCategoria]
GO
/****** Object:  ForeignKey [FK_tblDescarga_tblLibro]    Script Date: 11/30/2017 09:59:55 ******/
ALTER TABLE [dbo].[tblDescarga]  WITH CHECK ADD  CONSTRAINT [FK_tblDescarga_tblLibro] FOREIGN KEY([libroId])
REFERENCES [dbo].[tblLibro] ([LibroId])
GO
ALTER TABLE [dbo].[tblDescarga] CHECK CONSTRAINT [FK_tblDescarga_tblLibro]
GO
/****** Object:  ForeignKey [FK_tblDescarga_tblUsuario]    Script Date: 11/30/2017 09:59:55 ******/
ALTER TABLE [dbo].[tblDescarga]  WITH CHECK ADD  CONSTRAINT [FK_tblDescarga_tblUsuario] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tblUsuario] ([usuarioId])
GO
ALTER TABLE [dbo].[tblDescarga] CHECK CONSTRAINT [FK_tblDescarga_tblUsuario]
GO
/****** Object:  ForeignKey [FK_tblLectura_tblLibro]    Script Date: 11/30/2017 09:59:55 ******/
ALTER TABLE [dbo].[tblLectura]  WITH CHECK ADD  CONSTRAINT [FK_tblLectura_tblLibro] FOREIGN KEY([libroId])
REFERENCES [dbo].[tblLibro] ([LibroId])
GO
ALTER TABLE [dbo].[tblLectura] CHECK CONSTRAINT [FK_tblLectura_tblLibro]
GO
/****** Object:  ForeignKey [FK_tblLectura_tblUsuario]    Script Date: 11/30/2017 09:59:55 ******/
ALTER TABLE [dbo].[tblLectura]  WITH CHECK ADD  CONSTRAINT [FK_tblLectura_tblUsuario] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tblUsuario] ([usuarioId])
GO
ALTER TABLE [dbo].[tblLectura] CHECK CONSTRAINT [FK_tblLectura_tblUsuario]
GO
