import "dotenv/config";
import readline from "readline";
import {
  ChatCompletionRequestMessage,
  Configuration,
  CreateChatCompletionResponse,
  OpenAIApi,
} from "openai";
import { AxiosError, AxiosResponse } from "axios";

const openAi = new OpenAIApi(
  new Configuration({
    apiKey: process.env.OPEN_AI_API_KEY || "",
  })
);

const userInterface = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

const conversationHistory: ChatCompletionRequestMessage[] = [
  {
    role: "system",
    content: "You are a helpful assistant.",
  },
];

console.log("ChatGPT Initialized - Start Chatting (type 'exit' to quit)");
userInterface.prompt();
userInterface.on("line", async (input) => {
  if (input === "exit") {
    console.log("ChatGPT Terminated. Bye Bye!");
    userInterface.close();
    return;
  }

  if (input === "") {
    userInterface.prompt();
    return;
  }

  conversationHistory.push({ role: "user", content: input });

  let response: AxiosResponse<CreateChatCompletionResponse, any>;
  try {
    response = (await openAi.createChatCompletion({
      model: "gpt-3.5-turbo",
      messages: conversationHistory,
    })) as AxiosResponse<CreateChatCompletionResponse, any>;
  } catch (error) {
    console.error((error as AxiosError).response?.data || null);
    console.error("An error occurred. Exiting...");
    userInterface.close();
    return;
  }

  const assistantMessage = response.data.choices[0].message?.content || "";
  console.log("<", assistantMessage);
  conversationHistory.push({ role: "assistant", content: assistantMessage });
  userInterface.prompt();
});
