#!/usr/bin/env bash

export OPEN_AI_API_KEY="PLACEHOLDER"
function chatgpt() {
        conversationHistory=( '{"role": "system", "content": "You are a helpful assistant."}' )

        echo "ChatGPT Initialized - Start Chatting (type 'exit' to quit)"

        while true; do
                read -p "> " userInput

                if [[ $userInput == "exit" ]]; then
                        echo "ChatGPT Terminated. Bye Bye!"
                        break
                fi

                if [[ $userInput == "" ]]; then
                        continue
                fi

                userInput=${userInput//\"/\\\"} # escape double quotes
                conversationHistory+=( '{"role": "user", "content": "'"$userInput"'"}' )

                messages=$(printf '%s,' "${conversationHistory[@]}")
                messages=${messages%,} # remove the trailing comma

                response=$(curl https://api.openai.com/v1/chat/completions \
                        -s \
                        -H "Content-Type: application/json" \
                        -H "Authorization: Bearer $OPEN_AI_API_KEY" \
                        -d '{ 
                                "model": "gpt-3.5-turbo", 
                                "messages": ['"$messages"'] 
                        }')

                # check if the response is an error
                if [[ $response == *"error"* ]]; then
                        echo $response
                        echo "An error occurred. Exiting..."
                        return
                fi

                assistantMessage=$(echo "$response" | grep -oP '(?<="content":")[^"]+')

                echo -e "< $assistantMessage"

                conversationHistory+=( '{"role": "assistant", "content": "'"$assistantMessage"'"}' )
        done
}

chatgpt
