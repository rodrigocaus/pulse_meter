pkg load instrument-control

# Variaveis e constantes de uso
SAMPLES_TIMEOUT = 1000;
	# Formato de leitura: x.xx\r\n
BYTES_READ = 6;
SERIAL_PORT = "com5";

# Inicializa a porta serial
if(exist('serial') != 3)
	disp("Sem suporte a serial!");
	pause(3);
	exit;
endif
s1 = serial(SERIAL_PORT, 19200);
srl_flush(s1);

# Leitura continua até apertar a letra 'q'
press = "0";
y_read = double(ones(1, SAMPLES_TIMEOUT));
count = 1;

plotHandle = plot(y_read);

while ~isequal(press, "q")

	y_read(count) = str2num(char(srl_read(s1, BYTES_READ)));
	set(plotHandle,'YData', y_read);
	count = count+1;
	if count >= SAMPLES_TIMEOUT
		count = 1;
	endif
	press = kbhit(1);
endwhile

srl_close(s1);
