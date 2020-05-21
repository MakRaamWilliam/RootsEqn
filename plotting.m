% figure('Name','Measured Data','NumberTitle','off');

function plotting (str)
figure1 = figure;
 axes('Parent',figure1,...
     'Position',[0.1300 0.1100 0.7750 0.8150]); 
hold on
g1=ezplot( inline('0'));
set(g1,'color','black','LineWidth',2);
g2=plot(zeros(1001),[-500:500]);
set(g2,'color','black','LineWidth',2);
g1=ezplot( inline(str));
set(g1,'color','green','LineWidth',2);
hold off