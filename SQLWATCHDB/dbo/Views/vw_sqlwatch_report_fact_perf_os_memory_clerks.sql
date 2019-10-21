﻿CREATE VIEW [dbo].[vw_sqlwatch_report_fact_perf_os_memory_clerks] with schemabinding
as
SELECT [report_time]
      ,omc.[total_kb]
      ,omc.[allocated_kb]
      ,omc.[total_kb_all_clerks]
      ,omc.[memory_available]
      ,omc.[sql_instance]
	  ,mdc.clerk_name
  FROM [dbo].[sqlwatch_logger_perf_os_memory_clerks] omc
	
	inner join [dbo].[sqlwatch_meta_memory_clerk] mdc
		on mdc.sql_instance = omc.sql_instance
		and mdc.sqlwatch_mem_clerk_id = omc.sqlwatch_mem_clerk_id

    inner join dbo.sqlwatch_logger_snapshot_header sh
		on sh.sql_instance = omc.sql_instance
		and sh.snapshot_time = omc.[snapshot_time]
		and sh.snapshot_type_id = omc.snapshot_type_id