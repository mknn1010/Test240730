package quartz;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class TestJob implements Job {
	
	@Override
	public void execute(JobExecutionContext ctx) throws JobExecutionException {
		System.out.println("누군가 소리 지름.");
	}
	
}





