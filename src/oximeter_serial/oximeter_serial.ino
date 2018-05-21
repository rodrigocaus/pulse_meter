/*
 *  Rodrigo Oliveira Caus
 *
 *  Arquivo que lê uma porta analógica e envia pela porta Serial o valor de
 *  tensão da entrada analógica de 0.0 a 5.0 (double - 4 bytes)
 */



#define OXI_PIN A0

double i;
double oximeter;
unsigned long sys_time;


void setup() {
  Serial.begin(19200);
  delay(3000);
  oximeter = 0;
  i = 0;
}

void loop() {
 //oximeter_voltage = 5.0*(analogRead(OXI_PIN)/1024.0);
 oximeter = cos(i)+1;
 Serial.println(oximeter);
 i += 0.1;
 if(i > 2*PI)
    i = 0;
 delay(10);
}
