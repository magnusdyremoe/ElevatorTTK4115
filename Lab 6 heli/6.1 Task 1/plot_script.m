%P_bar
figure(1);
P_bar_diag = [];
for i = 1:length(P_bar_bus.signals.values)
    P_bar_diag = [P_bar_diag; diag(P_bar_bus.signals.values(:, :, i))'];
end
plot(P_bar_bus.time, P_bar_diag) %P_bar
hold on;
title('P_bar')
xlabel('Time');
ylabel('P_bar');
hold off;