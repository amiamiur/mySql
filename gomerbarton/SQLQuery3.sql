USE [TestIndex2]
GO

/****** Object:  Table [dbo].[Table_1]    Script Date: 25.09.2026 9:08:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Table_2](
	[id] [int] NOT NULL,
	[name] [nchar](10) NOT NULL,
	[date_created] [datetime] NOT NULL,
	[balance] [money] NOT NULL,
	[credit] [money] NOT NULL,
	[diff_balance]  AS ([balance]-[credit])
) ON [PRIMARY]
GO


