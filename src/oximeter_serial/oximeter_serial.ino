/*
 *  Rodrigo Oliveira Caus
 *
 *  Arquivo que lê uma porta analógica e envia pela porta Serial o valor de
 *  tensão da entrada analógica de 0.0 a 5.0 (double - 4 bytes)
 */



#define OXI_PIN A0

double i;
double oximeter;

void setup() {
  Serial.begin(19200);
  delay(3000);
  oximeter = 0;
  i = 0;
}

void loop() {
 oximeter = 5.0*(analogRead(OXI_PIN)/1024.0);
 /*
 oximeter = max(2*cos(i), 0.5);
 i += 0.08;
 if(i > 2*PI)
    i = 0;
 */
 Serial.println(oximeter);
 delay(10);
}
