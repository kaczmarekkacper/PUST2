function  plotProcess(u, y, z, plotTitle)

    global k;
    figure;
    subplot(3, 1, 1);
    stairs(1:k, y, 'b');
    title(plotTitle);
    legend('Wyj�cie procesu');
    xlabel('k');
    ylabel('y');
    subplot(3, 1, 2);
    stairs(1:k, u, 'm');
    legend('Wej�cie procesu');
    xlabel('k');
    ylabel('u');
    subplot(3, 1, 3);
    stairs(1:k, z, 'c');
    legend('Wej�cie procesu');
    xlabel('k');
    ylabel('z');
end

