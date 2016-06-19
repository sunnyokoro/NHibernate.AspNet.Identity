
    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK86803B282B87AB2A]') AND parent_object_id = OBJECT_ID('AspNetUserRoles'))
alter table AspNetUserRoles  drop constraint FK86803B282B87AB2A


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK86803B28EA778823]') AND parent_object_id = OBJECT_ID('AspNetUserRoles'))
alter table AspNetUserRoles  drop constraint FK86803B28EA778823


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF896DAEEA778823]') AND parent_object_id = OBJECT_ID('AspNetUserLogins'))
alter table AspNetUserLogins  drop constraint FKEF896DAEEA778823


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF4F7D992EA778823]') AND parent_object_id = OBJECT_ID('AspNetUserClaims'))
alter table AspNetUserClaims  drop constraint FKF4F7D992EA778823


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4376B148E75DF37]') AND parent_object_id = OBJECT_ID('ApplicationUser'))
alter table ApplicationUser  drop constraint FK4376B148E75DF37


    if exists (select * from dbo.sysobjects where id = object_id(N'AspNetUsers') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AspNetUsers

    if exists (select * from dbo.sysobjects where id = object_id(N'AspNetUserRoles') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AspNetUserRoles

    if exists (select * from dbo.sysobjects where id = object_id(N'AspNetUserLogins') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AspNetUserLogins

    if exists (select * from dbo.sysobjects where id = object_id(N'AspNetRoles') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AspNetRoles

    if exists (select * from dbo.sysobjects where id = object_id(N'AspNetUserClaims') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AspNetUserClaims

    if exists (select * from dbo.sysobjects where id = object_id(N'ApplicationUser') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ApplicationUser

    create table AspNetUsers (
        Id INT IDENTITY NOT NULL,
       AccessFailedCount INT null,
       Email NVARCHAR(255) null,
       EmailConfirmed BIT null,
       LockoutEnabled BIT null,
       LockoutEndDateUtc DATETIME null,
       PasswordHash NVARCHAR(255) null,
       PhoneNumber NVARCHAR(255) null,
       PhoneNumberConfirmed BIT null,
       TwoFactorEnabled BIT null,
       UserName NVARCHAR(255) not null unique,
       SecurityStamp NVARCHAR(255) null,
       primary key (Id)
    )

    create table AspNetUserRoles (
        UserId INT not null,
       RoleId INT not null
    )

    create table AspNetUserLogins (
        UserId INT not null,
       LoginProvider NVARCHAR(255) null,
       ProviderKey NVARCHAR(255) null
    )

    create table AspNetRoles (
        Id INT IDENTITY NOT NULL,
       Name NVARCHAR(255) not null unique,
       primary key (Id)
    )

    create table AspNetUserClaims (
        Id INT IDENTITY NOT NULL,
       ClaimType NVARCHAR(255) null,
       ClaimValue NVARCHAR(255) null,
       UserId INT null,
       primary key (Id)
    )

    create table ApplicationUser (
        applicationuser_key INT not null,
       primary key (applicationuser_key)
    )

    alter table AspNetUserRoles 
        add constraint FK86803B282B87AB2A 
        foreign key (RoleId) 
        references AspNetRoles

    alter table AspNetUserRoles 
        add constraint FK86803B28EA778823 
        foreign key (UserId) 
        references AspNetUsers

    alter table AspNetUserLogins 
        add constraint FKEF896DAEEA778823 
        foreign key (UserId) 
        references AspNetUsers

    alter table AspNetUserClaims 
        add constraint FKF4F7D992EA778823 
        foreign key (UserId) 
        references AspNetUsers

    alter table ApplicationUser 
        add constraint FK4376B148E75DF37 
        foreign key (applicationuser_key) 
        references AspNetUsers
