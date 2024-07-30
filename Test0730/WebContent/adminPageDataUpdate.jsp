<%@page import="org.quartz.JobBuilder"%>
<%@page import="org.quartz.JobDetail"%>
<%@page import="org.quartz.JobDataMap"%>
<%@page import="org.quartz.Scheduler"%>
<%@page import="org.quartz.impl.StdSchedulerFactory"%>
<%@page import="org.quartz.SchedulerFactory"%>
<%@page import="dto.MemberDTO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDAO mDao = new MemberDAO();
	String id = request.getParameter("id").toString();
	MemberDTO mInfo = mDao.getMemberById(id);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>adminPageDataUpdate</title>
	<link href="css/reset.css"/>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script>
	$(function(){
		$(document).on("click","#login", function(){
			alert("수정되었습니다.");
		})
	})
	</script>
	<style>
		.main_border{
			display: inline-block;
			border: 1px solid black;
			padding: 1rem 2rem 2rem 2rem;
		}
		.input_container, .input_outer {
			display:flex;
  			flex-direction: column;
			gap:0.2rem;
		}
		.input_inner {
			display:flex;
			justify-content: flex-start;
		}
		.input_inner > input {
			margin-left: auto;
		}
		.btn {
			width:100%;
		}
	</style>
</head>
<body>
	<div class="main_border">
		<div class="h1_container">
			<h1 style="font-size: 36px;">회원가입</h1>
		</div>
		<div class="input_container">
			<form action="AdminServlet" method="post">
			<div class="input_outer">
				<div class="input_inner">
					ID  <input type="text" name="id" placeholder="<%=mInfo.getId()%>" value="<%=mInfo.getId()%>" id="input_id" readonly/><br/>
				</div>
				<div class="input_inner">
					PW  <input type="text" name="pw" placeholder="<%=mInfo.getPw()%>" id="input_pw" required/><br/>
				</div>
				<div class="input_inner">
					Name  <input type="text" name="name" placeholder="<%=mInfo.getName()%>" id="input_name" required/><br/>
				</div>
				<div class="input_inner">
					Point  <input type="number" name="point" placeholder="<%=mInfo.getPoint()%>" id="input_point" required/><br/>
				</div>
			</div>
			<input type="hidden" name="type" value="updateInfo"/>
			<button type="submit" id="login" class="btn">제출</button>	
			</form>
		</div>
	</div>
</body>
</html>
<%-- <%!
// public class ExQuartz {
// 	public void main(String[] args) throws Exception {
// 		SchedulerFactory schedulerFactory = new StdSchedulerFactory();
// 		Scheduler scheduler = schedulerFactory.getScheduler();
// 		JobDataMap jobDataMap = new JobDataMap();
// 		jobDataMap.put("jobSays", "Say Hello World!");
// 		jobDataMap.put("myFloatValue", 3.1415f);
// 		JobDetail jobDetail = JobBuilder.newJob(TestJob.class)
// 		.withIdentity("myJob", "group1")
// 		.setJobData(jobDataMap)
// 		.build();
// 		CronTrigger cronTrigger = (CronTrigger) TriggerBuilder.newTrigger()
// 		.withIdentity("trggerName", "cron_trigger_group")
// 		.withSchedule(CronScheduleBuilder.cronSchedule("*/20 * * * * ?")) // 매 20초마다 실행
// 		.forJob(jobDetail)
// 		.build();
		
// 		Set<Trigger> triggerSet = new HashSet<Trigger>();
// 		triggerSet.add(cronTrigger);

// 		scheduler.scheduleJob(jobDetail, triggerSet, false);
// 		scheduler.start();	
// 		Thread.sleep(7000);
// 		scheduler.shutdown();	
// 	}
// }
%> --%>
