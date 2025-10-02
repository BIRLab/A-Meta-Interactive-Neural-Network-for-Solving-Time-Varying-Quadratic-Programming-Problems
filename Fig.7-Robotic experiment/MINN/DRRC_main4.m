clear;
close all
format long;
load SDNN_3robot_data
load DRRC_SRDdata3
load DRRC_SRDdata2
global jo djo
figure;
p1=plot(t,qAll(:,1),'m--',t,qAll(:,2),'g.-',t,qAll(:,3),'k.',t,qAll(:,4),'r:',t,qAll(:,5),'k--',t,qAll(:,6),'b-',...
    t,jo*ones(length(t),1),'r',t,-jo*ones(length(t),1),'c','linewidth',1.5);hold on;
% ylim([-4 4])
xlabel('Time (Second)');
title('$theta$');
legend(p1,'$theta_1$','$theta_2$','$theta_3$','$theta_4$','$theta_5$','$theta_6$','$theta^+$','$theta^-$');
ah=axes('position',get(gca,'position'),'visible','off');

% figure;
% p1=plot(t,qAll(:,7),'m--',t,qAll(:,8),'g.-',t,qAll(:,9),'k.',t,qAll(:,10),'r:',t,qAll(:,11),'k--',t,qAll(:,12),'b-',...
%     t,5*ones(length(t),1),'r',t,-5*ones(length(t),1),'c','linewidth',1.5);hold on;
% % ylim([-4 4])
% xlabel('Time (Second)');
% title('theta2');
% legend(p1,'q1','q2','q3','q4','q5','q6','q+','q-');
% ah=axes('position',get(gca,'position'),'visible','off');
% 
% figure;
% p1=plot(t,qAll(:,13),'m--',t,qAll(:,14),'g.-',t,qAll(:,15),'k.',t,qAll(:,16),'r:',t,qAll(:,17),'k--',t,qAll(:,18),'b-',...
%     t,5*ones(length(t),1),'r',t,-5*ones(length(t),1),'c','linewidth',1.5);hold on;
% % ylim([-4 4])
% xlabel('Time (Second)');
% title('theta3');
% legend(p1,'q1','q2','q3','q4','q5','q6','q+','q-');
% ah=axes('position',get(gca,'position'),'visible','off');
% 
% figure;
% p1=plot(t,qAll(:,19),'m--',t,qAll(:,20),'g.-',t,qAll(:,21),'k.',t,qAll(:,22),'r:',t,qAll(:,23),'k--',t,qAll(:,24),'b-',...
%     t,5*ones(length(t),1),'r',t,-5*ones(length(t),1),'c','linewidth',1.5);hold on;
% % ylim([-4 4])
% xlabel('Time (Second)');
% title('theta4');
% legend(p1,'q1','q2','q3','q4','q5','q6','q+','q-');
% ah=axes('position',get(gca,'position'),'visible','off');
% 
% figure;
% p1=plot(t,qAll(:,25),'m--',t,qAll(:,26),'g.-',t,qAll(:,27),'k.',t,qAll(:,28),'r:',t,qAll(:,29),'k--',t,qAll(:,30),'b-',...
%     t,5*ones(length(t),1),'r',t,-5*ones(length(t),1),'c','linewidth',1.5);hold on;
% % ylim([-4 4])
% xlabel('Time (Second)');
% title('theta5');
% legend(p1,'q1','q2','q3','q4','q5','q6','q+','q-');
% ah=axes('position',get(gca,'position'),'visible','off');

% 
% 
% 
figure;
p1=plot(t,dqAll(:,1),'m--',t,dqAll(:,2),'g.-',t,dqAll(:,3),'k.',t,dqAll(:,4),'r:',t,dqAll(:,5),'k--',t,dqAll(:,6),'b-',...
    t,djo*ones(length(t),1),'r',t,-djo*ones(length(t),1),'c','linewidth',1.5);hold on;
% ylim([-3 3])
xlabel('Time (Second)');
title('dottheta1');
legend(p1,'$\dot \theta_1$','$\dot \theta_2$','$\dot \theta_3$','$\dot \theta_4$','$\dot \theta_5$','$\dot \theta_6$','$\dot \theta^+$','$\dot \theta^-$');
ah=axes('position',get(gca,'position'),'visible','off');
% legend(ah,p1(5:8),'dq5','dq6','dq+','dq-');





%==plotting end effector==
% --¸ú×ÙErrors-
figure;
plot(t,erposx,'m--',t,erposy,'b-',t,erposz,'k-.','linewidth',1.5);
xlabel('Time (Second)');
title('Tracking position error');
legend('ex','ey','ez');

figure;
plot(t,erdposx,'m--',t,erdposy,'b-',t,erdposz,'k-.','linewidth',1.5);
title('Tracking velocity error');
xlabel('Time (Second)');
legend('edx','edy','edz');
%%%%Ð­×÷Î»ÖÃÎó²î



