create user win2 identified by win2;
grant create session to win2;
grant resource to win2;
grant create view to win2;

alter user win2 quota unlimited on users;
