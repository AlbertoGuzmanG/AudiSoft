-- select 0 into @v2;
-- select 0 into @v1;
-- select * from(
-- select *, if(@v2 = indicator_id or @v2 = 0, @v1:= @v1 + 1, @v1:= 1) AS v1, @v2:= indicator_id   from dashboard_indicatordata
-- order by indicator_id, load_date DESC
-- ) b where b.v1 <= 3;



CREATE DEFINER=`root`@`localhost` PROCEDURE `risk_information_tree`(IN `indicator_records_limit` INT, IN `filter` VARCHAR(600))
	LANGUAGE SQL
	NOT DETERMINISTIC
	CONTAINS SQL
	SQL SECURITY DEFINER
	COMMENT ''
BEGIN
	SET @v1=0;
	SET @v2 = 0;

	SET @query_filter = if(filter = "", "", CONCAT("WHERE ", filter));

	SET @basic_query = CONCAT("select *, if(@v2 = indicator_id or @v2 = 0, @v1:= @v1 + 1, @v1:= 1) AS executions_order, @v2:= indicator_id AS v2   from dashboard_indicatordata ", @query_filter , " order by indicator_id, load_date DESC");

	SET @query = CONCAT("select * from(", @basic_query, ") b where b.executions_order <= ", indicator_records_limit);

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
END