
/****** Object:  Table [dbo].[tblPromotions]    Script Date: 20/02/2025 2:48:05 pm ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblPromotions]') AND type in (N'U'))
DROP TABLE [dbo].[tblPromotions]
GO

/****** Object:  Table [dbo].[tblPromotions]    Script Date: 20/02/2025 2:48:05 pm ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblPromotions](
	[Id] [bigint] NULL,
	[PromotionTitle] [nvarchar](255) NULL,
	[PromotionTypeId] [int] NULL,
	[PromotionStartDate] [datetimeoffset](7) NULL,
	[PromotionEndDate] [datetimeoffset](7) NULL,
	[DiscountTypeId] [int] NULL,
	[DiscountValue] [decimal](18, 0) NULL,
	[PromotionDescription] [nvarchar](500) NULL,
	[RecordStatus] [int] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[CreatedDate] [datetimeoffset](7) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL
) ON [PRIMARY]
GO


