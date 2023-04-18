USE [master]
GO
/****** Object:  Database [Doan4]    Script Date: 4/19/2023 6:46:18 AM ******/
CREATE DATABASE [Doan4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Doan4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Doan4.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Doan4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Doan4_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Doan4] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Doan4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Doan4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Doan4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Doan4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Doan4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Doan4] SET ARITHABORT OFF 
GO
ALTER DATABASE [Doan4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Doan4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Doan4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Doan4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Doan4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Doan4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Doan4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Doan4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Doan4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Doan4] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Doan4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Doan4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Doan4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Doan4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Doan4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Doan4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Doan4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Doan4] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Doan4] SET  MULTI_USER 
GO
ALTER DATABASE [Doan4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Doan4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Doan4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Doan4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Doan4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Doan4] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Doan4] SET QUERY_STORE = OFF
GO
USE [Doan4]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_TotalPaidBooking]    Script Date: 4/19/2023 6:46:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_TotalPaidBooking]()
RETURNS MONEY
AS
BEGIN
    DECLARE @total MONEY;
    SELECT @total = SUM(total_price)
    FROM Booking
    WHERE payment_status = 'Paid';
    RETURN @total;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_TotalPassengersOnFlight]    Script Date: 4/19/2023 6:46:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_TotalPassengersOnFlight](@flight_id INT)
RETURNS INT
AS
BEGIN
    DECLARE @total INT;
    SELECT @total = SUM(passenger_count)
    FROM Booking
    INNER JOIN Ticket ON Booking.ticket_id = Ticket.id
    WHERE Ticket.flight_id = @flight_id AND Booking.flight_status = 'On Time';
    RETURN @total;
END;
GO
/****** Object:  Table [dbo].[Airlines]    Script Date: 4/19/2023 6:46:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airlines](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[address] [varchar](255) NULL,
	[phone] [varchar](20) NULL,
	[email] [varchar](50) NULL,
	[website] [varchar](255) NULL,
	[logo] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 4/19/2023 6:46:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[id] [int] NOT NULL,
	[booking_date] [date] NULL,
	[flight_date] [date] NULL,
	[total_price] [decimal](10, 2) NULL,
	[payment_status] [varchar](50) NULL,
	[flight_status] [varchar](50) NULL,
	[passenger_count] [int] NULL,
	[payment_method] [varchar](50) NULL,
	[ticket_id] [int] NULL,
	[payment_system_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/19/2023 6:46:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[address] [varchar](255) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_rating]    Script Date: 4/19/2023 6:46:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_rating](
	[id] [int] NOT NULL,
	[rating] [int] NOT NULL,
	[comment] [varchar](255) NULL,
	[customer_id] [int] NULL,
	[flight_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 4/19/2023 6:46:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[id] [int] NOT NULL,
	[origin] [varchar](50) NULL,
	[destination] [varchar](50) NULL,
	[departure_time] [datetime] NULL,
	[arrival_time] [datetime] NULL,
	[available_seats] [int] NULL,
	[airline_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Luggage]    Script Date: 4/19/2023 6:46:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Luggage](
	[id] [int] NOT NULL,
	[quantity] [int] NULL,
	[weight] [decimal](10, 2) NULL,
	[type] [varchar](50) NULL,
	[description] [varchar](255) NULL,
	[ticket_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment_system]    Script Date: 4/19/2023 6:46:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_system](
	[id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](255) NULL,
	[payment_method] [varchar](50) NOT NULL,
	[bank_account] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 4/19/2023 6:46:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[id] [int] NOT NULL,
	[booking_date] [date] NULL,
	[issue_date] [date] NULL,
	[price] [decimal](10, 2) NULL,
	[class] [varchar](50) NULL,
	[customer_id] [int] NULL,
	[flight_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([ticket_id])
REFERENCES [dbo].[Ticket] ([id])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [fk_payment_system] FOREIGN KEY([payment_system_id])
REFERENCES [dbo].[Payment_system] ([id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [fk_payment_system]
GO
ALTER TABLE [dbo].[Customer_rating]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[Customer_rating]  WITH CHECK ADD FOREIGN KEY([flight_id])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD FOREIGN KEY([airline_id])
REFERENCES [dbo].[Airlines] ([id])
GO
ALTER TABLE [dbo].[Luggage]  WITH CHECK ADD FOREIGN KEY([ticket_id])
REFERENCES [dbo].[Ticket] ([id])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([flight_id])
REFERENCES [dbo].[Flight] ([id])
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCustomer]    Script Date: 4/19/2023 6:46:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetCustomer]
AS
BEGIN
    SELECT * FROM Customer
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCustomers]    Script Date: 4/19/2023 6:46:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetCustomers]
AS
BEGIN
    SELECT * FROM Customers
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCustomersByCity]    Script Date: 4/19/2023 6:46:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetCustomersByCity]
    @City NVARCHAR(50)
AS
BEGIN
    SELECT *
    FROM Customer
    WHERE address LIKE N'%' + @City + N'%'
END
GO
/****** Object:  StoredProcedure [dbo].[update_customer]    Script Date: 4/19/2023 6:46:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[update_customer] 
  @id INT,
  @name VARCHAR(50),
  @address VARCHAR(255),
  @email VARCHAR(50),
  @phone VARCHAR(20)
AS
BEGIN
  UPDATE Customer
  SET name = @name, address = @address, email = @email, phone = @phone
  WHERE id = @id;
END
GO
USE [master]
GO
ALTER DATABASE [Doan4] SET  READ_WRITE 
GO
