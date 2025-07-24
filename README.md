# Daily Log

This project is a template for keeping track of daily activities. You can use it to create your own daily log repository.

## Getting Started

To get started, click the "Use this template" button on the GitHub repository page. This will create a new repository with the same structure and files.

## Usage

To create or edit a daily log, run the following command from the root of the project:

```bash
./log.sh [editor]
```

- This will create a new Markdown file in the `logs` directory if one doesn't already exist for the current day.
- If a log file for the current day already exists, the script will open the existing file.
- You can optionally pass in the name of an editor (`vscode`, `nano`, or `vim`) to open the file directly.
- If you don't provide an editor, you will be prompted to select one.

### Tags

The following tags are used to categorize tasks:

- `@triage`: For bug fixing and issue investigation.
- `@support`: For helping other developers or teams.
- `@feature`: For new feature development.

## Global Alias (Optional)

To run the script from anywhere on your machine, you can create an alias. I suggest using `daily` as the alias name to avoid conflicts with other commands.

Here's how to set it up for `zsh`:

1.  Open your `.zshrc` file in your home directory:
    ```bash
    nano ~/.zshrc
    ```
2.  Add the following line to the file, replacing `/path/to/daily-log` with the actual path to your project directory:
    ```bash
    alias daily='cd /path/to/daily-log && ./log.sh [editor]'
    ```
3.  Save the file and reload your shell configuration:
    ```bash
    source ~/.zshrc
    ```

Now you can simply type `daily` in your terminal from any directory to run the script. You can also pass the editor as an argument to the alias, for example: `daily`.
