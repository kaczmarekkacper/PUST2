function  plotProcess(u, y, plotTitle)

    global k;
    figure;
    subplot(2, 1, 1);
    stairs(1:k, y, 'b');
    title(plotTitle);
    legend('Wyjœcie procesu');
    xlabel('k');
    ylabel('y');
    subplot(2, 1, 2);
    stairs(1:k, u, 'm');
    legend('Wejœcie procesu');
    xlabel('k');
    ylabel('u');
end

