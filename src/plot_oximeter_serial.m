pkg load instrument-control

# Variaveis e constantes de uso
SAMPLES_TIMEOUT = 1000;
BYTES_READ = 4;
SERIAL_PORT = "com3";

# Inicializa a porta serial
if(exist('serial') != 3)
	disp("Sem suporte a serial!");
	pause(3);
	exit;
endif
s1 = serial(SERIAL_PORT, 19200);
srl_flush(s1);

# Gerenciar o Plot


# Leitura continua até apertar a letra 'q'
press = "0";
y_read = ones(1, SAMPLES_TIMEOUT);
count = 1;
while ~isequal(press, "q")

	y_read(count) = double(srl_read(s1, BYTES_READ));

	count = count+1;
	if count >= SAMPLES_TIMEOUT
		count = 1;
	endif
	press = kbhit(1);
endwhile

srl_close(s1);
