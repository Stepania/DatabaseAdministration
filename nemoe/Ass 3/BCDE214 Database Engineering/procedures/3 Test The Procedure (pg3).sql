Test the Procedure(pg3)
SET @email_list = "";
CALL build_email_list(@email_list);
SELECT @email_list;

Last modified: Monday, 14 May 2018, 9:13 AM