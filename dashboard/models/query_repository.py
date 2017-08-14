

class QueryRepository():

	class Office():
		last_3_run = '''
			SET @v1=0;
			SET @v2 = 0;
			select * from(
				select *, if(@v2 = indicator_id or @v2 = 0, @v1:= @v1 + 1, @v1:= 1) AS v1, @v2:= indicator_id   from dashboard_indicatordata where id =  318110
				order by indicator_id, load_date DESC
		) b where b.v1 <= 3;'''
