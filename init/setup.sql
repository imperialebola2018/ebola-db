CREATE DATABASE orderly;
CREATE DATABASE coredata;

-- Core roles
-- TODO: orderly should not be able to write to any db but orderly
CREATE ROLE orderly NOSUPERUSER NOCREATEDB NOCREATEROLE INHERIT LOGIN;
CREATE ROLE import NOSUPERUSER NOCREATEDB NOCREATEROLE INHERIT LOGIN;

-- Group:
-- TODO: this doesn't actually work and the readonly user can create tables
CREATE ROLE readaccess;
REVOKE ALL PRIVILEGES ON ALL tables IN SCHEMA public FROM readaccess;
REVOKE ALL PRIVILEGES ON ALL sequences IN SCHEMA public FROM readaccess;
REVOKE ALL PRIVILEGES ON ALL functions IN SCHEMA public FROM readaccess;
GRANT USAGE ON SCHEMA public TO readaccess;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO readaccess;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO readaccess;

-- Create a final user with password
CREATE USER readonly;
GRANT readaccess TO readonly;
