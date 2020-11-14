# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first) 

 
User.create( :name => 'admin', :login => 'admin', :email => 'jacob@pitsolutions.com', :password => 'admin',:role_id=>1,:confirmed=>true,:is_approved=>1,:active=>true)

Setting.create( :allow_examinee_registration => true, :confirm_exam=> true, :datetime_format=>'%m/%d/%Y', :locale=>'en', :show_hint_to_examinee => true )

 ["admin", "examiner", "questionsetter","examinee"].each do |r|  
   Role.find_or_create_by_name r  
 end 

# ["t1", "t2", "t3", "t4", "t5", "t6","t7"].each do |r|  
#   Email.find_or_create_by_section_id r  
# end
 
 ["school", "university/college", "organization","training_center"].each do |r|  
   Organization.find_or_create_by_title r  
 end 
 
 
   ["course,1,1","section,1,2","course,2,1","academic_year,2,2","department,2,3","semester,2,4","department,3,1","domain,4,1"] .each do |category|  
     a,b,c = category.chomp.split(",")  
     CategoryType.create!(:title => a, :organization_id => b, :sort_order=>c)  
   end  

 ["MultipleChoice", "MultipleSelection", "Fill in the blanks","Yes or No", "True or False", "Drag and Drop","Likert","Matrix","Image based","Hierarchical ordering","Matching","Descriptive"].each do |r|  
   QuestionType.find_or_create_by_name r  
 end


  ["Dear $^_username_^$,<br><br>
Now your are registered user of VirtualX! <br>
Please wait till you receive your account activated email for logging in to the system.<br><br>
<hr>
Thanks & Regards,<br>
<b>VirtualX Team</b>",

"Dear $^_username_^$, <br><br>
Your account has been created. You can login with the following credentials after you have activated your account by clicking on the <i>Verify Email</i> link given below.<br><br> 
<br>
User Id: $^_userlogin_^$ <br>
<br><br>
Please click on the below given link to activate your account, <br><br>
$^_verify_email_^$ <br><br>
<hr>
Thanks & Regards,<br>
<b>VirtualX Team<b>*t2*
User Name <=> $^_username_^$<br>  User LoginId <=> $^_userlogin_^$<br>  Verify Email link <=> $^_verify_email_^$*",
 
"Dear $^_username_^$,<br><br>
Your account has been rejected. <br><br>
<hr>
Thanks & Regards,<br>
<b>VirtualX Team</b><br>*t3*User Name <=> $^_username_^$*",

"Dear $^_username_^$,<br><br>
Your account has been created with VirtualX.<br><br>
You can login to the system with the following credentials. <br><br>
<br>
User Id: $^_userlogin_^$ <br>
<br><br>
Please verify your email-id and set password after clicking on the link below,<br><br>
$^_verify_and_set_password^$<br><br>
<hr>
Thanks & Regards,<br>
<b>VirtualX Team</b><br>*t4*User Name <=> $^_username_^$<br>  User Login <=> $^_userlogin_^$<br>  Verify Email and Password link <=> $^_verify_and_set_password^$*",

"Dear $^_username_^$,<br><br>
To reset your password, please click on the link below:<br><br>
$^_reset_url_^$ <br><br>
<hr>
Thanks & Regards,<br>
<b>VirtualX Team</b><br>*t5*User Name <=> $^_username_^$<br> Reset Password Link <=> $^_reset_url_^$*",

"Dear Administrator,<br><br>
Please find the attachment containing the list of Temporary Examinees created few minutes ago.<br><br>
<hr>
Thanks & Regards,<br>
<b>VirtualX Team</b><br>*t6* *",

"Dear $^_username_^$,<br><br>
Your exam schedule details are given below.<br><br> 
<hr>
Exam name: $^_examname_^$ <br>
Exam code:  $^_examcode_^$ <br>
Exam date:  $^_examdate_^$ <br>
Exam time:  $^_examtime_^$ <br>
Exam duration: $^_examduration_^$ <br>
<br><br>
<hr>
Thanks & Regards,<br>
<b>VirtualX Team</b><br>*t8*User Name <=> $^_username_^$*" ] .each do |email|  
     a,b,c,d,e,f = email.chomp.split("*")  
     Email.create!(:content => a, :section_id => b, :help_content=>c, :content_de=>d, :content_ar=>e, :content_zh=>f)  
   end




   ["VirtualX is an online examination management system which provides a basis for effective fulfillment of conducting online exam in an efficient manner. This system efficiently evaluates the candidates thoroughly through the fully automated system that not only save the time but also gives fast result. The system supports report generation and feedback management.*1",
   "VirtualX ist eine Online-Prufung-Management-System, die eine Grundlage fur eine effektive Erfullung der Durchfuhrung von Online-Prufung auf effiziente Weise zur Verfugung stellt. Dieses System effizient beurteilt die Kandidaten grundlich durch das voll automatisiertes System, das spart nicht nur Zeit, sondern gibt auch schnelle Ergebnis. Das System unterstutzt Berichterstellung und Feedback-Management.*2",
   "يرشول أكس هو نظام إدارة إمتحانات إلكتروني يوفر أساسا لإجراء الامتحانات على الانترنت بطريقة فعالة. يقوم هذا النظام بتقييم كفاءة المتقدمين للإمتحان بدقة من خلال نظام آلي تماما ولذا فهو لا يعمل على توفير الوقت فحسب ولكنه أيضا يعطي نتيجة سريعة. النظام يدعم إنشاء التقارير، و??دارة التغذية الظاهري.*3","VirtualX 是一個在線考試管理系統，它提供了一個基礎，有效地進行在線考試，以有效的方式履行。該系統有效地評估候選人完全通過完全自動化的系統，不僅節省了時間，但也能提供快速的結果。該系統支持生成報告和反饋管理.*4"] .each do |about|  
     a,b = about.chomp.split("*")  
     Aboutus.create!(:description => a, :locale_id => b)
   end  

