# Foldingboat

> A wonderous item... This object appears as a wooden box that measures 6 inches wide... The command word causes the box to unfold into a ship 24 feet long. The ship can hold fifteen Medium creatures comfortably.
>
> -- <cite>Dungeons and Dragons 5th Edition Compendium</cite>

This repository serves as a basic example of a self-initializing development environment. Just a few small text files "unfold" into a "ship" that can navigate roughest seas of academic software development.

I wanted to call it Hammerspace, but there's already a product with that name.

## Intallation

1. Ensure you have a GitHub account.
1. Download this repository (or clone it. or fork it. or copy-paste the raw contents of each file. you do you).
1. Run the file "startup.bat". This will open a command line interface terminal which will take a few minutes to install dependencies.
1. Follow the prompts to authenticate your machine with GitHub.
<details>
   - The following steps will inform GitHub.com that you will be using your computer to send updates to repositories associated with your GitHub account. This process will only need to be done once per machine. Future projects utilizing the GitHub command line interface from the same machine will automatically be permitted.

   1. You will eventually receive the prompt: `Authenticate Git with your GitHub credentials? (Y/n)`
      - Press the Enter key to contiue.
   1.  A code of the format `1AB2-3456` will be printed along with the prompt `Press Enter to open https://github.com/login/device in your browser...`
       - Copy the code, then press the Enter key to continue.
   1. The GitHub page for "Device Authentication" will open in your default web browser. If your browser is signed in to your GitHub account, you can select the Continue button. You may need to log in to GitHub in the Browser. There is a "Use a different account" button if you want to use a different GitHub account than one that is already logged in.
      -Select the "Continue" button, or log in, or switch accounts as needed.
   1. After logging in, the page will ask you for the 8-character code that was displayed in the terminal.
      - Paste in the code and select the "Continue" button.
   1. The webpage will present some technical details about the permissions that are being granted to your computer to interact GitHub.com in the name of your account.
      - Select the "Authorize github" button.
   1. You will be prompted for your GitHub password as a final authentication
      - Enter your password and select the "Continue" button.
   1. You will be presented with a message `Congratulations, you're all set!
   Your device is now connected.`
      - You can close this browswer tab.
   1. A popup window may enquire about a "credential selection helper"
      - Select "manager" and "always use this choice" then "okay".
</details>

## Usage

The batch script `startup.bat` launches the powershell script `startup.ps1`, which contains the code to download various pieces of software and configure a shell environment to use them. Critically, this script does not "install" anything in the normal manner on your machine. Everything is unpacked into the current directory. So this 