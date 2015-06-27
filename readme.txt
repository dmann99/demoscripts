David Mann
http://ba6.us

readme.txt - This file.

scott - Baseline
-------------------------------------------------------------------------------
scott.sql    - Base SCOTT/tiger schema for reference


scottjr  - Auditing trigger example
-------------------------------------------------------------------------------
scottjr-0.sql            -- Create SCOTTJR user
scottjr-1-triggers.sql   -- Create audit tables and triggers
scottjr-2-demo.sql       -- Make changes, commit, view changes in audit table


scottIII - Todo: Fine Grained Auditing Example
-------------------------------------------------------------------------------
scottiii.sql


scottIV  - Flashback enabled for query and transaction
-------------------------------------------------------------------------------
scottiv-0-reset.sql     - Remove and recreate ScottIV User 
scottiv-1-ddl.sql       - Create and populate DEPT, EMP tables
scottiv-2-CreateFDA.sql - Create and verify Flash Data Archive
scottiv-3-dml.sql       - Apply multiple changes, inspect the results

