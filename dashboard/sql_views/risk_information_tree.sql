select 0 into @v2;
select 0 into @v1;
select * from(
select *, if(@v2 = indicator_id or @v2 = 0, @v1:= @v1 + 1, @v1:= 1) AS v1, @v2:= indicator_id   from dashboard_indicatordata
order by indicator_id, load_date DESC
) b where b.v1 <= 3;