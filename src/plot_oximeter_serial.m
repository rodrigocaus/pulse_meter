# Necessita do pacote instrument-control (http://wiki.octave.org/Instrument_control_package)
pkg load instrument-control

# Número de amostras lidas por ciclo
SAMPLES_TIMEOUT = 1000;
# Formato de leitura: x.xx\r\n
BYTES_READ = 6;
# Porta serial usada pode variar
SERIAL_PORT = "com5";
BAUD_RATE = 19200;

# Inicializa a porta serial
if(exist('serial') != 3)
	disp("Sem suporte a serial!");
	pause(3);
	exit;
endif
s1 = serial(SERIAL_PORT, BAUD_RATE);
srl_flush(s1);


y_read = double(ones(1, SAMPLES_TIMEOUT));
count = 1;

# Gerenciamento de plot
plotHandle = plot(y_read);
grid("on");
ylabel("Tensao (V)");
xlabel("Tempo (s)");
	# Tensão limitada de 0 a 5V
ylim([0.0 5.0]);
	# Limita o eixo x a SAMPLES_TIMEOUT/10 amostras por segundo
	# Deve estar sincronizado com o Arduino
xticks([0:SAMPLES_TIMEOUT/10:SAMPLES_TIMEOUT]);
xticklabels(num2cell(0:10));


# Leitura continua até apertar a letra 'q'
press = "0";
while ~isequal(press, "q")

	y_read(count) = str2num(char(srl_read(s1, BYTES_READ)));
	set(plotHandle,'YData', y_read);
	count = count+1;

	# Volta para o inicio
	if count >= SAMPLES_TIMEOUT
		count = 1;
	endif

	# Verifica se houve tecla pressionada
	press = kbhit(1);

endwhile

srl_close(s1);
