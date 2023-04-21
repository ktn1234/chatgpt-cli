# 🤖 ChatGPT CLI

## 📋 Prerequisites

Before using ChatGPT CLI, make sure you have the following:

- 📥[Node.js](https://nodejs.org/en) installed on your machine
- 🔑An API key from OpenAI. You can get one by signing up for their [GPT-3 beta program](https://beta.openai.com/signup/).

## ⚙️ Setup and Usage

#### 📦 Using a Different Package Manager

If you are using a package manager other than npm, replace the `npm` command with the appropriate command for your package manager. For example, if you are using `yarn`, replace `npm install` with `yarn install`. If you are using `pnpm`, replace `npm install` with `pnpm install`.

### 🚀 Node.js

1. 💻 Install dependencies by running the command `npm install` in your terminal.
2. 🔑 Create a `.env` file at the root of the project and add your OpenAI API key in the format `OPEN_AI_API_KEY=your_api_key_here`.
3. 🏃‍♀️ Run the command `npm start` to start the ChatGPT CLI.
4. 💬 Start chatting by entering your messages and pressing enter.

### 💻 Bash

1. 🔑 Replace `your_api_key_here` with your OpenAI API key inside `scripts/bash/chatgpt.sh`.
2. 🏃‍♀️ Run the command `scripts/bash/chatgpt.sh` in your terminal.
3. 💬 Start chatting by entering your messages and pressing enter.

### 💻 Zsh (Debian or macOS)

1. 🔑 Replace `your_api_key_here` with your OpenAI API key inside `scripts/zsh/{operating-system}/chatgpt.sh`.
2. 🏃‍♀️ Run the command `scripts/zsh/{operating-system}/chatgpt.sh` in your terminal.
3. 💬 Start chatting by entering your messages and pressing enter.

### 🔧 CLI Runtime Configurations (bash, zsh, or Node.js)

To avoid typing your OpenAI API key every time you use ChatGPT CLI, you can configure it to use your key automatically.

#### 💻 Bash or Zsh

1. 🔑 Replace `your_api_key_here` with your OpenAI API key inside `scripts/bash/chatgpt.sh` or `scripts/zsh/chatgpt.sh`.
2. 📋 Copy `export OPEN_AI_API_KEY="your_api_key_here"` and the entire `function chatgpt()` from `scripts/bash/chatgpt.sh` or `scripts/zsh/chatgpt.sh`.
3. 📝 Paste the above into your `.bashrc` or `.zshrc` file.
4. 🔚 Close and re-open your shell terminal completely or run `source path/to/rc/file`.
5. 🏃‍♀️ Run the command `chatgpt` in your terminal.
6. 💬 Start chatting by entering your messages and pressing enter.

#### 🚀 Node.js

1. 🚀 Run the command `npm run build` to transpile the code to Node.js.
2. 📋 Copy `alias chatgpt=/usr/bin/node /absolute/path/to/repo/build/index.js` from the output.
3. 📝 Paste the above into your `.bashrc` or `.zshrc` file.
4. 🔚 Close and re-open your shell terminal completely or run `source path/to/rc/file`.
5. 🏃‍♀️ Run the command `chatgpt` in your terminal.
6. 💬 Start chatting by entering your messages and pressing enter.

#### 💻 Windows

1. 📂 Create a new directory `C:\CustomCommands`
2. 📁 Copy the files `scripts/powershell/chatgpt.ps1` and `scripts/cmd/chatgpt.bat` into `C:\CustomCommands`

#### 🔒 Permissions and Configurations

1. 🔑 Run PowerShell as administrator and enter the command `Set-ExecutionPolicy RemoteSigned`. Type `y` and press enter to confirm.
2. 🔍 Click the Windows key and search for `Edit the system environmental variables`
3. 👤 Click `Environmental Variables`
4. 👆 Double-click on `Path` under `System variables`
5. 🖊️ Add a new row with `C:\CustomCommands` and click `OK`
6. 💻 Open either `Command Prompt` or `PowerShell`
7. 🚀 Run the command `chatgpt` in your terminal
8. 🗣️ Start chatting by entering your messages and pressing enter.
