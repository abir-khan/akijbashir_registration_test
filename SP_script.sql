USE [HRNITOL06]
GO
/****** Object:  StoredProcedure [dbo].[SpUserRegistration_ak]    Script Date: 9/14/2023 6:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SpUserRegistration_ak] 
	-- Add the parameters for the stored procedure here
	@username nvarchar(200),
	@password_ nvarchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into tblUserRegistration_t(Username,Password,Entryby) values(@username,@password_,GETDATE())
END
GO
