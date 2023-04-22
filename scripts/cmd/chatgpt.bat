@echo off

SET "URL=https://api.openai.com/v1/chat/completions"
SET "OPEN_AI_API_KEY=your_api_key_here"
SET "HEADER_CONTENT_TYPE=Content-Type: application/json"
SET "HEADER_AUTHORIZATION=Authorization: Bearer %OPEN_AI_API_KEY%"

@REM Initialize conversation
SET "MESSAGES={ \"role\": \"system\", \"content\": \"You are a helpful assistant.\" }"
SET USER_INPUT=

echo ChatGPT Initialized - Start Chatting (type 'exit' to quit)

:loop

@REM NOTE: The user input cannot handle special characters: \, ", ', &, |, ^, <, >, etc.
@REM TODO: In the user input, escape special characters: \, ", ', &, |, ^, <, >, etc.
SET /p USER_INPUT="> "

@REM Check if user input is empty
if "%USER_INPUT%" == "" (
    goto :loop
)

@REM Check if user input is 'exit'
if "%USER_INPUT%" == "exit" (
    echo ChatGPT Terminated. Bye Bye!
    goto :end
)

if "%USER_INPUT%" == "clear" (
    cls
    SET USER_INPUT=
    goto :loop
)

if "%USER_INPUT%" == "cls" (
    cls
    SET USER_INPUT=
    goto :loop
)

if "%USER_INPUT%" == "help" (
    echo Commands:
    echo exit - Exit the program
    echo clear - Clear the screen
    echo help - Show this help message
    SET USER_INPUT=
    goto :loop
)

@REM Add user input to messages - This represents a conversation
SET "MESSAGES=%MESSAGES%, { \"role\": \"user\", \"content\": \"%USER_INPUT%\" }"

@REM Add the conversation to the payload
SET "PAYLOAD={ \"model\": \"gpt-3.5-turbo\", \"messages\": [ %MESSAGES% ] }"

@REM NOTE: There is no error handling for the response and does not check for non 200 status codes
@REM TODO: Add error handling for the response - Check for non 200 status codes
@REM Get response from ChatGPT
FOR /F "tokens=* USEBACKQ" %%F IN (`curl %URL% -s -H "%HEADER_CONTENT_TYPE%" -H "%HEADER_AUTHORIZATION%" -d "%PAYLOAD%"`) DO SET RESPONSE=%%F

@REM Parse response -> RESPONSE.choices[0].message.content
FOR /F "tokens=* USEBACKQ" %%F IN (`echo %RESPONSE% ^| jq -r ".choices[0].message.content"`) DO SET CHATGPT_RESPONSE=%%F

echo ^< %CHATGPT_RESPONSE%

@REM Add response to messages
SET "MESSAGES=%MESSAGES%, { \"role\": \"user\", \"content\": \"%CHATGPT_RESPONSE%\" }"

SET USER_INPUT=

goto :loop

:end
