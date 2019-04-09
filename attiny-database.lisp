; The ATtiny database v3 - 9th April 2019
; with 1-off prices (in pence) from https://uk.farnell.com/ and https://uk.rs-online.com/

(defvar *data*
  '((attinyX5 (pins 8) (io 5) (adc 4) (pwm 3) (usi 1) (timer8 2) (crystal) (pll))
    (attiny85 (family attinyx5) (flash 8192) (ram 512) (eeprom 512) (price soic 72) (price pdip 90))
    (attiny45 (family attinyx5) (flash 4096) (ram 256) (eeprom 256) (price soic 77) (price pdip 85)) 
    (attiny25 (family attinyx5) (flash 2048) (ram 128) (eeprom 128) (price soic 79) (price pdip 83)) 
    
    (attinyX4 (pins 14) (io 11) (adc 8) (pwm 4) (usi 1) (timer8 1) (timer16 1) (crystal))
    (attiny84 (family attinyX4) (flash 8192) (ram 512) (eeprom 512) (price soic 60) (price pdip 87))
    (attiny44 (family attinyX4) (flash 4096) (ram 256) (eeprom 256) (price soic 56) (price pdip 86))
    (attiny24 (family attinyX4) (flash 2048) (ram 128) (eeprom 128) (price soic 52) (price pdip 83))

    (attinyX313 (pins 20) (io 17) (pwm 3) (uart 1) (usi 1) (timer8 1) (timer16 1) (crystal))
    (attiny4313 (family attinyX313) (flash 4096) (ram 256) (eeprom 256) (price soic 70) (price pdip 98))
    (attiny2313 (family attinyX313) (flash 2048) (ram 128) (eeprom 128) (price soic 82) (price pdip 99))

    (attinyX41 (pins 14) (io 11) (adc 12) (uart 2) (i2c slave) (timer8 1) (timer16 2) (crystal))
    (attiny841 (family attinyX41) (flash 8192) (ram 512) (eeprom 512) (price soic 78))
    (attiny441 (family attinyX41) (flash 4096) (ram 256) (eeprom 256) (price soic 73))

    (attinyX61 (pins 20) (io 15) (adc 11) (pwm 3) (usi 1) (timer8 1) (timer16 1) (crystal) (pll))
    (attiny861 (family attinyX61) (flash 8192) (ram 512) (eeprom 512) (price soic 92) (price pdip 110))
    (attiny461 (family attinyX61) (flash 4096) (ram 256) (eeprom 256) (price soic 85) (price pdip 129))
    (attiny261 (family attinyX61) (flash 2048) (ram 128) (eeprom 128) (price soic 83) (price pdip 107))

    (attinyX7 (pins 20) (io 16) (adc 11) (pwm 3) (uart 1) (usi 1) (timer8 1) (timer16 1) (crystal) (lin))
    (attiny167 (family attinyX7) (flash 16384) (ram 512) (eeprom 512) (price soic 111))
    (attiny87 (family attinyX7) (flash 8192) (ram 512) (eeprom 512) (price soic 124))

    (attinyX8 (pins 28) (io 27) (adc 8) (pwm 4) (i2c master) (i2c slave) (usi 1) (timer8 1) (timer16 1))
    (attiny88 (family attinyX8) (flash 8192) (ram 512) (eeprom 64) (price tqfp 76) (price pdip 143))
    (attiny48 (family attinyX8) (flash 4096) (ram 256) (eeprom 64) (price tqfp 78) (price pdip 131))
    
    (attinyX34 (pins 20) (io 17) (adc 12) (pwm 4) (i2c slave) (uart 2) (usi 1) (timer8 1) (timer16 1) (crystal))
    (attiny1634 (family attinyX34) (flash 16384) (ram 1024) (eeprom 256) (price soic 118))

    (attinyX28 (pins 32) (io 27) (adc 28) (pwm 4) (i2c slave) (uart 1) (timer8 1) (timer16 1))
    (attiny828 (family attinyX28) (flash 8192) (ram 512) (eeprom 512) (price tqfp 84))

    (attinyX3 (pins 20) (io 15) (adc 4) (pwm 4) (usi 1) (timer8 1) (timer16 1) (boost))
    (attiny43 (family attinyX3) (flash 4096) (ram 512) (eeprom 64) (price soic 147))
    
    (attiny9/10 (pins 6) (io 4) (adc 4) (pwm 2) (timer16 1))
    (attiny4/5 (pins 6) (io 4) (pwm 2) (timer16 1))
    (attiny10 (family attiny9/10) (flash 1024) (ram 32) (price sot 25))
    (attiny9 (family attiny9/10) (flash 512) (ram 32) (price sot 25))
    (attiny5 (family attiny4/5) (flash 1024) (ram 32) (price sot 23))
    (attiny4 (family attiny4/5) (flash 512) (ram 32) (price sot 27))))