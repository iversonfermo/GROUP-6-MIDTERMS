#include <Servo.h>

const int servo1pin = 3;
const int servo2pin = 5;
const int servo3pin = 6;
const int servo4pin = 9;

int servo1_current_angle = 0;
int servo2_current_angle = 0;
int servo3_current_angle = 0;
int servo4_current_angle = 0;

int servo1_target_angle = 0;
int servo2_target_angle = 0;
int servo3_target_angle = 0;
int servo4_target_angle = 0;

Servo servo1;
Servo servo2;
Servo servo3;
Servo servo4;

void setup() {
  Serial.begin(115200);
  servo1.attach(servo1pin);   
  servo2.attach(servo2pin);
  servo3.attach(servo3pin);
  servo4.attach(servo4pin);

  servo1.write(servo1_current_angle);
  servo2.write(servo2_current_angle);
  servo3.write(servo3_current_angle);
  servo4.write(servo4_current_angle);

}

void loop() {
  if (Serial.available()) {
    String input = Serial.readStringUntil('\n');
    input.trim();

    if (input.startsWith("SERVO")) {
      input.remove(0, 6);



      servo1_target_angle = input.substring(0, input.indexOf(' ')).toInt();
      input = input.substring(input.indexOf(' ') + 1);

      servo2_target_angle = input.substring(0, input.indexOf(' ')).toInt();
      input = input.substring(input.indexOf(' ') + 1);

      servo3_target_angle = input.substring(0, input.indexOf(' ')).toInt();
      servo4_target_angle = input.substring(input.indexOf(' ') + 1).toInt();

      while (
        servo1_current_angle != servo1_target_angle ||
        servo2_current_angle != servo2_target_angle ||
        servo3_current_angle != servo3_target_angle ||
        servo4_current_angle != servo4_target_angle
      ) {
        if (servo1_current_angle < servo1_target_angle) 
        servo1_current_angle++;
        else if 
        (servo1_current_angle > servo1_target_angle) 
        servo1_current_angle--;
        servo1.write(servo1_current_angle);

        if (servo2_current_angle < servo2_target_angle) 
        servo2_current_angle++;
        else if (servo2_current_angle > servo2_target_angle)
         servo2_current_angle--;
        servo2.write(servo2_current_angle);

        if (servo3_current_angle < servo3_target_angle) 
        servo3_current_angle++;
        else if (servo3_current_angle > servo3_target_angle) 
        servo3_current_angle--;
        servo3.write(servo3_current_angle);

        if (servo4_current_angle < servo4_target_angle) 
        servo4_current_angle++;
        else if (servo4_current_angle > servo4_target_angle) 
        servo4_current_angle--;
        servo4.write(servo4_current_angle);

        delay(15); 
      }

      Serial.println("4 Angles set");
    }
  }
}
