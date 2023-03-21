# ChatGPT CLI

## For Node.js

1. Install dependencies via npm, yarn, pnpm
2. Create a `.env` file at the root level and put in your `OPEN_AI_API_KEY` in there like so `OPEN_AI_API_KEY=key_value`
3. Run the npm script `start` via npm, yarn, or pnpm
4. Start Chatting!

## For bash

1. Replace `OPEN_AI_API_KEY` variable inside `scripts/bash/chatgpt.sh` with your API Key from OpenAI
2. Run the script `scripts/bash/chatgpt.sh`
3. Start Chatting!

## For bash

1. Replace `OPEN_AI_API_KEY` variable inside `scripts/zsh/chatgpt.sh` with your API Key from OpenAI
2. Run the script `scripts/bash/chatgpt.sh`
3. Start Chatting!

## For Runtime Configurations in bash and zsh

1. Replace `OPEN_AI_API_KEY` variable inside `scripts/bash/chatgpt.sh` or `scripts/zsh/chatgpt.sh` with your API Key from OpenAI
2. Copy `export OPEN_AI_API_KEY="PLACEHOLDER"` and the entire `function chatgpt()`
3. Paste the above into your `.bashrc` or `.zshrc` file
4. Close and re-open your shell terminal completely or run `source path/to/rc/file`
5. Run `chatgpt`
6. Start Chatting!
