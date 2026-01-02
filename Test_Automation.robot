*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHROME_BROWSER_PATH}     D:/Software Engineer/TestAutomationLab/ChromeForTesting/chrome-win64/chrome-win64/chrome.exe
${CHROME_DRIVER_PATH}      D:/Software Engineer/TestAutomationLab/ChromeForTesting/chromedriver-win64/chromedriver-win64/chromedriver.exe
${HOMEPAGE}    http://www.google.com
${BROWSER}     Chrome
${REG_URL}     http://localhost:7272/Registration.html

${FIRST_NAME}              Somyod
${LAST_NAME}               Sodsai
${ORGANIZATION}            CS KKU
${EMAIL}                   somyod@kkumail.com
${PHONE_NUMBER}            091-001-1234

*** Keywords ***
Open Chrome
    ${opts}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${svc}=     Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
    Create Webdriver    Chrome    options=${opts}    service=${svc}
    Set Selenium Speed  0


*** Test Cases ***
Register Success:
    Open Browser    ${HOMEPAGE}    ${BROWSER}
    Go To    ${REG_URL}

    Input Text    id=firstname      ${FIRST_NAME}
    Input Text    id=lastname       ${LAST_NAME}
    Input Text    id=organization   ${ORGANIZATION}
    Input Text    id=email          ${EMAIL}
    Input Text    id=phone          ${PHONE_NUMBER}

    Click Button  id=registerButton
	
	${title}=    Get Title
    Should Be Equal    ${title}    Success
	Wait Until Page Contains    Thank you for registering with us.
	Wait Until Page Contains    We will send a confirmation to your email soon.
	Close Browser

Register Success No Organization Info:
    Open Browser    ${HOMEPAGE}    ${BROWSER}
    Go To    ${REG_URL}

    Input Text    id=firstname      ${FIRST_NAME}
    Input Text    id=lastname       ${LAST_NAME}
    Input Text    id=email          ${EMAIL}
    Input Text    id=phone          ${PHONE_NUMBER}

    Click Button  id=registerButton
	
	${title}=    Get Title
    Should Be Equal    ${title}    Success
	Wait Until Page Contains    Thank you for registering with us.
	Wait Until Page Contains    We will send a confirmation to your email soon.
	Close Browser
	
Empty First Name:
    Open Browser    ${HOMEPAGE}    ${BROWSER}
    Go To    ${REG_URL}

    Input Text    id=lastname       ${LAST_NAME}
    Input Text    id=organization   ${ORGANIZATION}
    Input Text    id=email          ${EMAIL}
    Input Text    id=phone          ${PHONE_NUMBER}

    Click Button  id=registerButton
	
	${title}=    Get Title
    Should Be Equal    ${title}    Registration
	Wait Until Page Contains    Please enter your first name!!
	Close Browser
	
Empty Last Name:
	Open Browser    ${HOMEPAGE}    ${BROWSER}
    Go To    ${REG_URL}

    Input Text    id=firstname      ${FIRST_NAME}
    Input Text    id=organization   ${ORGANIZATION}
    Input Text    id=email          ${EMAIL}
    Input Text    id=phone          ${PHONE_NUMBER}

    Click Button  id=registerButton
	
	${title}=    Get Title
    Should Be Equal    ${title}    Registration
	Wait Until Page Contains    Please enter your last name!!
	Close Browser
	
Empty First Name and Last Name:
	Open Browser    ${HOMEPAGE}    ${BROWSER}
    Go To    ${REG_URL}

    Input Text    id=organization   ${ORGANIZATION}
    Input Text    id=email          ${EMAIL}
    Input Text    id=phone          ${PHONE_NUMBER}

    Click Button  id=registerButton
	
	${title}=    Get Title
    Should Be Equal    ${title}    Registration
	Wait Until Page Contains    Please enter your name!!
	Close Browser
	
Empty Email:
	Open Browser    ${HOMEPAGE}    ${BROWSER}
    Go To    ${REG_URL}

	Input Text    id=firstname   	${FIRST_NAME}
	Input Text    id=lastname   	${LAST_NAME}
    Input Text    id=organization   ${ORGANIZATION}
    Input Text    id=phone          ${PHONE_NUMBER}

    Click Button  id=registerButton
	
	${title}=    Get Title
    Should Be Equal    ${title}    Registration
	Wait Until Page Contains    Please enter your email!!
	Close Browser
	
Empty Phone Number:
	Open Browser    ${HOMEPAGE}    ${BROWSER}
    Go To    ${REG_URL}

	Input Text    id=firstname   	${FIRST_NAME}
	Input Text    id=lastname   	${LAST_NAME}
    Input Text    id=organization   ${ORGANIZATION}
    Input Text    id=email          ${EMAIL}

    Click Button  id=registerButton
	
	${title}=    Get Title
    Should Be Equal    ${title}    Registration
	Wait Until Page Contains    Please enter your email!!
	Close Browser
	
Invalid Phone Number:
	Open Browser    ${HOMEPAGE}    ${BROWSER}
    Go To    ${REG_URL}

    Input Text    id=firstname      ${FIRST_NAME}
    Input Text    id=lastname       ${LAST_NAME}
    Input Text    id=organization   ${ORGANIZATION}
    Input Text    id=email          ${EMAIL}
    Input Text    id=phone          1234

    Click Button  id=registerButton
	
	${title}=    Get Title
    Should Be Equal    ${title}    Registration
	Wait Until Page Contains    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678)
	Close Browser