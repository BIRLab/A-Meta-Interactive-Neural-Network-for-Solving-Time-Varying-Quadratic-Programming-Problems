%三个机械臂，将算法改成ASTVNN

clear;
format long;

load DRRC_SRDdata3;

%%%各个关节颜色不同
figure;
plot3(posx1,posy1,posz1,'r', 'LineWidth',2);hold on;

for j=1:5:length(t)
    %if(rem(j,10)==0)
    basejoint1=line('xdata',[j10px(j);j11px(j)],'ydata',[j10py(j);j11py(j)],'zdata',[j10pz(j);j11pz(j)],...
        'color', 'k', 'LineWidth',1.5);
    joints12=line('xdata',[j11px(j);j12px(j)],'ydata',[j11py(j);j12py(j)],'zdata',[j11pz(j);j12pz(j)],...
        'color', 'yellow', 'LineWidth',1.5);
    joints23=line('xdata',[j12px(j);j13px(j)],'ydata',[j12py(j);j13py(j)],'zdata',[j12pz(j);j13pz(j)],...
        'color', 'magenta', 'LineWidth',1.5);
    joints34=line('xdata',[j13px(j);j14px(j)],'ydata',[j13py(j);j14py(j)],'zdata',[j13pz(j);j14pz(j)],...
        'color', 'cyan', 'LineWidth',1.5);
    joints45=line('xdata',[j14px(j);j15px(j)],'ydata',[j14py(j);j15py(j)],'zdata',[j14pz(j);j15pz(j)],...
        'color', 'blue', 'LineWidth',1.5);
    joints56=line('xdata',[j15px(j);posx1(j)],'ydata',[j15py(j);posy1(j)],'zdata',[j15pz(j);posz1(j)],...
        'color', 'green', 'LineWidth',1.5);
    
%     drawnow
%     pause(0.5)
%     j
    %end
end
xlabel('X (m)');ylabel('Y (m)');zlabel('Z (m)');
grid on;


