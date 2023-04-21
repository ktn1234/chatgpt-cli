$env:OPEN_AI_API_KEY="your_api_key_here"

function chatgpt() {
    $url = "https://api.openai.com/v1/chat/completions"

    $conversationHistory = @(
        @{
            role = "system"
            content = "You are a helpful assistant."
        }
    )

    $headers = @{
        "Content-Type" = "application/json"
        "Authorization" = "Bearer $env:OPEN_AI_API_KEY"
    }

    $body = @{
        model = "gpt-3.5-turbo"
        messages = $conversationHistory
    }

    Write-Host "ChatGPT Initialized - Start Chatting (type 'exit' to quit)"

    while ($true) {
        # Read user input
        $userInput = Read-Host ">"

        # Check if user wants to exit
        if($userInput -eq "exit") {
            Write-Host "ChatGPT Terminated. Bye Bye!"
            break
        }

        # Check if user input is empty
        if([string]::IsNullOrEmpty($userInput)) {
            continue
        }

        # Add user input to conversation history
        $userInputEscaped = $userInput.Replace('"', '\"')
        $conversationHistory += @{
            role = "user"
            content = $userInputEscaped
        }

        # Set request body and send request
        $body.messages = $conversationHistory
        $response = Invoke-RestMethod -Method Post -Uri $url -Headers $headers -Body ($body | ConvertTo-Json)

        # Check if response is successful
        if ($? -ne $true) {
            Write-Host "An error has occurred. Exiting..."
            Write-Host
            break
        }

        # Get response message and add to conversation history
        $assistantMessage = $response.choices[0].message[0].content
        $conversationHistory += @{
            role = "system"
            content = $assistantMessage
        }

        # Output assistant message
        Write-Host "<: $assistantMessage"
    }
}

chatgpt