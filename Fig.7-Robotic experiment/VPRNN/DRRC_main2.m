clear;
format long;
load DRRC_SYSdata;
load DRRC_INITdata;
global n ;

interval=0.005;                         %��С����
jj=0;
epsilon=0;
for ii=1:length(t)
    if(t(ii,1)>=epsilon)                
        jj=jj+1;
        tn(jj,1)=t(ii,1);
        yn(jj,:)=y(ii,:);
        %%%%%%%%%%%%%%%%%
        doty=DRRC_net(tn(jj,1),yn(jj,:)');     %���´�������ʱ��ֵ���������
        ddqAll(jj,:)=doty((n+1):(2*n),1)';              %ȡ��u_dot��ǰn������
        %%%%%%%%%%%%%%%%%
        epsilon=jj*interval;
    elseif(ii==length(t))
        jj=jj+1;
        tn(jj,1)=t(ii,1);
        yn(jj,:)=y(ii,:);
        %%%%%%%%%%%%%%%%%
        doty=DRRC_net(tn(jj,1),yn(jj,:)');
        ddqAll(jj,:)=doty((n+1):(2*n),1)';
        %%%%%%%%%%%%%%%%%
        epsilon=jj*interval;
    end
end
clear t y;
t=tn;
y=yn;
size(t)
size(y)
clear tn yn;
qAll=y(:,1:n);
qaa=y(:,1:n);
%ȡ�������Theta
size(qAll)
dqAll=y(:,n+1:2*n);                                  %ȡ��u��ǰn��
size(dqAll)
size(ddqAll)
save SDNN_3robot_data t qAll dqAll ddqAll;
save SPRNN_robot_data qaa ;
