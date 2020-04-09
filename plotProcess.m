function  plotProcess(u, y, z, plotTitle)

    global k;
    figure('Renderer', 'painters', 'Position', [10 10 650 600])
    %figure
    subplot(3, 1, 1);
    stairs(1:k, y, 'b');
    title(plotTitle);
    legend('Wyjœcie procesu', 'location', 'southeast');
    xlabel('k');
    ylabel('y');
    subplot(3, 1, 2);
    stairs(1:k, u, 'm');
    legend('Wejœcie procesu');
    xlabel('k');
    ylabel('u');
    subplot(3, 1, 3);
    stairs(1:k, z, 'c');
    legend('Zak³ócenie procesu');
    xlabel('k');
    ylabel('z');
end

