USE Vaccinations
GO

-- Script for full database backups:
BACKUP DATABASE Vaccinations --Database that is backed up
      TO DISK = N'C:\toRestore\backup\VaccinationsFull.bak'--Backup path and backup name
WITH CHECKSUM;

--Script for differential backups:
BACKUP DATABASE Vaccinations               
        TO DISK =   N'C:\toRestore\backup\differentialVaccinations.bak'
        WITH DIFFERENTIAL;
GO

--Script for transaction log backups:
BACKUP LOG Vaccinations
TO DISK = N'C:\toRestore\backup\Vaccinations.log';
GO
