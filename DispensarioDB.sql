USE [master]
GO
/****** Object:  Database [Dispensario]    Script Date: 2/11/2020 13:37:50 ******/
CREATE DATABASE [Dispensario]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Dispensario', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\Dispensario.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Dispensario_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\Dispensario_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Dispensario] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Dispensario].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Dispensario] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Dispensario] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Dispensario] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Dispensario] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Dispensario] SET ARITHABORT OFF 
GO
ALTER DATABASE [Dispensario] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Dispensario] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Dispensario] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Dispensario] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Dispensario] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Dispensario] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Dispensario] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Dispensario] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Dispensario] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Dispensario] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Dispensario] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Dispensario] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Dispensario] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Dispensario] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Dispensario] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Dispensario] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Dispensario] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Dispensario] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Dispensario] SET  MULTI_USER 
GO
ALTER DATABASE [Dispensario] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Dispensario] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Dispensario] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Dispensario] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Dispensario] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Dispensario] SET QUERY_STORE = OFF
GO
USE [Dispensario]
GO
/****** Object:  Table [dbo].[Accidente_de_Trabajo]    Script Date: 2/11/2020 13:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accidente_de_Trabajo](
	[ID_Accidente] [int] NOT NULL,
	[Fecha_Accidente] [date] NOT NULL,
	[Hora_Accidente] [time](7) NOT NULL,
	[Lugar_Accidente] [nvarchar](80) NOT NULL,
	[Lugar_Especifico] [nvarchar](80) NOT NULL,
	[Distrito/Frente] [nvarchar](40) NOT NULL,
	[Nombre_Testigo1] [nvarchar](50) NOT NULL,
	[Nombre_Testigo2] [nvarchar](50) NOT NULL,
	[Cod_Testigo1] [int] NOT NULL,
	[Cod_Testigo2] [int] NOT NULL,
	[Descripcion_Accidente] [nvarchar](80) NOT NULL,
	[Partes_Lesionadas] [nvarchar](80) NOT NULL,
	[Causas_Accidente] [nvarchar](50) NOT NULL,
	[Detalles] [nvarchar](50) NOT NULL,
	[ID_Usuario] [int] NOT NULL,
	[Lugar_Traslado] [nvarchar](80) NOT NULL,
	[Medida_Preventiva1] [nvarchar](50) NOT NULL,
	[Medida_Preventiva2] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Accidente_de_Trabajo] PRIMARY KEY CLUSTERED 
(
	[ID_Accidente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consulta]    Script Date: 2/11/2020 13:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consulta](
	[ID_Consulta] [int] NOT NULL,
	[ID_PreClinica] [int] NOT NULL,
	[Hora] [time](4) NOT NULL,
	[Tipo_Consulta] [nvarchar](50) NOT NULL,
	[ID_Usuario] [int] NOT NULL,
	[Diagnostico] [nvarchar](80) NOT NULL,
	[ID_Receta] [int] NULL,
	[ID_Laboratorio] [int] NULL,
	[Dias_Incapacidad] [int] NULL,
	[Fecha_Inicio] [date] NULL,
	[Fecha_Final] [date] NULL,
	[Tipo_Descanso] [bit] NULL,
	[ID_Accidente] [int] NULL,
 CONSTRAINT [PK_Consulta] PRIMARY KEY CLUSTERED 
(
	[ID_Consulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_Laboratorio]    Script Date: 2/11/2020 13:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Laboratorio](
	[ID_Detalle] [int] NOT NULL,
	[ID_Laboratorio] [int] NOT NULL,
	[ID_Examen] [int] NOT NULL,
 CONSTRAINT [PK_Detalle_Laboratorio] PRIMARY KEY CLUSTERED 
(
	[ID_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_Receta]    Script Date: 2/11/2020 13:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Receta](
	[ID_Detalle] [int] NOT NULL,
	[ID_Receta] [int] NOT NULL,
	[ID_Medicamento] [int] NOT NULL,
	[Cantidad] [int] NULL,
	[Dosis] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Detalle_Receta] PRIMARY KEY CLUSTERED 
(
	[ID_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleDet]    Script Date: 2/11/2020 13:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleDet](
	[ID_Detalle] [int] NOT NULL,
	[Medicamento] [int] NOT NULL,
	[Descripción] [nvarchar](20) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Dosis] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_DetalleDet_1] PRIMARY KEY CLUSTERED 
(
	[ID_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetDetalleLab]    Script Date: 2/11/2020 13:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetDetalleLab](
	[ID_Detalle] [int] NOT NULL,
	[ID_Examen] [int] NOT NULL,
	[Categoría] [nvarchar](30) NOT NULL,
	[Descripción] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DetDetalleLab] PRIMARY KEY CLUSTERED 
(
	[ID_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 2/11/2020 13:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[Cod_Empleado] [int] NOT NULL,
	[Nombre] [nvarchar](60) NOT NULL,
	[Num_Identidad] [nvarchar](16) NOT NULL,
	[Fecha_Nacimiento] [date] NOT NULL,
	[Edad] [int] NOT NULL,
	[Sexo] [bit] NOT NULL,
	[Nacionalidad] [bit] NOT NULL,
	[Direccion] [nvarchar](80) NOT NULL,
	[Telefono] [nvarchar](12) NOT NULL,
	[Cargo] [nvarchar](50) NOT NULL,
	[Departamento] [nvarchar](40) NOT NULL,
	[Antiguedad] [nvarchar](20) NOT NULL,
	[Supervisor] [nvarchar](60) NOT NULL,
	[Centro_Costo] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[Cod_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Examenes_Laboratorio]    Script Date: 2/11/2020 13:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Examenes_Laboratorio](
	[ID_Examen] [int] NOT NULL,
	[Categoria] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](55) NOT NULL,
 CONSTRAINT [PK_Examenes_Laboratorio] PRIMARY KEY CLUSTERED 
(
	[ID_Examen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Expediente]    Script Date: 2/11/2020 13:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expediente](
	[ID_Expediente] [nchar](10) NULL,
	[ID_Consulta] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Familia]    Script Date: 2/11/2020 13:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Familia](
	[ID_Familia] [int] NOT NULL,
	[Cod_Empleado] [int] NOT NULL,
	[Nombre] [nvarchar](60) NOT NULL,
	[Edad] [int] NOT NULL,
	[Género] [bit] NOT NULL,
 CONSTRAINT [PK_Familia] PRIMARY KEY CLUSTERED 
(
	[ID_Familia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Laboratorio]    Script Date: 2/11/2020 13:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laboratorio](
	[ID_Laboratorio] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Edad] [int] NOT NULL,
	[Sexo] [nvarchar](15) NOT NULL,
	[Fecha] [date] NOT NULL,
	[ID_Usuario] [int] NOT NULL,
 CONSTRAINT [PK_Laboratorio] PRIMARY KEY CLUSTERED 
(
	[ID_Laboratorio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamentos]    Script Date: 2/11/2020 13:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamentos](
	[ID_Medicamento] [int] NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Unidad] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Medicamentos] PRIMARY KEY CLUSTERED 
(
	[ID_Medicamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pre_Clinica]    Script Date: 2/11/2020 13:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pre_Clinica](
	[ID_PreClinica] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Cod_Empleado] [int] NOT NULL,
	[Tipo_Paciente] [bit] NOT NULL,
	[ID_Familia] [int] NULL,
	[Altura] [nvarchar](20) NOT NULL,
	[Temperatura] [nvarchar](20) NOT NULL,
	[Peso] [nvarchar](20) NOT NULL,
	[ID_Usuario] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Pre_Clinica] PRIMARY KEY CLUSTERED 
(
	[ID_PreClinica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta]    Script Date: 2/11/2020 13:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta](
	[ID_Receta] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_Receta] PRIMARY KEY CLUSTERED 
(
	[ID_Receta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 2/11/2020 13:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[ID_Usuario] [int] NOT NULL,
	[Usuario] [nvarchar](20) NOT NULL,
	[Contraseña] [nvarchar](20) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Cargo] [nvarchar](20) NOT NULL,
	[Tipo_Usuario] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Consulta] ([ID_Consulta], [ID_PreClinica], [Hora], [Tipo_Consulta], [ID_Usuario], [Diagnostico], [ID_Receta], [ID_Laboratorio], [Dias_Incapacidad], [Fecha_Inicio], [Fecha_Final], [Tipo_Descanso], [ID_Accidente]) VALUES (1, 1, CAST(N'11:11:00' AS Time), N'Enfermedad Común', 1, N'Gripe', NULL, NULL, 0, CAST(N'1900-01-01' AS Date), CAST(N'1900-01-01' AS Date), 0, NULL)
INSERT [dbo].[Consulta] ([ID_Consulta], [ID_PreClinica], [Hora], [Tipo_Consulta], [ID_Usuario], [Diagnostico], [ID_Receta], [ID_Laboratorio], [Dias_Incapacidad], [Fecha_Inicio], [Fecha_Final], [Tipo_Descanso], [ID_Accidente]) VALUES (3, 5, CAST(N'13:09:00' AS Time), N'Enfermedad Común', 1, N'Gripe', 1, 1, 0, CAST(N'1900-01-01' AS Date), CAST(N'1900-01-01' AS Date), 1, NULL)
INSERT [dbo].[Consulta] ([ID_Consulta], [ID_PreClinica], [Hora], [Tipo_Consulta], [ID_Usuario], [Diagnostico], [ID_Receta], [ID_Laboratorio], [Dias_Incapacidad], [Fecha_Inicio], [Fecha_Final], [Tipo_Descanso], [ID_Accidente]) VALUES (4, 9, CAST(N'15:43:00' AS Time), N'Enfermedad Común', 1, N'Gripe', NULL, 2, 0, CAST(N'1900-01-01' AS Date), CAST(N'1900-01-01' AS Date), 1, NULL)
INSERT [dbo].[Consulta] ([ID_Consulta], [ID_PreClinica], [Hora], [Tipo_Consulta], [ID_Usuario], [Diagnostico], [ID_Receta], [ID_Laboratorio], [Dias_Incapacidad], [Fecha_Inicio], [Fecha_Final], [Tipo_Descanso], [ID_Accidente]) VALUES (5, 10, CAST(N'15:50:00' AS Time), N'Accidente Común', 1, N'Brazo roto', NULL, NULL, 0, CAST(N'1900-01-01' AS Date), CAST(N'1900-01-01' AS Date), 0, NULL)
INSERT [dbo].[Consulta] ([ID_Consulta], [ID_PreClinica], [Hora], [Tipo_Consulta], [ID_Usuario], [Diagnostico], [ID_Receta], [ID_Laboratorio], [Dias_Incapacidad], [Fecha_Inicio], [Fecha_Final], [Tipo_Descanso], [ID_Accidente]) VALUES (6, 11, CAST(N'16:07:00' AS Time), N'Enfermedad Común', 1, N'Gripe', 3, 3, 0, CAST(N'1900-01-01' AS Date), CAST(N'1900-01-01' AS Date), 1, NULL)
GO
INSERT [dbo].[Detalle_Laboratorio] ([ID_Detalle], [ID_Laboratorio], [ID_Examen]) VALUES (1, 1, 1)
INSERT [dbo].[Detalle_Laboratorio] ([ID_Detalle], [ID_Laboratorio], [ID_Examen]) VALUES (2, 2, 1)
INSERT [dbo].[Detalle_Laboratorio] ([ID_Detalle], [ID_Laboratorio], [ID_Examen]) VALUES (3, 3, 23)
GO
INSERT [dbo].[Detalle_Receta] ([ID_Detalle], [ID_Receta], [ID_Medicamento], [Cantidad], [Dosis]) VALUES (1, 1, 1, 1, N'hhgjhkj')
INSERT [dbo].[Detalle_Receta] ([ID_Detalle], [ID_Receta], [ID_Medicamento], [Cantidad], [Dosis]) VALUES (2, 2, 1, 12, N'Tomar 1 cada 8 horas')
INSERT [dbo].[Detalle_Receta] ([ID_Detalle], [ID_Receta], [ID_Medicamento], [Cantidad], [Dosis]) VALUES (3, 3, 1, 12, N'dfdfg')
INSERT [dbo].[Detalle_Receta] ([ID_Detalle], [ID_Receta], [ID_Medicamento], [Cantidad], [Dosis]) VALUES (4, 3, 3, 12, N'ghrdfdft')
GO
INSERT [dbo].[Empleados] ([Cod_Empleado], [Nombre], [Num_Identidad], [Fecha_Nacimiento], [Edad], [Sexo], [Nacionalidad], [Direccion], [Telefono], [Cargo], [Departamento], [Antiguedad], [Supervisor], [Centro_Costo]) VALUES (111, N'Jose Mendoza', N'0801198690987', CAST(N'1986-11-06' AS Date), 34, 0, 0, N'Col. El Sarzal', N'98765432', N'Soldador', N'Fabrica', N'3 años', N'José Ponce', N'GS12-INFO')
INSERT [dbo].[Empleados] ([Cod_Empleado], [Nombre], [Num_Identidad], [Fecha_Nacimiento], [Edad], [Sexo], [Nacionalidad], [Direccion], [Telefono], [Cargo], [Departamento], [Antiguedad], [Supervisor], [Centro_Costo]) VALUES (112, N'Lidia Morazan', N'0827199100098', CAST(N'1991-03-08' AS Date), 29, 1, 0, N'Villa de San Francisco', N'89675432', N'Gerente', N'Contabilidad', N'6 meses', N'José Ponce', N'GS12-INFO')
INSERT [dbo].[Empleados] ([Cod_Empleado], [Nombre], [Num_Identidad], [Fecha_Nacimiento], [Edad], [Sexo], [Nacionalidad], [Direccion], [Telefono], [Cargo], [Departamento], [Antiguedad], [Supervisor], [Centro_Costo]) VALUES (113, N'Carlos Rodriguez', N'0826197609123', CAST(N'1976-09-23' AS Date), 44, 0, 0, N'Cantarranas', N'34567890', N'Agricultor', N'Agricultura', N'4 años', N'José Ponce', N'GS12-INFO')
INSERT [dbo].[Empleados] ([Cod_Empleado], [Nombre], [Num_Identidad], [Fecha_Nacimiento], [Edad], [Sexo], [Nacionalidad], [Direccion], [Telefono], [Cargo], [Departamento], [Antiguedad], [Supervisor], [Centro_Costo]) VALUES (114, N'Noe Ponce', N'0706198700765', CAST(N'1987-01-08' AS Date), 33, 0, 0, N'Danli', N'98765409', N'Dibujante', N'Fabrica', N'2 años', N'José Ponce', N'GS12-INFO')
INSERT [dbo].[Empleados] ([Cod_Empleado], [Nombre], [Num_Identidad], [Fecha_Nacimiento], [Edad], [Sexo], [Nacionalidad], [Direccion], [Telefono], [Cargo], [Departamento], [Antiguedad], [Supervisor], [Centro_Costo]) VALUES (115, N'Maria Lopez', N'0826199400678', CAST(N'1994-12-03' AS Date), 26, 1, 0, N'Cantarranas', N'99668381', N'Analista', N'Laboratorio', N'1 año', N'José Ponce', N'GS12-INFO')
GO
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (1, N'Hematología', N'Hemograma Completo')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (2, N'Hematología', N'Tiempo de Protrombina')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (3, N'Hematología', N'Tiempo de Tromboplastina')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (4, N'Hematología', N'Gota Gruesa')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (5, N'Hematología', N'Velocidad de Eritrosedimentación (VES)')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (6, N'Hematología', N'Frotis de Sangre Periférica')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (7, N'Bioquímica Clínica', N'Glucosa en Ayunas')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (8, N'Bioquímica Clínica', N'Glucosa 2 horas post prandial')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (9, N'Bioquímica Clínica', N'Curva de Tolerancia Oral a la Glucosa')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (10, N'Bioquímica Clínica', N'Colesterol Total')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (11, N'Bioquímica Clínica', N'Colesterol HDL')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (12, N'Bioquímica Clínica', N'Colesterol LDL')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (13, N'Bioquímica Clínica', N'Triglicéridos')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (14, N'Bioquímica Clínica', N'Ácido Úrico')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (15, N'Bioquímica Clínica', N'TGO')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (16, N'Bioquímica Clínica', N'TGP')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (17, N'Bioquímica Clínica', N'Bilirrubina Total')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (18, N'Bioquímica Clínica', N'Bilirrubina Directa e Indirecta')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (19, N'Bioquímica Clínica', N'Urea/ BUN')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (20, N'Bioquímica Clínica', N'Creatinina')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (21, N'Uroanálisis', N'Examen General de Orina')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (22, N'Uroanálisis', N'Prueba de Embarazo')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (23, N'Parasitología', N'General de Heces')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (24, N'Parasitología', N'Coloración de Wright')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (25, N'Parasitología', N'Fehling')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (26, N'Parasitología', N'Seriado de Heces')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (27, N'Parasitología', N'Sangre Oculta')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (28, N'Marcadores Tumorales y Cardíacos', N'PSA Total')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (29, N'Marcadores Tumorales y Cardíacos', N'Troponina')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (30, N'Marcadores Tumorales y Cardíacos', N'CK-MB')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (31, N'Electrolitos', N'Sodio')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (32, N'Electrolitos', N'Potasio')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (33, N'Electrolitos', N'Cloro')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (34, N'Inmunología', N'Hepatitis A')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (35, N'Inmunología', N'PCR (Proteína C Reactiva)')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (36, N'Inmunología', N'Prueba de Embarazo')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (37, N'Inmunología', N'Helicobacter pylori en Heces')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (38, N'Inmunología', N'Helibacter pylori en Sangre')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (39, N'Inmunología', N'Factor Reumatoide (Ra Test)')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (40, N'Inmunología', N'Serología por Dengue')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (41, N'Inmunología', N'Antiestreptolisina O (ASO)')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (42, N'Inmunología', N'Reagina Plasmatica Rapída (RPR)')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (43, N'Inmunología', N'Virus de Inmunodeficiencia Humana (VIH)')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (44, N'Hormonas', N'T3 Total')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (45, N'Hormonas', N'T4 Total')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (46, N'Hormonas', N'TSH')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (47, N'Drogas de Abuso', N'Alcohol en aliento')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (48, N'Drogas de Abuso', N'Alcohol en orina')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (49, N'Drogas de Abuso', N'Cocaína')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (50, N'Drogas de Abuso', N'Marihuana')
INSERT [dbo].[Examenes_Laboratorio] ([ID_Examen], [Categoria], [Descripcion]) VALUES (51, N'Drogas de Abuso', N'Anfetaminas')
GO
INSERT [dbo].[Familia] ([ID_Familia], [Cod_Empleado], [Nombre], [Edad], [Género]) VALUES (1, 111, N'Ana Maria Lagos', 18, 1)
INSERT [dbo].[Familia] ([ID_Familia], [Cod_Empleado], [Nombre], [Edad], [Género]) VALUES (2, 113, N'luis perez', 12, 0)
INSERT [dbo].[Familia] ([ID_Familia], [Cod_Empleado], [Nombre], [Edad], [Género]) VALUES (3, 114, N'Luisa Vasquez', 16, 1)
GO
INSERT [dbo].[Laboratorio] ([ID_Laboratorio], [Nombre], [Edad], [Sexo], [Fecha], [ID_Usuario]) VALUES (1, N'Noe Ponce', 33, N'Masculino', CAST(N'2020-08-10' AS Date), 1)
INSERT [dbo].[Laboratorio] ([ID_Laboratorio], [Nombre], [Edad], [Sexo], [Fecha], [ID_Usuario]) VALUES (2, N'Jose Mendoza', 34, N'Masculino', CAST(N'1900-01-01' AS Date), 1)
INSERT [dbo].[Laboratorio] ([ID_Laboratorio], [Nombre], [Edad], [Sexo], [Fecha], [ID_Usuario]) VALUES (3, N'Jose Mendoza', 34, N'Masculino', CAST(N'2020-10-19' AS Date), 1)
GO
INSERT [dbo].[Medicamentos] ([ID_Medicamento], [Descripcion], [Cantidad], [Unidad]) VALUES (1, N'Acetaminofen', 10, N'Cajas')
INSERT [dbo].[Medicamentos] ([ID_Medicamento], [Descripcion], [Cantidad], [Unidad]) VALUES (2, N'Paracetamol', 15, N'Cajas')
INSERT [dbo].[Medicamentos] ([ID_Medicamento], [Descripcion], [Cantidad], [Unidad]) VALUES (3, N'Suero', 15, N'Botes')
GO
INSERT [dbo].[Pre_Clinica] ([ID_PreClinica], [Fecha], [Cod_Empleado], [Tipo_Paciente], [ID_Familia], [Altura], [Temperatura], [Peso], [ID_Usuario], [Estado]) VALUES (1, CAST(N'2020-09-28' AS Date), 111, 1, 1, N'178 cm', N'34', N'67 kg', 1, 1)
INSERT [dbo].[Pre_Clinica] ([ID_PreClinica], [Fecha], [Cod_Empleado], [Tipo_Paciente], [ID_Familia], [Altura], [Temperatura], [Peso], [ID_Usuario], [Estado]) VALUES (2, CAST(N'2020-09-28' AS Date), 112, 0, NULL, N'165 cm', N'37', N'67 kg', 1, 1)
INSERT [dbo].[Pre_Clinica] ([ID_PreClinica], [Fecha], [Cod_Empleado], [Tipo_Paciente], [ID_Familia], [Altura], [Temperatura], [Peso], [ID_Usuario], [Estado]) VALUES (3, CAST(N'2020-09-28' AS Date), 113, 0, NULL, N'178 cm', N'36', N'112 KG', 1, 1)
INSERT [dbo].[Pre_Clinica] ([ID_PreClinica], [Fecha], [Cod_Empleado], [Tipo_Paciente], [ID_Familia], [Altura], [Temperatura], [Peso], [ID_Usuario], [Estado]) VALUES (4, CAST(N'2020-09-28' AS Date), 113, 1, 2, N'143 cm', N'36', N'112 KG', 1, 1)
INSERT [dbo].[Pre_Clinica] ([ID_PreClinica], [Fecha], [Cod_Empleado], [Tipo_Paciente], [ID_Familia], [Altura], [Temperatura], [Peso], [ID_Usuario], [Estado]) VALUES (5, CAST(N'2020-09-28' AS Date), 114, 0, NULL, N'176 cm', N'36', N'134 kg', 1, 0)
INSERT [dbo].[Pre_Clinica] ([ID_PreClinica], [Fecha], [Cod_Empleado], [Tipo_Paciente], [ID_Familia], [Altura], [Temperatura], [Peso], [ID_Usuario], [Estado]) VALUES (6, CAST(N'2020-10-08' AS Date), 114, 1, 3, N'157 cm', N'36', N'35 kg', 1, 0)
INSERT [dbo].[Pre_Clinica] ([ID_PreClinica], [Fecha], [Cod_Empleado], [Tipo_Paciente], [ID_Familia], [Altura], [Temperatura], [Peso], [ID_Usuario], [Estado]) VALUES (7, CAST(N'2020-10-15' AS Date), 111, 0, NULL, N'165 cm', N'36', N'134 kg', 1, 1)
INSERT [dbo].[Pre_Clinica] ([ID_PreClinica], [Fecha], [Cod_Empleado], [Tipo_Paciente], [ID_Familia], [Altura], [Temperatura], [Peso], [ID_Usuario], [Estado]) VALUES (8, CAST(N'2020-10-15' AS Date), 114, 0, NULL, N'178 cm', N'36', N'134 kg', 1, 1)
INSERT [dbo].[Pre_Clinica] ([ID_PreClinica], [Fecha], [Cod_Empleado], [Tipo_Paciente], [ID_Familia], [Altura], [Temperatura], [Peso], [ID_Usuario], [Estado]) VALUES (9, CAST(N'2020-10-15' AS Date), 111, 0, NULL, N'178 cm', N'36', N'134 kg', 1, 1)
INSERT [dbo].[Pre_Clinica] ([ID_PreClinica], [Fecha], [Cod_Empleado], [Tipo_Paciente], [ID_Familia], [Altura], [Temperatura], [Peso], [ID_Usuario], [Estado]) VALUES (10, CAST(N'2020-10-15' AS Date), 114, 0, NULL, N'178 cm', N'36', N'134 kg', 1, 1)
INSERT [dbo].[Pre_Clinica] ([ID_PreClinica], [Fecha], [Cod_Empleado], [Tipo_Paciente], [ID_Familia], [Altura], [Temperatura], [Peso], [ID_Usuario], [Estado]) VALUES (11, CAST(N'2020-10-19' AS Date), 111, 0, NULL, N'178 cm', N'36', N'134 kg', 1, 1)
GO
INSERT [dbo].[Receta] ([ID_Receta], [Fecha]) VALUES (1, CAST(N'2020-08-10' AS Date))
INSERT [dbo].[Receta] ([ID_Receta], [Fecha]) VALUES (2, CAST(N'2020-08-10' AS Date))
INSERT [dbo].[Receta] ([ID_Receta], [Fecha]) VALUES (3, CAST(N'2020-10-19' AS Date))
GO
INSERT [dbo].[Usuarios] ([ID_Usuario], [Usuario], [Contraseña], [Nombre], [Cargo], [Tipo_Usuario]) VALUES (1, N'Silvia', N'1234', N'Silvia Sevilla', N'Practicante', N'1')
INSERT [dbo].[Usuarios] ([ID_Usuario], [Usuario], [Contraseña], [Nombre], [Cargo], [Tipo_Usuario]) VALUES (2, N'rcastro', N'1234', N'Regina Castro', N'Enfermera', N'2')
GO
ALTER TABLE [dbo].[Accidente_de_Trabajo]  WITH CHECK ADD  CONSTRAINT [FK_Accidente_de_Trabajo_Usuarios] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Accidente_de_Trabajo] CHECK CONSTRAINT [FK_Accidente_de_Trabajo_Usuarios]
GO
ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_Accidente_de_Trabajo] FOREIGN KEY([ID_Accidente])
REFERENCES [dbo].[Accidente_de_Trabajo] ([ID_Accidente])
GO
ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [FK_Consulta_Accidente_de_Trabajo]
GO
ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_Laboratorio] FOREIGN KEY([ID_Laboratorio])
REFERENCES [dbo].[Laboratorio] ([ID_Laboratorio])
GO
ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [FK_Consulta_Laboratorio]
GO
ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_Pre_Clinica] FOREIGN KEY([ID_PreClinica])
REFERENCES [dbo].[Pre_Clinica] ([ID_PreClinica])
GO
ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [FK_Consulta_Pre_Clinica]
GO
ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_Receta] FOREIGN KEY([ID_Receta])
REFERENCES [dbo].[Receta] ([ID_Receta])
GO
ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [FK_Consulta_Receta]
GO
ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_Usuarios] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [FK_Consulta_Usuarios]
GO
ALTER TABLE [dbo].[Detalle_Laboratorio]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Laboratorio_Examenes_Laboratorio] FOREIGN KEY([ID_Examen])
REFERENCES [dbo].[Examenes_Laboratorio] ([ID_Examen])
GO
ALTER TABLE [dbo].[Detalle_Laboratorio] CHECK CONSTRAINT [FK_Detalle_Laboratorio_Examenes_Laboratorio]
GO
ALTER TABLE [dbo].[Detalle_Laboratorio]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Laboratorio_Laboratorio1] FOREIGN KEY([ID_Laboratorio])
REFERENCES [dbo].[Laboratorio] ([ID_Laboratorio])
GO
ALTER TABLE [dbo].[Detalle_Laboratorio] CHECK CONSTRAINT [FK_Detalle_Laboratorio_Laboratorio1]
GO
ALTER TABLE [dbo].[Detalle_Receta]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Receta_Medicamentos] FOREIGN KEY([ID_Medicamento])
REFERENCES [dbo].[Medicamentos] ([ID_Medicamento])
GO
ALTER TABLE [dbo].[Detalle_Receta] CHECK CONSTRAINT [FK_Detalle_Receta_Medicamentos]
GO
ALTER TABLE [dbo].[Detalle_Receta]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Receta_Receta1] FOREIGN KEY([ID_Receta])
REFERENCES [dbo].[Receta] ([ID_Receta])
GO
ALTER TABLE [dbo].[Detalle_Receta] CHECK CONSTRAINT [FK_Detalle_Receta_Receta1]
GO
ALTER TABLE [dbo].[Expediente]  WITH CHECK ADD  CONSTRAINT [FK_Expediente_Consulta] FOREIGN KEY([ID_Consulta])
REFERENCES [dbo].[Consulta] ([ID_Consulta])
GO
ALTER TABLE [dbo].[Expediente] CHECK CONSTRAINT [FK_Expediente_Consulta]
GO
ALTER TABLE [dbo].[Familia]  WITH CHECK ADD  CONSTRAINT [FK_Familia_Empleados] FOREIGN KEY([Cod_Empleado])
REFERENCES [dbo].[Empleados] ([Cod_Empleado])
GO
ALTER TABLE [dbo].[Familia] CHECK CONSTRAINT [FK_Familia_Empleados]
GO
ALTER TABLE [dbo].[Laboratorio]  WITH CHECK ADD  CONSTRAINT [FK_Laboratorio_Usuarios] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Laboratorio] CHECK CONSTRAINT [FK_Laboratorio_Usuarios]
GO
ALTER TABLE [dbo].[Pre_Clinica]  WITH CHECK ADD  CONSTRAINT [FK_Pre_Clinica_Empleados] FOREIGN KEY([Cod_Empleado])
REFERENCES [dbo].[Empleados] ([Cod_Empleado])
GO
ALTER TABLE [dbo].[Pre_Clinica] CHECK CONSTRAINT [FK_Pre_Clinica_Empleados]
GO
ALTER TABLE [dbo].[Pre_Clinica]  WITH CHECK ADD  CONSTRAINT [FK_Pre_Clinica_Familia] FOREIGN KEY([ID_Familia])
REFERENCES [dbo].[Familia] ([ID_Familia])
GO
ALTER TABLE [dbo].[Pre_Clinica] CHECK CONSTRAINT [FK_Pre_Clinica_Familia]
GO
ALTER TABLE [dbo].[Pre_Clinica]  WITH CHECK ADD  CONSTRAINT [FK_Pre_Clinica_Usuarios] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Pre_Clinica] CHECK CONSTRAINT [FK_Pre_Clinica_Usuarios]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarLaboratorio]    Script Date: 2/11/2020 13:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ActualizarLaboratorio]
@ID_Consulta as int,
@ID_Laboratorio as int
as
begin
update Consulta set ID_Laboratorio = @ID_Laboratorio where ID_Consulta = @ID_Consulta
end
GO
/****** Object:  StoredProcedure [dbo].[ActualizarPrecli]    Script Date: 2/11/2020 13:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ActualizarPrecli]
@ID_PreClinica as int
as
begin
update Pre_Clinica set Estado = 0 where ID_PreClinica = @ID_PreClinica
end
GO
/****** Object:  StoredProcedure [dbo].[ActualizarReceta]    Script Date: 2/11/2020 13:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ActualizarReceta]
@ID_Consulta as int,
@ID_Receta as int
as
begin
update Consulta set ID_Receta = @ID_Receta where ID_Consulta = @ID_Consulta
end
GO
/****** Object:  StoredProcedure [dbo].[IngresarDetalleLab]    Script Date: 2/11/2020 13:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[IngresarDetalleLab]
@ID_Detalle as int,
@ID_Laboratorio as int,
@ID_Examen as int
as
begin
insert into Detalle_Laboratorio values (
@ID_Detalle,
@ID_Laboratorio,
@ID_Examen
)
end
GO
/****** Object:  StoredProcedure [dbo].[IngresarDetalleRec]    Script Date: 2/11/2020 13:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[IngresarDetalleRec]
@ID_Detalle as int,
@ID_Receta as int,
@ID_Medicamento as int,
@Cantidad as int,
@Dosis as nvarchar(50)
as
begin
insert into Detalle_Receta values (
@ID_Detalle,
@ID_Receta,
@ID_Medicamento,
@Cantidad,
@Dosis
)
end
GO
/****** Object:  StoredProcedure [dbo].[IngresarDetDetalle]    Script Date: 2/11/2020 13:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[IngresarDetDetalle]
@ID_Detalle as int,
@Medicamento as int,
@Descripcion as nvarchar(20),
@Cantidad as int,
@Dosis as nvarchar(50)
as
begin 
insert into DetalleDet VALUES (
@ID_Detalle,
@Medicamento,
@Descripcion,
@Cantidad,
@Dosis 
)
END 
GO
/****** Object:  StoredProcedure [dbo].[IngresarDetDetalleLab]    Script Date: 2/11/2020 13:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[IngresarDetDetalleLab]
@ID_Detalle as int,
@ID_Examen as int,
@Categoria as nvarchar(30),
@Descripcion as nvarchar(50)
as
begin 
insert into DetDetalleLab VALUES (
@ID_Detalle,
@ID_Examen,
@Categoria,
@Descripcion
)
END 
GO
/****** Object:  StoredProcedure [dbo].[IngresarLaboratorio]    Script Date: 2/11/2020 13:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[IngresarLaboratorio]
@ID_Laboratorio as int,
@Nombre as nvarchar(50),
@Edad as int,
@Sexo as nvarchar(15),
@Fecha as date,
@ID_Usuario as int
as 
begin
insert into Laboratorio values(
@ID_Laboratorio,
@Nombre,
@Edad,
@Sexo,
@Fecha,
@ID_Usuario
)
end 
GO
/****** Object:  StoredProcedure [dbo].[IngresarReceta]    Script Date: 2/11/2020 13:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[IngresarReceta]
@ID_Receta as int,
@Fecha as date
as 
begin
insert into Receta values(
@ID_Receta,
@Fecha
)
end 
GO
USE [master]
GO
ALTER DATABASE [Dispensario] SET  READ_WRITE 
GO
