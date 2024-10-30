# cf4ai (Copy Folder for AI)

cf4ai is a Bash utility that helps copy all files in a directory for use in tools like ChatGPT with just one simple line. It also appends the name of the file to its contents so that AI can better understand it.

**Example 1**: If you have a project folder and want to ask ChatGPT about your code, you can use cf4ai to gather all `.md` documentation files. 

```bash
./cf4ai.sh /path/to/project --include .md
```

**Example 2**: If it didn't help and now you want to ask ChatGPT providing it with a context of all java files in your project, you can use cf4ai to copy all the java files.

```bash
./cf4ai.sh /path/to/project --include .md
```

## Installation on macOS

1. Clone the repository:

   ```bash
   git clone https://github.com/username/cf4ai.git
   cd cf4ai
   ```

2. Make the script executable:

   ```bash
   chmod +x cf4ai.sh
   ```

3. Optionally, set up an alias for easier use by adding the following line to your `~/.bash_profile` or `~/.zshrc`:

   ```bash
   alias cf4ai='/path/to/cf4ai/cf4ai.sh'
   ```

   Replace `/path/to/cf4ai` with the actual path to your script. Then, run:

   ```bash
   source ~/.bash_profile
   ```

## Usage

```bash
cf4ai [directory] [--include|-i extensions] [--depth|-d depth]
```

- `directory`: The path to the directory you want to scan.
- `--include, -i`: A comma-separated list of file extensions to include (e.g., `--include .txt,.md`).
- `--depth, -d`: The maximum depth for the directory scan. Defaults to 1 if not specified.

Example:

```bash
cf4ai /path/to/project -i .md -d 2
```

## Contribution Guide

1. Fork the repository and clone it locally.
2. Create a new branch for your feature or bug fix:
   ```bash
   git checkout -b feature-branch
   ```
3. Make your changes and add tests if applicable.
4. Commit your changes with descriptive messages.
5. Push to your fork and open a pull request on GitHub.
