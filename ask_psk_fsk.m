function ASK_FSK_PSK(msglen)
    n = msglen;
    b = randi([0 1], n);
    f1 = 1;
    f2 = 2;
    t = 0:1/30:1-1/30;

    % ASK
    sa1 = sin(2*pi*f1*t);
    sa0 = 0*sin(2*pi*f1*t);

    % FSK
    sf0 = sin(2*pi*f1*t);
    sf1 = sin(2*pi*f2*t);

    % PSK
    sp0 = -sin(2*pi*f1*t);
    sp1 = sin(2*pi*f1*t);

    % Modulation
    ask = [];
    psk = [];
    fsk = [];
    for i = 1:n
        if b(i) == 1
            ask = [ask sa1];
            psk = [psk sp1];
            fsk = [fsk sf1];
        else
            ask = [ask sa0];
            psk = [psk sp0];
            fsk = [fsk sf0];
        end
    end

    % AWGN
    snr = 0:20;
    BER_A = zeros(size(snr));
    BER_F = zeros(size(snr));
    BER_P = zeros(size(snr));
    for i = 1:length(snr)
        askn = awgn(ask, snr(i));
        pskn = awgn(psk, snr(i));
        fskn = awgn(fsk, snr(i));

        % Detection
        A = [];
        F = [];
        P = [];
        for j = 1:n
            if sum(sa1 .* askn(1+30*(j-1):30*j)) > 0.5
                A = [A 1];
            else
                A = [A 0];
            end

            if sum(sf1 .* fskn(1+30*(j-1):30*j)) > 0.5
                F = [F 1];
            else
                F = [F 0];
            end

            if sum(sp1 .* pskn(1+30*(j-1):30*j)) > 0
                P = [P 1];
            else
                P = [P 0];
            end
        end

        % BER calculation
        errA = sum(A ~= b);
        errF = sum(F ~= b);
        errP = sum(P ~= b);
        BER_A(i) = errA / n;
        BER_F(i) = errF / n;
        BER_P(i) = errP / n;
    end

    % Plotting
    figure(1)
    subplot(311)
    stairs(0:10, [b(1:10) b(10)], 'linewidth', 1.5)
    axis([0 10 -0.5 1.5])
    title('Message Bits')
    grid on

    subplot(312)
    tb = 0:1/30:10-1/30;
    plot(tb, ask(1:10*30), 'b', 'linewidth', 1.5)
    title('ASK Modulation')
    grid on

    subplot(313)
    plot(tb, fsk(1:10*30), 'r', 'linewidth', 1.5)
    title('FSK Modulation')
    grid on

    figure(2)
    subplot(311)
    stairs(0:10, [b(1:10) b(10)], 'linewidth', 1.5)
    axis([0 10 -0.5 1.5])
    title('Message Bits')
    grid on

    subplot(312)
    plot(tb, askn(1:10*30), 'b', 'linewidth', 1.5)
    title('Received ASK signal')
    grid on

    subplot(313)
    plot(tb, fskn(1:10*30), 'r', 'linewidth', 1.5)
    title('Received FSK signal')
    grid on

    figure(3)
    semilogy(snr, BER_A, 'b', 'linewidth', 2)
    title('BER Vs SNR')
    grid on
    hold on
    semilogy(snr, BER_F, 'r', 'linewidth', 2)
    semilogy(snr, BER_P, 'k', 'linewidth', 2)
    xlabel('Eo/No(dB)')
    ylabel('BER')
    hold off
    legend('ASK', 'FSK', 'PSK');
end
