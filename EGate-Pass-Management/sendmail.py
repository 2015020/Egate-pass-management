

import smtplib;

ser = smtplib.SMTP('smtp.gmail.com',587)

ser.starttls();

ser.login('2015020@nec.edu.in','xccziwgfyufllkft')

ser.sendmail('2015020@nec.edu.in','2015021@nec.edu.in','Mail send for youtube checking');

print('mail send');

