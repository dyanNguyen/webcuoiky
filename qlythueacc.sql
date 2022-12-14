USE [master]
GO
/****** Object:  Database [qlythueacc]    Script Date: 21-Nov-22 1:20:25 AM ******/
CREATE DATABASE [qlythueacc1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'qlythueacc1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\qlythueacc1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'qlythueacc1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\qlythueacc1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [qlythueacc1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [qlythueacc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [qlythueacc1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [qlythueacc1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [qlythueacc1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [qlythueacc1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [qlythueacc1] SET ARITHABORT OFF 
GO
ALTER DATABASE [qlythueacc1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [qlythueacc1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [qlythueacc1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [qlythueacc1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [qlythueacc1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [qlythueacc1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [qlythueacc1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [qlythueacc1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [qlythueacc1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [qlythueacc1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [qlythueacc1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [qlythueacc1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [qlythueacc1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [qlythueacc1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [qlythueacc1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [qlythueacc1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [qlythueacc1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [qlythueacc1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [qlythueacc1] SET  MULTI_USER 
GO
ALTER DATABASE [qlythueacc1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [qlythueacc1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [qlythueacc1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [qlythueacc1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [qlythueacc1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [qlythueacc1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [qlythueacc1] SET QUERY_STORE = OFF
GO
USE [qlythueacc1]
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 21-Nov-22 1:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMIN](
	[admin_id] [varchar](50) NOT NULL,
	[admin_password] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 21-Nov-22 1:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[Game_ID] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Game_Name] [nvarchar](50) NOT NULL,
	[idLoaiGame] [int] NOT NULL,
	[MoTa] [ntext] NULL,
	[AnhBia] [varchar](50) NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[Game_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 21-Nov-22 1:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[CustID] [int] IDENTITY(1,1) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Phone] [varchar](11) NULL,
	[Email] [varchar](50) NULL,
	[Cust_Balance] [float] NOT NULL,
	[Address] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 21-Nov-22 1:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Order_ID] [int] NOT NULL,
	[Game_ID] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QLTaiKhoanChoThue]    Script Date: 21-Nov-22 1:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QLTaiKhoanChoThue](
	[RentAccount_ID] [int] NOT NULL,
	[RentAccount_Password] [varchar](50) NOT NULL,
	[Game_ID] [int] NOT NULL,
	[AccountName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_QLTaiKhoanChoThue] PRIMARY KEY CLUSTERED 
(
	[RentAccount_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhToan]    Script Date: 21-Nov-22 1:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhToan](
	[Payment_ID] [int] NOT NULL,
	[Rent_time] [int] NOT NULL,
	[CustID] [int] NOT NULL,
	[Order_ID] [int] NOT NULL,
	[DaThanhToan] [bit] NULL,
 CONSTRAINT [PK_Thanh Toan] PRIMARY KEY CLUSTERED 
(
	[Payment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoaiGame]    Script Date: 21-Nov-22 1:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoaiGame](
	[idLoaiGame] [int] NOT NULL,
	[TenLoaiGame] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TheLoaiGame] PRIMARY KEY CLUSTERED 
(
	[idLoaiGame] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ADMIN] ([admin_id], [admin_password]) VALUES (N'namcute35p', N'123')
GO
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11101', 1799000, 77, N'Call of Duty®: Modern Warfare® II', N'10001', N'Call of Duty®: Modern Warfare® II đưa người chơi vào một cuộc xung đột toàn cầu chưa từng có với sự trở lại của những Người điều hành mang tính biểu tượng của Lực lượng Đặc nhiệm 141. Từ các hoạt động chiến thuật xâm nhập quy mô nhỏ, rủi ro cao đến các nhiệm vụ được phân loại cao, người chơi sẽ triển khai cùng với bạn bè trong một trải nghiệm thực sự đắm chìm.', N'COD.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11102', 360000, 45, N'NARAKA: BLADEPOINT', N'10001', N'Naraka: Bladepoint là một game online sinh tồn, hành động nhiều người chơi. Nhà phát hành của nó là cái tên quen thuộc 24 Entertainment. Lối chơi battle royale cực hút cùng đồ họa mãn nhãn đã chinh phục được đông đảo gamer trên khắp thế giới ngay từ khi game mới được giới thiệu.
Bối cảnh trong Naraka là thế giới giả tưởng mang phong cách văn hóa Trung Hoa cổ đại. Đây là nơi trú ngụ của 60 vị lãng khách và kiếm sĩ cùng loạt môn phái võ công, phép thuật cao cường như trong các bộ phim kiếm hiệp huyền thoại. Nếu để dễ hình dung, bạn có thể tưởng tượng nó là “PUBG" phiên bản kiếm hiệp”.
', N'NARAKA.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11103', 881000, 45, N'MONSTER HUNTER RISE', N'10001', N'Săn lùng vô số quái vật với những hành vi khác biệt và sự hung dữ chết người. Từ những con quái vật cổ điển trở lại cho đến những sinh vật hoàn toàn mới lấy cảm hứng từ văn hóa dân gian Nhật Bản, bao gồm cả wyvern Magnamalo hàng đầu, bạn sẽ cần phải suy nghĩ trên đôi chân của mình và làm chủ xu hướng độc đáo của chúng nếu bạn hy vọng gặt hái được bất kỳ phần thưởng nào!

', N'MonsterHunterRise.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11104', 1139000, 24, N'God of War', N'10001', N'Tiến vào Xứ sở Bắc Âu
Cuộc trả thù các Vị thần trên đỉnh Olympus của Kratos đã lùi dần vào dĩ vãng. Giờ đây, Kratos sống ẩn mình như một người đàn ông bình thường trong mảnh đất nơi các vị thần và quái vật Bắc Âu thống trị. Nhưng chính trong thế giới nghiệt ngã, không khoan nhượng này, ông phải chiến đấu để tồn tại… và dạy con trai mình những điều tương tự.
', N'GodofWar.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11105', 1159000, 18, N'Marvel’s Spider-Man: Miles Morales', N'10001', N'Chàng thiếu niên Miles Morales đang hòa nhập với cuộc sống ở ngôi nhà mới khi đang tiếp bước thầy mình, Peter Parker, để trở thành một Người Nhện mới. Khi một thế lực với sức mạnh khủng khiếp xuất hiện và đe dọa phá hủy đi mái ấm của anh, người anh hùng đầy khát vọng đã nhận ra rằng sức mạnh càng lớn, trách nhiệm càng cao. Để giải cứu cả thành phố New York của Marvel, Miles buộc phải tiếp quản và thể hiện mình xứng đáng với vai trò Người Nhện.', N'SpiderMan.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11106', 990000, 3, N'Dying Light 2 Stay Human', N'10001', N'Hơn hai mươi năm trước ở Harran, chúng ta đã chiến đấu với virus—và thua cuộc. Giờ đây, chúng ta lại sắp thua. Thành phố, một trong những khu định cư lớn cuối cùng của con người, đã bị xé nát bởi xung đột. Nền văn minh đã rơi vào Thời kỳ Tăm tối. Tuy nhiên, chúng ta vẫn còn hi vọng.
Bạn là một kẻ lang thang sở hữu sức mạnh có thể thay đổi số phận của Thành phố. Nhưng khả năng đặc biệt của bạn phải trả giá. Bị ám ảnh bởi những ký ức mà bạn không thể giải mã, bạn bắt đầu tìm hiểu sự thật… và thấy mình trong một khu vực chiến đấu. Hãy rèn luyện kỹ năng của bạn để đánh bại kẻ thù và kiếm đồng minh, bạn sẽ cần cả vũ lực và trí thông minh. Làm sáng tỏ những bí ẩn đen tối đằng sau những kẻ nắm giữ quyền lực, chọn phe và quyết định số phận của bạn. Nhưng bất cứ khi nào bạn muốn hành động, có một điều bạn không bao giờ được phép quên—hãy luôn là con người.
', N'DylingLight.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11107', 142000, 3, N'SOULSTONE SURVIVORS', N'10002', N'Soulstone Survivors là game roguelite hành động, trong đó bạn tiêu diệt lũ kẻ thù và đối mặt với những tên trùm khổng lồ trong khi học các kỹ năng mạnh mẽ để nâng cao nhân vật của mình. Vào vai một Thợ săn Hư không, và với chiến lợi phẩm là vũ khí chế tạo trong mỗi trận đấu, mở khóa các nhân vật mới, nâng cấp cây kỹ năng của bạn và trang bị các chữ rune mới, tất cả đều nằm trong hành trình tìm kiếm sức mạnh thần thánh của bạn.', N'SoulstoneSurvivors.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11108', 250000, 45, N'SHADOWS OVER LOATHING', N'10002', N'Chú Murray của bạn đã yêu cầu sự trợ giúp của bạn tại cửa hàng đồ cổ của ông ấy ở Thành phố Ocean, nhưng khi bạn đến thì không thấy ông già đâu cả. Cuộc điều tra của bạn về sự mất tích của anh ấy và những đồ tạo tác mà anh ấy đang thu thập sẽ thay đổi khi bạn tình cờ phát hiện ra một số âm mưu đen tối (và một loạt các xúc tu eldritch đang vặn vẹo) có nguy cơ dẫn đến ngày tận thế.', N'ShadowOverLoathing.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11109', 260000, 45, N'BRAVERY AND GREED', N'10002', N'Cho dù bạn đang chơi với tư cách là Amazon hùng mạnh, Chiến binh dũng cảm, Kẻ lừa đảo nhanh nhẹn hay Pháp sư dệt bùa chú, mỗi lớp đều sở hữu một loạt các bộ di chuyển kết hợp tuyệt vời và mạnh mẽ. Đỡ đòn, né tránh, tung hứng, khoanh vùng và giải phóng các đòn tấn công đặc biệt có tính hủy diệt để chiếm thế thượng phong trước những kẻ thù, ông chủ và thậm chí cả bạn bè của bạn ngày càng hùng mạnh hơn.', N'BraveryAndGreed.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11110', 480000, 24, N'MONOCHROME MOBIUS: RIGHTS AND WRONGS FORGOTTEN', N'10002', N'Ở tỉnh nhỏ Ennakamuy, trên biên giới của đế chế vĩ đại Yamato, có một chàng trai trẻ sống cùng mẹ và em gái. Một ngày nọ, theo lệnh của lãnh chúa địa phương, chàng trai trẻ đang điều tra một điều bất thường nhỏ thì anh gặp một cô gái mà anh chưa từng gặp.
Những lời cô gái nói khiến anh bị sốc: Cô nói với người đàn ông rằng cha anh vẫn còn sống.
Nhìn thấy dấu vết của cha mình trong cô và quyết tâm tìm hiểu sự thật, chàng trai trẻ và cô gái cùng nhau lên đường đến vùng đất Arva Shulan - một quốc gia không xuất hiện trên bản đồ.

Đối mặt với những thử thách và nguy hiểm, cậu bé đuổi theo cha mình.
Anh ấy gặp những người bạn và đồng đội mới, những người cùng tham gia với anh ấy trong nhiệm vụ của mình.
Sẽ có những cuộc đấu tranh và chiến thắng cũng như thất bại và chia tay.
Những thay đổi thất thường hay thay đổi của số phận sẽ đặt một kỷ nguyên vào tay chàng trai trẻ—
', N'Monochrome.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11111', 1138000, 18, N'PERSONA 5 ROYAL', N'10002', N'Như đã trở thành một truyền thống, mỗi phần game Persona nói chung đều sẽ có một phần mở rộng của bản gốc. Persona 5 (P5) cũng không phải là ngoại lệ khi phiên bản mở rộng Persona 5 Royal (P5R) với một vài thay đổi cả lớn lẫn nhỏ, tuy vậy dù cho bạn đã chơi qua Persona 5 rồi hay mới chơi bản này, thì cũng hãy chuẩn bị tinh thần để lần nữa tham gia vào hành trình đánh cắp trái tim
YÊU CẦU HỆ THỐNG
', N'Pesona5.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11112', 258000, 77, N'Tale of Immortal', N'10002', N'Tale of Immortal là một trò chơi hộp cát thế giới mở dựa trên thần thoại và tu luyện của Trung Quốc. Bạn sẽ lớn lên để trở thành bất tử, chinh phục những con thú từ Classic of Mountains and Season, đưa ra những lựa chọn cẩn thận và nắm bắt vận mệnh của chính mình.', N'TaleOfImmortal.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11113', 325000, 3, N'Cities: Skyline', N'10003', N'Cities: Skylines là phiên bản hiện đại dựa trên mô phỏng thành phố cổ điển. Trò chơi giới thiệu các yếu tố chơi trò chơi mới để nhận ra cảm giác hồi hộp và khó khăn khi tạo và duy trì một thành phố thực trong khi mở rộng trên một số vùng nhiệt đới đã được thiết lập tốt của trải nghiệm xây dựng thành phố.', N'Cities_skylines.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11114', 990000, 45, N'Sid Meier’s Civilization® VI', N'10003', N'Civilization VI cung cấp những cách thức mới để tương tác với thế giới của bạn: các thành phố hiện đang mở rộng trên bản đồ, nghiên cứu tích cực về công nghệ và văn hóa mở ra tiềm năng mới và các nhà lãnh đạo cạnh tranh sẽ theo đuổi chương trình nghị sự của riêng họ dựa trên đặc điểm lịch sử của họ khi bạn chạy đua theo một trong năm cách để đạt được chiến thắng trong trò chơi.
Hãy xem những điều kỳ diệu của đế chế của bạn trải rộng trên bản đồ hơn bao giờ hết. Mỗi quận, kỳ quan và cải tiến được xây dựng theo hình lục giác riêng, cho phép bạn tùy chỉnh thành phố của mình theo nội dung trái tim của bạn.
Từ Trung tâm thương mại đến Sân bay vũ trụ, mọi quận đều cung cấp những phần thưởng độc đáo và mạnh mẽ. Chọn và chọn quận nào sẽ xây dựng để phù hợp với nhu cầu của bạn!
', N'CivilizationVI.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11115', 480000, 75, N'Age of Empires IV: Anniversary Edition', N'10003', N'Kỷ niệm năm đầu tiên mang lại niềm hứng khởi cho hàng triệu người chơi toàn cầu, dòng game chiến lược bán chạy đạt được nhiều giải thưởng này tiếp tục hành trình với Age of Empires IV: Anniversary Edition.', N'AOE.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11116', 1061500, 24, N'Total War: WARHAMMER III', N'10003', N'Total War: Warhammer III là phiên bản thứ ba thuộc loạt trò chơi phụ Total War: Warhammer đình đám đã chính thức lộ diện. Tựa game đưa người chơi đến với những diễn biến cuối cùng trong cuộc hỗn chiến giữa các thế lực hùng mạnh ở nơi vũ trụ Warhammer Fantasy. ', N'TotalWar.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11117', 801000, 18, N'VICTORIA 3', N'10003', N'Lãnh đạo hàng chục quốc gia trên thế giới từ 1836-1936. Nông nghiệp hay Công nghiệp, Truyền thống hay Cấp tiến, Hòa bình hay Bành trướng... sự lựa chọn là của bạn.
Các nhóm dân số chi tiết với nhu cầu kinh tế và mong muốn chính trị của riêng họ.
Cải cách chính phủ và hiến pháp của bạn để tận dụng những đổi mới xã hội mới, hoặc duy trì sự ổn định của quốc gia của bạn bằng cách giữ vững truyền thống khi đối mặt với các nhà cách mạng.
Nghiên cứu công nghệ hoặc ý tưởng mới mang tính đột phá để cải thiện tình hình quốc gia của bạn.
', N'Victoria3.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11118', 499000, 77, N'TERRA INVICTA', N'10003', N'Đào, Chiến đấu, Khám phá, Xây dựng: Chính thế giới nằm trong tầm tay bạn khi bạn chiến đấu để sinh tồn, vận may và vinh quang. Bạn sẽ đào sâu vào các hang động rộng lớn để tìm kiếm kho báu và nguyên liệu thô để chế tạo các thiết bị, máy móc và tính thẩm mỹ không ngừng phát triển chứ? Thay vào đó, có lẽ bạn sẽ chọn tìm kiếm những kẻ thù ngày càng lớn hơn để kiểm tra dũng khí của mình trong chiến đấu? Có thể bạn sẽ quyết định xây dựng thành phố của riêng mình để làm nơi trú ngụ cho những đồng minh bí ẩn mà bạn có thể gặp trong chuyến du hành của mình?', N'Terraria.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11119', 510000, 3, N'Rust', N'10004', N'Mục tiêu duy nhất trong Rust là sống sót. Mọi thứ đều muốn bạn chết - động vật hoang dã trên đảo và những cư dân khác, môi trường, những người sống sót khác. Làm bất cứ điều gì cần thiết để kéo dài thêm một đêm nữa.', N'RUST.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11120', 990000, 45, N'Hogwards Legacy', N'10004', N'Hogwarts Legacy là game nhập vai hành động thế giới mở nhập vai. Giờ đây, bạn có thể kiểm soát hành động và trở thành trung tâm của cuộc phiêu lưu của chính mình trong thế giới phù thủy.', N'HogwartsLegacy.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11121', 830000, 75, N'SONIC FRONTIERS', N'10004', N'Các thế giới đang va chạm trong cuộc phiêu lưu tốc độ cao mới nhất của Sonic the Hedgehog! Để tìm kiếm những viên ngọc lục bảo Chaos bị mất tích, Sonic bị mắc kẹt trên một hòn đảo cổ xưa đầy ắp những sinh vật khác thường. Chiến đấu với lũ kẻ thù mạnh mẽ khi bạn khám phá một thế giới hành động, phiêu lưu và bí ẩn ngoạn mục. Tăng tốc lên những tầm cao mới và trải nghiệm cảm giác hồi hộp của sự tự do trên nền tảng khu vực mở, tốc độ cao khi bạn chạy đua qua năm Quần đảo Starfall rộng lớn. Bước vào cuộc phiêu lưu, sử dụng sức mạnh của Người xưa và chiến đấu để ngăn chặn những kẻ thù bí ẩn mới này. Chào mừng bạn đến với sự phát triển của trò chơi Sonic!', N'SonicFrontiers.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11122', 321000, 24, N'SOMERVILLE', N'10004', N'Trước thảm họa, bạn phải tìm cách để khiến gia đình mình trở lại bình thường. Somerville là một cuộc phiêu lưu Khoa học viễn tưởng dựa trên những hậu quả mật thiết của một cuộc xung đột quy mô lớn.', N'Somerville.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11123', 650000, 18, N'A PLAGUE TALE: REQUIEM', N'10004', N'Bắt tay vào một cuộc hành trình đầy cảm động vào một thế giới tàn khốc, ngoạn mục và khám phá cái giá phải trả để cứu những người bạn yêu thương trong một cuộc đấu tranh sinh tồn tuyệt vọng. Tấn công từ trong bóng tối hoặc giải phóng địa ngục bằng nhiều loại vũ khí, công cụ và sức mạnh phi thường.', N'APlagueTale.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11124', 226500, 77, N'SIGNALIS', N'10004', N'Một trải nghiệm kinh dị sinh tồn cổ điển lấy bối cảnh trong một tương lai đen tối, nơi loài người đã khám phá ra một bí mật đen tối. Làm sáng tỏ một bí ẩn vũ trụ, thoát khỏi những sinh vật đáng sợ và nhặt rác một cơ sở của chính phủ ngoài thế giới với vai Elster, một kỹ thuật viên Replika đang tìm kiếm những giấc mơ đã mất của mình.', N'SIGNALIS.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11125', 940000, 3, N'FOOTBALL MANAGER 2023', N'10005', N'Xây dựng đội hình trong mơ của bạn, vượt qua các đối thủ và trải nghiệm cảm giác hồi hộp của những đêm châu Âu lớn tại UEFA Champions League. Hành trình của bạn hướng tới vinh quang bóng đá đang chờ đợi.', N'FootballManager.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11126', 375500, 45, N'CITY BUS MANAGER', N'10005', N'Xây dựng bến xe buýt của riêng bạn từ đầu và tạo các tuyến xe buýt cá nhân của bạn trong City Bus Manager. Chơi ở quê hương của bạn hoặc bất kỳ thành phố nổi tiếng nào trên thế giới với dữ liệu bản đồ thực. Mua xe buýt, bảo trì chúng, chăm sóc nhân viên của bạn và dẫn dắt công ty xe buýt của bạn trở thành số 1 trong thị trấn!', N'CityBus.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11127', 250000, 75, N'POLICE SIMULATOR: PATROL OFFICERS', N'10005', N'Chào mừng đến với Brighton! Tham gia lực lượng cảnh sát của thành phố hư cấu của Mỹ này và trải nghiệm cuộc sống hàng ngày của một sĩ quan cảnh sát. Bắt đầu bằng việc trích dẫn các vi phạm và đưa ra các vé đậu xe, sau đó làm việc theo cách của bạn để gánh vác nhiều trách nhiệm hơn. Trở thành một phần của cộng đồng Brighton, tìm hiểu khu phố của bạn và xử lý công việc hàng ngày của cảnh sát để chống tội phạm trong ca làm việc của bạn. Luôn cứng rắn nhưng công bằng: tôn trọng luật pháp và tích lũy thêm kinh nghiệm để mở khóa thêm nhiều khu dân cư, quận và nhiệm vụ.', N'PoliceSimulator.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11128', 1340000, 24, N'Microsoft Flight Simulator', N'10005', N'Lần đầu tiên kể từ năm 2006, Microsoft Flight Simulator Phiên bản kỷ niệm 40 năm sẽ có tính năng máy bay trực thăng và tàu lượn, những cải tiến được yêu cầu nhiều nhất bởi cộng đồng của chúng tôi. Ngoài máy bay trực thăng và tàu lượn, chúng tôi sẽ giới thiệu một tính năng cộng đồng được yêu cầu cao khác: một chiếc máy bay chở khách chân thực, chiếc Airbus A-310 tinh vi, trong đó gần như mọi nút đều hoạt động như mong đợi.', N'MSFlightSimulator.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11129', 310000, 18, N'Train Sim World® 3', N'10005', N'Chinh phục những ngọn núi của Mỹ khi bạn vận chuyển trọng tải đáng kinh ngạc bằng những cỗ máy công nghiệp, khiến những người đi làm ở thủ đô nước Anh đi làm trong thời gian kỷ lục và chạy đua giữa các bang trên chiếc xe kéo tốc độ cao của Đức. Làm chủ cỗ máy với Train Sim World 3', N'TrainSimulator.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11130', 350000, 77, N'Euro Truck Simulator 2', N'10005', N'Du lịch khắp châu Âu với tư cách là vua đường bộ, một tài xế xe tải vận chuyển hàng hóa quan trọng trên những khoảng cách ấn tượng! Với hàng chục thành phố để khám phá từ Vương quốc Anh, Bỉ, Đức, Ý, Hà Lan, Ba Lan, v.v., sức bền, kỹ năng và tốc độ của bạn sẽ được đẩy đến giới hạn của chúng. Nếu bạn có đủ tố chất để trở thành một phần của lực lượng vận tải đường bộ ưu tú, hãy ngồi sau tay lái và chứng minh điều đó!', N'EuroTruck.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11131', 420000, 3, N'WRC GENERATIONS – THE FIA WRC OFFICIAL GAME', N'10006', N'Vươn lên tất cả những thách thức của mô phỏng tập hợp toàn diện, thực tế và đòi hỏi khắt khe nhất từng được phát triển. Đi sâu vào trung tâm của hành động và lái những chiếc xe từ giải vô địch WRC 2022, bao gồm cả những mẫu xe hybrid mới.', N'WRCGeneration.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11132', 990000, 45, N'FORZA HORIZON 5', N'10006', N'Cuộc phiêu lưu chân trời cuối cùng của bạn đang chờ đợi! Khám phá những cảnh quan thế giới mở sôi động và không ngừng phát triển của Mexico với hành động lái xe thú vị, không giới hạn trên hàng trăm chiếc xe tuyệt vời nhất thế giới.', N'ForzaHorizon5.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11133', 342500, 75, N'Wreckfest', N'10006', N'Wreckfest là một trò chơi đua xe theo chủ đề trận derby hủy diệt với mô hình sát thương thân mềm, động lực lái tinh vi và nâng cấp phương tiện chuyên sâu, bao gồm cả trận derby hủy diệt và các cuộc đua đường đua truyền thống hơn. Đó là tất cả về niềm vui, cuộc đua chóng mặt và những pha va chạm đỉnh cao.', N'Wreckfest.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11134', 990000, 24, N'F1® 22', N'10006', N'Bước vào kỷ nguyên mới của Công thức 1® trong EA SPORTS™ F1® 22, trò chơi điện tử chính thức của 2022 FIA Formula One World Championship™. Hãy ngồi vào chỗ của bạn trong một mùa giải mới khi những chiếc xe được thiết kế lại và các quy tắc được đại tu sẽ xác định lại ngày đua, kiểm tra kỹ năng của bạn quanh Trường đua Quốc tế Miami mới, đồng thời cảm nhận sự hào nhoáng và quyến rũ trong Cuộc sống F1®.', N'F122.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11135', 990000, 18, N'FIFA 22', N'10006', N'Được hỗ trợ bởi Football™, EA SPORTS™ FIFA 22 mang trò chơi đến gần hơn với thực tế với những cải tiến cơ bản về lối chơi và một mùa đổi mới mới trên mọi chế độ.', N'FIFA22.jpg')
INSERT [dbo].[Game] ([Game_ID], [Price], [Quantity], [Game_Name], [idLoaiGame], [MoTa], [AnhBia]) VALUES (N'11136', 950000, 77, N'Tennis World Tour 2', N'10006', N'Chơi như những người chơi hàng đầu thế giới hoặc tạo người chơi của riêng bạn để thử và thống trị bảng xếp hạng thế giới. Nhịp độ nhanh hơn, với nhiều hình ảnh động hơn và chân thực hơn: trải nghiệm cảm giác thực sự của quần vợt, trong các trận đấu đơn hoặc đôi, đồng thời thách đấu bạn bè của bạn tại địa phương hoặc trực tuyến.', N'TennisWorldTour.jpg')
GO
INSERT [dbo].[NguoiDung] ( [Password], [UserName], [Phone], [Email], [Cust_Balance], [Address]) VALUES ( N'anhyeuem123', N'truongvippro123', N'0900150306', N'truongthichthuy@gmail.com', 0, N'Bến Tre')
INSERT [dbo].[NguoiDung] ([Password], [UserName], [Phone], [Email], [Cust_Balance], [Address]) VALUES (N'iloveyou456', N'hungchodien', N'0900150666', N'nguyenphantanhung@gmail.com', 0, N'Bình Dương')
INSERT [dbo].[NguoiDung] ([Password], [UserName], [Phone], [Email], [Cust_Balance], [Address]) VALUES (N'123', N'namdeptrai', N'0132132112', N'dasoudg@gmail.com', 0, N'ye12v3h 23u23k12')
GO
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'1', N'c6rlgd1N29', N'11101', N'BruhRentAcc1')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'10', N'dD08MUaeoU', N'11104', N'BruhRentAcc10')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'100', N'brC0AHlwLP', N'11134', N'BruhRentAcc100')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'101', N'sadjosadniosa2', N'11134', N'BruhRentAcc101')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'102', N'D9adasss', N'11134', N'BruhRentAcc102')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'103', N'H4sbCu&x&O', N'11135', N'BruhRentAcc103')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'104', N'O&1oFjGyWR', N'11135', N'BruhRentAcc104')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'105', N'8nZJ13yxtR', N'11135', N'BruhRentAcc105')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'106', N'qCdkvyoqxj', N'11136', N'BruhRentAcc106')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'107', N'GOdHL&2b&g', N'11136', N'BruhRentAcc107')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'108', N'52OeTPhUHU', N'11136', N'BruhRentAcc108')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'11', N'UlHfd23', N'11104', N'BruhRentAcc11')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'12', N'eeuQZ29Yxv', N'11104', N'BruhRentAcc12')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'13', N'lUBtkXHE5M', N'11105', N'BruhRentAcc13')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'14', N'jZ22hjrAbg', N'11105', N'BruhRentAcc14')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'15', N'wIEsqvu&Vt', N'11105', N'BruhRentAcc15')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'16', N'pAP264ZNQm', N'11106', N'BruhRentAcc16')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'17', N'sBOuDdsad2', N'11106', N'BruhRentAcc17')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'18', N'm7b2zLywFV', N'11106', N'BruhRentAcc18')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'19', N'r7gB9uNrBn', N'11107', N'BruhRentAcc19')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'2', N'6wt4NirtTK', N'11101', N'BruhRentAcc2')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'20', N'XozozEuZTE', N'11107', N'BruhRentAcc20')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'21', N's9TNKNqKD0', N'11107', N'BruhRentAcc21')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'22', N'pt7XHOLeHf', N'11108', N'BruhRentAcc22')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'23', N'MpkNmmjrF6', N'11108', N'BruhRentAcc23')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'24', N'79Oaeisada', N'11108', N'BruhRentAcc24')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'25', N'OlRdDi4gHL', N'11109', N'BruhRentAcc25')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'26', N'FlC&A1gtso', N'11109', N'BruhRentAcc26')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'27', N'21EQbs2bA6', N'11109', N'BruhRentAcc27')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'28', N'vhrGE61QnI', N'11110', N'BruhRentAcc28')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'29', N'm45y6FzmAt', N'11110', N'BruhRentAcc29')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'3', N'XBzxoa8J8K', N'11101', N'BruhRentAcc3')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'30', N'rKusdaas2', N'11110', N'BruhRentAcc30')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'31', N'&0luPz2QKx', N'11111', N'BruhRentAcc31')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'32', N'q8uv02C2xU', N'11111', N'BruhRentAcc32')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'33', N'oipsibSbQd', N'11111', N'BruhRentAcc33')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'34', N'fSlKO4MRco', N'11112', N'BruhRentAcc34')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'35', N'IMwEJtHd08', N'11112', N'BruhRentAcc35')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'36', N'Aty1yacKE4', N'11112', N'BruhRentAcc36')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'37', N'sdasaccdsas22', N'11113', N'BruhRentAcc37')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'38', N'KhyAoJ8MxH', N'11113', N'BruhRentAcc38')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'39', N'c1NV2N7mpL', N'11113', N'BruhRentAcc39')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'4', N'ftZQg95hW7', N'11102', N'BruhRentAcc4')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'40', N'ro9QaHNRtu', N'11114', N'BruhRentAcc40')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'41', N'v7VvPS8fp', N'11114', N'BruhRentAcc41')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'42', N'tL8LyIq07h', N'11114', N'BruhRentAcc42')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'43', N'LyPUQ2tvTo', N'11115', N'BruhRentAcc43')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'44', N'jQoGFMrWua', N'11115', N'BruhRentAcc44')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'45', N'V&omOw6GtD', N'11115', N'BruhRentAcc45')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'46', N'yJDPwlRrbv', N'11116', N'BruhRentAcc46')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'47', N'aMNfdluOB0', N'11116', N'BruhRentAcc47')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'48', N'0o&5UQqjh1', N'11116', N'BruhRentAcc48')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'49', N'thLC0JxS4a', N'11117', N'BruhRentAcc49')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'5', N'qk5lpSOiOz', N'11102', N'BruhRentAcc5')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'50', N'PmxmMcRQ&k', N'11117', N'BruhRentAcc50')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'51', N'Q2TS7sad', N'11117', N'BruhRentAcc51')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'52', N'ChLfqLysno', N'11118', N'BruhRentAcc52')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'53', N'NErM3Fycf&', N'11118', N'BruhRentAcc53')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'54', N'H7uki3jdMM', N'11118', N'BruhRentAcc54')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'55', N'HZ5c80x1sn', N'11119', N'BruhRentAcc55')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'56', N'6H3dsau2', N'11119', N'BruhRentAcc56')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'57', N'X&CTeufHZq', N'11119', N'BruhRentAcc57')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'58', N'lycqUtyTut', N'11120', N'BruhRentAcc58')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'59', N'IA4M9qSWVD', N'11120', N'BruhRentAcc59')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'6', N'4o4tvqY5Eo', N'11102', N'BruhRentAcc6')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'60', N'bo7vYtr7DS', N'11120', N'BruhRentAcc60')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'61', N'ByKvrwijRe', N'11121', N'BruhRentAcc61')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'62', N'Wsoj80bie0', N'11121', N'BruhRentAcc62')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'63', N'w9o56Wz', N'11121', N'BruhRentAcc63')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'64', N'Rt6tusad', N'11122', N'BruhRentAcc64')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'65', N'DP7q2N3d7i', N'11122', N'BruhRentAcc65')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'66', N'e5zjB0HC7o', N'11122', N'BruhRentAcc66')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'67', N'Qh3eUxmOWX', N'11123', N'BruhRentAcc67')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'68', N'rjwym1NqeU', N'11123', N'BruhRentAcc68')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'69', N'aKaT6lTN', N'11123', N'BruhRentAcc69')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'7', N'Xtb0LJIZ&o', N'11103', N'BruhRentAcc7')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'70', N'SXKW5wNrEq', N'11124', N'BruhRentAcc70')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'71', N'Qdsaoubd2', N'11124', N'BruhRentAcc71')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'72', N'rvRTIX8uuF', N'11124', N'BruhRentAcc72')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'73', N'XHmrvzhKlt', N'11125', N'BruhRentAcc73')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'74', N'G55uU5HuRk', N'11125', N'BruhRentAcc74')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'75', N'tKZEnslooh', N'11125', N'BruhRentAcc75')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'76', N'CF008v&pAn', N'11126', N'BruhRentAcc76')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'77', N'vQ&qMP0mDZ', N'11126', N'BruhRentAcc77')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'78', N'Q0u&Mju1pc', N'11126', N'BruhRentAcc78')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'79', N'r3rr4zhtqz', N'11127', N'BruhRentAcc79')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'8', N'gkbmYSGw4m', N'11103', N'BruhRentAcc8')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'80', N'lgRnbn6jTK', N'11127', N'BruhRentAcc80')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'81', N'CuS8wx&kyj', N'11127', N'BruhRentAcc81')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'82', N'Orm9dyAMw&', N'11128', N'BruhRentAcc82')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'83', N'NjioRLVft1', N'11128', N'BruhRentAcc83')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'84', N'1B5cR3TLvT', N'11128', N'BruhRentAcc84')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'85', N'6DFtMsleGk', N'11129', N'BruhRentAcc85')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'86', N'gdVJLteyel', N'11129', N'BruhRentAcc86')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'87', N'1fw6BP9mlt', N'11129', N'BruhRentAcc87')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'88', N'AzBPmfJaLZ', N'11130', N'BruhRentAcc88')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'89', N'Eu6rNZq3RO', N'11130', N'BruhRentAcc89')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'9', N'x8kqEhwmmD', N'11103', N'BruhRentAcc9')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'90', N'oT5mhP6z5z', N'11130', N'BruhRentAcc90')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'91', N'xFsBmhy7BE', N'11131', N'BruhRentAcc91')
GO
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'92', N'gXAuIfN2ip', N'11131', N'BruhRentAcc92')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'93', N'YZKeFq5TuA', N'11131', N'BruhRentAcc93')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'94', N'MuYH7My', N'11132', N'BruhRentAcc94')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'95', N'L4idz2CODo', N'11132', N'BruhRentAcc95')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'96', N'7lWZRtdWHZ', N'11132', N'BruhRentAcc96')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'97', N'plVHucduk9', N'11133', N'BruhRentAcc97')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'98', N'Fdobsaudo2', N'11133', N'BruhRentAcc98')
INSERT [dbo].[QLTaiKhoanChoThue] ([RentAccount_ID], [RentAccount_Password], [Game_ID], [AccountName]) VALUES (N'99', N'ut2SMcGz2X', N'11133', N'BruhRentAcc99')
GO
INSERT [dbo].[TheLoaiGame] ([idLoaiGame], [TenLoaiGame]) VALUES (N'10001', N'Hành Ðộng')
INSERT [dbo].[TheLoaiGame] ([idLoaiGame], [TenLoaiGame]) VALUES (N'10002', N'Nhập Vai')
INSERT [dbo].[TheLoaiGame] ([idLoaiGame], [TenLoaiGame]) VALUES (N'10003', N'Chiến thuật')
INSERT [dbo].[TheLoaiGame] ([idLoaiGame], [TenLoaiGame]) VALUES (N'10004', N'Phiêu Luu')
INSERT [dbo].[TheLoaiGame] ([idLoaiGame], [TenLoaiGame]) VALUES (N'10005', N'Mô Phỏng')
INSERT [dbo].[TheLoaiGame] ([idLoaiGame], [TenLoaiGame]) VALUES (N'10006', N'Thể Thao Tốc Ðộ')
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_GameTheLoai] FOREIGN KEY([idLoaiGame])
REFERENCES [dbo].[TheLoaiGame] ([idLoaiGame])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_GameTheLoai]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_GameOrder] FOREIGN KEY([Game_ID])
REFERENCES [dbo].[Game] ([Game_ID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_GameOrder]
GO
ALTER TABLE [dbo].[QLTaiKhoanChoThue]  WITH CHECK ADD  CONSTRAINT [FK_Game_ID] FOREIGN KEY([Game_ID])
REFERENCES [dbo].[Game] ([Game_ID])
GO
ALTER TABLE [dbo].[QLTaiKhoanChoThue] CHECK CONSTRAINT [FK_Game_ID]
GO
ALTER TABLE [dbo].[ThanhToan]  WITH CHECK ADD  CONSTRAINT [FK_OrderPayment] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[OrderDetail] ([Order_ID])
GO
ALTER TABLE [dbo].[ThanhToan] CHECK CONSTRAINT [FK_OrderPayment]
GO
ALTER TABLE [dbo].[ThanhToan]  WITH CHECK ADD  CONSTRAINT [FK_ThanhToanUser] FOREIGN KEY([CustID])
REFERENCES [dbo].[NguoiDung] ([CustID])
GO
ALTER TABLE [dbo].[ThanhToan] CHECK CONSTRAINT [FK_ThanhToanUser]
GO
USE [master]
GO
ALTER DATABASE [qlythueacc] SET  READ_WRITE 
GO
