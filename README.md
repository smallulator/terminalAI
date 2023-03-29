# Terminal AI
This Ruby script demonstrates how to use the OpenAI API to generate chat responses based on user input.

## Prerequisites
To use this script, you need to have the following installed:

- Ruby 2.7 or later
- net/http Ruby module
- uri Ruby module
- json Ruby module
- pry Ruby module

## Getting Started

Clone the repository:

```Bash
git clone https://github.com/smallulator/terminalAI.git
```

Navigate to the cloned repository:

``` Bash
cd terminalAI
```
paste your OpenAI API key into it api_key.txt .

Run the script:

```Bash
astra
```
Enter a prompt when prompted by the script.

## How it Works
The script reads your OpenAI API key from the api_key.txt file. If the file is empty, the script prompts you to enter the key.

After getting the API key, the script prompts you to enter a chat prompt. It then sends the prompt to the OpenAI API and receives a response, which is displayed in the terminal.

The response is generated using the gpt-3.5-turbo model with a temperature of 0.7.

License
This project is licensed under the MIT License - see the LICENSE file for details.
