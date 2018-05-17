/*
 *  Rodrigo Oliveira Caus
 *
 *  Arquivo que lê uma porta analógica e envia pela porta Serial o valor de
 *  tensão da entrada analógica de 0.0 a 5.0 (double - 4 bytes)
 */


#define PI 3.14159
#define OXI_PIN A0

double i;
double oximeter_voltage;
unsigned long sys_time;


void setup() {
  Serial.begin(19200);
  delay(3000);
  oximeter_voltage = 0.0;
  i = 0.0;
}

void loop() {
 //oximeter_voltage = 5.0*(analogRead(OXI_PIN)/1024.0);
 oximeter_voltage = cos(i)+1;
 Serial.write((byte *) &oximeter_voltage, sizeof(oximeter_voltage));
 i += 0.01;
 if(i > 2*PI)
    i = 0.0;
}
