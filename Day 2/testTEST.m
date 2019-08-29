% testFileTESTfile

load irf_w
d = exp(-(1:100).*.10);
figure; plot(d./max(d), '-b', 'LineWidth', 2);
fD = conv(d,irf_w(:,1)./sum(irf_w(:,1)));
fD = fD(1:length(d));
hold on; plot(irf_w(:,1)./max(irf_w(:,1)), '-.m', 'LineWidth', 2);
hold on; plot(fD./max(fD), '--k', 'LineWidth', 2);
legend('Decay','IRF','Decay post-IRF conv');
