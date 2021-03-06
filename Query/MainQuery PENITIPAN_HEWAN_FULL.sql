USE [PENITIPAN_HEWAN_BARU]
GO
/****** Object:  Database [PENITIPAN_HEWAN]    Script Date: 1/11/2022 5:49:29 PM ******/
CREATE DATABASE [PENITIPAN_HEWAN_BARU]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PENITIPAN_HEWAN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PENITIPAN_HEWAN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PENITIPAN_HEWAN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PENITIPAN_HEWAN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PENITIPAN_HEWAN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET ARITHABORT OFF 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET  MULTI_USER 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET QUERY_STORE = OFF
GO
USE [PENITIPAN_HEWAN]
GO
/****** Object:  Table [dbo].[hewan_pelanggan]    Script Date: 1/11/2022 5:49:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hewan_pelanggan](
	[Nama] [varchar](20) NOT NULL,
	[Nama_pemilik] [varchar](20) NULL,
	[Jenis_hewan] [varchar](20) NOT NULL,
	[Deskripsi_hewan] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Nama] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kamar]    Script Date: 1/11/2022 5:49:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kamar](
	[No_kamar] [int] IDENTITY(1,1) NOT NULL,
	[Jenis_kamar] [varchar](20) NOT NULL,
	[harga_kamar] [int] NOT NULL,
	[status_kamar] [char](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[No_kamar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[layanan]    Script Date: 1/11/2022 5:49:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[layanan](
	[No_layanan] [char](1) NOT NULL,
	[Jenis_layanan] [varchar](20) NOT NULL,
	[harga] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[No_layanan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pelanggan]    Script Date: 1/11/2022 5:49:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pelanggan](
	[Username] [varchar](20) NOT NULL,
	[No_hp] [bigint] NOT NULL,
	[Alamat] [varchar](20) NOT NULL,
	[Email] [varchar](20) NOT NULL,
	[Pw] [varchar](20) NOT NULL,
	[Jenis_kelamin] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pembayaran]    Script Date: 1/11/2022 5:49:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pembayaran](
	[id_pembayaran] [int] IDENTITY(1,1) NOT NULL,
	[id_penitipan] [int] NULL,
	[total_harga] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pembayaran] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pemesanan_layanan]    Script Date: 1/11/2022 5:49:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pemesanan_layanan](
	[id_pemesanan_layanan] [int] IDENTITY(1,1) NOT NULL,
	[id_penitipan] [int] NULL,
	[id_layanan] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pemesanan_layanan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[penitipan]    Script Date: 1/11/2022 5:49:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[penitipan](
	[Kode_penitipan] [int] IDENTITY(1,1) NOT NULL,
	[Nama_pemesan] [varchar](20) NULL,
	[Nama_hewan] [varchar](20) NULL,
	[No_kamar] [int] NULL,
	[Tanggal_masuk] [datetime] NOT NULL,
	[Tanggal_keluar] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Kode_penitipan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'', N'Kelompok6', N'', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'asdfasdf', N'Kelompok6', N'Kucing', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'AWKOAWO', N'Kelompok6', N'KURA-KURA', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'babab', N'Kelompok6', N'Kura-kura', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'balaka', N'Kelompok6', N'Kucing', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'balalala', N'Kelompok6', N'Kucing', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'bedo', N'Kelompok6', N'Kura-kura', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'blecky', N'Kelompok6', N'Kura-kura', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'ccasdca', N'Kelompok6', N'Kura-kura', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'cddfasdfasdf', N'Kelompok6', N'', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'Doggy', N'Kelompok6', N'Anjing', N'Coklat caramel terdapat luka di bagian bawah perutnya')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'fgafgafgafga', N'Kelompok6', N'Anjing', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'Franklin', N'Kelompok6', N'Kura-kura', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'Goldie', N'Kelompok6', N'Anjing', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'hahahaha', N'Kelompok6', N'Kucing', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'hihihihi', N'Kelompok6', N'Kura-kura', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'jajajaj', N'Kelompok6', N'Kucing', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'jakakaa', N'Kelompok6', N'Kucing', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'jakakak', N'Kelompok6', N'Kucing', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'jakasdfasdf', N'Kelompok6', N'Kucing', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'jakauuk', N'Kelompok6', N'Kucing', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'korakora', N'Kelompok6', N'Kura-kura', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'Monke', N'Kelompok6', N'Anjing', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'Si Buta', N'Kelompok6', N'Kucing', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'Si Jahat', N'Kelompok6', N'Kura-kura', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'Si Jantan', N'Kelompok6', N'Kucing', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'tes', N'tsaqif', N'tes', N'tes')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'TESS', N'Kelompok6', N'KURA-KURA', N'TESS')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'uuk', N'Kelompok6', N'Kura-kura', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'vadsvasdva', N'Kelompok6', N'Anjing', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'wawawa', N'Kelompok6', N'Kucing', N'')
INSERT [dbo].[hewan_pelanggan] ([Nama], [Nama_pemilik], [Jenis_hewan], [Deskripsi_hewan]) VALUES (N'WKWKWK', N'Kelompok6', N'KURA-KURA', N'BZZZ')
GO
SET IDENTITY_INSERT [dbo].[kamar] ON 
--INI
INSERT [dbo].[kamar] ([No_kamar], [Jenis_kamar], [harga_kamar], [status_kamar]) VALUES (1, N'Regular', 10000, N'Kosong              ')
INSERT [dbo].[kamar] ([No_kamar], [Jenis_kamar], [harga_kamar], [status_kamar]) VALUES (2, N'Small', 5000, N'kosong              ')
INSERT [dbo].[kamar] ([No_kamar], [Jenis_kamar], [harga_kamar], [status_kamar]) VALUES (3, N'Eksklusif', 20000, N'kosong              ')
SET IDENTITY_INSERT [dbo].[kamar] OFF
GO
--INI
INSERT [dbo].[layanan] ([No_layanan], [Jenis_layanan], [harga]) VALUES (N'1', N'Grooming', 50000)
INSERT [dbo].[layanan] ([No_layanan], [Jenis_layanan], [harga]) VALUES (N'2', N'Sterilisasi', 55000)
INSERT [dbo].[layanan] ([No_layanan], [Jenis_layanan], [harga]) VALUES (N'3', N'Vaksin', 45000)
INSERT [dbo].[layanan] ([No_layanan], [Jenis_layanan], [harga]) VALUES (N'4', N'Check Up', 30000)
INSERT [dbo].[layanan] ([No_layanan], [Jenis_layanan], [harga]) VALUES (N'5', N'Kawin', 60000)
INSERT [dbo].[layanan] ([No_layanan], [Jenis_layanan], [harga]) VALUES (N'6', N'Cukur', 30000)
GO
--INI
INSERT [dbo].[pelanggan] ([Username], [No_hp], [Alamat], [Email], [Pw], [Jenis_kelamin]) VALUES (N'Kelompok6', 881234567, N'Yogyakarta', N'kelompok6@gmail.com', N'kelompok6', N'L')
INSERT [dbo].[pelanggan] ([Username], [No_hp], [Alamat], [Email], [Pw], [Jenis_kelamin]) VALUES (N'tsaqif', 88888888888, N'magelang', N'tsaqif', N'tsaqif', N'L')
GO
SET IDENTITY_INSERT [dbo].[pemesanan_layanan] ON 

INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (2, 1, N'1')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (3, 20, N'1')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (4, 21, N'1')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (7, 22, N'1')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (8, 22, N'2')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (9, 22, N'4')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (10, 23, N'1')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (11, 23, N'5')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (12, 23, N'6')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (13, 24, N'1')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (14, 24, N'3')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (15, 24, N'5')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (16, 25, N'2')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (17, 25, N'3')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (18, 25, N'4')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (19, 26, N'1')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (20, 26, N'3')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (21, 26, N'5')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (22, 27, N'1')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (23, 27, N'2')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (24, 27, N'5')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (25, 28, N'1')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (26, 28, N'3')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (27, 28, N'5')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (28, 29, N'1')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (29, 29, N'3')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (30, 29, N'5')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (31, 30, N'1')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (32, 30, N'2')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (33, 30, N'3')
INSERT [dbo].[pemesanan_layanan] ([id_pemesanan_layanan], [id_penitipan], [id_layanan]) VALUES (34, 30, N'5')
SET IDENTITY_INSERT [dbo].[pemesanan_layanan] OFF
GO
SET IDENTITY_INSERT [dbo].[penitipan] ON 

INSERT [dbo].[penitipan] ([Kode_penitipan], [Nama_pemesan], [Nama_hewan], [No_kamar], [Tanggal_masuk], [Tanggal_keluar]) VALUES (1, N'tsaqif', N'Doggy', 1, CAST(N'2022-01-06T00:00:00.000' AS DateTime), CAST(N'2021-12-27T00:00:00.000' AS DateTime))
INSERT [dbo].[penitipan] ([Kode_penitipan], [Nama_pemesan], [Nama_hewan], [No_kamar], [Tanggal_masuk], [Tanggal_keluar]) VALUES (2, N'Kelompok6', N'Doggy', 1, CAST(N'2021-12-25T00:00:00.000' AS DateTime), CAST(N'2021-12-27T00:00:00.000' AS DateTime))
INSERT [dbo].[penitipan] ([Kode_penitipan], [Nama_pemesan], [Nama_hewan], [No_kamar], [Tanggal_masuk], [Tanggal_keluar]) VALUES (3, N'Kelompok6', N'Doggy', 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2021-12-27T00:00:00.000' AS DateTime))
INSERT [dbo].[penitipan] ([Kode_penitipan], [Nama_pemesan], [Nama_hewan], [No_kamar], [Tanggal_masuk], [Tanggal_keluar]) VALUES (4, N'Kelompok6', N'Doggy', 1, CAST(N'2022-01-06T00:00:00.000' AS DateTime), CAST(N'2021-12-27T00:00:00.000' AS DateTime))
INSERT [dbo].[penitipan] ([Kode_penitipan], [Nama_pemesan], [Nama_hewan], [No_kamar], [Tanggal_masuk], [Tanggal_keluar]) VALUES (8, N'Kelompok6', N'uuk', 1, CAST(N'2022-01-10T00:00:00.000' AS DateTime), CAST(N'2022-01-11T00:00:00.000' AS DateTime))
INSERT [dbo].[penitipan] ([Kode_penitipan], [Nama_pemesan], [Nama_hewan], [No_kamar], [Tanggal_masuk], [Tanggal_keluar]) VALUES (9, N'Kelompok6', N'bedo', 1, CAST(N'2022-01-10T00:00:00.000' AS DateTime), CAST(N'2022-01-11T00:00:00.000' AS DateTime))
INSERT [dbo].[penitipan] ([Kode_penitipan], [Nama_pemesan], [Nama_hewan], [No_kamar], [Tanggal_masuk], [Tanggal_keluar]) VALUES (13, N'Kelompok6', N'vadsvasdva', 1, CAST(N'2022-01-19T00:00:00.000' AS DateTime), CAST(N'2022-01-20T00:00:00.000' AS DateTime))
INSERT [dbo].[penitipan] ([Kode_penitipan], [Nama_pemesan], [Nama_hewan], [No_kamar], [Tanggal_masuk], [Tanggal_keluar]) VALUES (14, N'Kelompok6', N'balalala', 2, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-21T00:00:00.000' AS DateTime))
INSERT [dbo].[penitipan] ([Kode_penitipan], [Nama_pemesan], [Nama_hewan], [No_kamar], [Tanggal_masuk], [Tanggal_keluar]) VALUES (15, N'Kelompok6', N'jakauuk', 3, CAST(N'2022-01-09T00:00:00.000' AS DateTime), CAST(N'2022-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[penitipan] ([Kode_penitipan], [Nama_pemesan], [Nama_hewan], [No_kamar], [Tanggal_masuk], [Tanggal_keluar]) VALUES (16, N'Kelompok6', N'jakakak', 1, CAST(N'2022-01-11T00:00:00.000' AS DateTime), CAST(N'2022-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[penitipan] ([Kode_penitipan], [Nama_pemesan], [Nama_hewan], [No_kamar], [Tanggal_masuk], [Tanggal_keluar]) VALUES (17, N'Kelompok6', N'balaka', 2, CAST(N'2022-01-10T00:00:00.000' AS DateTime), CAST(N'2022-01-11T00:00:00.000' AS DateTime))
INSERT [dbo].[penitipan] ([Kode_penitipan], [Nama_pemesan], [Nama_hewan], [No_kamar], [Tanggal_masuk], [Tanggal_keluar]) VALUES (18, N'Kelompok6', N'jakasdfasdf', 2, CAST(N'2022-01-18T00:00:00.000' AS DateTime), CAST(N'2022-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[penitipan] ([Kode_penitipan], [Nama_pemesan], [Nama_hewan], [No_kamar], [Tanggal_masuk], [Tanggal_keluar]) VALUES (19, N'Kelompok6', N'fgafgafgafga', 2, CAST(N'2022-01-19T00:00:00.000' AS DateTime), CAST(N'2022-01-17T00:00:00.000' AS DateTime))
INSERT [dbo].[penitipan] ([Kode_penitipan], [Nama_pemesan], [Nama_hewan], [No_kamar], [Tanggal_masuk], [Tanggal_keluar]) VALUES (20, N'Kelompok6', N'Franklin', 1, CAST(N'2022-01-11T00:00:00.000' AS DateTime), CAST(N'2022-01-14T00:00:00.000' AS DateTime))
INSERT [dbo].[penitipan] ([Kode_penitipan], [Nama_pemesan], [Nama_hewan], [No_kamar], [Tanggal_masuk], [Tanggal_keluar]) VALUES (21, N'Kelompok6', N'Si Buta', 1, CAST(N'2022-01-11T00:00:00.000' AS DateTime), CAST(N'2022-01-14T00:00:00.000' AS DateTime))
INSERT [dbo].[penitipan] ([Kode_penitipan], [Nama_pemesan], [Nama_hewan], [No_kamar], [Tanggal_masuk], [Tanggal_keluar]) VALUES (22, N'Kelompok6', N'Si Jahat', 3, CAST(N'2022-01-11T00:00:00.000' AS DateTime), CAST(N'2022-01-13T00:00:00.000' AS DateTime))
INSERT [dbo].[penitipan] ([Kode_penitipan], [Nama_pemesan], [Nama_hewan], [No_kamar], [Tanggal_masuk], [Tanggal_keluar]) VALUES (23, N'Kelompok6', N'Si Jantan', 3, CAST(N'2022-01-12T00:00:00.000' AS DateTime), CAST(N'2022-01-29T00:00:00.000' AS DateTime))
INSERT [dbo].[penitipan] ([Kode_penitipan], [Nama_pemesan], [Nama_hewan], [No_kamar], [Tanggal_masuk], [Tanggal_keluar]) VALUES (24, N'Kelompok6', N'Goldie', 1, CAST(N'2022-01-11T00:00:00.000' AS DateTime), CAST(N'2022-01-14T00:00:00.000' AS DateTime))
INSERT [dbo].[penitipan] ([Kode_penitipan], [Nama_pemesan], [Nama_hewan], [No_kamar], [Tanggal_masuk], [Tanggal_keluar]) VALUES (25, N'Kelompok6', N'tes', 1, CAST(N'2022-01-11T00:00:00.000' AS DateTime), CAST(N'2022-01-13T00:00:00.000' AS DateTime))
INSERT [dbo].[penitipan] ([Kode_penitipan], [Nama_pemesan], [Nama_hewan], [No_kamar], [Tanggal_masuk], [Tanggal_keluar]) VALUES (26, N'Kelompok6', N'Monke', 1, CAST(N'2022-01-11T00:00:00.000' AS DateTime), CAST(N'2022-01-15T00:00:00.000' AS DateTime))
INSERT [dbo].[penitipan] ([Kode_penitipan], [Nama_pemesan], [Nama_hewan], [No_kamar], [Tanggal_masuk], [Tanggal_keluar]) VALUES (27, N'Kelompok6', N'hahahaha', 2, CAST(N'2022-01-11T00:00:00.000' AS DateTime), CAST(N'2022-01-15T00:00:00.000' AS DateTime))
INSERT [dbo].[penitipan] ([Kode_penitipan], [Nama_pemesan], [Nama_hewan], [No_kamar], [Tanggal_masuk], [Tanggal_keluar]) VALUES (28, N'Kelompok6', N'hihihihi', 3, CAST(N'2022-01-19T00:00:00.000' AS DateTime), CAST(N'2022-01-13T00:00:00.000' AS DateTime))
INSERT [dbo].[penitipan] ([Kode_penitipan], [Nama_pemesan], [Nama_hewan], [No_kamar], [Tanggal_masuk], [Tanggal_keluar]) VALUES (29, N'Kelompok6', N'jajajaj', 2, CAST(N'2022-01-09T00:00:00.000' AS DateTime), CAST(N'2022-01-20T00:00:00.000' AS DateTime))
INSERT [dbo].[penitipan] ([Kode_penitipan], [Nama_pemesan], [Nama_hewan], [No_kamar], [Tanggal_masuk], [Tanggal_keluar]) VALUES (30, N'Kelompok6', N'wawawa', 2, CAST(N'2022-01-11T00:00:00.000' AS DateTime), CAST(N'2022-01-13T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[penitipan] OFF
GO
ALTER TABLE [dbo].[hewan_pelanggan]  WITH CHECK ADD FOREIGN KEY([Nama_pemilik])
REFERENCES [dbo].[pelanggan] ([Username])
GO
ALTER TABLE [dbo].[pembayaran]  WITH CHECK ADD FOREIGN KEY([id_penitipan])
REFERENCES [dbo].[penitipan] ([Kode_penitipan])
GO
ALTER TABLE [dbo].[pemesanan_layanan]  WITH CHECK ADD FOREIGN KEY([id_layanan])
REFERENCES [dbo].[layanan] ([No_layanan])
GO
ALTER TABLE [dbo].[pemesanan_layanan]  WITH CHECK ADD FOREIGN KEY([id_penitipan])
REFERENCES [dbo].[penitipan] ([Kode_penitipan])
GO
ALTER TABLE [dbo].[penitipan]  WITH CHECK ADD FOREIGN KEY([Nama_pemesan])
REFERENCES [dbo].[pelanggan] ([Username])
GO
ALTER TABLE [dbo].[penitipan]  WITH CHECK ADD FOREIGN KEY([Nama_hewan])
REFERENCES [dbo].[hewan_pelanggan] ([Nama])
GO
ALTER TABLE [dbo].[penitipan]  WITH CHECK ADD FOREIGN KEY([No_kamar])
REFERENCES [dbo].[kamar] ([No_kamar])
GO
ALTER TABLE [dbo].[kamar]  WITH CHECK ADD CHECK  (([Jenis_kamar]='Eksklusif' OR [Jenis_kamar]='Small' OR [Jenis_kamar]='Regular'))
GO
ALTER TABLE [dbo].[kamar]  WITH CHECK ADD CHECK  (([status_kamar]='Terisi' OR [status_kamar]='Kosong'))
GO
ALTER TABLE [dbo].[layanan]  WITH CHECK ADD CHECK  (([Jenis_layanan]='Cukur' OR [Jenis_layanan]='Kawin' OR [Jenis_layanan]='Check Up' OR [Jenis_layanan]='Vaksin' OR [Jenis_layanan]='Sterilisasi' OR [Jenis_layanan]='Grooming'))
GO
ALTER TABLE [dbo].[pelanggan]  WITH CHECK ADD CHECK  (([Jenis_kelamin]='P' OR [Jenis_kelamin]='L'))
GO



--ini nggak
USE [master]
GO
ALTER DATABASE [PENITIPAN_HEWAN] SET  READ_WRITE 
GO

select * from pemesanan_layanan