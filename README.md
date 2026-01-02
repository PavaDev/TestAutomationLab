ภายใน Repository นี้ไม่ได้รวมเอา folder ChromeForTesting หรือ Driver ที่ใช้ในการทดสอบเอาไว้ด้วย 
หากต้องการทดสอบ Robot Testing ต้องเข้าไปเปลี่ยน Path ของ Chrome ในไฟล์ Test_Automation.robot ส่วน ${CHROME_BROWSER_PATH} และ ${CHROME_DRIVER_PATH} ของท่านเสียก่อน

วิธีการทดสอบ
1. รันไฟล์ server.py
2. รันคำสั่ง robot Test_Automation.robot
