# chatbot_using_chatgpt3

Flutter project.

## Getting Started
This repository contains the source code for a Flutter-based chatbot application that integrates with the GPT (Generative Pre-trained Transformer) API for natural language processing and utilizes Firebase Authentication for user authentication.

The application provides a user-friendly interface for users to interact with the chatbot. The integration of the GPT API ensures powerful natural language understanding and generation, while Firebase Authentication ensures secure user authentication.

## Desain ui figma

![figma chatbot](https://github.com/Fannannf/flutter-chatbot-using-chatgpt3/assets/57026015/dd1898b2-5853-4dda-aa29-5d08fba2a1fc)

## Features
- **GPT API Integration:** Leverage the GPT API for natural language processing.
- **Firebase Authentication:**  Implement user authentication and secure user data with Firebase.

## Setup
Follow these steps to set up and run the application locally.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Fannannf/flutter-chatbot-using-chatgpt3.git

2. Navigate to the project directory:
   ```bash
   cd flutter-chatbot-using-chatgpt3
   
3. Install dependencies:
   ```bash
   flutter pub get

4. Add your ChatGPT token to the /lib/service/ai_handler.dart folder.
   ```bash
   final _openAI = OpenAI.instance.build(
    token: 'YOUR-TOKEN CHATGPT',
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
    ),

5. Replace the google-service.json file in the /android/app/ directory with the google-service.json file from your Firebase project
